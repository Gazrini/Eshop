<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminAccount.ascx.cs" Inherits="EShop.UserControls.AdminAccount" %>

<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>"
        SelectCommand="SELECT * FROM [admin] WHERE ([adminname] = @adminname)" DeleteCommand="DELETE FROM [admin] WHERE [adminid] = @adminid" InsertCommand="INSERT INTO [admin] ([adminname], [email], [phoneNo], [address], [passwordhash], [role], [enabled]) VALUES (@adminname, @email, @phoneNo, @address, @passwordhash, @role, @enabled)" UpdateCommand="UPDATE [admin] SET [adminname] = @adminname, [email] = @email, [phoneNo] = @phoneNo, [address] = @address, [passwordhash] = @passwordhash, [role] = @role, [enabled] = @enabled WHERE [adminid] = @adminid">
        <DeleteParameters>
            <asp:Parameter Name="adminid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="adminname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="phoneNo" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="passwordhash" Type="String" />
            <asp:Parameter Name="role" Type="String" />
            <asp:Parameter Name="enabled" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="adminname" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="adminname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="phoneNo" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="passwordhash" Type="String" />
            <asp:Parameter Name="role" Type="String" />
            <asp:Parameter Name="enabled" Type="Boolean" />
            <asp:Parameter Name="adminid" Type="Int32" />
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
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="adminid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="adminid" HeaderText="Admin ID" InsertVisible="False" ReadOnly="True" SortExpression="adminid" />
            <asp:BoundField DataField="adminname" HeaderText="Admin Name" SortExpression="adminname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="phoneNo" HeaderText="Phone Number" SortExpression="phoneNo" />
            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
            <asp:BoundField DataField="passwordhash" HeaderText="Password" SortExpression="passwordhash" />
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
            <asp:CheckBoxField DataField="enabled" HeaderText="Enabled" SortExpression="enabled" />
        </Columns>
    </asp:GridView>
</div>
