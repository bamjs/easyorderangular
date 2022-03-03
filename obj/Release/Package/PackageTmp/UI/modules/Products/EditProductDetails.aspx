<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="EditProductDetails.aspx.cs" Inherits="webapp.UI.modules.Products.EditProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table  runat="server" CellPadding="10"  Font-Bold="true" CellSpacing="10">
        <tr >
            <td >
                <asp:Label ID="lblProductName" runat="server" Text="Product Name" Font-Bold="true"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtProductName" runat="server"  Font-Bold="True" Font-Size="Medium" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
               
                <asp:Label ID="lblProductDescription" runat="server" Font-Bold="true" Text="Product Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProductDescription" runat="server"  Font-Bold="True" Font-Size="Medium"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lblProductPrice" runat="server" Font-Bold="true" Text="Product Price"></asp:Label>
            </td>
            <td>

                <asp:TextBox ID="txtProductPrice"  runat="server"  Font-Bold="True" Font-Size="Medium" OnTextChanged="txtProductPrice_TextChanged"  ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lblAvailableQuantity" runat="server" Font-Bold="true" Text="Available Quantity"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAvailableQuantity" runat="server" Font-Bold="True" Font-Size="Medium" ></asp:TextBox>
            </td>
        </tr>
        <tr>

            <td >
                <asp:Label runat="server" Text="Select Image To Upload" Font-Bold="true" ID="lblImage"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploading" runat="server" Height="62px"  />
            </td>
        </tr>
        <tr>
            <td>
                Product Image
            </td>
            <td>
                <img  runat="server" id="DisplayProductImage"/>
            </td>
        </tr>

            <tr><td ></td><td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" BackColor="#00ccff" Font-Bold="True" Font-Names="Arial Black" Font-Size="Large" ForeColor="White" />
                <asp:Button ID="btncancel" runat="server" Text="Cancel"  BackColor="Gray" Font-Bold="True" Font-Names="Arial Black" Font-Size="Large" ForeColor="White" />
    </td></tr> 
        
                </table>
    <asp:HiddenField runat="server" id="imagepath" ></asp:HiddenField>
    
    <asp:Label ID="Error" runat="server" Text="Label" Visible="False"></asp:Label>
  
</asp:Content>
