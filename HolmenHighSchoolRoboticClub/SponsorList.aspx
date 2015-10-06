<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SponsorList.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.SponsorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>A big thank you to all our sponsors for their generous help</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SponsorsDataSource">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
            <asp:BoundField DataField="DonationType" HeaderText="DonationType" SortExpression="DonationType" />
            <asp:BoundField DataField="Profile" HeaderText="Profile" SortExpression="Profile" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SponsorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HolmenRoboticsClubConnectionString3 %>" SelectCommand="SELECT [Name], [Currency], [DonationType], [Profile] FROM [Sponsor]"></asp:SqlDataSource>
    </asp:Content>
