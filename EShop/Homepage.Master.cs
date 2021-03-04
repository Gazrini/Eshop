using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EShop
{
    public partial class Homepage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime datetime = DateTime.Now;
            int hour = DateTime.Now.Hour;

            if (hour < 12)
            {
                Label1.Text = "Good Morning";
                //Label2.Text = datetime.ToString();
            }
            else
            {
                Label1.Text = "Good Evening";
                //Label2.Text = datetime.ToString();
            }

            //////////////////////

            if (Session["username"] != null && Session["role"] != null)
            {
                LabelStatus.Text = "Hello, " + Session["username"].ToString();
            }
            else
            {
                LabelStatus.Text = "You are not logged in.";
            }
        }
    }
}