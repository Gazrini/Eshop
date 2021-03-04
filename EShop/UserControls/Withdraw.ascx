<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Withdraw.ascx.cs" Inherits="EShop.UserControls.Withdraw" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<div align="center">
    <b>Withdraw</b>
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
        <td>
            <asp:Label ID="Label1" runat="server" Text="Account Number"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="Username"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox2" Format="dd/MM/yyyy" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Balance (RM)"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Choose Bank</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="Cimb">Cimb</asp:ListItem>
                <asp:ListItem Value="Maybank">Maybank</asp:ListItem>
                <asp:ListItem Value="Bank Islam">Bank Islam</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>Bank Account</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Withdraw (RM)"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" ToolTip="Enter amount"></asp:TextBox>
        </td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" CausesValidation="False" Width="65px" />
    <asp:Button ID="Button1" runat="server" Text="Withdraw" OnClick="Button1_Click" />
</div>
<br />
<div align="center">
    <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    <asp:Label ID="LabelStatus2" runat="server"></asp:Label>
    <asp:Label ID="LabelStatus3" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <asp:RequiredFieldValidator ID="rfvwithdraw" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Enter withdraw amount" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />

    <asp:RequiredFieldValidator ID="rfvbankacc" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Enter bank account" ForeColor="Red"></asp:RequiredFieldValidator>

</div>
<br />
<div align="center">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</div>
