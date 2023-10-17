<%@ Page Title="Historial" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="ProyectoDAI.App.Tracking.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <h1>Historial Seguimiento de Ejercicio</h1>
        <br />

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Hora de Inicio</th>
                    <th>Hora de Fin</th>
                    <th>Ejercicio</th>
                    <th>Intensidad</th>
                    <th>Calorias</th>
                    <th>Notas</th>
                </tr>
            </thead>
            <tbody>
                <!-- Repetir N Veces -->
                <tr>
                    <th>Day 1</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                </tr>
                <!-- Repetir N Veces -->
            </tbody>
        </table>
    </div>
</asp:Content>
