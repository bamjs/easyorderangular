using middleteir.Adapters.Orders;
using middleteir.Models.Orders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp.UI.modules.shared
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (Session["username"] != null)
            {
                int UserId = Convert.ToInt32(Session["UserID"].ToString());
                SavedListAdapter Objproduct = new SavedListAdapter();
                WishlistAdapter ObjwishlistAdapter = new WishlistAdapter();
                int WishListCount = ObjwishlistAdapter.WishlistProductsCount(UserId);
                lblWishListCount.Text = WishListCount.ToString();
                int SavedProductCount = Objproduct.GetSavedProductsCount(UserId);
                lblProductCount.Text = SavedProductCount.ToString();
                hdnfirstname.Value = Session["FirstName"].ToString();
                lbtSignin.Text = "Sign Out";
                ImageSign.ImageUrl = "/UploadedFiles/UI/signout.png";
                lbtFirstName.Text = "Hello   " + Session["FirstName"].ToString().ToUpper();
                if (Session["UserType"].Equals("Vendor"))
                {
                    //imgmenuBag.Visible = false;
                    //imageWishlist.Visible = false;
                    //lblWishListCount.Visible = false;
                    //lblProductCount.Visible = false;

                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        navbar.Items.RemoveAt(0);
                        navbar.Items.RemoveAt(0);
                        navbar.Items.RemoveAt(1);
                        sidemenu.Items.RemoveAt(0);
                        sidemenu.Items.RemoveAt(0);
                        sidemenu.Items.RemoveAt(1);
                    }
                }
            }
            else
            {
                lbtSignin.Text = "Sign In";
                ImageSign.ImageUrl = "/UploadedFiles/UI/signin.png";
                imgmenuBag.Visible = false;
                imageWishlist.Visible = false;
                lblWishListCount.Visible = false;
                lblProductCount.Visible = false;

            }
        }

        protected void lbtSignin_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                Session.Clear();
                Response.Redirect("/Signin.aspx?signedout=true&firstname=" + hdnfirstname.Value);
            }
            else
            {
                Response.Redirect("/signin.aspx");
            }
        }

        protected void imgmenuBag_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/UI/modules/Orders/SavedList.aspx");
        }

        protected void imageWishlist_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/UI/modules/Orders/WishList.aspx");
        }

        protected void lbtFirstName_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UI/modules/user/UserRegistration.aspx?UserID=" + Session["UserID"]);
        }
    }
}