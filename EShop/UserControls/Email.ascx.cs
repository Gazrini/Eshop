using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace EShop.UserControls
{
    public partial class Email : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            countRegistration();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox status = (row.Cells[2].FindControl("CheckBox1") as CheckBox);
                String emailadd = row.Cells[1].Text;
                if (status.Checked)
                {
                    sendcustomermail(emailadd);
                }
            }
        }

        private void sendcustomermail(String emailadd1)
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = TextBox1.Text;
            msg.Body = TextBox2.Text + "\n\n\nThanks & Regards.\nEshop system";
            string toaddress = emailadd1;
            msg.To.Add(toaddress);
            string fromaddress = "Eshop admin <admiiiineshop@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }
            Response.Write("Email sent to " + emailadd1);
            Label2.Text = "Email sent";
            Label2.ForeColor = System.Drawing.Color.Green;
        }

        private void countRegistration()
        {
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            String myquery = "Select count(*) from users";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            Label1.Text = ds.Tables[0].Rows[0][0].ToString();
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox2.Text = "";
        }
    }
}