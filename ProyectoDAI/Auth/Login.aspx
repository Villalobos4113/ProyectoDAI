<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoDAI.Auth.Login" %>

<asp:Content ID="Login" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Container for Login Form - Start -->

    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <h2>Iniciar Sesión</h2>
                <br />

                <!-- Input Field for Email -->
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" required></asp:TextBox>

                <!-- Input Field for Password -->
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" required></asp:TextBox>

                <br />

                <!-- Container for Error Message - Start -->

                <div class="error-message-container">

                    <!-- Button for Logging In -->
                    <asp:Button ID="btnLogin" runat="server" Text="Acceder" CssClass="btn btn-primary" OnClick="btnLogin_Click" />

                    <!-- Label for Displaying Error Message -->
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                </div>

                <!-- Container for Error Message - End -->

                <br /><br />

                <!-- Link to Register Page -->
                <p>¿No tienes una cuenta? <asp:HyperLink NavigateUrl="~/Auth/SignUp.aspx" Text="Regístrate" runat="server" /></p>

            </div>
        </div>
    </div>

    <!-- Container for Login Form - End -->

</asp:Content>
