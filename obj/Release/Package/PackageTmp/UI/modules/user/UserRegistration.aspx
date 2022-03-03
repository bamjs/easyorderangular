<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="webapp.UI.modules.user.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin: 10px; width: 80%;  font-weight: bold;" runat="server" id="registrationtable">
        <tr>
            <td>
                <asp:Label ID="lblfirstName" runat="server" Text="First Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtfirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ControlToValidate="txtfirstName" ErrorMessage="First Name is Required"></asp:RequiredFieldValidator>
            </td>
            </tr>
        <tr>
            <td>
                <asp:Label ID="lblsecondName" runat="server" Text="Second Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtsecondName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="secondNameValidator" runat="server" ErrorMessage="Second Name is Required" ControlToValidate="txtsecondName"></asp:RequiredFieldValidator>
            </td>

                

        </tr>
        <tr>
            <td>
                <asp:Label ID="lblphoneNumber" runat="server" Text="Phone Number" BorderColor="#33CC33"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtphoneNumber" TextMode="Number"  runat="server"></asp:TextBox></td>
            
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblemailID" runat="server" Text="Email ID"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtemailID" TextMode="Email" runat="server"></asp:TextBox></td>

        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lbladdress1" runat="server" Text="Address 1"></asp:Label></td>
            <td class="auto-style1">
                <asp:TextBox ID="txtaddress1" runat="server"></asp:TextBox></td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="lbladdress2" runat="server" Text="Address 2"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtaddress2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtusername"  runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtpassword"  runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblage" runat="server" Text="Age"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtage" TextMode="Number" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbldob" runat="server"  Text="Date of Birth"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtdobs" runat="server"  Visible="false" OnTextChanged="txtdobs_TextChanged"></asp:TextBox>
                <asp:ImageButton ID="calendarimage" runat="server" Height="20px" ImageUrl="~/UI/modules/calendar.png" Visible="false" OnClick="calendarimage_Click" />
                <asp:Calendar ID="txtdob" runat="server" OnSelectionChanged="txtdob_SelectionChanged">
                    <SelectedDayStyle BackColor="#FF0066" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblsalary" runat="server" Text="Salary"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtsalary" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblgender" runat="server" Text="Gender"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rdgender" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                   
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                  <asp:Label ID="lblregisteras" runat="server" Text="Register As"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdCustomertype" RepeatDirection="Horizontal" AutoPostBack="true"  OnSelectedIndexChanged="Customertype_SelectedIndexChanged" runat="server">
                    <asp:ListItem>Customer</asp:ListItem>
                    <asp:ListItem>Vendor</asp:ListItem>
                   </asp:RadioButtonList>
            </td>
        </tr>
        <tr runat="server" visible="false" id="tdGstNumber">
            <td>
                 <asp:Label ID="lblgst" runat="server" Text="GST Number"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtgst" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td ></td><td>
                <asp:CheckBox ID="CheckBoxterms" runat="server" />
                <asp:Label ID="lblchekbox" runat="server" Text="Terms & Conditions"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnsave" runat="server"  CausesValidation="true" Text="Save" BackColor="#00ccff"  ForeColor="White" OnClick="btnsave_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnreset" runat="server" Text="Reset"  BackColor="Gray"  ForeColor="White"/></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EasyOrdersConnectionString %>" InsertCommandType="StoredProcedure" ></asp:SqlDataSource>
 
                <asp:Button ID="redirect" runat="server"  Text="View List" Visible="False" OnClick="redirect_Click" />
             
</asp:Content>
