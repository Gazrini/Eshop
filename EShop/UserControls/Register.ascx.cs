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
using System.Data;

namespace EShop.UserControls
{
    public partial class Register : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private Boolean Checkemail()
        {
            Boolean emailavailable = false;
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            String myquery = "Select * from users where email='" + TextBoxEmail.Text + "'";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                emailavailable = true;
            }
            con.Close();
            return emailavailable;
        }

        private Boolean Checkusername()
        {
            Boolean usernameavailable = false;
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            String myquery = "Select * from users where username='" + TextBoxUsername.Text + "'";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                usernameavailable = true;
            }
            con.Close();
            return usernameavailable;
        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            //If else statement to check username and email  dah register ke belum dalam system
            if (Checkusername() == true)
            {
                LabelCheckUsername.Text = "Username already registered";
                LabelCheckUsername.ForeColor = System.Drawing.Color.Red;
                TextBoxUsername.BackColor = System.Drawing.Color.Red;

                LabelStatus.Text = "";
            }
            else if (Checkemail() == true)
            {
                LabelCheckEMail.Text = "Email already registered";
                LabelCheckEMail.ForeColor = System.Drawing.Color.Red;
                TextBoxEmail.BackColor = System.Drawing.Color.Red;

                LabelStatus.Text = "";
            }
            else if (Checkusername() == true || Checkemail() == true)
            {
                LabelCheckUsername.Text = "Username already registered";
                LabelCheckUsername.ForeColor = System.Drawing.Color.Red;
                TextBoxUsername.BackColor = System.Drawing.Color.Red;

                LabelCheckEMail.Text = "Email already registered";
                LabelCheckEMail.ForeColor = System.Drawing.Color.Red;
                TextBoxEmail.BackColor = System.Drawing.Color.Red;

                LabelStatus.Text = "";
            }
            else
            {
                string password = TextBoxPassword.Text;
                PBKDF2Hash PwdHash = new PBKDF2Hash(password);
                string passwordhash = PwdHash.HashedPassword;
                bool enabled = true;
                SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnStringStoreDB"].ConnectionString);
                string sql = @"INSERT INTO users VALUES(@username, @email, @phoneNo, @address, @passwordhash, @role, @enabled)";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", TextBoxUsername.Text);
                cmd.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                cmd.Parameters.AddWithValue("@phoneNo", TextBoxPhoneNo.Text);
                cmd.Parameters.AddWithValue("@address", TextBoxAddress.Text);
                cmd.Parameters.AddWithValue("@passwordhash", passwordhash);
                cmd.Parameters.AddWithValue("@role", "user");
                cmd.Parameters.AddWithValue("@enabled", enabled);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    LabelStatus.Text = "Register Success";
                    LabelStatus.ForeColor = System.Drawing.Color.Green;
                    LabelCheckEMail.Text = "";
                    LabelCheckUsername.Text = "";
                    TextBoxEmail.BackColor = System.Drawing.Color.White;
                    TextBoxUsername.BackColor = System.Drawing.Color.White;
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
                msg.Body = "New Registration Details \n\n-------------------\n\nName : " + TextBoxUsername.Text + "\n\nEmail Address :" + TextBoxEmail.Text + "\n\nPhone Number:" + TextBoxPhoneNo.Text + "\n\nAddress:" + TextBoxAddress.Text;

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

                Response.Redirect("RegisterWalletPage.aspx");
            }
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            TextBoxUsername.Text = String.Empty;
            TextBoxEmail.Text = String.Empty;
            TextBoxPhoneNo.Text = String.Empty;
            TextBoxAddress.Text = String.Empty;
            TextBoxPassword.Text = String.Empty;
            TextBoxConPass.Text = String.Empty;
            TextBoxEmail.BackColor = System.Drawing.Color.White;
            TextBoxUsername.BackColor = System.Drawing.Color.White;
            LabelCheckEMail.Text = "";
            LabelCheckUsername.Text = "";
            LabelStatus.Text = "";
        }
    }
}