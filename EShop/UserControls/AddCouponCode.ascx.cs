using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace EShop.UserControls
{
    public partial class AddCouponCode : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString);
            string sql = @"INSERT INTO coupondetails VALUES(@couponid, @couponcode, @discount, @maxdiscount)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@couponid", TextBox1.Text);
            cmd.Parameters.AddWithValue("@couponcode", TextBox2.Text);
            cmd.Parameters.AddWithValue("@discount", TextBox3.Text);
            cmd.Parameters.AddWithValue("@maxdiscount", TextBox4.Text);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                LabelStatus.Text = "New discount code added.";
                LabelStatus.ForeColor = System.Drawing.Color.Green;
            }
            catch (SqlException ex)
            {
                LabelStatus.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
    }
}