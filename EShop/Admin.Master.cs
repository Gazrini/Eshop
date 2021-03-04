using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EShop
{
    public partial class Admin : System.Web.UI.MasterPage
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

            /////////////////////////////////////////////

            if (Session["role"] == null || Session["role"].ToString() != "admin") //untuk elakkan user access if tak login
            {
                Response.Redirect("AdminLogin.aspx");
            }

            //////////////////////////////////////////////

            if (Session["adminname"] != null && Session["role"] != null)
            {
                LinkButtonLogout.Visible = true;
                LabelStatus.Text = "Welcome "
                + Session["adminname"].ToString();
            }
            else
            {
                LinkButtonLogout.Visible = false;
                LabelStatus.Text = "You are not logged in.";
            }
        }

        protected void LinkButtonLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Logout.aspx");
        }
    }
}