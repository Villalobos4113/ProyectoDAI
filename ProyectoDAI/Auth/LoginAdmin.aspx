<%@ Page Title="Login Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="ProyectoDAI.Auth.LoginAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Container for Login Form - Start -->

    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <h2>Iniciar Sesión Como Administrador</h2>
                <br />

                <!-- Input Field for Email -->
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username" required></asp:TextBox>

                <!-- Input Field for Password -->
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña" required></asp:TextBox>

                <br />

                <!-- Container for Error Message - Start -->

                <div class="error-message-container">

                    <!-- Button for Logging In -->
                    <asp:Button ID="btnLogin" runat="server" Text="Acceder Como Administrador" CssClass="btn btn-primary" OnClick="btnLogin_Click" />

                    <!-- Label for Displaying Error Message -->
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                </div>

                <!-- Container for Error Message - End -->

                <br />

            </div>
        </div>
    </div>

    <!-- Container for Login Form - End -->
</asp:Content>
