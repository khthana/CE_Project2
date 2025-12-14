#pragma SMALL
#pragma CODE DEBUG

//move on table only and avoid object along input instruction(s)

#include "c:\c51\bin\library\lib_mtr.c"
#include "c:\c51\bin\library\lib_ifr.c"
#include "c:\c51\bin\library\lib_itf.c"
#include "c:\c51\bin\library\lib_uts.c"

#define MAX_SIZE	255
#define STOP		0
#define FORWARD		1
#define BACKWARD	2
#define TURNLEFT	3
#define TURNRIGHT	4
#define END			5
#define NONE		6

struct command_struct
{
	unsigned char instruction;
	unsigned char value;
};

xdata struct command_struct command[MAX_SIZE];
xdata unsigned char size;
unsigned char current;

unsigned char key;

char* show_str[7] = {	"stop      \0",
						"forward   \0",
						"backward  \0",
						"turn left \0",
						"turn right\0",
						"end       \0",
						"          \0"};

void programming(void)
{
	unsigned char instruction = NONE;
	unsigned char value;
	unsigned char cursor;
	unsigned char key1;
	do
	{
		LCD_clear();
		LCD_write_string("Command no.");
		LCD_write_byte(current+1);
		do
		{
			LCD_gotoxy(1,2);
			LCD_write_string(show_str[instruction]);
			key1 = KBD_get_key();
			switch (key1)
			{
			case '2' :	instruction = FORWARD;
						break;
			case '8' :	instruction = BACKWARD;
						break;
			case '4' :	instruction = TURNLEFT;
						break;
			case '6' :	instruction = TURNRIGHT;
						break;
			case '5' :	instruction = END;
						break;
			case '0' :	instruction = STOP;
						break;
			case '*' :	if (current > 0)
						{
							current--;
							instruction = command[current].instruction;
						} else
						{
							instruction = NONE;
						}
						break;
			}
		}
		while (key1 != '*' && key1 != '#' || instruction == NONE);
		if (key1 == '#')
		{
			if (instruction != END)
			{
				LCD_clear();
				LCD_write_string("Enter Timer :");
				value = 0;
				cursor = 1;
				do
				{
					LCD_gotoxy(cursor,2);
					key1 = KBD_get_key();
					switch (key1)
					{
					case '1' :
					case '2' :
					case '3' :
					case '4' :
					case '5' :
					case '6' :
					case '7' :
					case '8' :
					case '9' :
					case '0' :	if (cursor < 4)
								{
									if (cursor != 1 || key1 != '0')
									{
										cursor++;
										value = value*10 + (key1 - '0');
										LCD_write_char(key1);
									}
								}
								break;
					case '*' :	if (cursor > 1)
								{
									cursor--;
									value = (unsigned char)(value/10);
									LCD_gotoxy(cursor,2);
									LCD_write_char(' ');
									LCD_gotoxy(cursor,2);
								}
								break;
					case '#' :	command[current].instruction = instruction;
								command[current].value = value;
								current++;
								break;
					}
				}
				while (key1 != '#');
			} else
			{
				command[current].instruction = instruction;
				command[current].value = 0;
				size = current;
				LCD_gotoxy(14,1);
				LCD_write_byte(size);
				delay(255,255);
			}
		}
	}
	while (instruction != END);
}

void running(void)
{
	unsigned char direction;
	unsigned char multiplier;
	unsigned char timer;
	unsigned char inner_timer1;
	unsigned char inner_timer2;
	unsigned char instruction;

	LCD_clear();
	LCD_write_string("Running");
	if (size == 0)
	{
		LCD_gotoxy(1,2);
		LCD_write_string("No Command");
		delay(255,255);
	}
	else
	do
	{
		inner_timer1 = 0;
		inner_timer2 = 0;
		instruction = command[current].instruction;
		timer = command[current].value;
		LCD_gotoxy(1,2);
		LCD_write_byte(current+1);
		LCD_write_char('.');
		LCD_write_string(show_str[instruction]);
		LCD_gotoxy(14,2);
		LCD_write_byte(timer);
		do
		{
			IR_get_data();
			US_get_data();
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
			if (infrared_12 == 1 && infrared_07 == 1 && infrared_01 == 1 && infrared_06 == 1)
			{
				if (ultrasonic_01 != 0 && ultrasonic_02 != 0)
				{
					LCD_gotoxy(16,1);
					LCD_write_char('1');
					MT_go_backward();
					delay(255,100);
					MT_turn_right();
					delay(255,255);
				} else
				if (ultrasonic_01 != 0 && ultrasonic_02 == 0)
				{
					LCD_gotoxy(16,1);
					LCD_write_char('2');
					MT_turn_right();
					delay(255,255);
				} else
				if (ultrasonic_01 == 0 && ultrasonic_02 != 0)
				{
					LCD_gotoxy(16,1);
					LCD_write_char('3');
					MT_turn_left();
					delay(255,255);
				} else
				{
					LCD_gotoxy(16,1);
					LCD_write_char('0');
					switch (instruction)
					{
					case FORWARD	:	MT_go_forward();
										multiplier = 16;
										break;
					case BACKWARD	:	MT_go_backward();
										multiplier = 16;
										break;
					case TURNLEFT	:	MT_turn_left();
										multiplier = 8;
										break;
					case TURNRIGHT	:	MT_turn_right();
										multiplier = 8;
										break;
					case STOP		:	MT_stop_move();
										multiplier = 8;
										break;
					}
					LCD_gotoxy(1,1);
					LCD_write_byte(inner_timer1);
					if (inner_timer1 >= multiplier)
					{
						inner_timer1 = 0;
						timer--;
						LCD_gotoxy(14,2);
						LCD_write_byte(timer);
					}
				}
			} else
			if (infrared_12 == 1 && infrared_07 == 0)
			{
				LCD_gotoxy(16,1);
				LCD_write_char('4');
				MT_go_backward();
				delay(255,100);
				MT_turn_left();
				delay(255,255);
			} else
			if (infrared_12 == 0 && infrared_07 == 1)
			{
				LCD_gotoxy(16,1);
				LCD_write_char('5');
				MT_go_backward();
				delay(255,100);
				MT_turn_right();
				delay(255,255);
			} else
			if (infrared_12 == 0 && infrared_07 == 0)
			{
				LCD_gotoxy(16,1);
				LCD_write_char('6');
				MT_go_backward();
				delay(255,255);
			} else
			if (infrared_01 == 1 && infrared_06 == 0)
			{
				LCD_gotoxy(16,1);
				LCD_write_char('7');
				MT_go_forward();
				delay(255,100);
				MT_turn_right();
				delay(255,255);
			} else
			if (infrared_01 == 0 && infrared_06 == 1)
			{
				LCD_gotoxy(16,1);
				LCD_write_char('8');
				MT_go_forward();
				delay(255,100);
				MT_turn_left();
				delay(255,255);

			} else
			if (infrared_01 == 0 && infrared_06 == 0)
			{
				LCD_gotoxy(16,1);
				LCD_write_char('9');
				MT_go_forward();
				delay(255,255);
			}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


			inner_timer1++;
			key = 'a';//KBD_scan_key();
		}
		while ((key != '#') && (timer > 0));
		current++;
	}
	while ((key != '#') && (current < size));
	MT_stop_move();
}

