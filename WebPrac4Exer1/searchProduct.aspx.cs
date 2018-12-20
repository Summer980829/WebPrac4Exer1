using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrac4Exer1
{
    public partial class DataBound : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            
            lblResult.Text = "" + Repeater1.Items.Count;
        }
    }
}