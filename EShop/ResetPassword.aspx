<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="EShop.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div align="center"><strong>Reset Password</strong></div>
    <br />
    <table align="center" style="border: thin double #000000">
        <tr>
            <td>Username</td>
            <td>
                <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Clear" CausesValidation="False" />
                <asp:Button ID="ButtonReset" runat="server" Text="Reset" OnClick="ButtonReset_Click" />
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Cancel reset password</asp:HyperLink>
    </div>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    </div>
    <br />
    <div align="center">
        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="TextBoxUsername" Display="Dynamic" ErrorMessage="Username required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <br />
</asp:Content>
