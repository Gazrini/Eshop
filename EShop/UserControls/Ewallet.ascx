<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ewallet.ascx.cs" Inherits="EShop.UserControls.Ewallet" %>

<div align="center">
    <b>Balance</b>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EwalletPage.aspx">Balance</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/DepositPage.aspx">Deposit</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/WithdrawPage.aspx">Withdraw</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/TransferPage.aspx">Transfer</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/TransactionHistoryPage.aspx">History</asp:HyperLink>
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
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Email</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Account Type</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Balance (RM)</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
</table>
<br />
<div align="center">
    <b>Balance in E-wallet: RM
        <asp:Label ID="LabelBalance" runat="server"></asp:Label>
    </b>
</div>

