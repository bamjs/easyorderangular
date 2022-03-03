<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="webapp.UI.modules.Orders.PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Select Payment Option</h1>
    <asp:DropDownList ID="ddlPaymentDetails" Width="200px" AutoPostBack="true" Height="40px" runat="server" OnTextChanged="ddlPaymentDetails_SelectedIndexChanged">
        <asp:ListItem Value="NONE" Enabled="true"> Select a Payment Method </asp:ListItem>
        <asp:ListItem Value="Cash" Enabled="true"> Cash </asp:ListItem>
        <asp:ListItem Value="Credit" Enabled="true">Credit Card</asp:ListItem>
        <asp:ListItem Value="Debit" Enabled="true">Debit Card</asp:ListItem>
    </asp:DropDownList>

    <div runat="server" id="CashDetails" visible="false">
    </div>
    <div runat="server" style="margin-left: 100px; margin-top: 50px" visible="false" id="CreditCard">
        <h3>Enter Your Credit Card Details</h3>
        <table style="border: solid; border-color: black; font-size: 20px; width: 425px">
            <tr>
                <td colspan="2" style="width: 200px; padding-top:20px ">
                    <asp:Label ID="lblCreditcardNumber" Font-Bold="true" Width="200px" runat="server" Text="Credit Card Number"></asp:Label>
                </td>
                <td colspan="2" style="width: 200px;padding-top:20px">
                    <asp:TextBox ID="txtcreditcardnumber" Font-Bold="true" TextMode="Number" Columns="16"  Height="20px" Width="150px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Font-Size="Small"  Height="10px"  ForeColor="Red"   ControlToValidate="txtcreditcardnumber" runat="server" ErrorMessage="Enter Credit Card Number"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td style="width: 75px; padding-top: 5px; ">
                    <asp:Label ID="lbldateofexpiry" Font-Bold="true" runat="server" Text="Expiry Date"></asp:Label>

                <td style="width: 80px; padding-top: 5px; ">
                    <asp:TextBox ID="txtexpiryMonth" Font-Bold="true" Height="20px" ValidationGroup="required" Width="35px" TextMode="Number" MaxLength="2" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtexpiryYear" Font-Bold="true" Height="20px" ValidationGroup="required" Width="45px" TextMode="Number" MaxLength="4" runat="server"></asp:TextBox>
                </td>

                <td style="width: 60px; padding-top: 5px; ">
                    <asp:Label ID="lblcvv" runat="server" Font-Bold="true" Text="CVV"></asp:Label>
                </td>
                <td style="width: 75px; padding-top: 5px; ">
                    <asp:TextBox ID="txtcvv" TextMode="Number" MaxLength="3" Font-Bold="true" Height="20px" Width="50px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="Requiredmonth" runat="server" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtexpiryMonth" ErrorMessage="Enter Month & Year"></asp:RequiredFieldValidator><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldyear" runat="server" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtexpiryYear" ErrorMessage="Enter Month & Year"></asp:RequiredFieldValidator>

                </td>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldcvv" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtcvv" runat="server" ErrorMessage="CVV Required" ></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100px; padding-top: 5px; ">
                    <asp:Label ID="lblName" Font-Bold="true" runat="server" Text="Name On The Card"></asp:Label>
                </td>
                <td colspan="2" style="width: 150px; padding-top: 5px; ">
                    <asp:TextBox ID="txtName" Width="150px" Font-Bold="true" Height="20px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:RequiredFieldValidator ID="Requiredname" runat="server" ErrorMessage=" Name Required" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtName"></asp:RequiredFieldValidator>

                </td>
            </tr>



        </table>
    </div>
    <div runat="server" id="DebitCard" visible="false" style="margin-left: 100px; margin-top: 50px">
        <h3>Enter Your Debit Card Details</h3>
        <table style="border: solid; border-color: black; font-size: 20px; width: 425px">
            <tr>
                <td colspan="2" style="width: 200px; padding-top: 20px; ">
                    <asp:Label ID="lblDebitcardNumber" Font-Bold="true" Width="200px" runat="server" Text="Debit Card Number"></asp:Label>
                </td>
                <td colspan="2" style="width: 200px; padding-top: 5px; ">
                    <asp:TextBox ID="txtdebitcardnumber" Font-Bold="true" TextMode="Number" MaxLength="16" Height="20px" Width="150px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:RequiredFieldValidator ID="requireddebitcard" runat="server" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtdebitcardnumber" ErrorMessage="Enter Debit Card Number"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td style="width: 75px; padding-top: 5px; ">
                    <asp:Label ID="lblexpiry" Font-Bold="true" runat="server" Text="Expiry Date"></asp:Label>
                    <asp:Label runat="server" Font-Bold="true" Font-Size="Small">(MM/YY)</asp:Label>

                <td style="width: 80px; padding-top: 5px; ">
                    <asp:TextBox ID="txtmonth" Font-Bold="true" Height="20px" Width="20px" TextMode="Number" MaxLength="2" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtyear" Font-Bold="true" Height="20px" Width="40px" TextMode="Number" MaxLength="2" runat="server"></asp:TextBox>
                </td>

                <td style="width: 40px; padding-top: 5px; ">
                    <asp:Label ID="lbldebitcvv" Font-Bold="true" runat="server" Text="CVV"></asp:Label>
                </td>
                <td style="width: 75px; padding-top: 5px; ">
                    <asp:TextBox ID="txtdebitcvv" TextMode="Number" MaxLength="3" Font-Bold="true" Height="20px" Width="50px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="Requireddebitcardmonth" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtmonth" runat="server" ErrorMessage="Enter Expiry Date"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="Requireddebitcardyear" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtyear" runat="server" ErrorMessage="Enter Expiry Year"></asp:RequiredFieldValidator>

                </td>
                <td colspan="2">

                    <asp:RequiredFieldValidator ID="requiredDebitcvv" runat="server" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtdebitcvv" ErrorMessage="Enter Debit Card CVV"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100px; padding-top: 5px; ; margin-bottom: 20px">
                    <asp:Label ID="lblDebitName" Font-Bold="true" runat="server" Text="Name On The Card"></asp:Label>
                </td>
                <td colspan="2" style="width: 150px; padding-top: 5px; ; margin-bottom: 20px">
                    <asp:TextBox ID="txtDebitName" Width="150px" Font-Bold="true" Height="20px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:RequiredFieldValidator ID="requireddebitname" runat="server" Font-Size="Small" Height="10px" ForeColor="Red"   ControlToValidate="txtDebitName" ErrorMessage="Enter Name on Debit Card"></asp:RequiredFieldValidator>

                </td>
            </tr>



        </table>


    </div>
    <div runat="server" id="DivPlaceOrder" style="margin-left: 100px;margin-top:20px ">
        <asp:Button ID="btncancelorder" Visible="false" Width="150px" Height="40px" CausesValidation="false" BackColor="Red" ForeColor="White" runat="server" Text="Cancel Order"  OnClick="btncancelorder_Click" />

        <asp:Button ID="btnPlaceOrder" Visible="false" Width="300px" Height="40px" CausesValidation="true" BackColor="#66ccff" ForeColor="White" runat="server" Text="Make Payment" OnClick="btnPlaceOrder_Click1" />
    </div>
</asp:Content>
