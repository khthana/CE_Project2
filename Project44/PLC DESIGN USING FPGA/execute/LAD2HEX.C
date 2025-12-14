/*
*   Program : lad2hex.exe (Ladder to HEX Code)
*   Author  : Siri Chongasamethaworn 41014417 4D
*   Date    : 23-02-02
*   Descripion : This program use in my project Design PLC Using FPGA.
*                Program must convert Ladder Language into HEX Code for
*                Xilinx XS40
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <dos.h>
#include "lad2hex.h"
//#include <conio.h>

typedef unsigned char byte;
typedef unsigned int word;

void writebuf(FILE *f, char buf[], unsigned int size)
{
   register unsigned int i;
   for (i=0; i<size; i++) putc(buf[i], f);
}

int main(int argc, char *argv[])
{
   FILE *fin;               // File input stream
   FILE *fout;              // File output stream
   char filein[12] ="\0";   // Name of input file
   char fileout[12]="\0";   // Name of output file
   int c,i = 0;             // For loop
   char input;              // Keep curren input charactor from input file
   char strrelay[5];        // Keep number of relay in string
   byte intrelay;           // Keep number of relay in numaric
   word values;             // Keep values of relay for TIM/CNT
   byte first_values;       // Keep first byte of values of relay for TIM/CNT
   long ptr = 0;            // Keep (current&number) of charactor in input file
   word line = 0;           // Keep (current&number) of line in input file
   byte opcode;             // Keep opcode of instruction (Not use)
   byte error_no;           // Keep error number
   struct time time1, time2;// Keep time for measure compile time of program
   byte o_break = 0;        // Keep option break if error
   word maxbuf = 969;       // Keep max buffer (default = 969)
   char *buf;               // Keep output buffer
   word buf_ptr;            // Keep current pointer buffer
   word error = 0;          // Keep number of error
   word nbytes = 0;         // Keep number of bytes

   /* Start getting time */
   gettime(&time1);
   /* Check valid argument */
   if (argc<=1)
   {
      fprintf(stderr, "lad2hex.exe: No input file\n");
      return 1;
   }
   for (c=1; c<argc; c++)
   {
      /* Keep option */
      if (argv[c][0] == '-')
      {
         /* rename output file */
         if (argv[c][1] == 'o')
         {
            strcpy(fileout, argv[++c]);
            continue;
         }
         /* break if found error */
         if (argv[c][1] == 'b')
         {
            o_break = 1;
            continue;
         }
         /* allocate max buffer */
         if (argv[c][1] == 'a')
         {
            maxbuf = (byte)atoi(argv[++c]);
            continue;
         }
         /* show help screen */
         if (argv[c][1] == 'h')
         {
            fprintf(stdout, "LADDER Compiler - LADDER Compiler to HEX Code\nWritten by Siri Chongasamethaworn 23/02/02 e-mail:ennohc@engineer.com\nSynopsis: lad2hex [option] file...\nOption: \n    -o <filename>  Rename output file\n    -b             Break if found error\n    -a <maxbuffer> Define a max buffer (default = 969)\n    -h             Show this help.\nExamples: \n    lad2hex input.asm \n    lad2hex -o output.hex input.asm \n");
            return 0;
         }
         fprintf(stdout, "Invalid option type -h to see help\n");
      }
      /* show help screen */
      else if (argv[c][0] == '/')
      {
         if (argv[c][1] == '?')
         {
            fprintf(stdout, "LADDER Compiler - LADDER Compiler to HEX Code\nWritten by Siri Chongasamethaworn 23/02/02 e-mail:ennohc@engineer.com\nUsage: lad2hex [option] file...\nOption: \n    -o <filename>  Rename output file\n    -b             Break if found error\n    -a <maxbuffer> Define a max buffer (default = 969)\n    -h             Show this help.\nExamples: \n    lad2hex input.asm \n    lad2hex -o output.hex input.asm \n");
            return 0;
         }
         fprintf(stdout, "Invalid option type -h to see help\n");
      }
      else
      {
         strcpy(filein, argv[c]);
         if (fileout[0]=='\0')
         {
            while (argv[c][i] != '.') fileout[i] = argv[c][i++];
            fileout[i] = '\0';
            strcat(fileout, ".hex");
         }
         if (c < argc-1)
         {
            fprintf(stderr, "Invalid argument %s\n", argv[++c]);
            return 1;
         }
      }
   }
   if (filein[0] == '\0')
   {
      fprintf(stderr, "lad2hex.exe: No input file\nExample: lad2hex -o output.hex input.asm");
      return 1;
   }
   if ((fin = fopen(filein, "rb")) == NULL)
   {
      fprintf(stderr, "Error open file %s\n", filein);
      return 1;
   }
   if ((fout = fopen("lad2hex.swp", "wb")) == NULL)
   {
      fprintf(stderr, "Error open file %s\n", fileout);
      return 1;
   }
