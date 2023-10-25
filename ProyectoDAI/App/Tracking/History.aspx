<%@ Page Title="Historial" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="ProyectoDAI.App.Tracking.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <h1>Historial Seguimiento de Ejercicio</h1>
        <br />

        <asp:Table ID="tblHistory" runat="server" CssClass="table table-bordered">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Fecha</asp:TableHeaderCell>
                <asp:TableHeaderCell>Hora de Inicio</asp:TableHeaderCell>
                <asp:TableHeaderCell>Hora de Fin</asp:TableHeaderCell>
                <asp:TableHeaderCell>Ejercicio</asp:TableHeaderCell>
                <asp:TableHeaderCell>Intensidad</asp:TableHeaderCell>
                <asp:TableHeaderCell>Calorías</asp:TableHeaderCell>
                <asp:TableHeaderCell>Notas</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>

    </div>
</asp:Content>
