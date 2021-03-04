<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageProduct.ascx.cs" Inherits="EShop.UserControls.ManageProduct" %>

<style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
</style>
<div align="center">
    <asp:HyperLink ID="AddProdLink" runat="server" NavigateUrl="~/AddProduct.aspx" Width="85px">Add Product</asp:HyperLink>
</div>
<br />
<div align="center" style="color: #000000" class="auto-style1"><strong>Manage Product</strong></div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" DeleteCommand="DELETE FROM [products] WHERE [prod_id] = @prod_id" InsertCommand="INSERT INTO [products] ([cat_id], [prod_title], [prod_price], [prod_desc], [prod_image]) VALUES (@cat_id, @prod_title, @prod_price, @prod_desc, @prod_image)" SelectCommand="SELECT * FROM [products]" UpdateCommand="UPDATE [products] SET [cat_id] = @cat_id, [prod_title] = @prod_title, [prod_price] = @prod_price, [prod_desc] = @prod_desc, [prod_image] = @prod_image WHERE [prod_id] = @prod_id">
        <DeleteParameters>
            <asp:Parameter Name="prod_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="cat_id" Type="Int32" />
            <asp:Parameter Name="prod_title" Type="String" />
            <asp:Parameter Name="prod_price" Type="String" />
            <asp:Parameter Name="prod_desc" Type="String" />
            <asp:Parameter Name="prod_image" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cat_id" Type="Int32" />
            <asp:Parameter Name="prod_title" Type="String" />
            <asp:Parameter Name="prod_price" Type="String" />
            <asp:Parameter Name="prod_desc" Type="String" />
            <asp:Parameter Name="prod_image" Type="String" />
            <asp:Parameter Name="prod_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="prod_id" DataSourceID="SqlDataSource1" PageSize="8">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:BoundField DataField="prod_id" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="prod_id">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="cat_id" HeaderText="Category ID" SortExpression="cat_id">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="prod_title" HeaderText="Product Name" SortExpression="prod_title">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="prod_price" DataFormatString="RM {0:n2}" HeaderText="Product Price" SortExpression="prod_price">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="prod_desc" HeaderText="Product Description" SortExpression="prod_desc">
                <ControlStyle Width="295px" />
                <ItemStyle Width="300px" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="prod_image" HeaderText="Image Filename" SortExpression="prod_image">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="prod_image" DataImageUrlFormatString="../Images/{0}" HeaderText="Image" ReadOnly="True">
                <ControlStyle Width="50px" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
        </Columns>
    </asp:GridView>
</div>
