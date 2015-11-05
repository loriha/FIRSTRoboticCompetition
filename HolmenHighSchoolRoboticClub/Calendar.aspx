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
                <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="form-control" style="position:absolute;left:26px; top:220px; height: 44px; width:300px;" TextMode="MultiLine" TabIndex="1"></asp:TextBox>
      
                <asp:RequiredFieldValidator ID="rfvEventDay" runat="server" ErrorMessage="Event Day is Required" ControlToValidate="EventDayTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
      
            </div>
             <div class="form-group">
                 <asp:DropDownList ID="StartTime" runat="server" Width="100px" CssClass="form-control" style="position:absolute;left:26px; top:295px; height: 44px;" TabIndex="2">
                     <asp:ListItem Value="0">6:00 AM</asp:ListItem>
                     <asp:ListItem Value="1">6:30 AM</asp:ListItem>
                     <asp:ListItem Value="2">7:00 AM</asp:ListItem>
                     <asp:ListItem Value="3">7:30 AM</asp:ListItem>
                     <asp:ListItem Value="4">8:00 AM</asp:ListItem>
                     <asp:ListItem Value="5">8:30 AM</asp:ListItem>
                     <asp:ListItem Value="6">9:00 AM</asp:ListItem>
                     <asp:ListItem Value="7">9:30 AM</asp:ListItem>
                     <asp:ListItem Value="8">10:00 AM</asp:ListItem>
                     <asp:ListItem Value="9">10:30 AM</asp:ListItem>
                     <asp:ListItem Value="10">11:00 AM</asp:ListItem>
                     <asp:ListItem Value="11">11:30 AM</asp:ListItem>
                     <asp:ListItem Value="12">12:00 PM</asp:ListItem>
                     <asp:ListItem Value="13">12:30 PM</asp:ListItem>
                     <asp:ListItem Value="14">1:00 PM</asp:ListItem>
                     <asp:ListItem Value="15">1:30 PM</asp:ListItem>
                      <asp:ListItem Value="16">2:00 PM</asp:ListItem>
                     <asp:ListItem Value="17">2:30 PM</asp:ListItem>
                     <asp:ListItem Value="18">3:00 PM</asp:ListItem>
                     <asp:ListItem Value="19">3:30 PM</asp:ListItem>
                     <asp:ListItem Value="20">4:00 PM</asp:ListItem>
                     <asp:ListItem Value="21">4:30 PM</asp:ListItem>
                     <asp:ListItem Value="22">5:00 PM</asp:ListItem>
                     <asp:ListItem Value="23">5:30 PM</asp:ListItem>
                     <asp:ListItem Value="24">6:00 PM</asp:ListItem>
                     <asp:ListItem Value="25">6:30 PM</asp:ListItem>
                     <asp:ListItem Value="26">7:00 PM</asp:ListItem>
                     <asp:ListItem Value="27">7:30 PM</asp:ListItem>
                     <asp:ListItem Value="28">8:00 PM</asp:ListItem>
                     <asp:ListItem Value="29">8:30 PM</asp:ListItem>
                     <asp:ListItem Value="30">9:00 PM</asp:ListItem>
                     <asp:ListItem Value="31">9:30 PM</asp:ListItem>
                     <asp:ListItem Value="32">10:00 PM</asp:ListItem>
                     <asp:ListItem Value="33">10:30 PM</asp:ListItem>
                     <asp:ListItem Value="34">11:00 PM</asp:ListItem>
                 </asp:DropDownList>
                <asp:Label ID="StartTimeLabel" runat="server" Text="Start Time" CssClass="col-md-2 control-label"  style="position:absolute;left:26px; top:276px; height: 16px; width:150px; margin-top: 0px;"></asp:Label>
                <asp:Label ID="EndTimeLabel" runat="server" Text="End Time" CssClass="col-md-2 control-label" style="position:absolute;left:134px; top:276px; height: 16px; width: 150px; margin-top: 0px;"></asp:Label>
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <asp:DropDownList ID="EndTime" runat="server" Height="44px" Width="100px" CssClass="form-control" style="position:absolute;left:145px; top:296px; height: 44px;" TabIndex="3">
                      <asp:ListItem Value="0">6:00 AM</asp:ListItem>
                     <asp:ListItem Value="1">6:30 AM</asp:ListItem>
                     <asp:ListItem Value="2">7:00 AM</asp:ListItem>
                     <asp:ListItem Value="3">7:30 AM</asp:ListItem>
                     <asp:ListItem Value="4">8:00 AM</asp:ListItem>
                     <asp:ListItem Value="5">8:30 AM</asp:ListItem>
                     <asp:ListItem Value="6">9:00 AM</asp:ListItem>
                     <asp:ListItem Value="7">9:30 AM</asp:ListItem>
                     <asp:ListItem Value="8">10:00 AM</asp:ListItem>
                     <asp:ListItem Value="9">10:30 AM</asp:ListItem>
                     <asp:ListItem Value="10">11:00 AM</asp:ListItem>
                     <asp:ListItem Value="11">11:30 AM</asp:ListItem>
                     <asp:ListItem Value="12">12:00 PM</asp:ListItem>
                     <asp:ListItem Value="13">12:30 PM</asp:ListItem>
                     <asp:ListItem Value="14">1:00 PM</asp:ListItem>
                     <asp:ListItem Value="15">1:30 PM</asp:ListItem>
                      <asp:ListItem Value="16">2:00 PM</asp:ListItem>
                     <asp:ListItem Value="17">2:30 PM</asp:ListItem>
                     <asp:ListItem Value="18">3:00 PM</asp:ListItem>
                     <asp:ListItem Value="19">3:30 PM</asp:ListItem>
                     <asp:ListItem Value="20">4:00 PM</asp:ListItem>
                     <asp:ListItem Value="21">4:30 PM</asp:ListItem>
                     <asp:ListItem Value="22">5:00 PM</asp:ListItem>
                     <asp:ListItem Value="23">5:30 PM</asp:ListItem>
                     <asp:ListItem Value="24">6:00 PM</asp:ListItem>
                     <asp:ListItem Value="25">6:30 PM</asp:ListItem>
                     <asp:ListItem Value="26">7:00 PM</asp:ListItem>
                     <asp:ListItem Value="27">7:30 PM</asp:ListItem>
                     <asp:ListItem Value="28">8:00 PM</asp:ListItem>
                     <asp:ListItem Value="29">8:30 PM</asp:ListItem>
                     <asp:ListItem Value="30">9:00 PM</asp:ListItem>
                     <asp:ListItem Value="31">9:30 PM</asp:ListItem>
                     <asp:ListItem Value="32">10:00 PM</asp:ListItem>
                     <asp:ListItem Value="33">10:30 PM</asp:ListItem>
                     <asp:ListItem Value="34">11:00 PM</asp:ListItem>
                 </asp:DropDownList>
                 <br />
                 <asp:Label ID="EventDayLabel" runat="server" Text="Event Day" style="position:absolute; left:26px; top:355px; height: 17px; width: 235px;"></asp:Label>
                 <br />
                <asp:TextBox ID="EventDayTextBox" runat="server" CssClass="form-control" Enabled="false" style="position:absolute; left:21px; top:380px; height: 44px; width: 235px;" TabIndex="5"></asp:TextBox>
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
                         <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" DataFormatString="{0:MM/dd/yy}" />
                     </Columns>
                     <SelectedRowStyle ForeColor="#3333CC" />
                 </asp:GridView>
                 <asp:SqlDataSource ID="EventDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Event] ORDER BY [EventDate]"></asp:SqlDataSource>
                 <br />
                 <br />
                 <br />
             </div>
              <div>
                  <asp:Calendar ID="EventDayCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth" OnSelectionChanged="EventDayCalendar_SelectionChanged" Style="position: absolute; left: 26px; top: 503px; height: 203px; width: 363px;" CssClass="active">
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
                 <asp:Button ID="ResetButton" runat="server" Text="Reset" Style="position: absolute; left: 33px; top: 725px; width: 80px; height: 44px;" OnClick="ResetButton_Click" TabIndex="6" />
                 <br />
                <asp:Button ID="DeleteButton" runat="server" Text="Delete"  Style="position: absolute; left: 118px; position: absolute; top: 725px; width: 80px; height: 44px;" OnClick="DeleteButton_Click" TabIndex="7"/>
                <asp:Button ID="AttendeesButton" runat="server" Text="Attendees" Style="position: absolute; left: 203px; top: 725px; width: 80px; height: 44px;" OnClick="AttendeesButton_Click" CausesValidation="False" TabIndex="8" />
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
                <asp:Button ID="SaveButton" runat="server" Text="Save" Style="position: absolute; left: 288px; top: 725px; width: 80px; height: 44px;" OnClick="SaveButton_Click" TabIndex="9" />
            </div>
      
</asp:Content>
