<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Schedule an Event</h1>
    <div class="form-group">
        <asp:Label ID="TitleLabel" runat="server" Text="Title" CssClass="col-md-2 control-label"></asp:Label>
        <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Title is a required field" ControlToValidate="TitleTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <asp:Label ID="DescriptionLabel" runat="server" Text="Description" CssClass="col-md-2 control-label"></asp:Label>
        <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="form-control" Width="300px" TextMode="MultiLine"></asp:TextBox>
      
    </div>
     <div class="form-group">
        <asp:Label ID="StartTimeLabel" runat="server" Text="Start Date & Time" CssClass="col-md-2 control-label"></asp:Label>
         <asp:DropDownList ID="StartTime" runat="server" Height="44px" Width="100px" CssClass="form-control">
             <asp:ListItem Value="0">6:00 AM</asp:ListItem>
             <asp:ListItem Value="1">6:30 AM</asp:ListItem>
             <asp:ListItem Value="2">7:00 AM</asp:ListItem>
             <asp:ListItem Value="3">7:30 AM</asp:ListItem>
         </asp:DropDownList>
        <asp:TextBox ID="StartDayTextBox" runat="server" CssClass="form-control" Width="100px" Enabled="false" style="position:absolute; left:680px; top:258px; height: 44px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvStartDay" runat="server" ErrorMessage="Start Day is Required" ControlToValidate="StartDayTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Calendar ID="StartDayCalendar" runat="server" style="position:absolute; left:559px; top:325px; height: 144px;" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>   
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
         <asp:GridView ID="EventsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EventDataSource" Style="z-index: 101; left: 644px; position: absolute;
            top: 565px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="EventsGridView_SelectedIndexChanged">
             <Columns>
                 <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                 <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                 <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                 <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                 <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:d}" />
                 <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" DataFormatString="{0:d}" />
             </Columns>
             <SelectedRowStyle ForeColor="#3333CC" />
         </asp:GridView> 
         <asp:SqlDataSource ID="EventDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HolmenRoboticsClubConnectionString3 %>" SelectCommand="SELECT * FROM [Event] ORDER BY StartDate"></asp:SqlDataSource>
         <br />
         <br />
         <br />
         <br />
         <br />
    </div>
    <div class="form-group">
        <asp:Label ID="EndLabel" runat="server" Text="End Date & Time" CssClass="col-md-2 control-label" style="position:absolute;left:829px; top:258px; height: 44px;"></asp:Label>
         <asp:DropDownList ID="EndTime" runat="server" Height="44px" Width="100px" CssClass="form-control" style="position:absolute;left:959px; top:258px; height: 44px;">
             <asp:ListItem Value="0">6:00 AM</asp:ListItem>
             <asp:ListItem Value="1">6:30 AM</asp:ListItem>
             <asp:ListItem Value="2">7:00 AM</asp:ListItem>
             <asp:ListItem Value="3">7:30 AM</asp:ListItem>
         </asp:DropDownList>
        <asp:TextBox ID="EndDayTextBox" runat="server" CssClass="form-control" Width="100px" Enabled="false" style="position:absolute; left:1080px; top:258px; height: 44px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEndDay" runat="server" ErrorMessage="End Day is required" ControlToValidate="EndDayTextBox" Forecolor="Red"></asp:RequiredFieldValidator>
        <asp:Calendar ID="EndDayCalendar" runat="server" style="position:absolute;left:959px; top:325px; height: 144px;" OnSelectionChanged="EndDayCalendar_SelectionChanged"></asp:Calendar>   
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
    <div class="form-group">
        <asp:Button ID="DeleteButton" runat="server" Text="Delete"  Style="z-index: 101; left: 640px; position: absolute; top: 515px; width: 150px; height: 44px;"/>
        <asp:Button ID="SaveButton" runat="server" Text="Save" Style="position: absolute; left: 980px; top: 515px; width: 150px; height: 44px;" OnClick="SaveButton_Click" />
        <asp:Button ID="AttendeesButton" runat="server" Text="Attendees" Style="position: absolute; left: 810px; top: 515px; width: 150px; height: 44px;" OnClick="AttendeesButton_Click" />
    </div>
</asp:Content>
