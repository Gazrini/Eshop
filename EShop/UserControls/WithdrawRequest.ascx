<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WithdrawRequest.ascx.cs" Inherits="EShop.UserControls.WithdrawRequest" %>
<div align="center"><b>E-wallet withdraw request</b></div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Withdrawid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Withdrawid" HeaderText="Withdraw id" InsertVisible="False" ReadOnly="True" SortExpression="Withdrawid" />
            <asp:BoundField DataField="accountid" HeaderText="Account id" SortExpression="accountid" />
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
            <asp:BoundField DataField="dates" HeaderText="Date" SortExpression="dates" />
            <asp:BoundField DataField="Bank" HeaderText="Bank" SortExpression="Bank" />
            <asp:BoundField DataField="BankAccount" HeaderText="Bank Account" SortExpression="BankAccount" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [EwalletWithdrawRequest]"></asp:SqlDataSource>
</div>