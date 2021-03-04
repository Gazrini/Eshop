using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EShop.UserControls
{
    public partial class AdminLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM admin WHERE adminname=@adminname";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@adminname", TextBoxAdminName.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Object objpasswordhash = dt.Rows[0]["passwordhash"];
                Object objrole = dt.Rows[0]["role"];
                Object objenabled = dt.Rows[0]["enabled"];
                string password = TextBoxPassword.Text;
                string storedpasswordhash = objpasswordhash.ToString();
                PBKDF2Hash PwdHash = new PBKDF2Hash(password, storedpasswordhash);
                bool passwordcheck = PwdHash.PasswordCheck;
                bool enabled = Convert.ToBoolean(objenabled);

                if (passwordcheck == true && enabled == true)
                {
                    Session["adminname"] = TextBoxAdminName.Text;
                    Session["role"] = objrole;

                    if (Session["role"].ToString() == "admin")
                        Response.Redirect("ManageProduct.aspx");
                    else
                        Response.Redirect("AdminLogin.aspx");
                    Session.RemoveAll();
                }
                else
                {
                    LabelStatus.Text = "Incorrect username or password";
                    LabelStatus.ForeColor = System.Drawing.Color.Red;
                }
                Session.RemoveAll();
            }
            else
            {
                LabelStatus.Text = "Incorrect username or password";
                LabelStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            TextBoxAdminName.Text = String.Empty;
            TextBoxPassword.Text = String.Empty;
        }
    }
}