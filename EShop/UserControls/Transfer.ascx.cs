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
    public partial class Transfer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime datetime = DateTime.Now;
            TextBox3.Text = datetime.ToString("dd/MM/yyyy");

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
                            TextBox5.Text = reader.GetString(1);
                            TextBox6.Text = Convert.ToString(reader["balance"] + ".00");
                        }
                    }
                }
            }
        }

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True");

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fromaccount, toaccount, date, sendername;
            double balance, transferamount;

            fromaccount = TextBox1.Text;
            sendername = TextBox5.Text;
            toaccount = TextBox2.Text;
            date = TextBox3.Text;
            transferamount = double.Parse(TextBox4.Text);
            balance = double.Parse(TextBox6.Text);

            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlTransaction transaction;

            transaction = con.BeginTransaction(); //to execute more than one SQL command queries
            cmd.Connection = con;
            cmd.Transaction = transaction;

            try
            {
                cmd.CommandText = "update EWalletAccount set balance = balance - '" + transferamount + "' where accountid = '" + fromaccount + "'";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "update EWalletAccount set balance = balance + '" + transferamount + "' where accountid = '" + toaccount + "'";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "insert into Transfers(fromaccount,sendername,toaccount,dates,amount,balance) values ('" + fromaccount + "', '" + sendername + "', '" + toaccount + "','" + date + "', '" + transferamount + "','" + balance + "')";
                cmd.ExecuteNonQuery();

                if (transferamount > balance)
                {
                    LabelStatus.Text = "";
                    LabelStatus2.Text = "You have insufficient balance in E-wallet";
                    LabelStatus2.ForeColor = System.Drawing.Color.Red;
                    LabelStatus3.Text = "";
                }
                else if (transferamount == 0)
                {
                    LabelStatus.Text = "";
                    LabelStatus2.Text = "";
                    LabelStatus3.Text = "RM 0.00 is not allowed";
                    LabelStatus3.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    transaction.Commit();
                    LabelStatus.Text = "Transfer complete";
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
            TextBox2.Text = "";
            TextBox4.Text = "";
            LabelStatus.Text = "";
            LabelStatus2.Text = "";
            LabelStatus3.Text = "";
        }
    }
}