using middleteir.Adapters.users;
using middleteir.Models.users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp.UI.modules.user
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnverify_Click(object sender, EventArgs e)
        {
            divVerify.Visible = false;
            UserProfile objUser = new UserProfile();
            objUser.Str_emailID = txtemailid.Text;
            objUser.Str_phoneNumber = txtNumber.Text;
            LoginValidator objloginValidator = new LoginValidator();

            objUser = objloginValidator.ResetPasswordvalidator(objUser);
            if (objUser.Int_userid>1)
            {
                divVerify.Visible = false;
                lblNameondb.Visible = true;
                lblNameondb.Text ="Create New Password   "+ objUser.Str_firstName;
               divChangePassword.Visible = true;
                hdnUserID.Value = objUser.Int_userid.ToString();
            }
            else
            {
                Error.Text = "InValid Credentials ";
                Error.Visible = true;
                divVerify.Visible = true;
                
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            LoginValidator ObjValidator = new LoginValidator();
            int UserID = Convert.ToInt32(hdnUserID.Value);
            if (txtPassword.Text.Equals(txtConfirmpassword.Text))
            {   
                ObjValidator.UpdatePassword(txtPassword.Text,UserID);
                lblNameondb.Text = "Password Updated Sucessful";
                btnSigin.Visible = true;

            }
            else
            {
                lblNameondb.Text = "Password Not Matched Re Enter";
            }
        }

        protected void btnSigin_Click(object sender, EventArgs e)
        {
            Response.Redirect("/signin.aspx");
        }
    }
}