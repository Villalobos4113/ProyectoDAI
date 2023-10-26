<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <!-- Welcome Message Start -->

    <asp:Literal ID="LiteralWelcomeMessage" runat="server"></asp:Literal>

    <!-- Welcome Message End -->

    <br /><hr /><br />

    <!-- Admin's Sections Start -->

    <!-- Report Section Start -->

    <div class="jumbotron">
        <h1>Reporte Flexible</h1>
        <p class="lead">Genera reportes flexibles de la base de datos.</p>
        <p><a href="/Admin/Report" class="btn btn-primary btn-lg">Genera un reporte &raquo;</a></p> 
    </div>

    <!-- Report Section End -->

    <!-- Catalog Section Start -->

    <div class="jumbotron">
        <h1>Administración de Catálogos</h1>
        <p class="lead">Administra los catálogos disponibles de manera sencilla.</p>
        <p><a href="/Admin/Catalog" class="btn btn-primary btn-lg">Administra los catálogos &raquo;</a></p> 
    </div>

    <!-- Catalog Section End -->

    <!-- Admin's Sections End -->
</asp:Content>
