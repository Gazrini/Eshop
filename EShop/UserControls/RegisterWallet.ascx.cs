using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

namespace EShop.UserControls
{
    public partial class RegisterWallet : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Accid();
        }

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True");

        public void Accid()
        {
            con.Open();
            string query = "select max (accountid) from EWalletAccount";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string val = dr[0].ToString();
                if (val == "")
                {
                    Label1.Text = "10000";
                }
                else
                {
                    int a;
                    a = int.Parse(dr[0].ToString());
                    a = a + 1;
                    Label1.Text = a.ToString();
                }
                con.Close();
            }
        }

        private Boolean Checkusername()
        {
            Boolean usernameavailable = false;
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            String myquery = "Select * from EWalletAccount where username='" + TextBox1.Text + "'";
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

        private Boolean Checkemail()
        {
            Boolean emailavailable = false;
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            String myquery = "Select * from EWalletAccount where email='" + TextBox2.Text + "'";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            //If else statement to check username and email  dah register ke belum dalam system
            if (Checkusername() == true)
            {
                LabelCheckUsername.Text = "Username already registered";
                LabelCheckUsername.ForeColor = System.Drawing.Color.Red;
                TextBox1.BackColor = System.Drawing.Color.Red;
                LabelStatus.Text = "";
            }
            else if (Checkemail() == true)
            {
                LabelCheckEmail.Text = "Email already registered";
                LabelCheckEmail.ForeColor = System.Drawing.Color.Red;
                TextBox2.BackColor = System.Drawing.Color.Red;
                LabelStatus.Text = "";
            }
            else if (Checkusername() == true || Checkemail() == true)
            {
                LabelCheckUsername.Text = "Username already registered";
                LabelCheckUsername.ForeColor = System.Drawing.Color.Red;
                TextBox1.BackColor = System.Drawing.Color.Red;
                LabelCheckEmail.Text = "Email already registered";
                LabelCheckEmail.ForeColor = System.Drawing.Color.Red;
                TextBox2.BackColor = System.Drawing.Color.Red;
                LabelStatus.Text = "";
            }
            else
            {
                string accountid, username, email, accounttype, balance;

                accountid = Label1.Text;
                username = TextBox1.Text;
                email = TextBox2.Text;
                accounttype = TextBox3.Text;
                balance = TextBox4.Text;

                SqlCommand cmd = new SqlCommand();
                SqlTransaction transaction; //Use sql transaction to run more than one sql query at the same time
                con.Open();
                transaction = con.BeginTransaction();
                cmd.Connection = con;
                cmd.Transaction = transaction;

                try
                {
                    cmd.CommandText = "insert into EWalletAccount(accountid,username,email,accounttype,balance) values ('" + accountid + "', '" + username + "','" + email + "', '" + accounttype + "','" + balance + "')";
                    cmd.ExecuteNonQuery();
                    transaction.Commit();
                    LabelStatus.Text = "Successfully create E-wallet";
                    LabelStatus.ForeColor = System.Drawing.Color.Green;
                    TextBox1.BackColor = System.Drawing.Color.White;
                    TextBox2.BackColor = System.Drawing.Color.White;
                    LabelCheckUsername.Text = "";
                    LabelCheckEmail.Text = "";
                }
                catch (SqlException ex)
                {
                    transaction.Rollback();
                    LabelStatus.Text = ex.Message;
                }
                finally
                {
                    con.Close();
                }

                // Email users after done registered E-Wallet
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;

                smtp.Credentials = new System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234");
                smtp.EnableSsl = true;
                MailMessage msg = new MailMessage();
                msg.Subject = "E-Wallet Registeration Details";
                msg.Body = "New Registration Details \n\n-------------------\n\nName : " + TextBox1.Text + "\n\nEmail Address :" + TextBox2.Text + "\n\nAccount Type:" + TextBox3.Text + "\n\nBalance:" + TextBox4.Text;

                string toaddress = (TextBox2.Text);
                msg.To.Add(toaddress);
                string fromaddress = ("admiiiineshop@gmail.com");
                msg.From = new MailAddress(fromaddress);

                try
                {
                    smtp.Send(msg);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('E-wallet Registration email has been send succesfully');", true);
                }
                catch
                {
                    throw;
                }

                LinkButton1.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = String.Empty;
            TextBox2.Text = String.Empty;
            TextBox1.BackColor = System.Drawing.Color.White;
            TextBox2.BackColor = System.Drawing.Color.White;
            LabelCheckUsername.Text = "";
            LabelCheckEmail.Text = "";
            LabelStatus.Text = "";
        }
    }
}