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
    public partial class WishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                databind();
            }
        }

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            WishlistAdapter ObjWishListAdapter = new WishlistAdapter();
            int UserID = Convert.ToInt32(Session["UserID"].ToString());
            LinkButton lbtDeleteWishList = (LinkButton)(sender);
            int ProductId = Convert.ToInt32(lbtDeleteWishList.CommandArgument.ToString());
            ObjWishListAdapter.DeleteWishList(UserID, ProductId);
            databind();
        }

        protected void lbtAddToBag_Click(object sender, EventArgs e)
        {
            SavedListAdapter ObjsavedListAdapter = new SavedListAdapter();
            WishlistAdapter ObjwishlistAdapter = new WishlistAdapter();
            int UserID = Convert.ToInt32(Session["UserID"].ToString());
            LinkButton lbtDeleteWishList = (LinkButton)(sender);
            int ProductId = Convert.ToInt32(lbtDeleteWishList.CommandArgument.ToString());
            ObjsavedListAdapter.SavedList(UserID, ProductId);
            ObjwishlistAdapter.DeleteWishList(UserID, ProductId);
            databind();

        }
        private void databind()
        {
            WishlistAdapter ObjWishlistAdapter = new WishlistAdapter();
            DataTable WishlistTable = ObjWishlistAdapter.GetWishListProducts(Convert.ToInt32(Session["UserID"].ToString()));
            WishListDataList.DataSource = WishlistTable;
            WishListDataList.DataBind();
            if (WishlistTable.Rows.Count == 0)
            {
                lblnoproducts.Visible = true;
                
            }
            Label lblWishListCount = (Label)Page.Master.FindControl("lblWishListCount");
            lblWishListCount.Text = ObjWishlistAdapter.WishlistProductsCount(Convert.ToInt32(Session["UserID"].ToString())).ToString();
            Label LblProductsCount = (Label)Page.Master.FindControl("lblProductCount");
            SavedListAdapter ObjsavedListAdapter = new SavedListAdapter();
            LblProductsCount.Text = ObjsavedListAdapter.GetSavedProductsCount(Convert.ToInt32(Session["UserID"].ToString())).ToString();

        }
        protected void btnToProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UI/modules/Products/ProductList.aspx");
        }
    }
}