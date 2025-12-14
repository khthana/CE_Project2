using System;
using System.Collections.Generic;
using System.Text;

namespace W
{
    public interface IMenu
    {
       void ShowMenu();
        void Update_();
        void Close_();
        /// <summary>
        /// get groupbox to add setting object forms
        /// </summary>
        /// <returns></returns>
       System.Windows.Forms.GroupBox GetPropertiesBox();   
    }
}
