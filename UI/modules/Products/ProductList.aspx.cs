using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using middleteir.Adapters.DBMethods;
using middleteir.Adapters.Orders;
using middleteir.Adapters.Products;
using middleteir.Models.Orders;
using middleteir.Models.Products;

namespace webapp.UI.modules.Products
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //    time.Text = DateTime.Now.ToString();
            if (!Page.IsPostBack)
            {
                ProductAdapter ObjProductAdapter = new ProductAdapter();
                DataListProducts.DataSource = ObjProductAdapter.getAllProducts();
                DataListProducts.DataBind();
            }
        }

        protected void ListProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void NewProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UI/modules/Products/SaveAsProduct.aspx");
        }

        public void AddToBag(object sender, EventArgs e)
        {
            sessionIdValidator();
            SavedListAdapter ObjSavedListAdapter = new SavedListAdapter();
            int userID = Convert.ToInt32(Session["UserID"].ToString());
            //Convert.ToInt32(Session["UserID"].ToString());
            LinkButton lbtbutton = (LinkButton)(sender); //typecasting sender to link button
            int ProductID = Convert.ToInt32(lbtbutton.CommandArgument);
            ObjSavedListAdapter.SavedList(userID, ProductID);
            SavedListAdapter Objproduct = new SavedListAdapter();
            int ProductCount = Objproduct.GetSavedProductsCount(Convert.ToInt32(Session["UserID"].ToString()));
            Label lblProductCount = (Label)Page.Master.FindControl("lblProductCount");
            lblProductCount.Text = ProductCount.ToString();
        }
        protected void EditProducts(object sender, EventArgs e)

        {

            LinkButton lbtEdit = (LinkButton)(sender);
            int productId = Convert.ToInt32(lbtEdit.CommandArgument);
            Response.Redirect("/UI/modules/Products/CreateProduct.aspx?ProductId=" + productId);

        }
        protected void DeleteProducts(object sender, EventArgs e)
        {

            LinkButton lbtButton = (LinkButton)(sender);
            lbtButton.Text = "Delete" + lbtButton.CommandArgument.ToString();
            int ProductID = Convert.ToInt32(lbtButton.CommandArgument.ToString());
            ProductAdapter ObjProductAdapter = new ProductAdapter();
            ProductModel ObjProduct = new ProductModel();
            ObjProduct.Action = "Delete";
            ObjProduct.ProductName = "";
            ObjProduct.ProductDescription = "";
            ObjProduct.ProductImage = "";
            ObjProduct.ProductID = ProductID;
            ObjProductAdapter.ManageProduct(ObjProduct);
            DataListProducts.DataSource = ObjProductAdapter.getAllProducts();
            DataListProducts.DataBind();

        }

        protected void bltAddToWishList_Click(object sender, EventArgs e)
        {
            sessionIdValidator();
            LinkButton lbtwishlist = (LinkButton)(sender);
            WishlistAdapter ObjWishListAdapter = new WishlistAdapter();
            int userID = Convert.ToInt32(Session["UserID"].ToString());
            int ProductID = Convert.ToInt32(lbtwishlist.CommandArgument);
            ObjWishListAdapter.SaveWishList(userID, ProductID);
            SavedListAdapter objsavedlistAdapter = new SavedListAdapter();



            Label lblWishListCount = (Label)Page.Master.FindControl("lblWishListCount");
            lblWishListCount.Text = ObjWishListAdapter.WishlistProductsCount(Convert.ToInt32(Session["UserID"].ToString())).ToString();
            Label lblProductCount = (Label)Page.Master.FindControl("lblProductCount");
            lblProductCount.Text = objsavedlistAdapter.GetSavedProductsCount(userID).ToString();
        }

        protected void DataListProducts_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["UserType"].Equals("Vendor"))
            {
                lbtvisibilty(sender, e, "lbtaddToBag", true);
                lbtvisibilty(sender, e, "lbtAddToWishList", true);

            }
            else
            {
                lbtvisibilty(sender, e, "lbtEditProduct", false);
                lbtvisibilty(sender, e, "btnDelete", false);

            }
        }
        private void lbtvisibilty(object sender, DataListItemEventArgs e, string lbtid, bool visible)
        {
            LinkButton lbt = (LinkButton)e.Item.FindControl(lbtid);
            lbt.Visible = visible;
        }
        private void sessionIdValidator()
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("/signin.aspx");
            }
        }

    }
}