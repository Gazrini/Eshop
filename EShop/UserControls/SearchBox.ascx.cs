using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EShop.UserControls
{
    public partial class SearchBox : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text.Trim() != "")
            {
                string searchtext = txtSearch.Text.ToLower(); // optional
                searchtext = searchtext.Replace(' ', '+'); // optional
                Response.Redirect("~/Search.aspx?search=" +
                txtSearch.Text);
            }
        }
    }
}