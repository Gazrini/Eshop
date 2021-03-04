using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EShop.UserControls
{
    public partial class Withdraw : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime datetime = DateTime.Now;
            TextBox2.Text = datetime.ToString("dd/MM/yyyy");

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
                            TextBox1.Text = Convert.ToString(reader["accountid"]);
                            TextBox3.Text = Convert.ToString(reader["balance"]+".00");
                            TextBox5.Text = reader.GetString(1);
                        }
                    }
                }
            }
        }

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True");

        protected void Button1_Click(object sender, EventArgs e)
        {
            string accountno, date, username, Bank, BankAccount;
            double balance, withdraw;
             

            accountno = TextBox1.Text;
            username = TextBox5.Text;
            date = TextBox2.Text;
            balance = double.Parse(TextBox3.Text);
            withdraw = double.Parse(TextBox4.Text);
            Bank = DropDownList1.Text;
            BankAccount = TextBox6.Text;

            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlTransaction transaction;

            transaction = con.BeginTransaction(); //to execute more than one SQL command queries
            cmd.Connection = con;
            cmd.Transaction = transaction;

            try
            {
                cmd.CommandText = "insert into Transactions(accountid,username,dates,balance,withdraw) values ('" + accountno + "','" + username + "', '" + date + "','" + balance + "', '" + withdraw + "')";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "update EWalletAccount set balance = balance - '" + withdraw + "' where accountid = '" + accountno + "'";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "insert into EWalletWithdrawRequest(accountid,username,dates,Bank,BankAccount,Amount) values ('" + accountno + "','" + username + "', '" + date + "','" + Bank + "', '" + BankAccount + "', '" + withdraw + "')";
                cmd.ExecuteNonQuery();

                if (withdraw > balance)
                {
                    LabelStatus.Text = "";
                    LabelStatus2.Text = "You have insufficient balance in E-wallet";
                    LabelStatus2.ForeColor = System.Drawing.Color.Red;
                    LabelStatus3.Text = "";
                }
                else if (withdraw == 0)
                {
                    LabelStatus.Text = "";
                    LabelStatus2.Text = "";
                    LabelStatus3.Text = "RM 0.00 is not allowed";
                    LabelStatus3.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    transaction.Commit();
                    LabelStatus.Text = "Withdraw complete";
                    LabelStatus.ForeColor = System.Drawing.Color.Green;
                    LabelStatus2.Text = "";
                    LabelStatus3.Text = "";
                }
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
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox4.Text = "";
            TextBox6.Text = "";
            LabelStatus.Text = "";
            LabelStatus2.Text = "";
            LabelStatus3.Text = "";
        }
    }
}