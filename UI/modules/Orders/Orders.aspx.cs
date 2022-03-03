using middleteir.Adapters.Orders;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp.UI.modules.Orders
{
    public partial class Orders1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindOrder();
        }
        protected void BindOrder()
        {
            if (Session["UserID"] != null)
            {
                OrdersAdapter ObjOrder = new OrdersAdapter();
                OrdersDataList.DataSource = ObjOrder.GetUserOrders(Convert.ToInt32(Session["UserID"].ToString()));
                OrdersDataList.DataBind();
            }
            else
            {
                Response.Redirect("/signin.aspx");

            }
        }

        protected void lbtorderDetails_Click(object sender, EventArgs e)
        {
            OrdersAdapter ObjOrder = new OrdersAdapter();
            LinkButton lbtorderdetails = (LinkButton)(sender);
            int OrderID = Convert.ToInt32(lbtorderdetails.CommandArgument);
            hdnorderid.Value = OrderID.ToString();
            int totalworth = 0;
            DatalistOrderDetails.DataSource = ObjOrder.CompleteOrderDetails(OrderID, out totalworth);
            DatalistOrderDetails.DataBind();
            string paymentStatus;
            ObjOrder.getPaymentStatus(OrderID, out paymentStatus);
            bool status;
            ObjOrder.checkStatusForRepayment(OrderID, out status);
          
            if (!paymentStatus.Equals("Payment Succesful"))
            {
                btnretrypayment.Visible = true;
            }
            else
            {
                btnretrypayment.Visible = false;
            }
            if (!status)
            {
                btnretrypayment.Visible = false;
                h3stockstatus.Visible = true;
            }


            divOrderDetails.Visible = true;
            lbldetailstotal.Text = "Total Order Value : " + totalworth.ToString() + " Rs";
        }

        protected void OrdersDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
   
        }

        protected void closeOrderdetails_Click(object sender, ImageClickEventArgs e)
        {
            divOrderDetails.Visible = false;
        }



        protected void btnretrypayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UI/modules/Orders/PaymentPage.aspx?OrderID=" + hdnorderid.Value+"&retryPayment=true");
        }
    }
}