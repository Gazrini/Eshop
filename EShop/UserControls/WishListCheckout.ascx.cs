using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EShop.UserControls
{
    public partial class WishListCheckout : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("prod_title");
                dt.Columns.Add("prod_image");
                dt.Columns.Add("quantity");
                dt.Columns.Add("prod_price");
                dt.Columns.Add("totalprice");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["Wishlist"] == null)
                    {
                        dr = dt.NewRow();
                        String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from products where prod_id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["prod_title"] = ds.Tables[0].Rows[0]["prod_title"].ToString();
                        dr["prod_image"] = ds.Tables[0].Rows[0]["prod_image"].ToString();
                        dr["quantity"] = Request.QueryString["quantity"];
                        dr["prod_price"] = ds.Tables[0].Rows[0]["prod_price"].ToString();
                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["prod_price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["wishlist"] = dt;
                        GridView1.FooterRow.Cells[4].Text = "Total Amount";
                        GridView1.FooterRow.Cells[5].Text = " RM " + grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["wishlist"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        String mycon = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename =| DataDirectory |\\StoreDatabase.mdf; Integrated Security = True";
                        SqlConnection scon = new SqlConnection(mycon);
                        String myquery = "select * from products where prod_id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["prod_title"] = ds.Tables[0].Rows[0]["prod_title"].ToString();
                        dr["prod_image"] = ds.Tables[0].Rows[0]["prod_image"].ToString();
                        dr["quantity"] = Request.QueryString["quantity"];
                        dr["prod_price"] = ds.Tables[0].Rows[0]["prod_price"].ToString();
                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["prod_price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["wishlist"] = dt;
                        GridView1.FooterRow.Cells[4].Text = "Total Amount";
                        GridView1.FooterRow.Cells[5].Text = " RM " + grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["wishlist"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[4].Text = "Total Amount";
                        GridView1.FooterRow.Cells[5].Text = " RM " + grandtotal().ToString();
                    }
                }
                // Label2.Text = GridView1.Rows.Count.ToString();
            }
            Label3.Text = DateTime.Now.ToShortDateString();
            findorderid();

            if (!Page.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("select * from users where username = @username", con))
                {
                    cmd.Parameters.AddWithValue("@username", Session["username"]);
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult | CommandBehavior.SingleRow))
                    {
                        if (reader.Read())
                        {
                            TextBox1.Text = reader.GetString(1);
                            TextBox2.Text = reader.GetString(2);
                            TextBox3.Text = reader.GetString(3);
                            TextBox4.Text = reader.GetString(4);
                        }
                    }
                }
            }

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
                            LabelEwallet.Text = Convert.ToString(reader["accountid"]);
                            LabelBalance.Text = Convert.ToString(reader["balance"] + ".00");
                        }
                    }
                }
            }

            //payumoney coding
            LabelPayU.Text = grandtotal().ToString();
            Random random = new Random();
            txnid.Value = (Convert.ToString(random.Next(10000, 20000)));
            txnid.Value = "Eshop" + txnid.Value.ToString();
            Response.Write(txnid.Value.ToString());

            //paypal and E-wallet coding to call grand total
            Session["totalAmount"] = grandtotal().ToString();
        }

        private void clearwishlistcheckout()
        {
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";

            String updatedata = "delete from wishlist where username='" + Session["username"].ToString() + "'";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            //Response.Redirect("WishListCheckout.aspx");
        }

        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["wishlist"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        public void findorderid()
        {
            String pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];

            }
            String orderid;
            orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

            Label2.Text = orderid;
        }

        public void saveaddress()
        {
            String updatepass = "insert into Orders(orderid,customername,email,mobilenumber,address,dateoforder) values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + Label3.Text + "')";
            String mycon1 = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            SqlConnection s = new SqlConnection(mycon1);
            s.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = updatepass;
            cmd1.Connection = s;
            cmd1.ExecuteNonQuery();
            s.Close();
        }

        public string GetGridviewData(GridView gv)
        {
            StringBuilder strBuilder = new StringBuilder();
            StringWriter strWriter = new StringWriter(strBuilder);
            HtmlTextWriter htw = new HtmlTextWriter(strWriter);
            gv.RenderControl(htw);
            return strBuilder.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["wishlist"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                String updatepass = "insert into OrderDetails(orderid,customername,email,mobilenumber,sno,prod_title,prod_price,quantity,totalprice,address,dateoforder) values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["prod_title"] + "','" + dt.Rows[i]["prod_price"] + "','" + dt.Rows[i]["quantity"] + "','" + dt.Rows[i]["totalprice"] + "','" + TextBox4.Text + "','" + Label3.Text + "')";
                String mycon1 = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
                SqlConnection s = new SqlConnection(mycon1);
                s.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatepass;
                cmd1.Connection = s;
                cmd1.ExecuteNonQuery();
                s.Close();
            }

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Thank You For Purchase at Eshop";
            msg.Body = "Here is you order details . " + "Order ID : " + Label2.Text +
            " , Date :" + Label3.Text + "\n" + GetGridviewData(GridView1);
            msg.IsBodyHtml = true;
            string toaddress = (TextBox2.Text);
            msg.To.Add(toaddress);
            string fromaddress = "admiiiineshop@gmail.com";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }

            saveaddress();
            clearwishlistcheckout();
            Response.Redirect("PaymentSuccess.aspx?orderid=" + Label2.Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["wishlist"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                String updatepass = "insert into OrderDetails(orderid,customername,email,mobilenumber,sno,prod_title,prod_price,quantity,totalprice,address,dateoforder) values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["prod_title"] + "','" + dt.Rows[i]["prod_price"] + "','" + dt.Rows[i]["quantity"] + "','" + dt.Rows[i]["totalprice"] + "','" + TextBox4.Text + "','" + Label3.Text + "')";
                String mycon1 = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
                SqlConnection s = new SqlConnection(mycon1);
                s.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatepass;
                cmd1.Connection = s;
                cmd1.ExecuteNonQuery();
                s.Close();
            }

            String amount = LabelPayU.Text.ToString();

            String text = key.Value.ToString() + "|" + txnid.Value.ToString() + "|" + amount + "|" + Label2.Text + "|" + TextBox1.Text + "|" + TextBox2.Text + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "||||||" + salt.Value.ToString();
            byte[] message = Encoding.UTF8.GetBytes(text);

            UnicodeEncoding UE = new UnicodeEncoding();
            byte[] hashValue;
            SHA512Managed hashString = new SHA512Managed();
            string hex = "";
            hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            hash.Value = hex;

            System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
            data.Add("hash", hex.ToString());
            data.Add("key", key.Value);
            data.Add("txnid", txnid.Value);
            data.Add("amount", amount);
            data.Add("productinfo", Label2.Text.Trim());
            data.Add("firstname", TextBox1.Text.Trim());
            data.Add("email", TextBox2.Text.Trim());
            data.Add("phone", TextBox3.Text.Trim());
            data.Add("udf1", "1");
            data.Add("udf2", "1");
            data.Add("udf3", "1");
            data.Add("udf4", "1");
            data.Add("udf5", "1");
            data.Add("surl", "http://localhost:57138/PaymentSuccessPayU.aspx");
            data.Add("furl", "http://localhost:57138/PaymentFailPayU.aspx");
            data.Add("service_provider", "");

            string strForm = PreparePOSTForm("https://test.payu.in/_payment", data);
            Page.Controls.Add(new LiteralControl(strForm));

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Thank You For Purchase at Eshop";
            msg.Body = "Here is you order details . " + "Order ID : " + Label2.Text +
            " , Date :" + Label3.Text + "\n" + GetGridviewData(GridView1);
            msg.IsBodyHtml = true;
            string toaddress = (TextBox2.Text);
            msg.To.Add(toaddress);
            string fromaddress = "admiiiineshop@gmail.com";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }

            saveaddress();
            clearwishlistcheckout();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["wishlist"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                String updatepass = "insert into OrderDetails(orderid,customername,email,mobilenumber,sno,prod_title,prod_price,quantity,totalprice,address,dateoforder) values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["prod_title"] + "','" + dt.Rows[i]["prod_price"] + "','" + dt.Rows[i]["quantity"] + "','" + dt.Rows[i]["totalprice"] + "','" + TextBox4.Text + "','" + Label3.Text + "')";
                String mycon1 = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
                SqlConnection s = new SqlConnection(mycon1);
                s.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatepass;
                cmd1.Connection = s;
                cmd1.ExecuteNonQuery();
                s.Close();
            }

            Session["Name"] = TextBox1.Text;
            Session["Email"] = TextBox2.Text;
            Session["Phone"] = TextBox3.Text;
            Session["Address"] = TextBox4.Text;
            int totalAmount = Convert.ToInt32(Session["totalAmount"].ToString());

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Thank You For Purchase at Eshop";
            msg.Body = "Here is you order details . " + "Order ID : " + Label2.Text +
            " , Date :" + Label3.Text + "\n" + GetGridviewData(GridView1);
            msg.IsBodyHtml = true;
            string toaddress = (TextBox2.Text);
            msg.To.Add(toaddress);
            string fromaddress = "admiiiineshop@gmail.com";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }

            saveaddress();
            clearwishlistcheckout();
            Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=sb-ppzei960484@business.example.com&amount=" + totalAmount + "&return=http://localhost:57138/CustomerHomepage.aspx" + (Session["wishlist"] = null));
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["wishlist"];

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True");

            string EwalletAccountNumber = LabelEwallet.Text;
            int totalAmount = Convert.ToInt32(Session["totalAmount"].ToString());
            double balance = double.Parse(LabelBalance.Text);

            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            try
            {
                if (balance <= 0)
                {
                    Label1.Text = "You have no balance in E-wallet";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else if (balance < totalAmount)
                {
                    Label4.Text = "You have insufficient balance";
                    Label4.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    cmd.CommandText = "update EWalletAccount set balance = balance - '" + totalAmount + "' where accountid = '" + EwalletAccountNumber + "'";
                    cmd.ExecuteNonQuery();

                    for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    {
                        cmd.CommandText = "insert into OrderDetails(orderid,customername,email,mobilenumber,sno,prod_title,prod_price,quantity,totalprice,address,dateoforder) values('" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + dt.Rows[i]["sno"] + "','" + dt.Rows[i]["prod_title"] + "','" + dt.Rows[i]["prod_price"] + "','" + dt.Rows[i]["quantity"] + "','" + dt.Rows[i]["totalprice"] + "','" + TextBox4.Text + "','" + Label3.Text + "')";
                        cmd.ExecuteNonQuery();
                    }

                    saveaddress();
                    clearwishlistcheckout();
                    Response.Redirect("PaymentSuccess.aspx?orderid=" + Label2.Text);
                }
            }
            catch (SqlException ex)
            {
                LabelStatus.Text = ex.Message;
            }
            finally
            {
                if (balance <= 0)
                {
                    LabelStatus2.Text = ""; // Label ni aku buat empty sebab dekat atas dah declare error message untuk label1.text
                }
                else if (balance < totalAmount) //reason aku buat ni untuk elakkan email receipt sent ke customer walaupun receive error message
                {
                    LabelStatus3.Text = ""; // Label ni aku buat empty sebab dekat atas dah declare error message untuk label4.text
                }
                else
                {
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("admiiiineshop@gmail.com", "admin_1234");
                    smtp.EnableSsl = true;
                    MailMessage msg = new MailMessage();
                    msg.Subject = "Thank You For Purchase at Eshop";
                    msg.Body = "Here is you order details . " + "Order ID : " + Label2.Text +
                    " , Date :" + Label3.Text + "\n" + GetGridviewData(GridView1);
                    msg.IsBodyHtml = true;
                    string toaddress = (TextBox2.Text);
                    msg.To.Add(toaddress);
                    string fromaddress = "admiiiineshop@gmail.com";
                    msg.From = new MailAddress(fromaddress);
                    try
                    {
                        smtp.Send(msg);
                    }
                    catch
                    {
                        throw;
                    }
                    con.Close();
                }
            }
        }

        private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // payumoney coding
        {
            //Set a name for the form
            string formID = "PostForm";
            //Build the form using the specified data to be posted.
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<form id=\"" + formID + "\" name=\"" +
                           formID + "\" action=\"" + url +
                           "\" method=\"POST\">");

            foreach (System.Collections.DictionaryEntry key in data)
            {
                strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                               "\" value=\"" + key.Value + "\">");
            }

            strForm.Append("</form>");
            //Build the JavaScript which will do the Posting operation.
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + formID + " = document." +
                             formID + ";");
            strScript.Append("v" + formID + ".submit();");
            strScript.Append("</script>");
            //Return the form and the script concatenated.
            //(The order is important, Form then JavaScript)
            return strForm.ToString() + strScript.ToString();
        }
    }
}