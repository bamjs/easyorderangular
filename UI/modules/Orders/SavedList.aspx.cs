using middleteir.Adapters.Orders;
using middleteir.Models.Orders;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webapp.UI.modules.Products;

namespace webapp.UI.modules.Orders
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateAmmountLabelText();


        }

        protected void lblProductPrice_DataBinding(object sender, EventArgs e)
        {

        }

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            LinkButton lbtdelete = (LinkButton)(sender);
            SavedListAdapter objorders = new SavedListAdapter();
            objorders.DeleteSavedList(Convert.ToInt32(Session["UserID"].ToString()), Convert.ToInt32(lbtdelete.CommandArgument));
            DataList1.DataBind();
            SavedListAdapter Objproduct = new SavedListAdapter();
            int SavedListCount = Objproduct.GetSavedProductsCount(Convert.ToInt32(Session["UserID"].ToString()));
            Control lblcontrol = Page.Master.FindControl("lblProductCount");
            Label lblProductCount = (Label)(lblcontrol);
            lblProductCount.Text = SavedListCount.ToString();
            UpdateAmmountLabelText();
        }

        protected void lbtwishlist_Click(object sender, EventArgs e)
        {
            LinkButton lbtwishlist = (LinkButton)(sender);
            WishlistAdapter ObjWishListAdapter = new WishlistAdapter();
            int userID = Convert.ToInt32(Session["UserID"].ToString());
            //Convert.ToInt32(Session["UserID"].ToString());
            LinkButton lbtbutton = (LinkButton)(sender); //typecasting sender to link button
            int ProductID = Convert.ToInt32(lbtbutton.CommandArgument);
            ObjWishListAdapter.SaveWishList(userID, ProductID);
            SavedListAdapter objsavedlistAdapter = new SavedListAdapter();
            objsavedlistAdapter.DeleteSavedList(Convert.ToInt32(Session["UserID"].ToString()), Convert.ToInt32(lbtwishlist.CommandArgument));

            UpdateAmmountLabelText();
        }

        protected void ToProductList_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UI/modules/Products/ProductList.aspx");
        }

        protected void btnPlaceorder_Click(object sender, EventArgs e)
        {
            OrdersAdapter objOrderAdapter = new OrdersAdapter();
            string errorMessage;
            bool stockStatus;
            int UserID = Convert.ToInt32(Session["UserID"]);
            objOrderAdapter.checkStockStatus(UserID, out errorMessage, out stockStatus);
            if (stockStatus)
            {
                int OrderID = objOrderAdapter.createOrder(Convert.ToInt32(Session["UserID"].ToString()));
                UpdateAmmountLabelText();
                DataList1.DataBind();
                Response.Redirect("/UI/modules/Orders/PaymentPage.aspx?OrderID=" + OrderID);
            }
            else
            {
                lblstockstatus.Text = errorMessage;
                lblstockstatus.Visible = true;
            }
        }
        protected void UpdateAmmountLabelText()
        {
            SavedListAdapter objsavedlistAdapter = new SavedListAdapter();
            DataTable SavedListTable = objsavedlistAdapter.getSavedProductDetails(Convert.ToInt32(Session["UserID"].ToString()));
            int totalprice = 0;
            int ProductPrice = 0;
            foreach (DataRow rows in SavedListTable.Rows)
            {
                ProductPrice = Convert.ToInt32(rows["ProductPrice"]) * Convert.ToInt32(rows["Quantity"]);
                totalprice += ProductPrice;
                lblTotalPrice.Text = totalprice.ToString() + "  Rs";
            }
            DataList1.DataSource = SavedListTable;
            DataList1.DataBind();
            WishlistAdapter ObjWishListAdapter = new WishlistAdapter();
            int WishlistCount = ObjWishListAdapter.WishlistProductsCount(Convert.ToInt32(Session["UserID"].ToString()));
            Label lblWishListCount = (Label)Page.Master.FindControl("lblWishListCount");
            lblWishListCount.Text = WishlistCount.ToString();
            Label lblProductCount = (Label)Page.Master.FindControl("lblProductCount");
            int productcount = objsavedlistAdapter.GetSavedProductsCount(Convert.ToInt32(Session["UserID"].ToString()));
            lblProductCount.Text = productcount.ToString();
            if (productcount == 0)
            {
                lblnoproducts.Visible = true;
                btnToProducts.Visible = true;
                divplaceorder.Visible = false;
            }
        }



        protected void lbtincrease_Click(object sender, EventArgs e)
        {
            SavedListAdapter ObjSavedListAdapter = new SavedListAdapter();
            int userID = Convert.ToInt32(Session["UserID"].ToString());
            LinkButton lbtbutton = (LinkButton)(sender); //typecasting sender to link button
            int ProductID = Convert.ToInt32(lbtbutton.CommandArgument);
            ObjSavedListAdapter.SavedList(userID, ProductID);
            SavedListAdapter Objproduct = new SavedListAdapter();
            int ProductCount = Objproduct.GetSavedProductsCount(Convert.ToInt32(Session["UserID"].ToString()));
            Label lblProductCount = (Label)Page.Master.FindControl("lblProductCount");
            lblProductCount.Text = ProductCount.ToString();
            UpdateAmmountLabelText();
        }

        //protected void lbtQuantityIncrease_Click(object sender, EventArgs e)
        //{

        //    ProductList objproductaspxcs = new ProductList();
        //    objproductaspxcs.AddToBag(sender, e);


        //}
    }
}