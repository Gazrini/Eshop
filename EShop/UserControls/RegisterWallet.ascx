<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegisterWallet.ascx.cs" Inherits="EShop.UserControls.RegisterWallet" %>

<div align="center">
    <b>Create E-wallet</b>
</div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Account Number</td>
        <td>
            <b>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </b>
        </td>
    </tr>
    <tr>
        <td>Username</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Email</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Account Type</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True">E-wallet</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Balance</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Create" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="Button2_Click" CausesValidation="False" />
        </td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    <br />
    <br />
    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/Login.aspx">Create E-wallet later</asp:LinkButton>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelCheckUsername" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <asp:Label ID="LabelCheckEmail" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <asp:RequiredFieldValidator ID="rfvusername" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Enter username" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Enter email" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:RegularExpressionValidator ID="revemail" runat="server" ErrorMessage="Invalid email" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</div>


