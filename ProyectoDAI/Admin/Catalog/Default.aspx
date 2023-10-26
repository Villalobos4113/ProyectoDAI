<%@ Page Title="Catalogo" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoDAI.Admin.Catalog.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-white">
        <br />
        <h2>Administración de Catálogos</h2>
        <hr /><br />

        <div class="form-group">
            <asp:Label ID="lblTables" runat="server" Text="Selecciona un catálogo"></asp:Label>
            <asp:DropDownList ID="ddlTables" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTables_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem>Selecciona un catálogo</asp:ListItem>
                <asp:ListItem>Gender</asp:ListItem>
                <asp:ListItem>PartsOfDay</asp:ListItem>
                <asp:ListItem>Exercises</asp:ListItem>
                <asp:ListItem>Intensity</asp:ListItem>
                <asp:ListItem>Medicine</asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="True" AutoGenerateSelectButton="true" DataKeyNames="id" OnSelectedIndexChanged="gvItems_SelectedIndexChanged" CssClass="table table-bordered"></asp:GridView>

        <div class="col-md-6">
            <asp:TextBox ID="txbNewItem" runat="server" placeholder="Nuevo Elemento" CssClass="form-control" Visible="false"></asp:TextBox>
            <asp:Button ID="btnInsert" runat="server" Text="Insertar" OnClick="btnInsert_Click" CssClass="btn btn-primary" Visible="false" />
        </div>

        <div class="col-md-6">
            <asp:FormView ID="fvItem" runat="server" DefaultMode="ReadOnly">
                <ItemTemplate>
                    <asp:TextBox ID="txbNewValue" runat="server" placeholder="Nuevo Valor" CssClass="form-control" Text='<%# Eval("value") %>'></asp:TextBox>
                    <asp:Button ID="btnUpdate" runat="server" Text="Actualizar" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </div>
</asp:Content>