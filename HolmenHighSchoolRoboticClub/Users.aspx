<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Holmen Robotics Club Users</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" ShowFooter="True"  Style="z-index: 101; left: 249px; position: absolute;
            top: 454px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:TemplateField HeaderText="NAME" SortExpression="NAME">
                <EditItemTemplate>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("NAME") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="NameTextBox"  ForeColor="red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ROLE" SortExpression="ROLE">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("ROLE") %>'>
                        <asp:ListItem Value="0">Volunteer</asp:ListItem>
                        <asp:ListItem Value="1">Student</asp:ListItem>
                        <asp:ListItem Value="2">Admin</asp:ListItem>
                        <asp:ListItem Value="3">Sponsor</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="RoleLabel" runat="server" Text='<%# Bind("ROLE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <SelectedRowStyle BackColor="#6600FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HolmenRoboticsClubConnectionString3 %>" SelectCommand="SELECT [NAME], [ROLE], [ID] FROM [Users]" DeleteCommand="DELETE FROM USERS WHERE ID = @ID;" UpdateCommand="UPDATE Users
 SET NAME=@name,ROLE=@role WHERE ID=@ID;">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" />
            <asp:Parameter Name="role" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
