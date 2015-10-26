<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendees.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Attendees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Add Event Attendees</h1>
    
            <div class="form-group">
                <asp:ListBox ID="UsersListBox" runat="server" Style="position: absolute; left: 359px; top: 120px; height: 400px; width: 253px;" DataSourceID="UsersDataSource" DataTextField="NAME" DataValueField="NAME" SelectionMode="Multiple"></asp:ListBox>
                <asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [NAME] FROM [Users] ORDER BY [NAME]"></asp:SqlDataSource>
                <asp:Button ID="AddAttendeeButton" runat="server" Text="Add Attendee >>" Style="position: absolute; left: 361px; top: 550px; height: 35px;" OnClick="AddAttendeeButton_Click" CausesValidation="False" UseSubmitBehavior="False" ViewStateMode="Enabled" TabIndex="2" />
                <asp:Button ID="SaveButton" runat="server" Text="Save" Style="position: absolute; left: 900px; top: 550px; height: 35px;" OnClick="ApplyButton_Click1" CausesValidation="False" UseSubmitBehavior="False" ViewStateMode="Enabled" TabIndex="4" />
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" Style="position: absolute; left: 980px; top: 550px; height: 35px;" OnClick="CancelButton_Click1" CausesValidation="False" UseSubmitBehavior="False" ViewStateMode="Enabled" TabIndex="5"/>
                <asp:Button ID="RemoveButton" runat="server" Text="Remove" Style="position: absolute; left: 798px; top: 550px; height: 35px;" OnClick="RemoveButton_Click1" CausesValidation="False" UseSubmitBehavior="False" ViewStateMode="Enabled" TabIndex="3" />
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
                <asp:ListBox ID="AttendeesListBox" runat="server" Style="position: absolute; left: 798px; top: 120px; height: 400px; width: 253px;" TabIndex="1"></asp:ListBox>
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
