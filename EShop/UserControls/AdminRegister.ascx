<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminRegister.ascx.cs" Inherits="EShop.UserControls.AdminRegister" %>

<div align="center" style="color: #000000;"><strong>Admin Account Register </strong></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Username<br />
            <br />
        </td>
        <td>
            <asp:TextBox ID="TextBoxAdminName" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvAdminName" runat="server" ControlToValidate="TextBoxAdminName" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Email<br /> 
            <br />
        </td>
        <td>
            <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Phone Number<br />
            <br />
        </td>
        <td>
            <asp:TextBox ID="TextBoxPhoneNo" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ControlToValidate="TextBoxPhoneNo" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Address<br />
        </td>
        <td>
            <asp:TextBox ID="TextBoxAddress" runat="server" Height="77px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="TextBoxAddress" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Password<br />
            <br />
        </td>
        <td>
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBoxPassword" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Confirm Password<br />
            <br />
        </td>
        <td>
            <asp:TextBox ID="TextBoxConPass" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvconpass" runat="server" ControlToValidate="TextBoxConPass" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="ButtonRegister" runat="server" Text="Register" OnClick="ButtonRegister_Click" />
            <asp:Button ID="ButtonClear" runat="server" CausesValidation="False" OnClick="ButtonClear_Click" Text="Clear" /></td>
        <td></td>
    </tr>
</table>
<br />
<div align="center">
    <asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="~/AdminLogin.aspx">Admin Login</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="UserRegisterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    <br />
    <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConPass" Display="Dynamic" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
    <br />
    <br />
    <asp:RegularExpressionValidator ID="revemail" runat="server" ErrorMessage="Invalid email" ControlToValidate="TextBoxEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</div>
<br />


