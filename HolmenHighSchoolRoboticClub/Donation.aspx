<%@ Page Title="Make a donation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Donation.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Donation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Donate Now</h1>
    <p>Your generous donation helps students from Holmen High School Robotics club meet their goals. </p>
    <h1>Donate by mail</h1>
    <p>You may send your check to:</p>
    <p>Holmen robotics club</p>
    <p>1001 McHugh Road</p>
    <p>Holmen WI 54636</p>
    <h1>Donate by phone</h1>
    <p>Using a credit card you may pay by phone 608-526-3372</p>
    <h1>Please sign up to be a sponsor.</h1>
    <div class="form-group">
        <asp:Label ID="NameLabel" runat="server" Text="Name" CssClass="col-md-2 control-label"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="The name field is required" ControlToValidate="NameTextBox" ForeColor="red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="form-group">
        <asp:Label ID="CurrencyLabel" runat="server" Text="Currency (optional)" CssClass="col-md-2 control-label"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revNumber" runat="server" ControlToValidate="txtAmount"
                ErrorMessage="Please enter only numbers like 100 or 100.00" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="red"></asp:RegularExpressionValidator>
        </div>
     </div>
    <div class="form-group">
        <asp:Label ID="DonationTypeLabel" runat="server" Text="Donation Type" CssClass="col-md-2 control-label"></asp:Label>
        <div class="col-md-10">
              <asp:DropDownList ID="DonationType" runat="server" Height="44px" Width="209px" CssClass="form-control">
                    <asp:ListItem Value="0">Volunteer</asp:ListItem>
                    <asp:ListItem Value="1">Donate Item(s)</asp:ListItem>
                    <asp:ListItem Value="2">Donate Money</asp:ListItem>
               </asp:DropDownList>
        </div>
    </div>
    <div class="form-group">
        <asp:Label ID="DonationProfile" runat="server" Text="Profile (optional)" CssClass="col-md-2 control-label"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="ProfileText" runat="server" TextMode="MultiLine" Height="101px" Width="354px"></asp:TextBox> 
        </div>
    </div>
    <div class="form-group">
         <div class="col-md-offset-2 col-md-10">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="OnSubmit" />
             <br />
        </div>
    </div>

</asp:Content>
