<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="webapp.UI.modules.Orders.WishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Wish List</h1>
    <asp:DataList ID="WishListDataList" runat="server"  CellPadding="4" ForeColor="#333333">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="width:200px">Name</td>
                    <td class="auto-style2" style="width:200px">Description</td>
                    <td class="auto-style2" style="width:100px">Price</td>
                    <td class="auto-style2"style="width:100px">Image</td>
                    <td class="auto-style2"style="width:200px">Options</td>
                    
                </tr>
            </table>
        </HeaderTemplate>
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="width:200px;height:50px;">
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </td>
                    <td style="width:200px;height:50px;">
                        <asp:Label ID="lblProductDescription" runat="server" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                    </td>
                    <td style="width:100px;height:50px;">
                        <asp:Label ID="lblProductPrice" runat="server" Text='<%# Eval("ProductPrice")+"  Rs" %>'   ></asp:Label>
                    </td>
                    <td style="width:100px;height:50px;">
                        <asp:Image ID="imgProductImage" runat="server" Width="50px" Height="50px" ImageUrl='<%# Eval("ProductImage") %>' />
                    </td>
                    <td style="width:200px">

                        <asp:LinkButton ID="lbtDelete"  runat="server" Font-Underline="false"  ForeColor="Red" BackColor="Wheat" OnClick="lbtDelete_Click" CommandArgument='<%# Eval("ProductID") %>' Text="Delete"></asp:LinkButton>
                       &nbsp;&nbsp; <asp:LinkButton ID="lbtAddToBag"  runat="server" Font-Underline="false"  ForeColor="Red" BackColor="Wheat"  OnClick="lbtAddToBag_Click" CommandArgument='<%# Eval("ProductID") %>' Text="Add to Bag"></asp:LinkButton>

                    </td>
                </tr>
               
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:Label ID="lblnoproducts" runat="server" Font-Size="XX-Large" Text="" Visible="false">No Products in the Wish List &#128528;</asp:Label>
    <asp:Button ID="btnToProducts" OnClick="btnToProducts_Click" Visible="true" BackColor="#33ccff" ForeColor="White" Font-Size="Large" Text="Add More Products" CssClass="button"  runat="server" />
    </asp:Content>