void pattern(void)
{
	unsigned char key = '0';
	while (key != '4')
	{
		LCD_clear();
		LCD_write_string("1.Program  2.Run");
		LCD_gotoxy(1,2);
		LCD_write_string("3.Clear   4.Back");
		do
		{
			key = KBD_get_key();
		}
		while ((key < '1') && (key > '4'));
		switch (key)
		{
		case '1' :	size = 0;
					current = 0;
					programming();
					break;
		case '2' :	current = 0;
					running();
					break;
		case '3' :	size = 0;
					current = 0;
					break;
		}
	}
}

void track(void)
{
	unsigned char key = '0';
	unsigned char last = 0;
	unsigned char count = 0;
	unsigned char direction = 0;

	MT_set_speed(1);
	LCD_clear();
	do
	{
		IR_get_data();
		LCD_gotoxy(1,2);
		LCD_write_char((unsigned char)infrared_08+48);//right
		LCD_write_char((unsigned char)infrared_09+48);//center
		LCD_write_char((unsigned char)infrared_11+48);//left
		if (infrared_09 == 0)
		{
			if (direction != 1)
			{
				direction = 1;
				MT_stop_move();
				delay(1,50);
			}
			LCD_gotoxy(1,1);
			LCD_write_string("f-n");
			MT_go_forward();
			IR_get_data();
		} else
		{
			if (infrared_11 == 0 && infrared_08 == 1)
			{
				if (direction != 2)
				{
					direction = 2;
					MT_stop_move();
					delay(1,50);
				}
				LCD_gotoxy(1,1);
				LCD_write_string("l-n");
				MT_turn_left();
				IR_get_data();
			} else
			if (infrared_11 == 1 && infrared_08 == 0)
			{
				if (direction != 3)
				{
					direction = 3;
					MT_stop_move();
					delay(1,50);
				}
				LCD_gotoxy(1,1);
				LCD_write_string("r-n");
				MT_turn_right();
				IR_get_data();
			} else
			if (infrared_11 == 0 && infrared_08 == 0)
			{
				while (infrared_11 == 0 && infrared_08 == 0)
				{
					if (direction != 1)
					{
						direction = 1;
						MT_stop_move();
						delay(1,50);
					}
					MT_go_forward();
					IR_get_data();
					LCD_gotoxy(1,1);
					LCD_write_string("f-s");
				}
				count = 0;
				while (count < 50 && infrared_11 == 1)
				{
					if (direction != 2)
					{
						direction = 2;
						MT_stop_move();
						delay(1,50);
					}
					count++;
					MT_turn_left();
					IR_get_data();
					LCD_gotoxy(1,1);
					LCD_write_string("l-s");
				}
				if (count == 50)
				{
					count = 0;
					while (count < 100 && infrared_08 == 1)
					{
						if (direction != 3)
						{
							direction = 3;
							MT_stop_move();
							delay(1,50);
						}
						count++;
						MT_turn_right();
						IR_get_data();
						LCD_gotoxy(1,1);
						LCD_write_string("r-s");
					}
				}
			}
		}
		key = KBD_scan_key();
	}
	while (key != '#');
	MT_stop_move();
}

void main(void)
{
	unsigned char i;
	P0 = 0xFF;
	P1 = 0xFF;
	P2 = 0xFF;
	P3 = 0xFF;

	delay(255,255);
	for (i=0;i<255;i++)
	{
		command[i].instruction = 0;
		command[i].value = 0;
	}
	size = 0;
	current = 0;
	while (1)
	{
		LCD_clear();
		LCD_write_string("1.Pattern Robot");
		LCD_gotoxy(1,2);
		LCD_write_string("2.Track Robot");
		key = KBD_get_key();
		switch (key)
		{
		case '1' :	pattern();
					break;
		case '2' :	track();
					break;
		}
	}
	while (1)
	{
	}
}