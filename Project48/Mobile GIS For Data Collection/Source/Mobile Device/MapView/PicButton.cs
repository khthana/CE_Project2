using System;
using System.Collections.Generic;
using System.Text;

namespace MapView
{
    class PicButton
    {
        private int MousePosX;
        private int MousePosY;


        //-------------------
        //Fine Button()IN : MousePosition
        public int FineButton(int MouseX,int MouseY)
        {
            if ((MouseX > 3) && (MouseX < 27)) { return 0; } //return button[0]
            else if ((MouseX > 33) && (MouseX < 56)) { return 1; } //return button[1]
            else if ((MouseX > 61) && (MouseX < 85)) { return 2; } //return button[2]
            else if ((MouseX > 90) && (MouseX < 114)) { return 3; } //return button[3]
            else if ((MouseX > 119) && (MouseX < 142)) { return 4; } //return button[4]
            else if ((MouseX > 149) && (MouseX < 172)) { return 5; } //return button[5]
            else if ((MouseX > 177) && (MouseX < 201)) { return 6; } //return button[6]
            else if ((MouseX > 206) && (MouseX < 230)) { return 7; } //return button[7]
            else return 8;
        }

        
    }
}
