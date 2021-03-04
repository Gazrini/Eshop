<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="EShop.Logout" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            background-color: #66FFFF;
        }

        .starempty {
            background-image: url(stars/starempty.png);
            width: 50px;
            height: 50px;
        }

        .starfilled {
            background-image: url(stars/starfilled.png);
            width: 50px;
            height: 50px;
        }

        .starwaiting {
            background-image: url(stars/starwaiting.png);
            width: 50px;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table style="width: 100%;">
        <tr>
            <td rowspan="3">&nbsp;</td>
            <td align="center">
                <div>
                    You have successfully logout
                </div>
            </td>
            <td rowspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <br />
                <meta http-equiv="refresh" content="3; url=Default.aspx">
                <div align="center">
                    <table border="1" class="auto-style4">
                        <tr>
                            <td>Rate this website</td>
                            <td>
                                <ajaxToolkit:Rating ID="Rating1" runat="server" CurrentRating="0" MaxRating="5" AutoPostBack="true" StarCssClass="starempty" FilledStarCssClass="starfilled" WaitingStarCssClass="starwaiting" EmptyStarCssClass="starempty">
                                </ajaxToolkit:Rating>
                            </td>
                        </tr>
                    </table>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>
