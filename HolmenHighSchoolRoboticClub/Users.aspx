<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="HolmenHighSchoolRoboticClub.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Holmen Robotics Club Users</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" ShowFooter="false"  Style="z-index: 101; left: 475px; position: absolute;
            top: 250px" Caption="<h3>Current Users</h3>">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="ROLE" HeaderText="ROLE" SortExpression="ROLE" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        </Columns>
        <SelectedRowStyle BackColor="#6600FF" />
    </asp:GridView>
     
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Users] WHERE APPROVED =1"  DeleteCommand="DELETE FROM USERS WHERE ID = @ID" UpdateCommand="UPDATE Users
 SET NAME=@name,ROLE=@role WHERE ID=@ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" />
            <asp:Parameter Name="role" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Users] WHERE APPROVED=0">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" DataSourceID="SqlDataSource3" ShowFooter="false" OnRowCommand="GridView2_RowCommand" 
        Style="z-index:101; left:75px; position:absolute; top:250px "
        Caption="<h3>Approval Needed</h3>">
        <Columns>
            <asp:TemplateField HeaderText="Approve">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text="Approve" CommandName="ApprovalUpdate" CommandArgument='<%# Eval("ID") + ";" + Eval("NAME") + ";" + Eval("ROLE") + ";" + Eval("EMAIL")%>' 
                        OnCommand="LinkButton1_Command" runat="server" ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Deny">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" Text="Deny" CommandName="DenyUpdate" CommandArgument='<%# Eval("ID") + ";" + Eval("NAME") + ";" + Eval("ROLE") + ";" + Eval("EMAIL")%>'
                         OnCommand="LinkButton2_Command" runat="server" ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="ROLE" HeaderText="ROLE" SortExpression="ROLE" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Users] WHERE APPROVED=2"></asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" DataSourceID="SqlDataSource4" ShowFooter="false" Style="z-index:101; left:875px; position:absolute; top:250px"
        Caption="<h3>Denied Users</h3>">
        <Columns>
            <asp:TemplateField HeaderText="Approve">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" Text="Approve" CommandName="ApproveUpdate" CommandArgument='<%# Eval("ID") + ";" + Eval("NAME") + ";" + Eval("ROLE") + ";" + Eval("EMAIL")%>'
                         OnCommand="LinkButton3_Command" runat="server" ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="ROLE" HeaderText="ROLE" SortExpression="ROLE" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
        </Columns>
    </asp:GridView>
</asp:Content>