//   clrscr();

//   fprintf(fout, "- 21 0000");
   buf = (char*)malloc(maxbuf);
   sprintf(&buf[0], "- XX 0000"); buf_ptr = 9;
   if (buf_ptr >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
   input = toupper(getc(fin)); // advance the input
   ptr++;
   while (!feof(fin))
   {
      error_no = 0;
      while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
      if (input == '\r' || input == '\n') line++;
      if (input == EOF) { line++; break; }
      /* Recognize "LD & LDI" */
      if (toupper(input) == 'L')
      {
         input = toupper(getc(fin)); // advance the input
         ptr++;
         if (input == 'D')
         {
            input = toupper(getc(fin)); // advance the input
            ptr++;
            /* Recognize "LDI RELAY" */
            if (input == 'I')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LDI);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LDI, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LDI);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LDI, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LDI);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LDI, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LDI);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LDI, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            /* Recognize "LD RELAY" */
            else if (isspace(input))
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LD);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LD, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LD);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LD, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LD);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LD, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", LD);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", LD, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            else
            {
               error_no = INSTRUCTION;
            }
         }
         else
         {
            error_no = INSTRUCTION;
         }
      }
      /* Recognize AND ANI */
      else if (toupper(input) == 'A')
      {
         input = toupper(getc(fin)); // advance the input
         ptr++;
         if (input == 'N')
         {
            input = toupper(getc(fin)); // advance the input
            ptr++;
            /* Recognize "AND RELAY" */
            if (input == 'D')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", AND);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", AND, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", AND);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", AND, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", AND);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", AND, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", AND);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", AND, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            /* Recognize "ANI RELAY" */
            else if (input == 'I')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ANI);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ANI, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ANI);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ANI, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ANI);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ANI, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ANI);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ANI, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            /* Recognize "ANB RELAY" */
            else if (input == 'B')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (input != '\r' && input != EOF) { input = getc(fin); ptr++; }
               if (input == '\r' || input == '\n') line++;
//               fprintf(fout, " %02x", ANB);
               sprintf(&buf[buf_ptr], " %02x", ANB);
               if ((buf_ptr += 3) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
               nbytes+=1;
            }
            else
            {
               error_no = INSTRUCTION;
            }
         }
         else
         {
            error_no = INSTRUCTION;
         }
      }
      /* Recognize "OR & ORI & OUT & OUI" */
      else if (toupper(input) == 'O')
      {
         input = toupper(getc(fin)); // advance the input
         ptr++;
         /* Recognize "OR & ORI" */
         if (input == 'R')
         {
            input = toupper(getc(fin)); // advance the input
            ptr++;
            /* Recognize "ORI RELAY" */
            if (input == 'I')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ORI);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ORI, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ORI);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ORI, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ORI);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ORI, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", ORI);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", ORI, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            /* Recognize "OR RELAY" */
            else if (isspace(input))
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OR);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OR, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OR);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OR, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OR);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OR, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OR);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OR, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            /* Recognize "ORB RELAY" */
            else if (input == 'B')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (input != '\r' && input != EOF) { input = getc(fin); ptr++; }
               if (input == '\r' || input == '\n') line++;
