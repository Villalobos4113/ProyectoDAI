<%@ Page Title="Registrar" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ProyectoDAI.App.Report.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Form Start -->

    <div class="container text-white">

        <h1>Informe de Diabetes</h1>

        <div class="row">
            <div class="col-md-6">

                <h2>Registrar Datos</h2>
                <br />

                <!-- Dropdown list for selecting a time -->
                <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control" required></asp:DropDownList>
                
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
                    <div>

                        <!-- Medication entry fields - Start -->

                        <div class="medicationEntry">

                            <!-- Dropdown list for selecting a medication -->
                            <asp:DropDownList ID="ddlMedication1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMedication_SelectedIndexChanged"></asp:DropDownList>

                            <!-- Input for quantity -->
                            <asp:TextBox ID="txbMedication1" TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server"></asp:TextBox>

                            <br />

                        </div>

                        <!-- Medication entry fields - Start -->

                    </div> 

                    <div>

                        <!-- Medication entry fields - Start -->

                        <div class="medicationEntry">

                            <!-- Dropdown list for selecting a medication -->
                            <asp:DropDownList ID="ddlMedication2" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMedication_SelectedIndexChanged"></asp:DropDownList>

                            <!-- Input for quantity -->
                            <asp:TextBox ID="txbMedication2" TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server"></asp:TextBox>

                            <br />

                        </div>

                        <!-- Medication entry fields - Start -->

                    </div> 

                    <div>

                        <!-- Medication entry fields - Start -->

                        <div class="medicationEntry">

                            <!-- Dropdown list for selecting a medication -->
                            <asp:DropDownList ID="ddlMedication3" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMedication_SelectedIndexChanged"></asp:DropDownList>

                            <!-- Input for quantity -->
                            <asp:TextBox ID="txbMedication3" TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server"></asp:TextBox>

                            <br />

                        </div>

                        <!-- Medication entry fields - Start -->

                    </div> 

                    <div>

                        <!-- Medication entry fields - Start -->

                        <div class="medicationEntry">

                            <!-- Dropdown list for selecting a medication -->
                            <asp:DropDownList ID="ddlMedication4" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMedication_SelectedIndexChanged"></asp:DropDownList>

                            <!-- Input for quantity -->
                            <asp:TextBox ID="txbMedication4" TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server"></asp:TextBox>

                            <br />

                        </div>

                        <!-- Medication entry fields - Start -->

                    </div> 

                    <div>

                        <!-- Medication entry fields - Start -->

                        <div class="medicationEntry">

                            <!-- Dropdown list for selecting a medication -->
                            <asp:DropDownList ID="ddlMedication5" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMedication_SelectedIndexChanged"></asp:DropDownList>

                            <!-- Input for quantity -->
                            <asp:TextBox ID="txbMedication5" TextMode="Number" CssClass="form-control" placeholder="Cantidad" runat="server"></asp:TextBox>

                            <br />

                        </div>

                        <!-- Medication entry fields - Start -->

                    </div> 

                    <!-- Medications Register - End -->

                </div>
            </div>
        </div>

        <div class="error-message-container">

            <!-- Label for displaying error messages -->
            <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

            <!-- Button to save data -->
            <asp:Button ID="btnSave" runat="server" Text="Guardar Datos" CssClass="btn btn-primary" OnClick="SaveData_Click" />

        </div>

    </div>

    <!-- Form End -->

</asp:Content>
