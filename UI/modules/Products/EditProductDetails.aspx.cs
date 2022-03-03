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
    public partial class EditProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ProductAdapter ObjproductView = new ProductAdapter();
                ProductModel ObjProduct = new ProductModel();

                ObjProduct = ObjproductView.GetProducts(Convert.ToInt32(Request.QueryString["ProductId"].ToString()));
                txtProductName.Text = ObjProduct.ProductName;
                txtProductDescription.Text = ObjProduct.ProductDescription;
                txtAvailableQuantity.Text = ObjProduct.AvailableQuantity.ToString();
                txtProductPrice.Text = ObjProduct.ProductPrice.ToString();
                imagepath.Value = ObjProduct.ProductImage.ToString();
                DisplayProductImage.Src = ObjProduct.ProductImage.ToString();
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            ProductModel ObjUpdatedProduct = new ProductModel();
            ObjUpdatedProduct.ProductDescription = txtProductDescription.Text.ToString();

            ObjUpdatedProduct.ProductName = txtProductName.Text.ToString();
            ObjUpdatedProduct.ProductPrice = Convert.ToInt32(txtProductPrice.Text);
            ObjUpdatedProduct.AvailableQuantity = Convert.ToInt32(txtAvailableQuantity.Text);
            ObjUpdatedProduct.ProductID = Convert.ToInt32(Request.QueryString["ProductId"].ToString());
            ObjUpdatedProduct.Action = "Update";
            if (imagepath.Value.ToString() != FileUploading.FileName)
            {
                ObjUpdatedProduct.ProductImage = imagepath.Value.ToString();
            }
            else
            {
                if (FileUploading.HasFile)
                {
                    string path = @"C:\practice\webapp\UploadedFiles\";
                    FileUploading.SaveAs(path + FileUploading.FileName);
                    ObjUpdatedProduct.ProductImage = "/UploadedFiles/" + FileUploading.FileName;
                }


                else
                {
                    Error.Text = "Please select file";
                }
            }


            ProductAdapter OBJUpdateProduct = new ProductAdapter();
            OBJUpdateProduct.ManageProduct(ObjUpdatedProduct);
        }

        protected void txtProductPrice_TextChanged(object sender, EventArgs e)
        {
            TextBox txtbox = (TextBox)(sender);
            string changedvalue = txtbox.Text;
            txtAvailableQuantity.Text = changedvalue;
        }
    }
}