<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomersAdmin.aspx.cs" Inherits="StoreFront.Admin.CustomersAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" pagesize="50" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" Height="363px" style="margin-right: 0px" Width="523px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="CustomerAdminDetails.aspx?UserID={0}" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreFrontConnectionString %>" SelectCommand="spGetUsers" SelectCommandType="StoredProcedure" DeleteCommand="spDeleteUser" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    
        <asp:DetailsView ID="DetailsView1" runat="server" DefaultMode="Insert" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StoreFrontConnectionString %>" SelectCommand="SELECT [UserName], [EmailAddress] FROM [User]" InsertCommand="spAddUser" InsertCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
</asp:Content>