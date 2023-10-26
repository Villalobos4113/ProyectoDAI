<%@ Page Title="Reporte" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.Admin.Report.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <br />
        <h2>Reporte Flexible</h2>
        <hr /><br />

        <div class="form-group">
            <asp:Label ID="lblTables" runat="server" Text="Selecciona una tabla"></asp:Label>
                <asp:DropDownList ID="ddlTables" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTables_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem>Selecciona una tabla</asp:ListItem>
                <asp:ListItem>Gender</asp:ListItem>
                <asp:ListItem>PartsOfDay</asp:ListItem>
                <asp:ListItem>Exercises</asp:ListItem>
                <asp:ListItem>Intensity</asp:ListItem>
                <asp:ListItem>Medicine</asp:ListItem>
                <asp:ListItem>User</asp:ListItem>
                <asp:ListItem>Doctor</asp:ListItem>
                <asp:ListItem>Report</asp:ListItem>
                <asp:ListItem>ReportMedicines</asp:ListItem>
                <asp:ListItem>Tracking</asp:ListItem>
                <asp:ListItem>FollowUp</asp:ListItem>
                <asp:ListItem>UserMedicine</asp:ListItem>
                <asp:ListItem>ForumMessage</asp:ListItem>
                <asp:ListItem>UserDoctor</asp:ListItem>
            </asp:DropDownList>
        </div>

        <br /><br />

        <asp:GridView ID="gvData" runat="server" CssClass="table table-bordered">
        </asp:GridView>
    </div>
</asp:Content>
