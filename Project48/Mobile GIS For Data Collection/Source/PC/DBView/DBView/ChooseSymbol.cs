using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DBView
{
    public partial class ChooseSymbol : Form
    {
        private int SymbolIndex;
        public ChooseSymbol()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }

        public int GetSymbolIndex() {
            if (radioButton1.Checked) SymbolIndex = 1;
            if (radioButton2.Checked) SymbolIndex = 2;
            if (radioButton3.Checked) SymbolIndex = 3;
            return SymbolIndex;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }
    }
}