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
    public partial class Deposit : System.Web.UI.UserControl
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
            TextBox4.Text = "";
            LabelStatus.Text = "";
            LabelStatus2.Text = "";
            LabelStatus3.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string accountno, date, username;
            double balance, deposit;

            accountno = TextBox1.Text;
            username = TextBox5.Text;
            date = TextBox2.Text;
            balance = double.Parse(TextBox3.Text);
            deposit = double.Parse(TextBox4.Text);

            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlTransaction transaction;

            transaction = con.BeginTransaction(); 
            cmd.Connection = con;
            cmd.Transaction = transaction;

            try
            {
                cmd.CommandText = "insert into Transactions(accountid,username,dates,balance,deposit) values ('" + accountno + "','" + username + "', '" + date + "','" + balance + "', '" + deposit + "')";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "update EWalletAccount set balance = balance + '" + deposit + "' where accountid = '" + accountno + "'";
                cmd.ExecuteNonQuery();

                if (deposit == 0)
                {
                    LabelStatus.Text = "";
                    LabelStatus2.Text = "RM 0.00 is not allowed";
                    LabelStatus2.ForeColor = System.Drawing.Color.Red;
                    LabelStatus3.Text = "";
                }
                else if (deposit < 10)
                {
                    LabelStatus.Text = "";
                    LabelStatus2.Text = "";
                    LabelStatus3.Text = "Minimum deposit amount is RM 10.00";
                    LabelStatus3.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    transaction.Commit();
                    LabelStatus.Text = "Deposit complete";
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
    }
}
