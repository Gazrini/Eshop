using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace EShop.UserControls
{
    public partial class Feedback : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;

            smtp.Credentials = new System.Net.NetworkCredential(TextBoxFrom.Text, TextBoxPassword.Text);
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();

            msg.Subject = TextBoxSubject.Text;
            msg.Body = TextBoxMessage.Text;

            string fromaddress = (TextBoxFrom.Text);
            msg.From = new MailAddress(fromaddress);

            string toaddress = ("admiiiineshop@ gmail.com"); 
            msg.To.Add(toaddress);

            try
            {
                smtp.Send(msg);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Message has been send succesfully');", true);
            }
            catch
            {
                throw;
            }
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            TextBoxSubject.Text = String.Empty;
            TextBoxMessage.Text = String.Empty;
            TextBoxFrom.Text = String.Empty;
        }
    }
}