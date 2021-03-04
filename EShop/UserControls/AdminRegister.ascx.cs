using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace EShop.UserControls
{
    public partial class AdminRegister : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            string password = TextBoxPassword.Text;
            PBKDF2Hash PwdHash = new PBKDF2Hash(password);
            string passwordhash = PwdHash.HashedPassword;
            bool enabled = true;
            SqlConnection conn = new SqlConnection(ConfigurationManager.
            ConnectionStrings["ConnStringStoreDB"].ConnectionString);
            string sql = @"INSERT INTO admin VALUES(@adminname, @email, @phoneNo, @address, @passwordhash, @role, @enabled)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@adminname", TextBoxAdminName.Text);
            cmd.Parameters.AddWithValue("@email", TextBoxEmail.Text);
            cmd.Parameters.AddWithValue("@phoneNo", TextBoxPhoneNo.Text);
            cmd.Parameters.AddWithValue("@address", TextBoxAddress.Text);
            cmd.Parameters.AddWithValue("@passwordhash", passwordhash);
            cmd.Parameters.AddWithValue("@role", "admin");
            cmd.Parameters.AddWithValue("@enabled", enabled);
            try
            {

                conn.Open();
                cmd.ExecuteNonQuery();
                LabelStatus.Text = "Register Success";
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

            // Email users after done registered
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;

            smtp.Credentials = new System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "New Users Registeration Details";
            msg.Body = "New Registration Details \n\n-------------------\n\nName : " + TextBoxAdminName.Text + "\n\nEmail Address :" + TextBoxEmail.Text + "\n\nPhone Number:" + TextBoxPhoneNo.Text + "\n\nAddress:" + TextBoxAddress.Text;

            string toaddress = (TextBoxEmail.Text);
            msg.To.Add(toaddress);
            string fromaddress = ("admiiiineshop@gmail.com");
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Registration email has been send succesfully');", true);
            }
            catch
            {
                throw;
            }
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            TextBoxAdminName.Text = String.Empty;
            TextBoxEmail.Text = String.Empty;
            TextBoxPhoneNo.Text = String.Empty;
            TextBoxAddress.Text = String.Empty;
            TextBoxPassword.Text = String.Empty;
            TextBoxConPass.Text = String.Empty;
            LabelStatus.Text = "";
        }
    }
}