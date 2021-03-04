<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="EShop.UserControls.Login" %>

<div align="center" style="font-size: medium; color: #000000"><strong>Login</strong></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Username</td>
        <td>
            <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
    <asp:HyperLink ID="LoginAdminLink" runat="server" NavigateUrl="~/AdminLogin.aspx">Admin Login</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ResetPassword.aspx">Forgot or reset password</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
</div>
