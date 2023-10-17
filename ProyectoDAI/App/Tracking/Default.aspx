<%@ Page Title="Seguimiento" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.App.Tracking.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Registrar Datos</h1>
        <p class="lead">Registra tu actividad física y las calorías consumidas.</p>
        <p><a href="/App/Tracking/Register" class="btn btn-primary btn-lg">Ir al Registro &raquo;</a></p> 
    </div>

    <div class="jumbotron">
        <h1>Histórico de Datos</h1>
        <p class="lead">Revisa el histórico de tus datos.</p>
        <p><a href="/App/Tracking/History" class="btn btn-primary btn-lg">Ir al Histórico &raquo;</a></p> 
    </div>
</asp:Content>
