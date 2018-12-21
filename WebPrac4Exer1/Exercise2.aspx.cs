using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrac4Exer1
{
    public partial class Exercise2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblTitleGridView.Text = "Sales Order by " + ddlStaffName.SelectedItem.Text + " in the year of " + rblYear.SelectedItem.Value;
        }
    }
}