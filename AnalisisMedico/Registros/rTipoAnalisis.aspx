<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="rTipoAnalisis.aspx.cs" Inherits="AnalisisMedico.Registros.rTipoAnalisis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
    <div class="form-row justify-content-center">
        <aside class="col-sm-8">
            <div class="card">
                <div class="card-header text-uppercase text-center text-primary">Registro Tipo Analisis</div>
                <article class="card-body">
                    <form>
                        <div class="col-md-6 col-md-offset-3">
                            <%--Id--%>
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" class="text-success" Text="Id"></asp:Label>
                                    <asp:Button class="btn btn-outline-success btn-sm" ID="BuscarButton" runat="server" Text="Buscar" OnClick="BuscarButton_Click" />
                                    <asp:TextBox class="form-control" type="number" ID="IdTextBox" Text="0" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="IdRegularExpressionValidator" runat="server" ErrorMessage="Solo Números" ControlToValidate="IdTextBox" ValidationExpression="^[0-9]*$" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-md-offset-3">
                            <%--Descripcion--%>
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" class="text-success" Text="Descripcion"></asp:Label>
                                    <asp:TextBox class="form-control" type="text" ID="DescripcionTextBox" placeholder="Descripcion" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="El campo &quot;Descripcion&quot; esta vacio" ControlToValidate="DescripcionTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Campo Descripcion es obligatorio" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>     
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-6 col-md-offset-3">
                             <%--Precio--%>
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" class="text-success" Text="Precio"></asp:Label>
                                    <asp:TextBox class="form-control" textmode="Number" ID="PrecioTextBox" placeholder="0" runat="server"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="Valida" runat="server" ErrorMessage="El campo &quot;Precio&quot; esta vacio" ControlToValidate="PrecioTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Campo Precio es obligatorio" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <br>
                        <asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
                        <div class="panel-footer">
                            <div class="text-center">
                                <div class="form-group" style="display: inline-block">
                                    <asp:Button Text="Nuevo" class="btn btn-outline-primary btn-sm" runat="server" ID="nuevoButton" OnClick="nuevoButton_Click" />
                                    <asp:Button Text="Guardar" class="btn btn-outline-success btn-sm" runat="server" ID="guadarButton" OnClick="guadarButton_Click" ValidationGroup="Guardar" />
                                    <asp:Button Text="Eliminar" class="btn btn-outline-danger btn-sm" runat="server" ID="eliminarButton" OnClick="eliminarButton_Click" />
                                </div>
                            </div>
                        </div>

                    </form>
                </article> 
            </div>
      </aside>
    </div>
    <br>
</asp:Content>