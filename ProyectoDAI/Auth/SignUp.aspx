<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ProyectoDAI.Auth.SignUp" %>

<asp:Content ID="SignUp" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h2>Crea tu Cuenta</h2>
                <br />
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Nombre" required></asp:TextBox>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Apellido" required></asp:TextBox>
                <br />
                <asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control" placeholder="Email" required></asp:TextBox>
                <br />
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña" required></asp:TextBox>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirma tu contraseña" required></asp:TextBox>
                <span id='message'></span>
                <br />
                <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" required></asp:TextBox>
                <br />
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" required></asp:DropDownList>
                <br />
                <div class="error-message-container">
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
                    <br />
                    <asp:Button ID="btnSignUp" runat="server" Text="Crear Cuenta" CssClass="btn btn-primary" OnClick="btnSignUp_Click" />
                </div>
                <br /><br />
                <p>¿Ya tienes una cuenta? <asp:HyperLink NavigateUrl="~/Auth/Login.aspx" Text="Inicia Sesión" runat="server" /></p>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= txtNewPassword.ClientID %>, #<%= txtConfirmPassword.ClientID %>').on('keyup', function () {
                if ($('#<%= txtNewPassword.ClientID %>').val() == $('#<%= txtConfirmPassword.ClientID %>').val()) {
                    $('#message').html('Coincide').css('color', 'green');
                } else 
                    $('#message').html('No coincide').css('color', 'red');
            });
        });
    </script>
</asp:Content>