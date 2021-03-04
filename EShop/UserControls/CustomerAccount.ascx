<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccount.ascx.cs" Inherits="EShop.UserControls.CustomerAccount" %>

<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" DeleteCommand="DELETE FROM [users] WHERE [userid] = @userid" InsertCommand="INSERT INTO [users] ([username], [email], [phoneNo], [address], [passwordhash], [role], [enabled]) VALUES (@username, @email, @phoneNo, @address, @passwordhash, @role, @enabled)" SelectCommand="SELECT * FROM [users] WHERE ([username] = @username)" UpdateCommand="UPDATE [users] SET [username] = @username, [email] = @email, [phoneNo] = @phoneNo, [address] = @address, [passwordhash] = @passwordhash, [role] = @role, [enabled] = @enabled WHERE [userid] = @userid">
        <DeleteParameters>
            <asp:Parameter Name="userid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="phoneNo" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="passwordhash" Type="String" />
            <asp:Parameter Name="role" Type="String" />
            <asp:Parameter Name="enabled" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="phoneNo" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="passwordhash" Type="String" />
            <asp:Parameter Name="role" Type="String" />
            <asp:Parameter Name="enabled" Type="Boolean" />
            <asp:Parameter Name="userid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
<br />
<div align="center">
    Enter username: &nbsp;&nbsp;
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" />
</div>
<br />
<div align ="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="userid" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="userid" />
            <asp:BoundField DataField="username" HeaderText="Customer Name" SortExpression="username" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="phoneNo" HeaderText="Phone Number" SortExpression="phoneNo" />
            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
            <asp:BoundField DataField="passwordhash" HeaderText="Password" SortExpression="passwordhash" />
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
            <asp:CheckBoxField DataField="enabled" HeaderText="Enabled" SortExpression="enabled" />
        </Columns>
    </asp:GridView>
</div>