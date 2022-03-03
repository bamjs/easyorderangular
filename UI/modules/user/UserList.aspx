<%@ Page Title="" Language="C#" MasterPageFile="~/UI/modules/shared/Master.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="webapp.UI.modules.user.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridUserList" runat="server" AutoGenerateColumns="False" Width="600px" DataKeyNames="UserID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridUserList_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="SecondName" HeaderText="Second Name" SortExpression="SecondName" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="EmailID" HeaderText="Email-ID" SortExpression="EmailID" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
            <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" />
            <asp:BoundField DataField="DateOfBirth" HeaderText="Date Of Birth" SortExpression="DateOfBirth" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EasyOrdersConnectionString %>" SelectCommand="SELECT * FROM [Users]" ></asp:SqlDataSource>
</asp:Content>
