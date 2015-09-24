<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HolmenHighSchoolRoboticClub._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome!</h1>
        <p class="lead">Holmen Robotics Club</p>
        <asp:HyperLink ID="UsersLink" runat="server" NavigateUrl="~/Users.aspx">Users</asp:HyperLink>
        <asp:HyperLink ID="Admin" runat="server">Admin</asp:HyperLink>
        <asp:HyperLink ID="Email" runat="server">Email</asp:HyperLink>
        <asp:HyperLink ID="Donate" runat="server">Donate</asp:HyperLink>
    </div>

 
</asp:Content>
