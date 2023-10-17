<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoDAI.Auth.Login" %>

<asp:Content ID="Login" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h2>Iniciar Sesión</h2>
                <br />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" required></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" required></asp:TextBox>
                <br />
                <div class="error-message-container">
                    <asp:Button ID="btnLogin" runat="server" Text="Acceder" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                </div>
                <br /><br />
                <p>¿No tienes una cuenta? <asp:HyperLink NavigateUrl="~/Auth/SignUp.aspx" Text="Regístrate" runat="server" /></p>
            </div>
        </div>
    </div>
</asp:Content>
