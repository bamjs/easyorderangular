using middleteir.Adapters.Products;
using middleteir.Models.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp.UI.modules.Products
{
    public partial class SaveAsProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ProductID"] != null)
            {
                if (!Page.IsPostBack)
                {
                    DisplayProductDetails(Convert.ToInt32(Request.QueryString["ProductID"].ToString()));
                }
            }
            else
            {
                DisplayProductImage.Visible = false;
                lblProductImage.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ProductModel objProduct = new ProductModel();
            objProduct.ProductName = txtProductName.Text.ToString();
            objProduct.ProductDescription = txtProductDescription.Text.ToString();
            objProduct.ProductPrice = Convert.ToDecimal(txtProductPrice.Text);
            objProduct.AvailableQuantity = Convert.ToInt32(txtAvailableQuantity.Text);

            if (Request.QueryString["ProductID"] != null)
            {
                objProduct.Action = "Update";
                objProduct.ProductID = Convert.ToInt32(Request.QueryString["ProductID"].ToString());
                if (FileUploading.HasFile)
                {
                    if (imagepath.Value.ToString() != FileUploading.FileName)
                    {
                        imagepathstring();
                    }

                    else
                    {
                        objProduct.ProductImage = DisplayProductImage.ImageUrl;
                    }
                }
                else
                {
                        objProduct.ProductImage = DisplayProductImage.ImageUrl;

                }
            }
            else
            {
                objProduct.Action = "Insert";
                imagepathstring();

            }

            ProductAdapter saveproduct = new ProductAdapter();
            saveproduct.ManageProduct(objProduct);
            Response.Redirect("/UI/modules/Products/ProductList.aspx");
            void imagepathstring()
            {
                if (FileUploading.HasFile)
                {
                    string path = @"C:\practice\webapp\UploadedFiles\";
                    string iispath = @"C:\inetpub\wwwroot\Training\UploadedFiles\";
                    string angularPath = @"C:\practice\test\easyorder\src\assets\UploadedFiles\";
                    FileUploading.SaveAs(path + FileUploading.FileName);
                    FileUploading.SaveAs(iispath + FileUploading.FileName);
                    FileUploading.SaveAs(angularPath + FileUploading.FileName);
                    Error.Text = "file uploaded";
                    FileUploading.Visible = false;
                    btnSave.Visible = false;
                    objProduct.ProductImage = "/UploadedFiles/" + FileUploading.FileName;
                }
                else
                {
                    Error.Text = "error while uploading file";
                }
            }
        }
        protected void DisplayProductDetails(int ProductId)
        {

            ProductAdapter ObjproductView = new ProductAdapter();
            ProductModel ObjProduct = new ProductModel();

            ObjProduct = ObjproductView.GetProducts(Convert.ToInt32(Request.QueryString["ProductId"].ToString()));
            txtProductName.Text = ObjProduct.ProductName;
            txtProductDescription.Text = ObjProduct.ProductDescription;
            txtAvailableQuantity.Text = ObjProduct.AvailableQuantity.ToString();
            txtProductPrice.Text = ObjProduct.ProductPrice.ToString();
            imagepath.Value = ObjProduct.ProductImage.ToString().Substring(15);
          
            DisplayProductImage.ImageUrl = ObjProduct.ProductImage.ToString();
            DisplayProductImage.Visible = true;


        }

    }
}