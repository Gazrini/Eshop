<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.ascx.cs" Inherits="EShop.UserControls.AdminLogin" %>

<style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
</style>

<div align="center" style="color: #000000" class="auto-style1"><strong>Admin Login</strong></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Username</td>
        <td>
            <asp:TextBox ID="TextBoxAdminName" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvAdminName" runat="server" ControlToValidate="TextBoxAdminName" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Password</td>
        <td>
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBoxPassword" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
            <asp:Button ID="ButtonClear" runat="server" CausesValidation="False" OnClick="ButtonClear_Click" Text="Clear" />
        </td>
        <td></td>
    </tr>
</table>
<br />
<div align="center">
    <asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="UserLoginLink" runat="server" NavigateUrl="~/Login.aspx">Customer Login</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
</div>

