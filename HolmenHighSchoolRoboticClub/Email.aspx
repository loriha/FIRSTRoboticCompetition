<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Email" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem>xyz@gmail.com</asp:ListItem>
            <asp:ListItem>kwhite@yahoo.com</asp:ListItem>
            <asp:ListItem>twitt@gmail.com</asp:ListItem>
            <asp:ListItem>rpaul@gmail.com</asp:ListItem>
            <asp:ListItem>ciris@gmail.com</asp:ListItem>
        </asp:CheckBoxList>
        <asp:Button ID="EmailBtn" runat="server" Text="Email" />
    </div>
</asp:Content>
