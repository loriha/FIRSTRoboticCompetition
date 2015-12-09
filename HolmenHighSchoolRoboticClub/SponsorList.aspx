<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SponsorList.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.SponsorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>A big thank you to all our sponsors for their generous help</h1>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    
    <asp:Button ID="SearchDonationsTextBox" runat="server" Text="Total Donations" style="position:absolute; left:21px; top:145px; height: 44px; width: 150px;" OnClick="SearchDonationsTextBox_Click"/>
    <asp:TextBox ID="DateTextBox" runat="server" style="position:absolute; left:180px; top:145px; height: 44px; width: 150px;"></asp:TextBox>
    <asp:TextBox ID="TotalDonationsTextBox" runat="server" style="position:absolute; left:330px; top:145px; height: 44px; width: 150px;"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SponsorsDataSource2" DataKeyNames="Id" style="position:absolute; left:21px; top:190px; height: 150px; width: 235px;">
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:MM/dd/yy}"/>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
            <asp:BoundField DataField="DonationType" HeaderText="DonationType" SortExpression="DonationType" />
            <asp:BoundField DataField="Profile" HeaderText="Profile" SortExpression="Profile" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SponsorsDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Sponsor]"></asp:SqlDataSource>
    </asp:Content>
