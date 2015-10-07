<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendees.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Attendees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add Event Attendees</h1>
    <div class="form-group">
        <asp:ListBox ID="UsersListBox" runat="server" Style="position: fixed; left: 359px; top: 120px; height: 500px; width: 353px;" DataSourceID="UsersDataSource" DataTextField="NAME" DataValueField="NAME" SelectionMode="Multiple"></asp:ListBox>
        <asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [NAME] FROM [Users] ORDER BY [NAME]"></asp:SqlDataSource>
        <asp:Button ID="AddAttendeeButton" runat="server" Text="Add Attendee >>" Style="position: fixed; left: 361px; top: 639px; height: 35px;" OnClick="AddAttendeeButton_Click" />
        <asp:Button ID="ApplyButton" runat="server" Text="Apply" Style="position: fixed; left: 1041px; top: 639px; height: 35px;" OnClick="ApplyButton_Click1" />
        <asp:Button ID="CancelButton" runat="server" Text="Cancel" Style="position: fixed; left: 1100px; top: 639px; height: 35px;" OnClick="CancelButton_Click1"/>
        <asp:Button ID="RemoveButton" runat="server" Text="Remove" Style="position: fixed; left: 950px; top: 639px; height: 35px;" OnClick="RemoveButton_Click1" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:ListBox ID="AttendeesListBox" runat="server" Style="position: fixed; left: 798px; top: 120px; height: 500px; width: 353px;"></asp:ListBox>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
