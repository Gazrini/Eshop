<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateDetails.ascx.cs" Inherits="EShop.UserControls.UpdateDetails" %>

<style type="text/css">
    .auto-style1 {
        text-align: center;
    }
</style>

<div class="auto-style1"><strong>Update Details</strong></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Username</td>
        <td>
            <asp:TextBox ID="TextBoxUsername" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td></td>
    </tr>
    <tr>
        <td>Email</td>
        <td>
            <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Phone Number</td>
        <td>
            <asp:TextBox ID="TextBoxPhoneNo" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvphoneono" runat="server" ControlToValidate="TextBoxPhoneNo" Display="Dynamic" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Address</td>
        <td>
            <br />
            <asp:TextBox ID="TextBoxAddress" runat="server" Height="77px" TextMode="MultiLine"></asp:TextBox>
            <br />
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="TextBoxAddress" Display="Dynamic" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="ButtonUpdate" runat="server" OnClick="ButtonUpdate_Click" Text="Update" />
        </td>
        <td></td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
</div> 
