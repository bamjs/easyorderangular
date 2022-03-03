<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calculator.aspx.cs" Inherits="webapp.UI.calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="textvalue" runat="server" Height="200px" Width="60%" BorderColor="#FF6666" BorderStyle="Solid" BorderWidth="5px" Font-Size="50px" BackColor="#FF9999" Font-Bold="True" ForeColor="#993399"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server"  Text="1" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Ridge" OnClick="Button1_Click" Font-Bold="True" Font-Size="XX-Large" />
            <asp:Button ID="Button2" runat="server" Text="2" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button2_Click" Font-Bold="True" Font-Size="XX-Large" />
            <asp:Button ID="Button3" runat="server" Text="3" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button3_Click" Font-Bold="True" Font-Size="XX-Large"  />
            <asp:Button ID="Button14" runat="server" Text="+" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" OnClick="Button14_Click" Font-Bold="True" Font-Size="XX-Large"/>
        </div>
        
            <div>
                <asp:Button ID="Button4" runat="server" Text="4" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button4_Click" Font-Bold="True" Font-Size="XX-Large"/>
                <asp:Button ID="Button5" runat="server" Text="5" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button5_Click" Font-Bold="True" Font-Size="XX-Large"/>
                <asp:Button ID="Button6" runat="server" Text="6" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button6_Click" Font-Bold="True" Font-Size="XX-Large"/>
            <asp:Button ID="Button10" runat="server" Text="-" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" OnClick="Button10_Click" Font-Bold="True" Font-Size="XX-Large"/>
            
            </div>
       
            <div>
                <asp:Button ID="Button7" runat="server" Text="7" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button7_Click" Font-Bold="True" Font-Size="XX-Large"/>
                <asp:Button ID="Button8" runat="server" Text="8" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button8_Click" Font-Bold="True" Font-Size="XX-Large"/>
                <asp:Button ID="Button9" runat="server" Text="9" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" BorderStyle="Solid" OnClick="Button9_Click" Font-Bold="True" Font-Size="XX-Large"/>
           <asp:Button ID="Button11" runat="server" Text="/" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" OnClick="Button11_Click" Font-Bold="True" Font-Size="XX-Large"/>
            
                </div>
        <div>
             <asp:Button ID="Button12" runat="server" Text="Clear" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" OnClick="Button12_Click" Font-Bold="True" Font-Size="XX-Large"/>
            <asp:Button ID="Button16" runat="server" Text="0" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" OnClick="Button16_Click" Font-Bold="True" Font-Size="XX-Large"/>
            <asp:Button ID="Button13" runat="server" Text="%" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" OnClick="Button13_Click" Font-Bold="True" Font-Size="XX-Large"/>
           <asp:Button ID="Button17" runat="server" Text="=" Width="15%" Height="150px" BackColor="#99FF99" BorderColor="#FF3399" OnClick="Button17_Click" Font-Bold="True" Font-Size="XX-Large"/>
             <asp:Label ID="check" runat="server" Text=" "></asp:Label>
        </div>
        
    </form>
</body>
</html>
