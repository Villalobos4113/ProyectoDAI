<%@ Page Title="Registrar" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ProyectoDAI.App.Report.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- JavaScript - Function to clone medication entry fields - Start -->

    <script type="text/javascript">
        $(document).ready(function () {
            $('#addMedication').click(function () {
                // Clone the first medication entry
                var medicationEntry = $('.medicationEntry').first().clone();
                medicationEntry.find('input').val(''); // Clear the input value in the cloned entry
                $('#medicationContainer').append(medicationEntry);
            });
        });
    </script>

    <!-- JavaScript End -->

    <!-- Form Start -->

    <div class="container text-white">

        <h1>Informe de Diabetes</h1>
        <h2>Registrar Datos</h2>
        <br />

        <div class="row">
            <div class="col-md-6">

                <!-- Dropdown list for selecting a time -->
                <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control" required>
                    <asp:ListItem Text="Selecciona una hora" Value="" />
                </asp:DropDownList>
                
                <h3>Glucosa y Cetonas</h3>
                
                <!-- Input for glucose level - Start -->
                
                <div class="form-group">
                    <label for="glucoseLevel">Nivel de Glucosa</label>
                    <asp:TextBox ID="glucoseLevel" TextMode="Number" CssClass="form-control" placeholder="Nivel de Glucosa" runat="server" required></asp:TextBox>
                </div>

                <!-- Input for glucose level - End -->

                <!-- Input for ketones level - Start -->

                <div class="form-group">
                    <label for="ketonesLevel">Nivel de Cetonas</label>
                    <asp:TextBox ID="ketonesLevel" TextMode="Number" CssClass="form-control" placeholder="Nivel de Cetonas" runat="server"></asp:TextBox>
                </div>

                <!-- Input for ketones level - End -->

                <h2>Notas</h2>

                <!-- Input for adding notes - Start -->

                <div class="form-group">
                    <label for="notes">Notas</label>
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" CssClass="form-control" Rows="5" placeholder="Agrega notas aquí" runat="server"></asp:TextBox>
                </div>

                <!-- Input for adding notes - End -->

            </div>
            <div class="col-md-6">

                <!-- Medications Register - Start -->

                <h3>Registro de Medicamentos</h3>
                <div class="form-group" id="medicationEntries">
                    <div id="medicationContainer">

                        <!-- Medication entry fields - Start -->

                        <div class="medicationEntry">

                            <!-- Dropdown list for selecting a medication -->
                            <asp:DropDownList ID="ddlMedication" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Selecciona un Medicamento" Value="" />
                            </asp:DropDownList>

                            <!-- Input for quantity -->
                            <asp:TextBox TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server"></asp:TextBox>

                            <br />

                        </div>

                        <!-- Medication entry fields - Start -->

                    </div> 
                    <br />

                    <!-- Button to add medication entry -->
                    <button type="button" id="addMedication" class="btn btn-secondary text-black">Agregar Otro Medicamento</button>

                    <!-- Medications Register - End -->

                </div>
            </div>
        </div>

        <!-- Button to save data -->
        <asp:Button ID="btnSave" runat="server" Text="Guardar Datos" CssClass="btn btn-primary" OnClick="SaveData_Click" />

    </div>

    <!-- Form End -->

</asp:Content>
