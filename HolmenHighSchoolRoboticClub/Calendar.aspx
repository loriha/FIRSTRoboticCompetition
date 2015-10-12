<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Schedule an Event</h1>
    <div class="form-group">
        <asp:Label ID="TitleLabel" runat="server" Text="Title" CssClass="col-md-2 control-label" style="position:absolute;left:26px; top:130px; height: 44px;"></asp:Label>
        <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control" style="position:absolute;left:26px; top:150px; height: 44px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Title is a required field" ControlToValidate="TitleTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:Label ID="DescriptionLabel" runat="server" Text="Description" CssClass="col-md-2 control-label" style="position:absolute;left:26px; top:200px; height: 44px;"></asp:Label>
        <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="form-control" style="position:absolute;left:26px; top:220px; height: 44px; width:300px;" TextMode="MultiLine"></asp:TextBox>
      
    </div>
     <div class="form-group">
         <asp:DropDownList ID="StartTime" runat="server" Width="100px" CssClass="form-control" style="position:absolute;left:26px; top:295px; height: 44px;">
             <asp:ListItem Value="0">6:00 AM</asp:ListItem>
             <asp:ListItem Value="1">6:30 AM</asp:ListItem>
             <asp:ListItem Value="2">7:00 AM</asp:ListItem>
             <asp:ListItem Value="3">7:30 AM</asp:ListItem>
         </asp:DropDownList>
        <asp:Label ID="StartTimeLabel" runat="server" Text="Start Time" CssClass="col-md-2 control-label"  style="position:absolute;left:26px; top:276px; height: 16px; width:150px; margin-top: 0px;"></asp:Label>
        <asp:Label ID="EndTimeLabel" runat="server" Text="End Time" CssClass="col-md-2 control-label" style="position:absolute;left:134px; top:276px; height: 16px; width: 150px; margin-top: 0px;"></asp:Label>
         <br />
         <br />
         <br />
        <asp:RequiredFieldValidator ID="rfvEventDay" runat="server" ErrorMessage="Event Day is Required" ControlToValidate="EventDayTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
         <br />
         <br />
         <br />
         <asp:DropDownList ID="EndTime" runat="server" Height="44px" Width="100px" CssClass="form-control" style="position:absolute;left:145px; top:296px; height: 44px;">
             <asp:ListItem Value="0">6:00 AM</asp:ListItem>
             <asp:ListItem Value="1">6:30 AM</asp:ListItem>
             <asp:ListItem Value="2">7:00 AM</asp:ListItem>
             <asp:ListItem Value="3">7:30 AM</asp:ListItem>
         </asp:DropDownList>
         <br />
         <asp:Label ID="EventDayLabel" runat="server" Text="Event Day" style="position:absolute; left:26px; top:355px; height: 17px; width: 235px;"></asp:Label>
         <br />
        <asp:TextBox ID="EventDayTextBox" runat="server" CssClass="form-control" Enabled="false" style="position:absolute; left:21px; top:380px; height: 44px; width: 235px;"></asp:TextBox>
         <br />
         <br />
         <br />
         <asp:GridView ID="EventsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="EventDataSource1" Style="left: 666px; position: absolute;
            top: 151px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="EventsGridView_SelectedIndexChanged" GridLines="None" AllowPaging="True" DataKeyNames="Id" ShowHeaderWhenEmpty="True">
             <Columns>
                 <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                 <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                 <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                 <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                 <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
             </Columns>
             <SelectedRowStyle ForeColor="#3333CC" />
         </asp:GridView> 
         <asp:SqlDataSource ID="EventDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Event] ORDER BY [EventDate]"></asp:SqlDataSource>
         <br />
         <br />
         <br />
         <asp:Calendar ID="EventDayCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth" OnSelectionChanged="EventDayCalendar_SelectionChanged">
             <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
             <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
             <OtherMonthDayStyle ForeColor="#999999" />
             <SelectedDayStyle BackColor="#333399" ForeColor="White" />
             <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
             <TodayDayStyle BackColor="#CCCCCC" />
         </asp:Calendar>
         <br />
         <br />
    </div>
    <div class="form-group">
         <br />
         <br />
         <br />
         <asp:Button ID="ResetButton" runat="server" Text="Reset" Style="position: absolute; left: 33px; top: 683px; width: 80px; height: 44px;" />
         <br />
        <asp:Button ID="DeleteButton" runat="server" Text="Delete"  Style="position: absolute; left: 118px; position: absolute; top: 683px; width: 80px; height: 44px;"/>
        <asp:Button ID="AttendeesButton" runat="server" Text="Attendees" Style="position: absolute; left: 203px; top: 683px; width: 80px; height: 44px;" OnClick="AttendeesButton_Click" CausesValidation="False" />
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
    <div class="form-group">
        <asp:Button ID="SaveButton" runat="server" Text="Save" Style="position: absolute; left: 288px; top: 683px; width: 80px; height: 44px;" OnClick="SaveButton_Click" />
    </div>
</asp:Content>
