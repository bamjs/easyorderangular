<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="webapp.UI.modules.Orders.Orders1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="divOrdersDisplay" style="float: left; width: 600px">
        <asp:DataList ID="OrdersDataList" runat="server" OnItemDataBound="OrdersDataList_ItemDataBound">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2" style="width: 150px">Order ID</td>
                        <td class="auto-style2" style="width: 150px">Order Date</td>

                        <td class="auto-style2" style="width: 100px">Amount</td>
                        <td class="auto-style2" style="width: 50px">Payment Status</td>
                       


                    </tr>
                </table>
            </HeaderTemplate>
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td style="width: 150px; height: 50px;">
                            <asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                        </td>
                        <td style="width: 150px; height: 50px;">
                            <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                        </td>
                        <td style="width: 100px; height: 50px;">
                            <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount")+"  Rs" %>'></asp:Label>
                        </td>
                        <td style="width: 50px; height: 50px;">
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbtorderDetails" OnClick="lbtorderDetails_Click" CommandArgument='<%# Eval("OrderID") %>' Font-Underline="false" runat="server">Details</asp:LinkButton>
                        </td>

                    </tr>

                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div id="divOrderDetails" runat="server" style="position: page; float: right;background-color:aqua; width: 400px" visible="false">
        <h3 runat="server" visible="false" id="h3stockstatus">Some Products In this Order are Out of Stock</h3>
        <div style="float: right;background-color:aqua;">
            <asp:ImageButton ID="closeOrderdetails" OnClick="closeOrderdetails_Click" Width="20px" BackColor="WindowText" ImageUrl="/UploadedFiles/UI/close.png" Height="20px" runat="server" />
        </div>
        <div style="margin:20px ">
            <table  style="font-weight:600;color:darkblue;font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif">
                <tr>
                    <td style="width: 100px">Name
                    </td>
                    <td style="width: 50px">Image
                    </td>
                    <td style="width: 50px">Price
                    </td>
                    <td style="width: 70px">Quantity
                    </td>
                    <td style="width: 50px">Value
                    </td>
                </tr>
            </table>
            <asp:DataList ID="DatalistOrderDetails" runat="server">
               
                <ItemStyle BackColor="#F7F6F3" Width="400" BorderColor="Window" ForeColor="#333333" />
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="width: 100px; font-size: small; height: 20px;">
                                <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                            </td>
                            <td style="width: 50px; height: 50px;">
                                <asp:Image ID="lblimage" runat="server" Width="50px" Height="50px" ImageUrl='<%# Eval("ProductImage") %>'></asp:Image>
                            </td>
                            <td style="width: 50px; height: 10px;">
                                <asp:Label ID="lblprice" runat="server" Width="50px" Height="50px" Text='<%# Eval("ProductPrice") + " Rs" %>'></asp:Label>

                            </td>
                            <td style="width: 70px; height: 10px;text-align:center;">
                                <asp:Label ID="lblquantity" runat="server" Width="50px" Height="50px" Text='<%# Eval("Quantity")  %>'></asp:Label>
                            </td>
                            <td style="width: 50px; height: 10px;text-align:center;">
                                <asp:Label ID="lblvalue" runat="server" Width="50px" Height="50px" Text='<%# Eval("ProductValue") +" Rs" %>'></asp:Label>

                            </td>

                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <div style="background-color:aqua;font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;font-weight:600;width:inherit;margin-top:10px;padding-left:20px">
                <asp:Button ID="btnretrypayment" OnClick="btnretrypayment_Click" runat="server" BorderStyle="Dotted" BorderWidth="1px"  BackColor="#33ccff" ForeColor="White" Font-Bold="true" Font-Size="Larger" Text="Retry Payment" Visible="false" />
                <asp:Label ID="lbldetailstotal" runat="server"></asp:Label>
                <asp:HiddenField ID="hdnorderid" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
