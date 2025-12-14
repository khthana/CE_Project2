using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Windows.Forms;

namespace W
{
    public abstract class DrawAble
    {
        #region ref
        protected B board;
        #endregion
        #region Attribute
        protected Color color;
        public Color Color
        {
            set
            {
                color = value;
            }
            get
            {
                return color;
            }
        }
        protected System.Drawing.Point possition;
        /// <summary>
        /// possition x,y on board of drawable object
        /// </summary>
        public System.Drawing.Point Possition
        {
            set
            {
                possition = value;
            }
            get
            {
                return possition;
            }
        }
        protected States state;
        /// <summary>
        /// internal state of drawable object  -state change by method sketch(paras,,,) 
        /// </summary>
        protected virtual States State
        {
            set
            {
                switch (value)
                {
                    case States.First:
                    {
                        possition = System.Drawing.Point.Empty;
                        drawableFrame = null;
                    } break;
                    case States.Final:
                    {
                        this.FillFrame();
                        this.Draw();
                        State = States.Start;
                    } break;
                    default:
                    {
                        state = value;
                    } break;
                }
            }
            get
            {
                return state;
            }
        }
        protected  Frame drawableFrame;
        public virtual Frame DrawableFrame
        {
            get
            {
                if (State == States.Start)
                {
                    return drawableFrame;
                }
                else
                {
                    return null;
                }
            }
        }
        #endregion
        #region Construtor
        public DrawAble(B b)
        {
            board = b;
            drawableFrame = null;
            //State = States.First;
        }
        #endregion
        #region Methods

        /// <summary>
        /// drawing object by receive event paramiter ,etc mouse point,key is pressed
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        public virtual States Sketch(params object[] param)
        {
            return State;
        }
       
        /// <summary>
        /// to First State of Object
        /// </summary>
        public virtual void Clear()
        {
            State = States.First;
        }
        /// <summary>
        /// return Frame which send to network
        /// </summary>
        /// <returns></returns>
        public virtual Frame ToFrame()
        {
            return DrawableFrame;
        }
        /// <summary>
        /// Create,Update Frame
        /// </summary>
        protected virtual void FillFrame()
        {
        }
        /// <summary>
        /// Draw Object to Board
        /// </summary>
        protected virtual void Draw()
        {
        }
        #endregion
    }
}
