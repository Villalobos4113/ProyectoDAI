<%@ Page Title="Foro" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.App.Forum.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-white">
        <br />
        <h2>Foro</h2>
        <hr /><br />

        <div class="panel panel-default">
            <div class="panel-heading">Publica un Mensaje</div>
            <div class="panel-body">
                <asp:TextBox ID="txbMessage" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Escribe aquí..." required></asp:TextBox>
                <br />
                <asp:Button ID="PostButton" runat="server" Text="Publicar" CssClass="btn btn-primary" OnClick="PostButton_Click" />
                <asp:Label ID="lblError" Text="" runat="server" />
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">Mensajes Recientes</div>
            <div class="panel-body">
                <asp:Repeater ID="MessageRepeater" runat="server">
                    <ItemTemplate>
                        <div class="well text-black">
                            <p><%# Eval("message") %></p>
                            <p><small>Publicado por <%# Eval("first_name") %> <%# Eval("last_name") %> el <%# Eval("created_at") %></small></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

</asp:Content>
