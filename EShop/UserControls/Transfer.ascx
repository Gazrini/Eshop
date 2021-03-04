<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Transfer.ascx.cs" Inherits="EShop.UserControls.Transfer" %>

<div align="center"><b>Transfer</b></div>
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
        <td>From account</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>To account</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Sender name</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Date</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Balance (RM)</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Amount (RM)</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Button ID="Button2" runat="server" Text="Clear" CausesValidation="False" Width="65px" OnClick="Button2_Click" />
    <asp:Button ID="Button1" runat="server" Text="Transfer" OnClick="Button1_Click" />
</div>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    <asp:Label ID="LabelStatus2" runat="server"></asp:Label>
    <asp:Label ID="LabelStatus3" runat="server"></asp:Label>
</div>
<br />
<div align="center">

    <asp:RequiredFieldValidator ID="rfvaccountno" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Enter recipient account number" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <asp:RequiredFieldValidator ID="rfvamount" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Enter amount" ForeColor="Red"></asp:RequiredFieldValidator>

</div>
