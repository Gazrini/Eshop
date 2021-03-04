<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="EShop.PaymentSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receipt</title>
    <style type="text/css">
        .auto-style1 {
            width: 474px;
        }

        .auto-style2 {
            width: 335px;
        }

        .auto-style3 {
            width: 84px;
            height: 50px;
        }
    </style>
</head>
<body>
    <meta http-equiv="refresh" content="10; url=CustomerProducts.aspx" />
    <div align="center">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomerProducts.aspx">Go to product page</asp:HyperLink>
    </div>
    <br />
    <form id="form1" runat="server">
        <div align="center">
            Order ID:
    <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" Height="470px" Width="829px">
                <table border="1">
                    <tr>
                        <td>
                            <div align="center">
                                <b>Eshop Receipt</b>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Order No:</b><br />
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                            <br />
                            <b>Order Date:</b><br />
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td class="auto-style1">
                                        <b>Buyer Address:</b>
                                        <br />
                                        <asp:Label ID="Label4" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <b>Buyer Name:</b>
                                        <br />
                                        <asp:Label ID="Label5" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <b>Phone:</b>
                                        <br />
                                        <asp:Label ID="Label6" runat="server"></asp:Label>
                                        <br />
                                    </td>
                                    <td class="auto-style2">
                                        <b>Seller:</b>
                                        <br />
                                        Eshop Sdn Bhd
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="808px">
                                <Columns>
                                    <asp:BoundField DataField="sno" HeaderText="No">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="prod_title" HeaderText="Product Name">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="prod_price" DataFormatString="RM {0:n2}" HeaderText="Price">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="totalprice" DataFormatString="RM {0:n2}" HeaderText="Total Price">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <b>Grand Total: RM<asp:Label ID="Label7" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td>Declaration: We declare that this receipt shows actual price of the goods described inclusive of taxes and that all particulars are correct.
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div align="center">
                <asp:Button ID="Button1" runat="server" Height="50px" Text="Download Invoice" Width="156px" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>
