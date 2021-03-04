<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewOrdersCustomers.ascx.cs" Inherits="EShop.UserControls.ViewOrdersCustomers" %>
<div align="center">
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Receipt.aspx">Download E-receipt</asp:HyperLink>
</div>
<br />
<div align="center"><b>Orders History</b></div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="orderid" HeaderText="Order Id" SortExpression="orderid"></asp:BoundField>
            <asp:BoundField DataField="prod_title" HeaderText="Product Name" SortExpression="prod_title"></asp:BoundField>
            <asp:BoundField DataField="prod_price" HeaderText="Price" SortExpression="prod_price" DataFormatString="RM {0:n2}"></asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="totalprice" HeaderText="Total Price" SortExpression="totalprice" DataFormatString="RM {0:n2}"></asp:BoundField>
            <asp:BoundField DataField="dateoforder" HeaderText="Date" SortExpression="dateoforder"></asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [OrderDetails] WHERE ([customername] = @customername)">
        <SelectParameters>
            <asp:SessionParameter Name="customername" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
