<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="SavedList.aspx.cs" Inherits="webapp.UI.modules.Orders.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Saved List</h1>
    <span style="vertical-align:middle;text-align:center;margin-left:100px">
    <asp:Label ID="lblstockstatus" ForeColor="White" BackColor="Red" Font-Bold="true" Font-Size="Large" runat="server" Text="Label" Visible="false" Height="25px"></asp:Label></span>
    <asp:DataList ID="DataList1" runat="server"  CellPadding="4" ForeColor="#333333">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" style="width: 100px">Name</td>
                    <td class="auto-style2" style="width: 250px">Description</td>
                    <td class="auto-style2" style="width: 100px">Price</td>
                    <td class="auto-style2" style="width: 100px;padding-left:10px;">Quantity</td>
                    <td class="auto-style2" style="width: 100px">Image</td>
                    <td class="auto-style2" style="width: 150px">Options</td>

                </tr>
            </table>
        </HeaderTemplate>
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="width: 100px; height: 50px;">
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </td>
                    <td style="width: 250px; height: 50px;">
                        <asp:Label ID="lblProductDescription" runat="server" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                    </td>
                    <td style="width: 100px; height: 50px;">
                        <asp:Label ID="lblProductPrice" runat="server" Text='<%# Eval("ProductPrice")+"  Rs" %>' OnDataBinding="lblProductPrice_DataBinding"></asp:Label>
                    </td>
                    <td style="width: 100px; height: 50px;">
                        <asp:LinkButton ID="lbtDelete" OnClick="lbtDelete_Click" runat="server" Font-Underline="false" ForeColor="Red"   CommandArgument='<%# Eval("ProductID") %>' >&#10134;</asp:LinkButton>&nbsp;
                        <asp:Label ID="lblQuantity" runat="server" Font-Bold="true" Font-Size="Larger" Text='<%# Eval("Quantity") %>' OnDataBinding="lblProductPrice_DataBinding"></asp:Label>&nbsp;
                        <asp:LinkButton ID="lbtadd"  OnClick="lbtincrease_Click" Font-Size="Medium" Height="15" runat="server" Font-Underline="false" ForeColor="Red"   CommandArgument='<%# Eval("ProductID") %>' >&#10133;</asp:LinkButton>
                        <%--<asp:LinkButton ID="lbtQuantityIncrease" runat="server" OnClick="lbtQuantityIncrease_Click" Width="30px" Height="30px" CommandArgument='<%# Eval("ProductID") %>' >+</asp:LinkButton>--%>
                    </td>
                    <td style="width: 100px; height: 50px;">
                        <asp:Image ID="imgProductImage" runat="server" Width="50px" Height="50px" ImageUrl='<%# Eval("ProductImage") %>' />
                    </td>
                    <td style="width: 150px">

                        
                        <asp:LinkButton ID="lbtwishlist" OnClick="lbtwishlist_Click" runat="server" Font-Underline="false" ForeColor="Red" BackColor="Wheat" CommandArgument='<%# Eval("ProductID") %>' Text="Add to Wish List"></asp:LinkButton>

                    </td>
                </tr>

            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
     <asp:Label ID="lblnoproducts" runat="server" Font-Size="XX-Large" Text="" Visible="false">No Products in the Saved List &#128528;</asp:Label>
    <asp:Button ID="btnToProducts" OnClick="ToProductList_Click" Visible="false" BackColor="#33ccff" ForeColor="White" Font-Size="Large" Text="Add More Products" CssClass="button"  runat="server" />
     
    <table runat="server"  id="divplaceorder" >
        <tr>
            <td style="text-align: right; padding-left: 300px; width: 300px; font-size: 30px; font-weight: 300">Total Ammount 
            </td>
            <td style="text-align: left; padding-left: 100px; width: 200px; font-size: 30px; font-weight: 300">
                <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
            </td>

        </tr>
        <tr>
            <td style="text-align: right">
                <asp:Button ID="ToProductList" runat="server" Text="Add More" Font-Bold="true" Width="150px" Height="40px" ForeColor="White" BorderColor="Black" BackColor="#33ccff" OnClick="ToProductList_Click" />
            </td>
            <td style="text-align: left">
                <asp:Button ID="btnPlaceorder" runat="server" Width="150px" Font-Bold="true" Height="40px" ForeColor="White" BackColor="#33ccff" BorderColor="Black" Text="Place Order" OnClick="btnPlaceorder_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
