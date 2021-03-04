using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EShop.UserControls
{
    public partial class Ewallet : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                            Label1.Text = Convert.ToString(reader["accountid"]); //convert integer value into string in reader
                            TextBox1.Text = reader.GetString(1);
                            TextBox2.Text = reader.GetString(2);
                            TextBox3.Text = reader.GetString(3);
                            TextBox4.Text = Convert.ToString(reader["balance"]+".00"); //convert integer value into string in reader
                            LabelBalance.Text = Convert.ToString(reader["balance"]+".00");
                        }
                    }
                }
            }
        }
    }
}