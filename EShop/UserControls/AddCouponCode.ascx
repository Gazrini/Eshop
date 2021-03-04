<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddCouponCode.ascx.cs" Inherits="EShop.UserControls.AddCouponCode" %>
<div align="center">
    <b>
        <asp:Label ID="Label1" runat="server" Text="Add discount code"></asp:Label>
    </b>
</div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Code Id</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvcpid" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Discount Code</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvcc" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Discount (%)</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvd" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Max Discount</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvmd" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="Button2_Click" CausesValidation="False" />
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        </td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <b>Discount code list</b>
</div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="couponid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:BoundField DataField="couponid" HeaderText="Code id" ReadOnly="True" SortExpression="couponid">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="couponcode" HeaderText="Discount code" SortExpression="couponcode">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="discount" HeaderText="Discount" SortExpression="discount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="maxdiscount" HeaderText="Max discount" SortExpression="maxdiscount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" DeleteCommand="DELETE FROM [coupondetails] WHERE [couponid] = @couponid" InsertCommand="INSERT INTO [coupondetails] ([couponid], [couponcode], [discount], [maxdiscount]) VALUES (@couponid, @couponcode, @discount, @maxdiscount)" SelectCommand="SELECT * FROM [coupondetails]" UpdateCommand="UPDATE [coupondetails] SET [couponcode] = @couponcode, [discount] = @discount, [maxdiscount] = @maxdiscount WHERE [couponid] = @couponid">
        <DeleteParameters>
            <asp:Parameter Name="couponid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="couponid" Type="Int32" />
            <asp:Parameter Name="couponcode" Type="String" />
            <asp:Parameter Name="discount" Type="Int32" />
            <asp:Parameter Name="maxdiscount" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="couponcode" Type="String" />
            <asp:Parameter Name="discount" Type="Int32" />
            <asp:Parameter Name="maxdiscount" Type="Int32" />
            <asp:Parameter Name="couponid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
