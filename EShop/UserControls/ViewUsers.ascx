<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewUsers.ascx.cs" Inherits="EShop.UserControls.ViewUsers" %>

<style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
</style>

<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>"
        SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
</div>
<br />
<div align="center" style="color: #000000" class="auto-style1"><strong>Customers List</strong></div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="userid" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="userid">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="Customer Name" SortExpression="username"></asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
            <asp:BoundField DataField="phoneNo" HeaderText="Phone Number" SortExpression="phoneNo"></asp:BoundField>
            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address"></asp:BoundField>
            <asp:BoundField DataField="passwordhash" HeaderText="Password" SortExpression="passwordhash"></asp:BoundField>
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role"></asp:BoundField>
            <asp:CheckBoxField DataField="enabled" HeaderText="Enabled" SortExpression="enabled" />
        </Columns>
    </asp:GridView>
</div>