//               fprintf(fout, " %02x", ORB);
               sprintf(&buf[buf_ptr], " %02x", ORB);
               if ((buf_ptr += 3) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
               nbytes+=1;
            }
            else
            {
               error_no = INSTRUCTION;
            }
         }
         /* Recognize "OUT & OUI" */
         else if (input == 'U')
         {
            input = toupper(getc(fin)); // advance the input
            ptr++;
            /* Recognize "OUT RELAY" */
            if (input == 'T')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUT);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUT, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUT);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUT, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUT);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUT, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUT);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUT, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            /* Recognize "OUI RELAY" */
            else if (input == 'I')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* is input RELAY */
               if (toupper(input) == 'X')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUI);
//                  fprintf(fout, " %02x", X | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUI, X | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'Y')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUI);
//                  fprintf(fout, " %02x", Y | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUI, Y | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'M')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUI);
//                  fprintf(fout, " %02x", M | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUI, M | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else if (toupper(input) == 'T')
               {
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = RELAYNUM;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  intrelay = (byte)atoi(strrelay);
//                  fprintf(fout, " %02x", OUI);
//                  fprintf(fout, " %02x", T | intrelay);
                  sprintf(&buf[buf_ptr], " %02x %02x", OUI, T | intrelay);
                  if ((buf_ptr += 6) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=2;
               }
               else
               {
                  error_no = RELAYTYPE;
               }
            }
            else
            {
               error_no = INSTRUCTION;
               while (!isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               if (input == '\r' || input == '\n') line++;
            }
         }
         else
         {
            error_no = INSTRUCTION;
         }
      }
      /* Recognize END */
      else if (toupper(input) == 'E')
      {
         input = toupper(getc(fin)); // advance the input
         ptr++;
         if (input == 'N')
         {
            input = toupper(getc(fin)); // advance the input
            ptr++;
            if (input == 'D')
            {
               input = getc(fin); // advance the input
               ptr++;
               while (input != '\r' && input != EOF) { input = getc(fin); ptr++; }
               if (input == '\r' || input == '\n') line++;
//               fprintf(fout, " %02x", END);
               sprintf(&buf[buf_ptr], " %02x", END);
               if ((buf_ptr += 3) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
               nbytes+=1;
            }
         }
      }
      /* Recognize TIM */
      else if (toupper(input) == 'T')
      {
         input = toupper(getc(fin)); // advance the input
         ptr++;
         if (input == 'I')
         {
            input = toupper(getc(fin)); // advance the input
            ptr++;
            if (input == 'M')
            {
               input = toupper(getc(fin)); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* Get Relay No. */
               i=0;
               do
               {
                  input = getc(fin);
                  ptr++;
                  if (isdigit(input)) { strrelay[i++] = input; }
                  else if (!isspace(input) && input != EOF)
                  {
                     error_no = RELAYNUM;
                  }
               }
               while (!isspace(input) && input != EOF);
               strrelay[i] = '\0';
               while (isspace(input) && input != EOF) { if (input == '\r') line++; input = getc(fin); ptr++; }
               intrelay = (byte)atoi(strrelay);
               intrelay = intrelay << 6;
               if (input == '#')
               {
                  /* Get Values */
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = VALUES;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  while (input != '\r' && input != '\n' && input != EOF) { input = getc(fin); ptr++; }
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  values = (word)atoi(strrelay);
                  values = values & 0x3FFF;
                  first_values = values >> 8;
//                  fprintf(fout, " %02x %02x %02x", TIM, intrelay | first_values, 0x00FF & values);
                  sprintf(&buf[buf_ptr], " %02x %02x %02x", TIM, intrelay | first_values, 0x00FF & values);
                  if ((buf_ptr += 9) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=3;
               }
               else
               {
                  error_no = VALUES;
               }
            }
         }
      }
      /* Recognize CNT */
      else if (toupper(input) == 'C')
      {
         input = toupper(getc(fin)); // advance the input
         ptr++;
         if (input == 'N')
         {
            input = toupper(getc(fin)); // advance the input
            ptr++;
            if (input == 'T')
            {
               input = toupper(getc(fin)); // advance the input
               ptr++;
               while (isspace(input) && input != EOF) { input = getc(fin); ptr++; }
               /* Get Relay No. */
               i=0;
               do
               {
                  input = getc(fin);
                  ptr++;
                  if (isdigit(input)) { strrelay[i++] = input; }
                  else if (!isspace(input) && input != EOF)
                  {
                     error_no = RELAYNUM;
                  }
               }
               while (!isspace(input) && input != EOF);
               strrelay[i] = '\0';
               while (isspace(input) && input != EOF) { if (input == '\r') line++; input = getc(fin); ptr++; }
               intrelay = (byte)atoi(strrelay);
               intrelay = intrelay << 6;
               if (input == '#')
               {
                  /* Get Values */
                  i=0;
                  do
                  {
                     input = getc(fin);
                     ptr++;
                     if (isdigit(input)) { strrelay[i++] = input; }
                     else if (!isspace(input) && input != EOF)
                     {
                        error_no = VALUES;
                     }
                  }
                  while (!isspace(input) && input != EOF);
                  strrelay[i] = '\0';
                  while (input != '\r' && input != '\n' && input != EOF) { input = getc(fin); ptr++; }
                  if (input == '\r' || input == '\n' || input == EOF) line++;
                  values = (word)atoi(strrelay);
                  values = values & 0x3FFF;
                  first_values = values >> 8;
//                  fprintf(fout, " %02x %02x %02x", CNT, intrelay | first_values, 0x00FF & values);
                  sprintf(&buf[buf_ptr], " %02x %02x %02x", CNT, intrelay | first_values, 0x00FF & values);
                  if ((buf_ptr += 9) >= maxbuf) { writebuf(fout, buf, buf_ptr); buf_ptr = 0; }
                  nbytes+=3;
               }
               else
               {
                  error_no = VALUES;
               }
            }
         }
      }
      else if (input == ';')
      {
         while (input != '\r' && input != EOF) { input = getc(fin); ptr++; }
         if (input == '\r' || input == '\n') line++;
      }
      else
      {
         error_no = INSTRUCTION;
      }

      if (error_no > 0)
      {
         while (input != '\r' && input != EOF) { input = getc(fin); ptr++; }
         if (input == '\r' || input == '\n') line++;
         switch (error_no)
         {
            case INSTRUCTION: fprintf(stderr, "Error line %d(%d): Invalid instruction\n", line, ptr); break;
            case RELAYTYPE  : fprintf(stderr, "Error line %d(%d): Invalid relay type\n", line, ptr); break;
            case RELAYNUM   : fprintf(stderr, "Error line %d(%d): Invalid relay number\n", line, ptr); break;
            case VALUES     : fprintf(stderr, "Error line %d(%d): Invalid values number\n", line, ptr); break;
         }
         error++;
         if (o_break) break;
      }
   }

   writebuf(fout, buf, buf_ptr);
   fseek(fout, (long)2, SEEK_SET);
   if (nbytes > 255)
   {
      fprintf(stderr, "Error : Maximum RAM on board XS40\n");
      error++;
   }
   else
      fprintf(fout, "%02x", nbytes);

   free(buf);
   fclose(fin);
   fclose(fout);
   if (error>0)
   {
      printf("total error = %d\n", error);
      remove("./lad2hex.swp");
   }
   else
   {
      remove(fileout);
      rename("./lad2hex.swp", fileout);
   }

   /* End of program return program time */
   printf("total line=%u, char=%d\n", line, ptr);
   gettime(&time2);
   if (time2.ti_hund < time1.ti_hund)
      printf("Total compile time is: %02d.%02d seconds\n", time2.ti_sec-time1.ti_sec, time2.ti_hund+(100-time1.ti_hund));
   else
      printf("Total compile time is: %02d.%02d seconds\n", time2.ti_sec-time1.ti_sec, time2.ti_hund-time1.ti_hund);
   return 0;
}
