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
    public partial class AddToCart : System.Web.UI.UserControl
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
            if (Session["addproduct"].ToString() == "true") // session discount coupon
            {
                Session["addproduct"] = "false"; //session discount coupon
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
                    if (Session["Buyitems"] == null)
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
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        GridView1.FooterRow.Cells[4].Text = "Total Amount";
                        GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
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
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["prod_price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        GridView1.FooterRow.Cells[4].Text = "Total Amount";
                        GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    }
                }
            }
            else
            {
                DataTable dt;
                dt = (DataTable)Session["buyitems"];
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
            dt = (DataTable)Session["buyitems"];
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;
                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }
            Session["buyitems"] = dt;
            Response.Redirect("AddToCart.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("EditOrder.aspx?sno=" + GridView1.SelectedRow.Cells[0].Text);
        }

        protected void Button1_Click(object sender, EventArgs e) //button apply discount coupon
        {
            int discount;
            int maxdiscount;
            Int64 finalprice;
            Int64 discountprice;

            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";

            String myquery = "Select * from coupondetails where couponcode='" + TextBox1.Text + "'";
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
                Label2.Text = "Discount code " + TextBox1.Text + " applied successfully";
                Label2.ForeColor = System.Drawing.Color.Green;

                discount = Convert.ToInt16(ds.Tables[0].Rows[0]["discount"].ToString());
                maxdiscount = Convert.ToInt16(ds.Tables[0].Rows[0]["maxdiscount"].ToString());
                discountprice = (grandtotal() * discount) / 100;
                if (discountprice > maxdiscount)
                {
                    discountprice = maxdiscount;
                }
                Label3.Text = "RM "+ discountprice.ToString() + " ( " + discount + "% ) discount is RM" + maxdiscount;
                finalprice = grandtotal() - discountprice;
                Label4.Text = "RM " + grandtotal().ToString();
                Label5.Text = "RM " + finalprice.ToString();
            }
            else
            {
                Label2.Text = "Invalid discount code applied : not exist";
                Label2.ForeColor = System.Drawing.Color.Red;
                Label4.Text = "";
                Label3.Text = "";
                Label5.Text = "";
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }

        protected void gv_DataBound(object sender, EventArgs e)
        {
            Button2.Visible = GridView1.Rows.Count > 0;
            //The Following is actually better , but less readable
            //I cast the sender to Gridview. The sender is the control
            //initiating the event
            //Button2.Visible = ((GridView)sender).Rows.Count > 0;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindData();
        }
    }
}