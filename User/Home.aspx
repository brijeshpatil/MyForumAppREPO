<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MyForumApp.User.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

    <table>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtQuestionDetails" runat="server" TextMode="MultiLine" Height="150" Width="750"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:FileUpload ID="fpImage" runat="server" />
            </td>
            <td align="right">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Theme/btnimages/submit-button-png-25796.png" Height="55" Width="100" OnClick="ImageButton1_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />



    <asp:DataList ID="DataList1" runat="server" DataKeyField="QueID" OnItemDataBound="DataList1_ItemDataBound" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <div class="matches-main-agileinfo">
                <div class="col-md-6">
                    <asp:Image ID="Image1" runat="server" Height="300" Width="450" ImageUrl='<%#Bind("QuestionImage") %>' />
                </div>
                <div class="col-md-6 person-info-agileits-w3layouts">
                    <ul>
                        <li><span>Name</span>:
                            <asp:Label ID="Label1" runat="server" Text='<%#Bind("Name") %>'></asp:Label></li>
                        <li><span>Technology</span>:
                            <asp:Label ID="Label2" runat="server" Text='<%#Bind("TechName") %>'></asp:Label></li>
                        <li><span>Contact Details</span>:
                            <asp:Label ID="Label3" runat="server" Text='<%#Bind("username") %>'></asp:Label></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
                <div class="about-person">
                    <h6>About Question:</h6>
                    <p class="para-agileits-w3layouts" style="color: white;">
                        <span>Hi!, Iam
                            <asp:Label ID="Label4" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                        </span>
                        Nam arcu mauris, tincidunt sed convallis non, egestas ut lacus. Cras sapien urna, malesuada ut varius consequat, hendrer.
                    </p>
                    <p>
                        <asp:Label ID="Label5" runat="server" Text='<%#Bind("QuestionDetails") %>'></asp:Label>
                    </p>
                    <asp:Button ID="Button1" runat="server" Text="Reply" CssClass="sim-button button12" CommandName="ReplyBtn" />
                    <br />

                    <table>
                        <tr>
                            <td>
                                <h2>Answers</h2>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:DataList ID="DataListAnswers" runat="server" OnItemCommand="DataListAnswers_ItemCommand" OnItemDataBound="DataListAnswers_ItemDataBound">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Bind("name") %>'>LinkButton</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Text='<%#Bind("AnsDetails") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Like" CommandArgument='<%# Eval("AnsID")%>'>Like</asp:LinkButton>
                                                    <asp:Label ID="lblLikeCounter" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Panel ID="pnlAnswers" runat="server" Visible="false">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtAnswer" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="Button2" runat="server" Text="Post Answer" CssClass="btn" CommandName="SubmitAns" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
