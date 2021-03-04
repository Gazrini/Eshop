using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace EShop
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spResetPassword", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUserName = new SqlParameter("@username", TextBoxUsername.Text);

                cmd.Parameters.Add(paramUserName);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (Convert.ToBoolean(rdr["ReturnCode"]))
                    {
                        SendPasswordResetEmail(rdr["email"].ToString(), TextBoxUsername.Text, rdr["UniqueId"].ToString());
                        LabelStatus.Text = "Link to reset your password has been sent to your email";
                        LabelStatus.ForeColor = System.Drawing.Color.Green;
                        HyperLink1.Visible = false;
                    }
                    else
                    {
                        LabelStatus.ForeColor = System.Drawing.Color.Red;
                        LabelStatus.Text = "Username not found";
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBoxUsername.Text = "";
            LabelStatus.Text = "";
        }

        private void SendPasswordResetEmail(string toEmail, string username, string UniqueId)
        {
            //Mail message class is present  is System.Net.Mail namespace
            MailMessage mailMessage = new MailMessage("admiiiineshop@gmail.com", toEmail);

            //StringBuilder class is present in System.Text namespace
            StringBuilder sbEmailBody = new StringBuilder();

            sbEmailBody.Append("Dear " + username + ",<br/><br/>");
            sbEmailBody.Append("Please click on the following link to reset your password");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("http://localhost:57138/ChangePassword.aspx?uid=" + UniqueId);
            sbEmailBody.Append("<br/><br/>");

            mailMessage.IsBodyHtml = true;

            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Reset your password";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "admiiiineshop@gmail.com",
                Password = "admin_1234"
            };

            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessage);
        }
    }
}


