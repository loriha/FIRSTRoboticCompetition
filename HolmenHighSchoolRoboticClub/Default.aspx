<%@ Page Title="Holmen Robotics Club" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HolmenHighSchoolRoboticClub._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome!</h1>
        <p class="lead">Holmen Robotics Club</p>
        <asp:HyperLink ID="UsersLink" runat="server" NavigateUrl="~/Users.aspx">Users</asp:HyperLink>
        <asp:HyperLink ID="Admin" runat="server" NavigateUrl="~/Calendar.aspx">Calendar</asp:HyperLink>
        <asp:HyperLink ID="Email" runat="server" NavigateUrl="~/Email.aspx">Email</asp:HyperLink>
        <asp:HyperLink ID="Donate" runat="server" NavigateUrl="~/Donation.aspx">Donate</asp:HyperLink>
    </div>

 
</asp:Content>
