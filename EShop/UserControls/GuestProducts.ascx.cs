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
    public partial class GuestProducts : System.Web.UI.UserControl
    {
        static int currentposition = 0;
        static int totalrows = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {
                Label1.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label1.Text = "0";
            }
            Session["addproduct"] = "false"; //session untuk discount coupon

            if (!IsPostBack)
            {
                bindata();
            }
        }

        private void bindata()
        {
            String mycon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\StoreDatabase.mdf;Integrated Security=True";
            String myquery = "Select * from products";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            totalrows = ds.Tables[0].Rows.Count;

            DataTable dt = ds.Tables[0];
 
            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = dt.DefaultView;
            pg.AllowPaging = true;
            pg.CurrentPageIndex = currentposition;
            pg.PageSize = 6;
            Button1.Enabled = !pg.IsFirstPage;
            Button2.Enabled = !pg.IsLastPage;

            //Binding pg to datalist
            DataList1.DataSource = pg;//dl is datalist
            DataList1.DataBind();
            con.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true"; // session untuk discount coupon
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dlist.SelectedItem.ToString());
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (currentposition == 0)
            {

            }
            else
            {
                currentposition = currentposition - 1;
                bindata();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (currentposition == totalrows - 1)
            {

            }
            else
            {
                currentposition = currentposition + 1;
                bindata();
            }
        }
    }
}