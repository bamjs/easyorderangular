using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using middleteir.Models.users;
using middleteir.Adapters.users;
using System.Data.SqlClient;
using System.Data;

namespace webapp.UI.modules.user
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayUserDetails();
            disablemaster();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            UserProfile Objuser = new UserProfile();//creating object for userprofile
            UserAdapter ObjuserAdapter = new UserAdapter();//creating object for objectuser adapter
            Objuser.Str_firstName = txtfirstName.Text;
            Objuser.Str_secondName = txtsecondName.Text;
            Objuser.Str_username = txtusername.Text;
            Objuser.Str_phoneNumber = txtphoneNumber.Text;
            Objuser.Str_emailID = txtemailID.Text;
            Objuser.Str_gender = rdgender.SelectedValue;
            Objuser.Str_address1 = txtaddress1.Text;
            Objuser.Str_address2 = txtaddress2.Text;
            Objuser.Str_password = txtpassword.Text;
            Objuser.Dt_dob = txtdob.SelectedDate;
            Objuser.Dec_salary = Convert.ToDecimal(txtsalary.Text);
            Objuser.Str_isTermsAndConditon = CheckBoxterms.Checked.ToString();
            Objuser.Int_age = Convert.ToInt32(txtage.Text);
            if (Request.QueryString["UserID"] != null)
            {
                rdCustomertype.Visible = false;
                Objuser.Str_Action = "Update";
                Objuser.Int_userid = Convert.ToInt32(Request.QueryString["UserID"]);
            }
            else
            {
                Objuser.Str_Action = "Insert";
            }
            Objuser.Str_UserType = rdCustomertype.SelectedValue;
            Objuser.Str_GSTNumber = txtgst.Text;
            DataTable data = new DataTable();
            ObjuserAdapter.saveuserprofile(Objuser);
            if (Session["UserID"] != null)
            {
                Response.Redirect("/UI/modules/user/UserList.aspx");
            }
            else
            {
                Response.Redirect("/Signin.aspx?usercreated=true");
            }

        }

        protected void txtdob_SelectionChanged(object sender, EventArgs e)
        {
            txtdob.Visible = false;
            txtdobs.Text = Convert.ToString(txtdob.SelectedDate).Substring(0, 11);
            txtdobs.Visible = true;
            calendarimage.Visible = true;
        }

        protected void txtdobs_TextChanged(object sender, EventArgs e)
        {

        }

        protected void calendarimage_Click(object sender, ImageClickEventArgs e)
        {
            txtdobs.Visible = false;
            txtdob.Visible = true;
        }

        protected void redirect_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UI/modules/user/UserList.aspx");
        }
        private void DisplayUserDetails()
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["UserID"] != null)
                {
                    UserAdapter ObjUseradapter = new UserAdapter();
                    DataTable UserTable = new DataTable();
                    UserTable = ObjUseradapter.GetUserDetails(Convert.ToInt32(Request.QueryString["UserID"]));
                    foreach (DataRow UserRow in UserTable.Rows)
                    {
                        txtusername.Text = UserRow["UserName"].ToString();
                        txtpassword.Text = UserRow["Password"].ToString();
                        txtfirstName.Text = UserRow["FirstName"].ToString();
                        txtsecondName.Text = UserRow["SecondName"].ToString();
                        txtphoneNumber.Text = UserRow["PhoneNumber"].ToString();
                        txtemailID.Text = UserRow["EmailID"].ToString();
                        rdgender.SelectedValue = UserRow["Gender"].ToString();
                        txtaddress1.Text = UserRow["Address1"].ToString();
                        txtaddress2.Text = UserRow["Address2"].ToString();
                        txtdob.Visible = false;
                        txtdobs.Text = UserRow["DateOfBirth"].ToString().Substring(0, 11);
                        txtdobs.Visible = true;
                        calendarimage.Visible = true;
                        txtdob.SelectedDate = Convert.ToDateTime(UserRow["DateOfBirth"]);
                        txtsalary.Text = UserRow["Salary"].ToString();
                        txtage.Text = UserRow["Age"].ToString();
                        CheckBoxterms.Checked = Convert.ToBoolean(UserRow["TermsAndConditions"]);
                        lblregisteras.Visible = false;
                        rdCustomertype.Visible = false;
                        if (UserRow["UserType"].ToString().Equals("Vendor"))
                        {
                            tdGstNumber.Visible = true;
                            txtgst.Text = UserRow["GSTNumber"].ToString();
                        }
                        else
                        {

                            txtgst.Visible = false;
                        }

                    }
                }
            }


        }
        protected void disablemaster()
        {

            if (Request.QueryString["disablemaster"]!=null)
            {
                Menu navbar = (Menu)Page.Master.FindControl("navbar");
                Menu sidemenu = (Menu)Page.Master.FindControl("sidemenu");
                navbar.Visible = false;
                sidemenu.Visible = false;
            }
        }
        protected void Customertype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdCustomertype.SelectedValue == "Vendor")
            {
                tdGstNumber.Visible = true;
            }
            else
            {
                tdGstNumber.Visible = false;
            }
        }

   

        protected void closetermsend_Click(object sender, EventArgs e)
        {
            termsandcondition.Visible = false;
            registrationtable.Visible = true;
        }

        protected void lbtterms_Click(object sender, EventArgs e)
        {
            termsandcondition.Visible = true;
            registrationtable.Visible = false;


        }

       
    }
}