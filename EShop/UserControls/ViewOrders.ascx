<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewOrders.ascx.cs" Inherits="EShop.UserControls.ViewOrders" %>

<div align="center">
    <table>
        <tr>
            <td>Order Id</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="orderid" DataValueField="orderid">
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</div>
<br />
<div align="center">
    <b>
        <asp:Label ID="Label1" runat="server" Text="Order Details" Visible="False"></asp:Label></b>
</div>
<br />
<div align="center">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False">
        <Columns>
            <asp:BoundField DataField="orderid" HeaderText="Order Id" SortExpression="orderid"></asp:BoundField>
            <asp:BoundField DataField="prod_title" HeaderText="Product Name" SortExpression="prod_title"></asp:BoundField>
            <asp:BoundField DataField="prod_price" HeaderText="Price" DataFormatString="RM {0:n2}" SortExpression="prod_price"></asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="totalprice" HeaderText="Total Price" SortExpression="totalprice"></asp:BoundField>
            <asp:BoundField DataField="dateoforder" HeaderText="Date Order" SortExpression="dateoforder">
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <b>Order list</b>
</div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="orderid" HeaderText="Order Id" SortExpression="orderid">
            </asp:BoundField>
            <asp:BoundField DataField="customername" HeaderText="Customer Name" SortExpression="customername">
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email">
            </asp:BoundField>
            <asp:BoundField DataField="mobilenumber" HeaderText="Phone Number" SortExpression="mobilenumber">
            </asp:BoundField>
            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address">
            </asp:BoundField>
            <asp:BoundField DataField="dateoforder" HeaderText="Date Order" SortExpression="dateoforder">
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT [orderid] FROM [OrderDetails]"></asp:SqlDataSource>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [OrderDetails] WHERE ([orderid] = @orderid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="orderid" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<br />
