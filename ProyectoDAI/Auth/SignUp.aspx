<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ProyectoDAI.Auth.SignUp" %>

<asp:Content ID="SignUp" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <h2>Crea tu Cuenta</h2>
                <br />

                <!-- Input field for first name -->
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Nombre" required></asp:TextBox>
                
                <!-- Input field for last name -->
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Apellido" required></asp:TextBox>
                <br />
                
                <!-- Input field for email -->
                <asp:TextBox ID="txtNewEmail" runat="server" CssClass="form-control" placeholder="Email" required></asp:TextBox>
                <br />
                
                <!-- Input field for password -->
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña" required></asp:TextBox>
                
                <!-- Input field for confirming password -->
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirma tu contraseña" required></asp:TextBox>
                
                <!-- Span to show matching password and confirm password -->
                <span id='message'></span>

                <br />

                <!-- Input field for date of birth - Start -->  
                
                <div class="form-group">
                    <label for="txtDateOfBirth">Fecha de Nacimiento</label>
                    <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" required></asp:TextBox>
                </div>
                <br />

                <!-- Input field for date of birth - End -->  

                <!-- Dropdown list for selecting gender -->
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" required></asp:DropDownList>
                <br />

                <!-- Container for error message display - Start -->

                <div class="error-message-container">

                    <!-- Label for displaying error messages -->
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                    <br />

                    <!-- Button for signing up -->
                    <asp:Button ID="btnSignUp" runat="server" Text="Crear Cuenta" CssClass="btn btn-primary" OnClick="btnSignUp_Click" />

                </div>

                <!-- Container for error message display - End -->

                <br /><br />

                <!-- Link for redirecting to the login page -->
                <p>¿Ya tienes una cuenta? <asp:HyperLink NavigateUrl="~/Auth/Login.aspx" Text="Inicia Sesión" runat="server" /></p>

            </div>
        </div>
    </div>

    <!-- Script reference for jQuery library - Start -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Function to check password match on keyup
            $('#<%= txtNewPassword.ClientID %>, #<%= txtConfirmPassword.ClientID %>').on('keyup', function () {
                // Compare the values in the password fields
                if ($('#<%= txtNewPassword.ClientID %>').val() == $('#<%= txtConfirmPassword.ClientID %>').val()) {
                    // Display 'Coincide' if passwords match
                    $('#message').html('Coincide').css('color', 'green');
                } else
                    // Display 'No coincide' if passwords do not match
                    $('#message').html('No coincide').css('color', 'red');
            });
        });
    </script>

    <!-- Script reference for jQuery library - End -->

</asp:Content>
