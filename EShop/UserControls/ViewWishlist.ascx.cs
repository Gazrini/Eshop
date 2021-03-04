using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace EShop.UserControls
{
    public partial class ViewWishlist : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindData();
            }
        }

        private void BindData()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("prod_title");
            dt.Columns.Add("quantity");
            dt.Columns.Add("prod_price");
            dt.Columns.Add("totalprice");
            dt.Columns.Add("prod_image");

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
                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["prod_price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                    int totalprice = price * quantity;
                    dr["totalprice"] = totalprice;

                    wishlist(1, ds.Tables[0].Rows[0]["prod_id"].ToString(), ds.Tables[0].Rows[0]["prod_title"].ToString(), ds.Tables[0].Rows[0]["prod_image"].ToString(), Request.QueryString["quantity"].ToString(), ds.Tables[0].Rows[0]["prod_price"].ToString(), totalprice.ToString());

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["wishlist"] = dt;
                    GridView1.FooterRow.Cells[4].Text = "Total Amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("ViewWishlist.aspx");
                }
                else
                {
                    dt = (DataTable)Session["wishlist"];
                    int sr;
                    sr = dt.Rows.Count;

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
                    dr["sno"] = sr + 1;
                    dr["prod_title"] = ds.Tables[0].Rows[0]["prod_title"].ToString();
                    dr["prod_image"] = ds.Tables[0].Rows[0]["prod_image"].ToString();
                    dr["quantity"] = Request.QueryString["quantity"];
                    dr["prod_price"] = ds.Tables[0].Rows[0]["prod_price"].ToString();
                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["prod_price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                    int totalprice = price * quantity;
                    dr["totalprice"] = totalprice;

                    wishlist(sr + 1, ds.Tables[0].Rows[0]["prod_id"].ToString(), ds.Tables[0].Rows[0]["prod_title"].ToString(), ds.Tables[0].Rows[0]["prod_image"].ToString(), Request.QueryString["quantity"].ToString(), ds.Tables[0].Rows[0]["prod_price"].ToString(), totalprice.ToString());

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    Session["wishlist"] = dt;
                    GridView1.FooterRow.Cells[4].Text = "Total Amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("ViewWishlist.aspx");
                }
            }
            else
            {
                dt = (DataTable)Session["wishlist"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[4].Text = " Total Amount ";
                    GridView1.FooterRow.Cells[5].Text = " RM " + grandtotal().ToString();
                }
            }
            Label1.Text = GridView1.Rows.Count.ToString();
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

        protected void LinkButtonClear_Click(object sender, EventArgs e)
        {
            Session["wishlist"] = null;
            clearwishlist();
        }

        private void clearwishlist()
        {
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";

            String updatedata = "delete from wishlist where username='" + Session["username"].ToString() + "'";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Redirect("ViewWishlist.aspx");
        }

        private void wishlist(int sno, String prod_id, String prod_title, String prod_image, String quantity, String prod_price, String totalprice)
        {
            String query = "insert into wishlist(sno,prod_id,prod_title,prod_image,quantity,prod_price,totalprice,username) values(" + sno + ",'" + prod_id + "','" + prod_title + "','" + prod_image + "','" + Request.QueryString["quantity"].ToString() + "','" + prod_price + "','" + totalprice + "','" + Session["username"].ToString() + "')";
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("WishListEditOrder.aspx?sno=" + GridView1.SelectedRow.Cells[0].Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WIshListCheckout.aspx");
        }

        protected void gv_DataBound(object sender, EventArgs e)
        {
            Button1.Visible = GridView1.Rows.Count > 0;
            //The Following is actually better , but less readable
            //I cast the sender to Gridview. The sender is the control
            //initiating the event
            //Button1.Visible = ((GridView)sender).Rows.Count > 0;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindData();
        }
    }
}