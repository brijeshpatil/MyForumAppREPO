<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUse.aspx.cs" Inherits="MyForumApp.Admin.ManageUse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

    <asp:GridView ID="GridView1" runat="server" CssClass="tblGrid" AutoGenerateColumns="false" DataKeyNames="userid" OnDataBound="GridView1_DataBound" OnRowCommand="GridView1_RowCommand" ShowFooter="True">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="Select All" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" />
                </HeaderTemplate>
                <FooterTemplate>
                    <asp:Button ID="Button1" runat="server" Text="Change Status" CommandName="ChangeStatus" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Technology">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%#Bind("TechName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="RegDate">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%#Bind("RegDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%#Bind("IsActive") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
