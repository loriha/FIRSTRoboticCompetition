<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Email" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Holmen Robotics Club Users<asp:CheckBoxList ID="EmailCheckBoxList" runat="server" DataSourceID="EmailDataSource" DataTextField="NAME" DataValueField="EMAIL" Font-Size="Small" Height="20px" Width="423px">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="EmailDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [NAME], [EMAIL] FROM [Users] ORDER BY [NAME]"></asp:SqlDataSource>
</h1>
    <div>
        <asp:Button ID="EmailBtn" runat="server" Text="Email" OnClick="EmailBtn_Click" OnClientClick="EmailBtn_Click" />
    </div>
</asp:Content>
