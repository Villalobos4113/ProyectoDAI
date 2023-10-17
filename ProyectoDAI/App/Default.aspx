<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.App.Default" %>

<asp:Content ID="Default" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Literal ID="LiteralWelcomeMessage" runat="server"></asp:Literal>
    <br /><br />
    <div class="jumbotron">
        <h1>Informe de Diabetes</h1>
        <p class="lead">Monitorea tus niveles de glucosa, cetonas y medicamentos durante el día. Recibe análisis semanales y obtén una visión integral para controlar tu diabetes eficazmente.</p>
        <p><a href="/App/Report" class="btn btn-primary btn-lg">Explorar el informe &raquo;</a></p> 
    </div>
    <div class="jumbotron">
        <h1>Seguimiento de Ejercicio</h1>
        <p class="lead">Registra tus actividades físicas y conoce las calorías consumidas. Accede a información valiosa para manejar tu diabetes mientras mantienes un estilo de vida saludable y activo.</p>
        <p><a href="/App/Tracking" class="btn btn-primary btn-lg">Vamos a hacer ejercicio &raquo;</a></p> 
    </div>
    <div class="jumbotron">
        <h1>Control de Chequeos Médicos</h1>
        <p class="lead">Lleva un seguimiento de tus citas médicas y registra el avance de tu tratamiento en un solo lugar. Toma el control completo de tu salud para combatir la diabetes.</p>
        <p><a href="/App/Follow-Up" class="btn btn-primary btn-lg">Gestiona tus Chequeos &raquo;</a></p> 
    </div>
    <div class="jumbotron">
        <h1>Medicamentos</h1>
        <p class="lead">Gestiona tus medicamentos, conoce su disponibilidad y recibe recordatorios para no quedarte sin ellos. Mantén tu tratamiento siempre a punto.</p>
        <p><a href="/App/Medicines" class="btn btn-primary btn-lg">Administra tus Medicamentos &raquo;</a></p> 
    </div>
    <div class="jumbotron">
        <h1>Foro Comunitario</h1>
        <p class="lead">Únete a nuestra comunidad para discutir, compartir experiencias y obtener apoyo. Juntos, afrontamos la diabetes de manera informada y empoderada.</p>
        <p><a href="/App/Forum" class="btn btn-primary btn-lg">Únete al Foro &raquo;</a></p> 
    </div>
</asp:Content>