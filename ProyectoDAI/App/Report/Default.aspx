<%@ Page Title="Informe" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.App.Report.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Registrar Datos</h1>
        <p class="lead">Registra tus niveles de glucosa, cetonas y medicamentos.</p>
        <p><a href="/APP/Report/Register" class="btn btn-primary btn-lg">Ir al Registro &raquo;</a></p> 
    </div>
    <div class="jumbotron">
        <h1>Histórico de Datos</h1>
        <p class="lead">Revisa el histórico de tus datos.</p>
        <p><a href="/APP/Informe/Historico" class="btn btn-primary btn-lg">Ir al Histórico &raquo;</a></p> 
    </div>
</asp:Content>
