<%@ Page Title="Historial" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="ProyectoDAI.App.Report.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <h1>Historial Informe de Diabetes</h1>
        <br />

        <asp:Table ID="tblHistory" runat="server" CssClass="table table-bordered">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Fecha</asp:TableHeaderCell>
                <asp:TableHeaderCell>Hora</asp:TableHeaderCell>
                <asp:TableHeaderCell>Nivel de Glucosa</asp:TableHeaderCell>
                <asp:TableHeaderCell>Nivel de Cetonas</asp:TableHeaderCell>
                <asp:TableHeaderCell>Notas</asp:TableHeaderCell>
                <asp:TableHeaderCell>Medicamentos</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>

    </div>
</asp:Content>
