using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EShop
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime datetime = DateTime.Now;
            int hour = DateTime.Now.Hour;

            if (hour < 12)
            {
                Label1.Text = "Good Morning"; //aku hide ni ganti display e walet balance
                //Label2.Text = datetime.ToString();
            }
            else
            {
                Label1.Text = "Good Evening"; //aku hide ni ganti display e walet balance
                //Label2.Text = datetime.ToString();
            }

            ///////////////////////////////////////

            if (Session["role"] == null || Session["role"].ToString() != "user") //untuk elakkan user access if tak login
            {
                Response.Redirect("Login.aspx");
            }

            ////////////////////////////////////////

            if (Session["username"] != null && Session["role"] != null)
            {
                LinkButtonLogout.Visible = true;
                LabelStatus.Text = "Hello, "
                + Session["username"].ToString();
            }
            else
            {
                LinkButtonLogout.Visible = false;
                LabelStatus.Text = "You are not logged in.";
            }

            if (!Page.IsPostBack)
            {

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("select * from EWalletAccount where username = @username", con))
                {
                    cmd.Parameters.AddWithValue("@username", Session["username"]);
                    cmd.CommandType = CommandType.Text;

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult | CommandBehavior.SingleRow))
                    {
                        if (reader.Read())
                        {
                            Label3.Text = Convert.ToString(reader["balance"] + ".00");
                        }
                    }
                }
            }
        }

        protected void LinkButtonLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Logout.aspx");
        }
    }
}