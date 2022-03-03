using middleteir.Adapters.Orders;
using middleteir.Models.Orders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp.UI.modules.Orders
{
    public partial class PaymentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Menu navbar = (Menu)Page.Master.FindControl("navbar");
            navbar.Visible = false;
            Menu sidemenu = (Menu)Page.Master.FindControl("sidemenu");
            sidemenu.Visible = false;
            Control divusercontrol = (Control)Page.Master.FindControl("divusercontrols");
            divusercontrol.Visible = false;
        }

        protected void ddlPaymentDetails_SelectedIndexChanged(object sender, EventArgs e)
        {

            switch (ddlPaymentDetails.SelectedValue.ToString())
            {
                case "Cash":
                    CashDetails.Visible = true;
                    DebitCard.Visible = false;
                    CreditCard.Visible = false;
                    btnPlaceOrder.Visible = true;
                    btncancelorder.Visible = true;
                    break;
                case "Debit":
                    DebitCard.Visible = true;
                    CreditCard.Visible = false;
                    CashDetails.Visible = false;
                    btnPlaceOrder.Visible = true;
                    btncancelorder.Visible = true;
                    break;
                case "Credit":
                    CreditCard.Visible = true;
                    DebitCard.Visible = false;
                    CashDetails.Visible = false;
                    btnPlaceOrder.Visible = true;
                    btncancelorder.Visible = true;
                    break;
            }

        }


        protected void btnPlaceOrder_Click1(object sender, EventArgs e)
        {
            OrdersAdapter ObjOrderAdapter = new OrdersAdapter();
            int OrderID = Convert.ToInt32(Request.QueryString["OrderID"].ToString());
            if (Request.QueryString["retryPayment"] != null)
            {
                ObjOrderAdapter.UpdatePaymentDetails(OrderID, "Payment Succesful", true);
            }
            else
            {
                ObjOrderAdapter.UpdatePaymentDetails(OrderID, "Payment Succesful", false);
            }
            Response.Redirect("/UI/modules/Orders/Orders.aspx");
        }

        protected void btncancelorder_Click(object sender, EventArgs e)
        {
            OrdersAdapter ObjOrderAdapter = new OrdersAdapter();
            int OrderID = Convert.ToInt32(Request.QueryString["OrderID"].ToString());
            ObjOrderAdapter.UpdatePaymentDetails(OrderID, "Payment Failed", false);
            Response.Redirect("/UI/modules/Orders/Orders.aspx");
        }
    }
}