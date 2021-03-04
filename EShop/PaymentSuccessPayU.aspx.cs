using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EShop
{
    public partial class PaymentSuccessPayU : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Transaction ID :" + Request.Form["txnid"] + " has been successfully completed";
            Label2.Text = Request.Form["firstname"];
            Label3.Text = Request.Form["email"];
            Label4.Text = Request.Form["phone"];
            Label5.Text = Request.Form["productinfo"];
            Label6.Text = Request.Form["amount"];
            Session["BuyItems"] = null;
            Session["Wishlist"] = null;
        }
    }
}