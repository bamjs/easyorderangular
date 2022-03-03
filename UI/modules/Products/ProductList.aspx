<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="webapp.UI.modules.Products.ProductList" %>
<%--<%@ OutputCache Duration="30" Location="ServerAndClient"  VaryByParam="ContentPlaceHolder1" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <asp:Label runat="server" ID="time"></asp:Label>
    <script>
        document.write(Date())
    </script>--%>
     <style>
        .button {
    border-radius: 20px;
    text-align: center;
    align-items: center;
    align-content:center;
   vertical-align:middle;
   text-justify:distribute;
    color: white;
    background-color: #33ccff;
    border: 2px solid black;
    font-weight:200;
    font-size:large;
    height:40px;
    width:100px;
}
.buttonpadding{
   margin-left:15px; 
}
#DataListProducts{
    display:flex;
}
table {
    
    box-shadow: 5px 5px 5px 5px  rgb(228 156 156);
    margin-inline-start:5px;
}
    </style>
    <asp:DataList ID="DataListProducts" RepeatColumns="4"  RepeatDirection="Horizontal" runat="server" DataKeyField="ProductID" OnItemDataBound="DataListProducts_ItemDataBound" ItemStyle-Width="250px" Width="250px" Height="300px" ItemStyle-Height="300px"   HorizontalAlign="Center" >
        <AlternatingItemStyle BorderColor="White" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black"  BackColor="#e0fecd" />
        <ItemTemplate>
            <table style="height:300px;width:250px; border:solid;max-height:300px; border-width:2px;border-color:black">
                <tr>
                    <td>Name  </td>
                       <td>
                          <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' Font-Bold="true" Font-Size="X-Large" /></td>
                    
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:70px">
                        <asp:Image ID="ProductImageLabel" runat="server"  Height="100px" Width="100px" ImageAlign="Middle"  src='<%# Eval("ProductImage") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Price
                    </td>
                    <td style="font-weight:700;color:tomato;font-size:larger">
                        <asp:Label ID="ProductPriceLabel" runat="server" Text='<%# Eval("ProductPrice") %>' />
                        Rs
                    </td>
                </tr>
                <tr>
                    <td>Description :
                    </td>
                    <td  >
                        <div style="height:50px; vertical-align:middle;text-align:center ; align-items:center;text-align:left;max-width:125px;max-height:53px;overflow:hidden;padding-bottom:5px ">
                        <asp:Label ID="ProductDescriptionLabel" runat="server" Text='<%# Eval("ProductDescription") %>' /></div>
                    </td>
                </tr>
                <tr>
                    <td>Available Qty
                    </td>
                    <td>
                        <asp:Label ID="AvailableQuantityLabel" runat="server" Text='<%# Eval("AvailableQuantity") %>' />

                    </td>
                </tr>
                <tr>
                    <td  style="text-align:center;vertical-align:central">
                        <asp:LinkButton Font-Underline="false" Text="&nbsp;&nbsp;Add to &nbsp;&nbsp;&nbsp; Bag " CssClass="button " Height="40px" Width="100px" runat="server" ID="lbtaddToBag" BackColor="#33ccff" ForeColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" OnClick="AddToBag" CommandArgument='<%# Eval("ProductID") %>'>

                            <%--<asp:Image ID="Addtobag" ImageUrl="/UploadedFiles/UI/bag.png"  Width="20px" Height="20px"  runat="server" />--%>
                            </asp:LinkButton>
                    </td>
                     <td style="text-align:center;vertical-align:central">
                         <asp:LinkButton Font-Underline="false"  CssClass="button "  Text="Add to WishList "  Height="40px"    Width="100px" runat="server" ID="lbtAddToWishList"  BackColor="#33ccff" ForeColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px"  OnClick="bltAddToWishList_Click" CommandArgument='<%# Eval("ProductID") %>'>
                            <%--<asp:Image ID="addtowishlist" ImageUrl="/UploadedFiles/UI/wishlist.png"  Width="20px" Height="20px"  runat="server" />--%>
                        
                     </asp:LinkButton></td>   
                    
                </tr>
               <tr>
                   <td>
                      <asp:LinkButton ID="lbtEditProduct" Text="Edit" runat="server" CssClass="button" Width="100" Height="20"  OnClick="EditProducts" Font-Underline="false" CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                   </td>
                 
                    <td>
                        <asp:LinkButton ID="btnDelete" OnClick="DeleteProducts" BackColor="Red" CssClass="button buttonpadding" Text="Delete"  Width="100" Height="20" Font-Underline="false" runat="server"  CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                    </td>
                </tr>

            
            </table>
        </ItemTemplate>
        <SeparatorStyle HorizontalAlign="Center" VerticalAlign="Top" />
    </asp:DataList>

                    
</asp:Content>
