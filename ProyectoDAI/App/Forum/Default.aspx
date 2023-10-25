<%@ Page Title="Foro" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.App.Forum.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-white">
        <br />
        <h2>Forum</h2>
        <hr /><br />

        <div class="panel panel-default">
            <div class="panel-heading">Post a Message</div>
            <div class="panel-body">
                <asp:TextBox ID="txbMessage" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="PostButton" runat="server" Text="Post" CssClass="btn btn-primary" OnClick="PostButton_Click" />
                <asp:Label ID="lblError" Text="" runat="server" />
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">Recent Messages</div>
            <div class="panel-body">
                <asp:Repeater ID="MessageRepeater" runat="server">
                    <ItemTemplate>
                        <div class="well text-black">
                            <p><%# Eval("message") %></p>
                            <p><small>Posted by <%# Eval("first_name") %> <%# Eval("last_name") %> on <%# Eval("created_at") %></small></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

</asp:Content>
