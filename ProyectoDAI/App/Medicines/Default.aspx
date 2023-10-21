<%@ Page Title="Medicamentos" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.App.Medicines.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-white">

        <br />
        <h2>Medicamentos</h2>
        <hr /><br />

        <h3>Tus Medicamentos</h3>
        <asp:Table ID="tblMedicines" runat="server" CssClass="table table-bordered"></asp:Table>

        <br /><br />

        <div class="row">

            <div class="container col-md-6">

                <h3>Añade Medicamentos</h3>
                <asp:DropDownList ID="ddlMedicines" CssClass="form-control" runat="server" ValidationGroup="AddMedicine"></asp:DropDownList>
                <asp:TextBox ID="txbQuantity" TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server" ValidationGroup="AddMedicine"></asp:TextBox>
                <br />
                <div class="error-message-container">

                    <!-- Label for displaying error messages -->
                    <asp:Label ID="Label1" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                    <!-- Button to save data -->
                    <asp:Button ID="btnSaveAddQuantity" runat="server" Text="Añadir Medicamentos" CssClass="btn btn-primary" OnClick="SaveDataNewQuantity_Click" ValidationGroup="AddMedicine" />

                </div>

            </div>

            <div class="container col-md-6">

                <h3>Añade un Nuevo Medicamento</h3>
                <asp:TextBox ID="txbNewMedicine" CssClass="form-control" placeholder="Nombre del medicamento" runat="server" ValidationGroup="NewMedicine"></asp:TextBox>
                <asp:TextBox ID="txbNewQuantity" TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server" ValidationGroup="NewMedicine"></asp:TextBox>
                <br />
                <div class="error-message-container">

                    <!-- Label for displaying error messages -->
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                    <!-- Button to save data -->
                    <asp:Button ID="btnSaveNewMedicine" runat="server" Text="Agregar Medicamento" CssClass="btn btn-primary" OnClick="SaveDataNewMedicine_Click" ValidationGroup="NewMedicine" />

                </div>

            </div>

        </div>

        <br />

    </div>

</asp:Content>