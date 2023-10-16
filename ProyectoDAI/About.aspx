<%@ Page Title="Sobre la Diabetes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ProyectoDAI.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">El Camino hacia la Comprensión de la Diabetes Comienza Aquí</h1>
                <h3>No importa en qué etapa te encuentres en tu viaje, aquí es donde debes estar.</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <p>
                    La diabetes es una condición de salud que afecta a millones de personas en todo el mundo. Comprender la diabetes es el primer paso para manejarla de manera efectiva y llevar una vida saludable. En esta sección, encontrarás información valiosa sobre la diabetes, sus tipos, síntomas y cómo puedes tomar el control de tu salud.
                </p>
            </div>
            <div class="col-md-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/SobreLaDiabetes/sobre-la-diabetes-1.jpg" CssClass="img-responsive" />
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-12">
                <h2 class="page-header">Secciones Importantes:</h2>
            </div>
        </div>

        <!-- Section: Warning Signs -->
        <div class="row">
            <div class="col-md-12">
                <h3>Señales de Advertencia</h3>
                <p>
                    Aquí aprenderás acerca de las señales de advertencia comunes de la diabetes, que pueden incluir síntomas como la sed excesiva, la micción frecuente y la fatiga. Reconocer estos signos tempranos es crucial para un diagnóstico temprano y un tratamiento adecuado.
                </p>
            </div>
        </div>

        <!-- Section: Understanding Diabetes -->
        <div class="row">
            <div class="col-md-12">
                <h3>Comprender la Diabetes</h3>
                <p>
                    Exploraremos en detalle los tipos de diabetes, incluyendo la diabetes tipo 1, la diabetes tipo 2 y la diabetes gestacional. Comprender las diferencias entre estos tipos es esencial para el manejo adecuado de la enfermedad.
                </p>
            </div>
        </div>

        <!-- Section: Type 1 Diabetes -->
        <div class="row">
            <div class="col-md-12">
                <h4>Diabetes Tipo 1</h4>
                <p>
                    La diabetes tipo 1 es una forma autoinmune de diabetes que generalmente se diagnostica en la infancia o la adolescencia. Aprende más sobre sus causas, síntomas y opciones de tratamiento.
                </p>
            </div>
        </div>

        <!-- Section: Type 2 Diabetes -->
        <div class="row">
            <div class="col-md-12">
                <h4>Diabetes Tipo 2</h4>
                <p>
                    La diabetes tipo 2 es más común y generalmente se desarrolla en adultos. Descubre cómo los factores de estilo de vida y genéticos pueden contribuir a esta forma de diabetes.
                </p>
            </div>
        </div>

        <!-- Section: Gestational Diabetes -->
        <div class="row">
            <div class="col-md-12">
                <h4>Diabetes Gestacional</h4>
                <p>
                    La diabetes gestacional es una forma de diabetes que afecta a algunas mujeres durante el embarazo. Conoce los riesgos y las estrategias de manejo para un embarazo saludable.
                </p>
            </div>
        </div>

        <!-- Section: Understanding A1C -->
        <div class="row">
            <div class="col-md-12">
                <h3>Comprender el A1C</h3>
                <p>
                    El análisis de hemoglobina A1c (A1C) es una herramienta importante en el control de la diabetes. Aprende cómo se utiliza y qué significan tus resultados de A1C.
                </p>
            </div>
        </div>
    </div>
</asp:Content>