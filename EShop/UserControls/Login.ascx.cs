using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EShop.UserControls
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM users WHERE username=@username";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnStringStoreDB"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@username", TextBoxUsername.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Object objpasswordhash = dt.Rows[0]["passwordhash"];
                Object objrole = dt.Rows[0]["role"];
                Object objenabled = dt.Rows[0]["enabled"];
                string password = TextBoxPassword.Text;
                string storedpasswordhash = objpasswordhash.ToString();
                PBKDF2Hash PwdHash = new PBKDF2Hash(password, storedpasswordhash);
                bool passwordcheck = PwdHash.PasswordCheck;
                bool enabled = Convert.ToBoolean(objenabled);

                if (passwordcheck == true && enabled == true)
                {
                    Session["username"] = TextBoxUsername.Text;
                    Session["role"] = objrole;

                    if (Session["role"].ToString() == "user")
                    {
                        Session["wishlist"] = null;
                        fillwishlist();
                        Response.Redirect("CustomerProducts.aspx");
                    }
                    else
                        Response.Redirect("Login.aspx");
                    Session.RemoveAll();
                }
                else
                {
                    LabelStatus.Text = "Incorrect username or password";
                    LabelStatus.ForeColor = System.Drawing.Color.Red;
                }
                Session.RemoveAll();
            }
            else
            {
                LabelStatus.Text = "Incorrect username or password";
                LabelStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void fillwishlist()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("prod_id");
            dt.Columns.Add("prod_title");
            dt.Columns.Add("quantity");
            dt.Columns.Add("prod_price");
            dt.Columns.Add("totalprice");
            dt.Columns.Add("prod_image");

            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "select * from wishlist where username='" + Session["username"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();
                    dr["sno"] = i + 1;
                    dr["prod_id"] = ds.Tables[0].Rows[i]["prod_id"].ToString();
                    dr["prod_title"] = ds.Tables[0].Rows[i]["prod_title"].ToString();
                    dr["prod_image"] = ds.Tables[0].Rows[i]["prod_image"].ToString();
                    dr["quantity"] = "1";
                    dr["prod_price"] = ds.Tables[0].Rows[i]["prod_price"].ToString();
                    int price1 = Convert.ToInt16(ds.Tables[0].Rows[i]["prod_price"].ToString());
                    int quantity1 = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
                    int totalprice1 = price1 * quantity1;
                    dr["totalprice"] = totalprice1;
                    dt.Rows.Add(dr);
                    i = i + 1;
                }

            }
            else
            {
                Session["wishlist"] = null;
            }
            Session["wishlist"] = dt;
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            TextBoxUsername.Text = String.Empty;
            TextBoxPassword.Text = String.Empty;
            LabelStatus.Text = "";
        }
    }
}