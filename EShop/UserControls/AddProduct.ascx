<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.ascx.cs" Inherits="EShop.UserControls.AddProduct" %>

<div align="center">
    <asp:HyperLink ID="BackLink" runat="server" NavigateUrl="~/ManageProduct.aspx" Width="185px">Go back</asp:HyperLink>
</div>
<br />
<div style="color: #000000" align="center"><strong>Add New Product</strong></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Category</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1">Clothes</asp:ListItem>
                <asp:ListItem Value="2">Jeans</asp:ListItem>
                <asp:ListItem Value="3">Accessories</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvCatId" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Enter category" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Product Name</td>
        <td>
            <asp:TextBox ID="TextBoxProductName" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvProdName" runat="server" ControlToValidate="TextBoxProductName" Display="Dynamic" ErrorMessage="Enter product name" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Product Price</td>
        <td>
            <asp:TextBox ID="TextBoxProductPrice" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvProdPrice" runat="server" ControlToValidate="TextBoxProductPrice" Display="Dynamic" ErrorMessage="Enter product price" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Product Description</td>
        <td>
            <asp:TextBox ID="TextBoxProductDesc" runat="server" Height="81px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvProdDesc" runat="server" ControlToValidate="TextBoxProductDesc" Display="Dynamic" ErrorMessage="Enter product description" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Product Image </td>
        <td>
            <asp:TextBox ID="TextBoxImage" runat="server" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvimage" runat="server" ErrorMessage="Enter product image" ControlToValidate="FileUpload1" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Clear" CausesValidation="False" OnClick="Button1_Click" />
            <asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
        </td>
        <td></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Image ID="imgItem" runat="server" Height="100" BorderStyle="Double" ImageUrl="~/Images/imageicon.png" />
        </td>
    </tr>
</table>
<br />
<table style="border: thin double #000000" align="center">
    <tr>
        <td align="center"><b>Category Id</b></td>
        <td align="center"><b>Product</b></td>
    </tr>
    <tr>
        <td align="center">1</td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Clothes</td>
    </tr>
    <tr>
        <td align="center">2</td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jeans</td>
    </tr>
    <tr>
        <td align="center">3</td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Accessories</td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Label ID="lblStatus" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" ForeColor="Red" />
</div>

