<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="webapp.UI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background:url(/UploadedFiles/UI/inforbg.jpg); opacity:1;background-blend-mode:lighten">
    <div >
        <form id="form1" runat="server">
            <div style="text-align:center; border-color: black; padding: 50px; margin-top: 100px; margin-left: 30%; width: 30%;background-color:aliceblue;opacity:0.8">
                <asp:Label ID="lblsignedout" runat="server"   Visible="false" Text="" ForeColor="Red" Font-Size="X-Large" Font-Bold="true" BackColor="White"></asp:Label>
                <table style="width:100%">
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Image ID="imglogos" ImageUrl="/UploadedFiles/UI/infor.png" Width="125" ImageAlign="Middle" Height="125" runat="server" /></td>
                    </tr>
                    <tr style="padding:100px;">
                        <td style="width:100px;text-align:right;margin-right:50px;padding-top:20px;padding-right:30px;">
                            <asp:Label ID="lblUsername"  Height="40px" Font-Size="X-Large" ForeColor="black"  runat="server" Text="User Name " Font-Bold="True"></asp:Label>
                        </td>
                        <td style="width:40%;margin-left:20px">
                            <asp:TextBox ID="txtusername" BorderStyle="Groove" Height="25px" Width="180px" BorderWidth="2px" Font-Bold="True" Font-Size="Large" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;padding-right:30px">
                            <asp:Label ID="lblPassword" Height="40px" Font-Size="X-Large" runat="server" Text="Password" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="passwordtxt" runat="server" TextMode="Password" Height="25px" BorderStyle="Groove" Width="180px" BorderWidth="2px" Font-Bold="True" Font-Size="Large"></asp:TextBox>
                        </td>
                    </tr>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                   
                    <tr >
                        <td style="text-align:right;padding-top:20px">
                            <asp:Button ID="btnSigin" runat="server"  Text="Log In" Width="150px" Height="40px" BackColor="#33ccff" ForeColor="White" Font-Bold="true" OnClick="btnSigin_Click" />
                        </td>
                        <td style="padding-top:20px">
                            <asp:Button ID="btnChangePassword" runat="server" Width="150px" Height="40px" BackColor="Gray" ForeColor="White" Font-Bold="true" Text="Change Password" OnClick="btnChangePassword_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center;padding-top:20px" colspan="2">
                            <asp:Button ID="btnRegistration" runat="server" Width="150px" Height="30px" BackColor="Silver" ForeColor="White" Font-Bold="true" Text="Create Account" OnClick="btnRegistration_Click" />
                        </td>
                    </tr>
                </table>
    <asp:Label ID="txtError" runat="server" Text="Label" Visible="False" BackColor="White" Font-Bold="True" Font-Size="X-Large" ForeColor="#990000"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
