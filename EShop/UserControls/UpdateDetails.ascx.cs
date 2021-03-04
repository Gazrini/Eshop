using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EShop.UserControls
{
    public partial class UpdateDetails : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("select * from users where username = @username", con))
                {
                    cmd.Parameters.AddWithValue("@username", Session["username"]);
                    cmd.CommandType = CommandType.Text;

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult | CommandBehavior.SingleRow))
                    {
                        if (reader.Read())
                        {
                            TextBoxUsername.Text = reader.GetString(1);
                            TextBoxEmail.Text = reader.GetString(2);
                            TextBoxPhoneNo.Text = reader.GetString(3);
                            TextBoxAddress.Text = reader.GetString(4);
                        }
                    }
                }
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand("Update users set email = @email, phoneNo = @phoneNo, address = @address where username = @username", con))
            {
                cmd.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                cmd.Parameters.AddWithValue("@phoneNo", TextBoxPhoneNo.Text);
                cmd.Parameters.AddWithValue("@address", TextBoxAddress.Text);
                cmd.Parameters.AddWithValue("@username", Session["username"]);
                cmd.CommandType = CommandType.Text;

                con.Open();
                cmd.ExecuteNonQuery();
            }
            LabelStatus.Text = "Profile Successfully updated";
            LabelStatus.ForeColor = System.Drawing.Color.Green;
        }
    }
}