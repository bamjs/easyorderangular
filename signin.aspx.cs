using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using middleteir.Adapters.users;
using middleteir.Models.users;

namespace webapp.UI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["signedout"] != null)
                {
                    lblsignedout.Visible = true;
                    lblsignedout.Text += "Thank You Visit Again " + Request.QueryString["firstname"].ToString().ToUpper();
                }
                if (Request.QueryString["usercreated"] != null)
                {
                    lblsignedout.Visible = true;
                    lblsignedout.Text = "User Created Succesfull";
                }
            }
        }

        protected void btnSigin_Click(object sender, EventArgs e)
        {
            LoginValidator OBJLogin = new LoginValidator();
            UserProfile ObjUsers = new UserProfile();
            ObjUsers = OBJLogin.GetUserDetails(txtusername.Text);
            if (ObjUsers.Int_userid > 0)
            {
                if (passwordtxt.Text == ObjUsers.Str_password)
                {
                    Session["username"] = ObjUsers.Str_username;
                    Session["UserID"] = ObjUsers.Int_userid;
                    Session["FirstName"] = ObjUsers.Str_firstName;
                    Session["UserType"] = ObjUsers.Str_UserType;
                    Response.Redirect("/UI/modules/Products/ProductList.aspx");
                }
                else
                {
                    txtError.Text = "Invalid Password";
                    txtError.Visible = true;

                }
            }
            else
            {
                txtError.Text = "Invalid Credentials";
                txtError.Visible = true;

            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UI/modules/user/ResetPassword.aspx");
        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("/UI/modules/user/UserRegistration.aspx?disablemaster=true");
        }
    }
}