﻿<%@ Page Title="Registrar" Language="C#" MasterPageFile="~/App/App.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ProyectoDAI.App.Tracking.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">

        <h1>Seguimiento de Ejercicio</h1>
        <h2>Registrar Datos</h2>
        <br />

        <!-- Dropdown for Selecting Start Time - Start -->

        <div class="form-group">
            <label for="ddlStartTime">Hora de Inicio</label>
            <asp:DropDownList ID="ddlStartTime" runat="server" CssClass="form-control" required>
                <asp:ListItem Text="Selecciona la hora de inicio" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Dropdown for Selecting Start Time - End -->
        
        <!-- Dropdown for Selecting End Time - Start -->

        <div class="form-group">
            <label for="ddlEndTime">Hora de Fin</label>
            <asp:DropDownList ID="ddlEndTime" runat="server" CssClass="form-control" required>
                <asp:ListItem Text="Selecciona la hora de fin" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Dropdown for Selecting End Time - End -->

        <!-- Dropdown for Selecting Exercise Type - Start -->

        <div class="form-group">
            <label for="ddlExerciseType">Tipo de Ejercicio</label>
            <asp:DropDownList ID="ddlExerciseType" runat="server" CssClass="form-control" required>
            </asp:DropDownList>
        </div>

        <!-- Dropdown for Selecting Exercise Type - End -->

        <!-- Dropdown for Selecting Intensity - Start -->

        <div class="form-group">
            <label for="ddlIntensity">Intensidad</label>
            <asp:DropDownList ID="ddlIntensity" runat="server" CssClass="form-control" required>
            </asp:DropDownList>
        </div>

        <!-- Dropdown for Selecting Intensity - End -->

        <!-- Input for Entering Consumed Calories - Start -->

        <div class="form-group">
            <label for="txbCalories">Calorias Consumidas</label>
            <asp:TextBox ID="txbCalories" TextMode="Number" CssClass="form-control" placeholder="Calorias Consumidas" runat="server"></asp:TextBox>
        </div>

        <!-- Input for Entering Consumed Calories - End -->

        <!-- Input for Adding Exercise Notes - Start -->

        <div class="form-group">
            <label for="txtExerciseNotes">Notas</label>
            <asp:TextBox ID="txtExerciseNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Agrega notas aquí"></asp:TextBox>
        </div>

        <!-- Input for Adding Exercise Notes - End -->

        <!-- Button to Save Data - Start -->
        <asp:Button ID="btnSave" runat="server" Text="Guardar Datos" CssClass="btn btn-primary" OnClick="SaveData_Click" />

    </div>
</asp:Content>
