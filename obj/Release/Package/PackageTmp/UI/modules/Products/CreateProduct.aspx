<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" Inherits="webapp.UI.modules.Products.SaveAsProduct" %>
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
                <asp:HiddenField ID="imagepath" runat="server" />
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

                <asp:TextBox ID="txtProductPrice" runat="server" Font-Bold="True" Font-Size="Medium" ></asp:TextBox>
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
              <td>
                  <asp:Label ID="lblProductImage" runat="server" Text="Product Image" Font-Bold="true"></asp:Label>
              </td>
              <td>
                  <asp:Image ID="DisplayProductImage" Visible="false" runat="server" />
              </td>
          </tr>
        <tr>

            <td >
                <asp:Label runat="server" Text="Upload Product Image" Font-Bold="true" ID="lblImage"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploading" runat="server" Height="62px"  />
            </td>
        </tr>
            <tr><td ></td><td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" BackColor="#00ccff" Font-Bold="True" Font-Names="Arial Black" Font-Size="Large" ForeColor="White" />
                <asp:Button ID="btncancel" runat="server" Text="Cancel"  BackColor="Gray" Font-Bold="True" Font-Names="Arial Black" Font-Size="Large" ForeColor="White" />
    </td></tr>    
                </table>
    <asp:Label ID="Error" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content> 
