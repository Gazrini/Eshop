<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="EShop.UserControls.Register" %>

<div align="center" style="color: #000000; font-size: medium"><strong>&nbsp;Account Register</strong></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Username<br />
            <br />
        </td>
        <td>
            <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
            <asp:Button ID="ButtonClear" runat="server" OnClick="ButtonClear_Click" Text="Clear" CausesValidation="False" />
        </td>
        <td></td>
    </tr>
</table>
<br />
<div align="center">
    <asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="AdminRegisterLink" runat="server" NavigateUrl="~/AdminRegister.aspx">Admin register</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RegisterWalletPage.aspx">Create E-shop wallet</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    <br />
    <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConPass" Display="Dynamic" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelCheckUsername" runat="server"></asp:Label>
    <br />
    <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="Invalid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelCheckEMail" runat="server"></asp:Label>
</div>
<br />

