<%@ Page Title="Historial" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="ProyectoDAI.App.Report.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <h1>Historial Informe de Diabetes</h1>
        <br />

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Tipo</th>
                    <th>Antes de Desayunar</th>
                    <th>Después de Desayunar</th>
                    <th>Antes de Comer</th>
                    <th>Después de Comer</th>
                    <th>Antes de Cenar</th>
                    <th>Después de Cenar</th>
                    <th>Antes de Dormir</th>
                </tr>
            </thead>
            <tbody>
                <!-- Repetir N Veces -->
                <tr>
                    <th rowspan="4">Day 1</th>
                    <th>Nivel de Glucosa</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                </tr>
                <tr>
                    <th>Nivel de Cetonas</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                </tr>
                <tr>
                    <th>Medicamentos</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                </tr>
                <tr>
                    <th>Notas</th>
                    <th>x</th>
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
