<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Label ID="TitleLbl" runat="server" Text="Title" style="position:fixed;left:80px;top:100px"></asp:Label>
        <asp:TextBox ID="EventTitleText" runat="server" style="position:fixed;left:80px;top:130px"></asp:TextBox>
        <asp:Label ID="DescriptionLbl" runat="server" Text="Description" style="position:fixed;left:80px;top:160px"></asp:Label>
        <asp:TextBox ID="DescriptionText" runat="server" style="position:fixed;left:80px;top:190px"></asp:TextBox>
        <asp:Label ID="StartTimeLbl" runat="server" Text="Start Time" style="position:fixed;left:80px;top:220px"></asp:Label>
        <asp:DropDownList ID="StartTimeDL" runat="server" style="position:fixed;left:80px;top:250px">
                  <asp:ListItem >12:00 AM</asp:ListItem>
                  <asp:ListItem>12:30 AM</asp:ListItem>
                  <asp:ListItem>1:00 AM</asp:ListItem>
                  <asp:ListItem>1:30 AM</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="EndTimeLbl" runat="server" Text="End Time" style="position:fixed;left:400px;top:220px"></asp:Label>
        <asp:DropDownList ID="EndTimeDL" runat="server" style="position:fixed;left:400px;top:250px">
            <asp:ListItem >12:00 AM</asp:ListItem>
            <asp:ListItem>12:30 AM</asp:ListItem>
            <asp:ListItem>1:00 AM</asp:ListItem>
            <asp:ListItem>1:30 AM</asp:ListItem>
        </asp:DropDownList>
        <asp:Calendar ID="Calendar1" runat="server" style="position:fixed;left:80px;top:280px"></asp:Calendar>
        <asp:Calendar ID="Calendar2" runat="server" style="position:fixed;left:400px;top:280px"></asp:Calendar>
        <asp:TextBox ID="StartTimeText" runat="server" style="position:fixed;left:160px;top:250px"></asp:TextBox>
        <asp:TextBox ID="EndTimeText" runat="server" style="position:fixed;left:480px;top:250px"></asp:TextBox>
        <asp:ListBox ID="UsersListBox" runat="server" style="position:fixed;left:380px;top:100px" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet-HolmenRoboticsClub-20150911093636ConnectionString %>" SelectCommand="SELECT [UserName] FROM [AspNetUsers]"></asp:SqlDataSource>
        <asp:ListBox ID="AttendeeListBox" runat="server" style="position:fixed;left:600px;top:100px"></asp:ListBox>
        <asp:Button ID="AttendeeButton" runat="server" Text="Attendee >>" style="position:fixed;left:380px;top:190px"/><br />
        <asp:DropDownList ID="DropDownList1" runat="server" style="position:fixed;left:660px;top:120px">
            <asp:ListItem >Event 1</asp:ListItem>
            <asp:ListItem>Event 2</asp:ListItem>
            <asp:ListItem>Event 3</asp:ListItem>
            <asp:ListItem>Event 4</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" style="position:fixed;left:660px;top:150px"/>
        <asp:Button ID="DeleteButton" runat="server" Text="Delete" style="position:fixed;left:660px;top:190px"/>
        <asp:Button ID="Reset" runat="server" Text="Reset"  style="position:fixed;left:660px;top:230px"/>
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
