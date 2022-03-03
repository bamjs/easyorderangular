<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="webapp.UI.modules.user.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: cornsilk">
    <div runat="server" id="divVerify">
        <form id="form1" runat="server">
            <div style="border: solid; border-width: 2px; border-color: black; padding: 50px; margin-top: 100px; margin-left: 30%; width: 30%">
        <asp:Label ID="Error" ForeColor="Red" Font-Bold="true" runat="server" Text=""></asp:Label>

                <table style="width: 100%">
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <asp:Image ID="imglogos" ImageUrl="/UploadedFiles/UI/infor.png" Width="125" ImageAlign="Middle" Height="125" runat="server" /></td>
                    </tr>
                    <tr style="padding: 100px">
                        <td style="width: 200px; text-align: right; margin-right: 50px; padding-top: 20px; padding-right: 30px">
                            <asp:Label ID="lblregisternedNumber" Height="40px" Font-Size="Large" runat="server" Text="Registered Number " Font-Bold="True"></asp:Label>
                        </td>
                        <td style="width: 40%; margin-left: 20px">
                            <asp:TextBox ID="txtNumber" BorderStyle="Groove" Height="25px" Width="180px" BorderWidth="2px" Font-Bold="True" Font-Size="Large" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 30px">
                            <asp:Label ID="lblemailid" Height="40px" Font-Size="Large" runat="server" Text="Registred Email-ID" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtemailid" runat="server" Height="25px" BorderStyle="Groove" Width="180px" BorderWidth="2px" Font-Bold="True" Font-Size="Large"></asp:TextBox>
                        </td>
                    </tr>
                    <asp:HiddenField ID="HiddenField1" runat="server" />

                    <tr>
                        <td colspan="2" style="text-align: center; padding-top: 20px">
                            <asp:Button ID="btnverify" runat="server" Text="Click To Verify" Width="150px" Height="40px" BackColor="#33ccff" ForeColor="White" Font-Bold="true" OnClick="btnverify_Click" />
                        </td>

                    </tr>

                </table>
                <asp:Label ID="txtError" runat="server" Text="Label" Visible="False" BackColor="White" Font-Bold="True" Font-Size="X-Large" ForeColor="#990000"></asp:Label>
            </div>
        </form>
    </div>
    <div runat="server" id="divChangePassword" visible="false">
        <form id="form2" runat="server">
            <div style="border: solid; border-width: 2px; border-color: black; padding: 50px; margin-top: 100px; margin-left: 30%; width: 30%">
                <table style="width: 100%">
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <asp:Image ID="Image1" ImageUrl="/UploadedFiles/UI/infor.png" Width="125" ImageAlign="Middle" Height="125" runat="server" /><br />
                            <asp:Label ID="lblNameondb" ForeColor="Blue" Font-Bold="true" BackColor="WhiteSmoke" Visible="false" runat="server" Text=""></asp:Label>
                    </tr>
                    <tr style="padding: 100px">
                        <td style="width: 200px; text-align: right; margin-right: 50px; padding-top: 20px; padding-right: 30px">
                            <asp:Label ID="lblPassword" Height="40px" Font-Size="Large" runat="server" Text="Enter Password" Font-Bold="True"></asp:Label>
                        </td>
                        <td style="width: 40%; margin-left: 20px">
                            <asp:TextBox ID="txtPassword" BorderStyle="Groove" Height="25px" TextMode="Password" Width="180px" BorderWidth="2px" Font-Bold="True" Font-Size="Large" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-right: 30px">
                            <asp:Label ID="lblConfirmPassword" Height="40px" Font-Size="Large" runat="server" Text="Re Enter Password" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtConfirmpassword" runat="server" TextMode="Password" Height="25px" BorderStyle="Groove" Width="180px" BorderWidth="2px" Font-Bold="True" Font-Size="Large"></asp:TextBox>
                        </td>
                    </tr>
                    <asp:HiddenField ID="hdnUserID" runat="server" />

                    <tr>
                        <td  style="text-align: right; padding-top: 20px">
                            <asp:Button ID="btnConfirm" runat="server" Text="Change Password" Width="150px" Height="40px" BackColor="#33ccff" ForeColor="White" Font-Bold="true" OnClick="btnConfirm_Click" />
                        </td>
                        <td style="text-align:left;padding-top:20px">
                            <asp:Button ID="btnSigin" Visible="false" runat="server" Text="Log In" Width="150px" Height="40px" BackColor="#33ccff" ForeColor="White" Font-Bold="true"  OnClick="btnSigin_Click" />

                        </td>
                    </tr>

                </table>
                <asp:Label ID="Label3" runat="server" Text="Label" Visible="False" BackColor="White" Font-Bold="True" Font-Size="X-Large" ForeColor="#990000"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
