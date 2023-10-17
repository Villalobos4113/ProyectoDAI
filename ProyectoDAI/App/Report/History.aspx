<%@ Page Title="Historial" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="ProyectoDAI.App.Report.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <h1>Historial Informe de Diabetes</h1>
        <br />

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Type</th>
                    <th>Before Breakfast</th>
                    <th>After Breakfast</th>
                    <th>Before Lunch</th>
                    <th>After Lunch</th>
                    <th>Before Dinner</th>
                    <th>After Dinner</th>
                    <th>Bedtime</th>
                </tr>
            </thead>
            <tbody>
                <!-- Repetir N Veces -->
                <tr>
                    <th rowspan="4">Day 1</th>
                    <th>Blood Glucose</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                </tr>
                <tr>
                    <th>Ketones</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                </tr>
                <tr>
                    <th>Meds</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                    <th>x</th>
                </tr>
                <tr>
                    <th>Notes</th>
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
