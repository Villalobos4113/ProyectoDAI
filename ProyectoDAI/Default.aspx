<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Dia Well APP</h1>
        <p class="lead">Inicia sesión o crea una cuenta para empezar a gestionar tu diabetes de manera más sencilla con nuestra aplicación.</p>
        <p>
            <a href="/Auth/Login" class="btn btn-primary btn-lg">Iniciar sesión &raquo;</a>
            <a href="/Auth/SignUp" class="btn btn-primary btn-lg">Registrarse &raquo;</a>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Sobre la Diabetes</h2>
            <p>
                El Camino hacia la Comprensión de la Diabetes Comienza Aquí. No importa en qué etapa te encuentres en tu viaje, aquí es donde debes estar.
            </p>
            <p>
                <a class="btn btn-default" href="/About">Más información &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Salud y Bienestar</h2>
            <p>
                Tú Puedes Gestionar y Prosperar con la Diabetes. Un diagnóstico de diabetes no te define. Tenemos los recursos que necesitas para vivir una vida saludable.
            </p>
            <p>
                <a class="btn btn-default" href="/Health">Más información &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Nosotros</h2>
            <p>
                Conoce al Equipo detrás del Proyecto. En Dia Well, te invitamos a conocer al equipo que está comprometido a ayudarte a llevar un control efectivo de tu diabetes.
            </p>
            <p>
                <a class="btn btn-default" href="/Contact">Conócenos &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
