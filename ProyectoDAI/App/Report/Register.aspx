<%@ Page Title="Registrar" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ProyectoDAI.App.Report.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#addMedication').click(function () {
                var medicationEntry = $('.medicationEntry').first().clone();
                medicationEntry.find('input').val(''); // Clear the input value in the cloned entry
                $('#medicationContainer').append(medicationEntry);
            });
        });
    </script>

        <div class="container text-white">
        <h1>Informe de Diabetes</h1>

        <h2>Registrar Datos</h2>
        <br />
        <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control" required>
            <asp:ListItem Text="Selecciona una hora" Value="" />
        </asp:DropDownList>
        <div class="row">
            <div class="col-md-6">
                <h3>Glucosa y Cetonas</h3>
                <div class="form-group">
                    <label for="glucoseLevel">Nivel de Glucosa</label>
                    <asp:TextBox ID="glucoseLevel" TextMode="Number" CssClass="form-control" Text="Nivel de Glucosa" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ketonesLevel">Nivel de Cetonas</label>
                    <asp:TextBox ID="ketonesLevel" TextMode="Number" CssClass="form-control" Text="Nivel de Cetonas" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="col-md-6">
                <h3>Registro de Medicamentos</h3>
                <div class="form-group" id="medicationEntries">
                    <div id="medicationContainer">
                        <div class="medicationEntry">
                            <asp:DropDownList ID="ddlMedication" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Selecciona un Medicamento" Value="" />
                            </asp:DropDownList>
                            <asp:TextBox TextMode="Number" CssClass="form-control" Text="Cantidad" runat="server"></asp:TextBox>
                        </div>
                        <br />
                    </div> 
                    <br />
                    <button type="button" id="addMedication" class="btn btn-secondary text-black">Añade Medicamento</button>
                </div>
            </div>
        </div>

        <h2>Notas</h2>
        <div class="form-group">
            <label for="notes">Notas</label>
            <asp:TextBox ID="notes" TextMode="MultiLine" CssClass="form-control" Text="Agrega notas aquí" runat="server"></asp:TextBox>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Guardar Datos" CssClass="btn btn-primary" OnClick="SaveData_Click" />
    </div>
</asp:Content>
