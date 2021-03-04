using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EShop.UserControls
{
    public partial class CustomerSearchBox : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCustomerSearch_Click(object sender, EventArgs e)
        {
            if (TextBoxCustomerSearch.Text.Trim() != "")
            {
                string searchtext = TextBoxCustomerSearch.Text.ToLower(); // optional
                searchtext = searchtext.Replace(' ', '+'); // optional
                Response.Redirect("~/CustomerSearch.aspx?search=" +
                TextBoxCustomerSearch.Text);
            }
        }
    }
}