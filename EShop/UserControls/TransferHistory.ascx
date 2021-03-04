<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TransferHistory.ascx.cs" Inherits="EShop.UserControls.TransferHistory" %>
<div align="center">
    <b>Transfer History</b>
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
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="transferid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="transferid" HeaderText="Transfer Id" InsertVisible="False" ReadOnly="True" SortExpression="transferid">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="fromaccount" HeaderText="From Account" SortExpression="fromaccount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="sendername" HeaderText="Sender Name" SortExpression="sendername">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="toaccount" HeaderText="To Account" SortExpression="toaccount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="dates" HeaderText="Date" SortExpression="dates">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="balance" HeaderText="Balance" SortExpression="balance">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/TransactionHistoryPage.aspx">Transaction History</asp:HyperLink>
</div>
<br />
<div align="center">
    Balance in E-wallet: RM<asp:Label ID="LabelBalance" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [Transfers] WHERE ([sendername] = @sendername)">
        <SelectParameters>
            <asp:SessionParameter Name="sendername" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
