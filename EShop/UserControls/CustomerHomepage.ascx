<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerHomepage.ascx.cs" Inherits="EShop.UserControls.CustomerHomepage" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>

<asp:ListView ID="ListView1" runat="server" DataKeyNames="prod_id" DataSourceID="SqlDataSource1" GroupItemCount="3">

    <EmptyDataTemplate>
        <table runat="server" style="">
            <tr>
                <td>No data was returned.</td>
            </tr>
        </table>
    </EmptyDataTemplate>

    <EmptyItemTemplate>
        <td runat="server" />
    </EmptyItemTemplate>

    <GroupTemplate>
        <tr id="itemPlaceholderContainer" runat="server">
            <td id="itemPlaceholder" runat="server"></td>
        </tr>
    </GroupTemplate>

    <ItemTemplate>
        <td runat="server" align="center" style="column-width: 140px">
            <p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/CustomerProductDetails.aspx?prod_id=" + Eval("prod_id") %>' Text='<%# Eval("prod_title") %>'></asp:HyperLink>
            </p>
            <asp:Image ID="Image1" runat="server" Height="100" ImageUrl='<%# "~/Images/" + Eval("prod_image") %>' BorderStyle="Solid" BorderWidth="1" />
            <br />
            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("prod_price", "RM {0:n2}") %>'></asp:Label>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/buynow.png" Width="100px" PostBackUrl="~/CustomerProducts.aspx" />
            <br />
        </td>
    </ItemTemplate>

    <LayoutTemplate>
        <table runat="server">
            <tr runat="server">
                <td runat="server">
                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                        <tr id="groupPlaceholder" runat="server">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server" align="center" style="">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>

</asp:ListView>

