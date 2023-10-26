<%@ Page Title="Ajustes de Cuenta" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="ProyectoDAI.App.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <br />
        <h2>Ajustes de Cuenta</h2>
        <hr /><br />

        <h3>Actualiza tu Información Personal</h3>

        <div class="form-group">
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblFirstName" runat="server" Text="Nombre"></asp:Label>
                </div>
                <div class="col-md-10">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblLastName" runat="server" Text="Apellido"></asp:Label>
                </div>
                <div class="col-md-10">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </div>
                <div class="col-md-10">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lblMessage1" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnUpdateInfo" runat="server" Text="Update Information" OnClick="btnUpdateInfo_Click" CssClass="btn btn-primary" />
        </div>

        <hr />

        <h3>Cambia tu Contraseña</h3>

        <div class="form-group">
            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblCurrentPassword" runat="server" Text="Contraseña Actual"></asp:Label>
                </div>
                <div class="col-md-10">
                    <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblNewPassword" runat="server" Text="Nueva Contraseña"></asp:Label>
                </div>
                <div class="col-md-10">
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <asp:Label ID="lblConfirmNewPassword" runat="server" Text="Confirma tu Contraseña"></asp:Label>
                </div>
                <div class="col-md-10">
                    <asp:TextBox ID="txtConfirmNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <asp:Label ID="lblMessage2" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" CssClass="btn btn-primary" />
        </div>

    </div>
</asp:Content>