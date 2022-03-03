using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp.UI
{
    public partial class calculator : System.Web.UI.Page
    {
        private string value;
        private int firstValue;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i = 1;
            textvalue.Text += i;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            int i = 2;
            textvalue.Text += i;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int i = 3;
            textvalue.Text += i;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            int i = 4;
            textvalue.Text += i;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            int i = 7;
            textvalue.Text += i;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            int i = 8;
            textvalue.Text += i;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            int i = 9;
            textvalue.Text += i;
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            int i = 2;
            textvalue.Text += i;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            int i = 5;
            textvalue.Text += i;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            int i = 6;
            textvalue.Text += i;
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            textvalue.Text = "";
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            int i = 0;
            textvalue.Text += i;
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            string value = "%";
            textvalue.Text += value;
        }

        protected void Button17_Click(object sender, EventArgs e)
        {
            check.Text =Convert.ToString(firstValue);
            //int add = Convert.ToInt32( textvalue.Text);
            //Console.WriteLine(firstValue);
                textvalue.Text =Convert.ToString( firstValue + Convert.ToInt32(textvalue.Text));
            
        }

        protected void Button11_Click(object sender, EventArgs e)
        {   
            firstValue = Convert.ToInt32(textvalue.Text);
           // string value = "/";
            textvalue.Text = "";
          
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            string value = "-";
            textvalue.Text += value;
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            string value = "+";
            textvalue.Text += value;
        }
    }
}