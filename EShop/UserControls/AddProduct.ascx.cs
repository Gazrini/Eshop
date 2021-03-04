using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace EShop.UserControls
{
    public partial class AddProduct : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null)
            {

                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                //Save files to images folder
                FileUpload1.SaveAs(Server.MapPath("~/Images/" + filename));
                this.imgItem.ImageUrl = "~/Images/" + filename;
                TextBoxImage.Text = filename;


                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString);
                string sql = @"INSERT INTO products VALUES(@cat_id, @prod_title, @prod_price, @prod_desc, @prod_image)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@cat_id", int.Parse(DropDownList1.Text));
                cmd.Parameters.AddWithValue("@prod_title", TextBoxProductName.Text);
                cmd.Parameters.AddWithValue("@prod_price", double.Parse(TextBoxProductPrice.Text));
                cmd.Parameters.AddWithValue("@prod_desc", TextBoxProductDesc.Text);
                cmd.Parameters.AddWithValue("@prod_image", TextBoxImage.Text);
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblStatus.Text = "Successfully added new product.";
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                }
                catch (SqlException ex)
                {
                    lblStatus.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBoxProductName.Text = "";
            TextBoxProductPrice.Text = "";
            TextBoxProductDesc.Text = "";
            TextBoxImage.Text = "";
            lblStatus.Text = "";
            imgItem.ImageUrl = "~/Images/imageicon.png";
        }
    }
}