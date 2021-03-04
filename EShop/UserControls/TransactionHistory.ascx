<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TransactionHistory.ascx.cs" Inherits="EShop.UserControls.TransactionHistory" %>
<div align="center">
    <b>Transaction History</b>
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
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="transactionid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="transactionid" HeaderText="Transaction Id" InsertVisible="False" ReadOnly="True" SortExpression="transactionid">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="accountid" HeaderText="Account Id" SortExpression="accountid">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="dates" HeaderText="Date" SortExpression="dates">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="balance" HeaderText="Balance" SortExpression="balance">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="deposit" HeaderText="Deposit" SortExpression="deposit">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="withdraw" HeaderText="Withdraw" SortExpression="withdraw">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/TransferHistoryPage.aspx">Transfer History</asp:HyperLink>
</div>
<br />
<div align="center">
    Balance in E-wallet: RM<asp:Label ID="LabelBalance" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Transactions] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
