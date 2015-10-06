<%@ Page Title="Holmen Robotics Club" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HolmenHighSchoolRoboticClub._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Welcome!</h1>
        <p class="lead">Holmen Robotics Club</p>
        <asp:HyperLink ID="UsersLink" runat="server" NavigateUrl="~/Users.aspx">Users</asp:HyperLink>
        <asp:HyperLink ID="CalendarLink" runat="server" NavigateUrl="~/Calendar.aspx">Calendar</asp:HyperLink>
        <asp:HyperLink ID="EmailLink" runat="server" NavigateUrl="~/Email.aspx">Email</asp:HyperLink>
        <asp:HyperLink ID="DonateLink" runat="server" NavigateUrl="~/Donation.aspx">Donate</asp:HyperLink>
        <asp:HyperLink ID="SponsorLink" runat="server" NavigateUrl="~/SponsorList.aspx">Sponsor List</asp:HyperLink>
    </div>

 
</asp:Content>
