<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Feedback.ascx.cs" Inherits="EShop.UserControls.Feedback" %>


<div style="font-size: medium; color: #000000" align="center"><strong>Feedback</strong></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Email </td>
        <td>&nbsp;<asp:TextBox ID="TextBoxFrom" runat="server" Width="212px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvfrom" runat="server" ControlToValidate="TextBoxFrom" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Email Password </td>
        <td>&nbsp;<asp:TextBox ID="TextBoxPassword" runat="server" Width="212px" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvEmailPassword" runat="server" ControlToValidate="TextBoxPassword" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>To </td>
        <td>&nbsp;<asp:TextBox ID="TextBoxEmailTo" runat="server" Width="212px" ReadOnly="True">admiiiineshop@gmail.com</asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvEmailTo" runat="server" ControlToValidate="TextBoxEmailTo" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Subject </td>
        <td>&nbsp;<asp:TextBox ID="TextBoxSubject" runat="server" Width="212px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="TextBoxSubject" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Message&nbsp;&nbsp; </td>
        <td>
            <br />
            &nbsp;<asp:TextBox ID="TextBoxMessage" runat="server" Height="141px" Width="212px" TextMode="MultiLine" Columns="30" Rows="10"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="TextBoxMessage" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            &nbsp;<asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
           <asp:Button ID="Clear" runat="server" Text="Clear" OnClick="Clear_Click" CausesValidation="False" />
        </td>
        <td></td>
    </tr>
</table>