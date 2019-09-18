<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="rPaciente.aspx.cs" Inherits="AnalisisMedico.Registros.rUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
    <div class="form-row justify-content-center">
        <aside class="col-sm-8">
            <div class="card">
                <div class="card-header text-uppercase text-center text-primary">Registro Paciente</div>
                <article class="card-body">
                    <form>
                        <div class="col-md-6 col-md-offset-3">
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" class="text-success" Text="PacienteId"></asp:Label>
                                    <asp:Button class="btn btn-outline-success btn-sm" ID="BuscarButton" runat="server" Text="Buscar" OnClick="BuscarButton_Click" />
                                    <asp:TextBox class="form-control" type="number" ID="PacienteIdTextBox" Text="0" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="PacienteIdRegularExpressionValidator" runat="server" ErrorMessage="Solo Números" ControlToValidate="PacienteIdTextBox" ValidationExpression="^[0-9]*$" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-md-offset-3">
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" class="text-success" Text="Fecha"></asp:Label>
                                    <asp:TextBox class="form-control" ID="fechaTextBox" type="date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-6 col-md-offset-3">
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" class="text-success" Text="Nombre"></asp:Label>
                                    <asp:TextBox class="form-control" type="text" ID="nombreTextBox" placeholder="Nombre" runat="server"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="Valida" runat="server" ErrorMessage="El campo &quot;Nombres&quot; esta vacio" ControlToValidate="nombreTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Campo Nombres es obligatorio" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="nombreRegularExpressionValidator" runat="server" ErrorMessage="Solo Letras" ControlToValidate="nombreTextBox" ValidationExpression="(^[a-zA-Z'.\s]{1,20}$)" SetFocusOnError="True" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-6 col-md-offset-3">
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" class="text-success" Text="Número de Teléfono"></asp:Label>
                                    <asp:TextBox class="form-control" type="number" ID="TelefonoTextBox" placeholder="###-###-####" runat="server" MaxLength="10"></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="TelefonoRegularExpressionValidator" runat="server" ErrorMessage="Solo Números" ControlToValidate="TelefonoTextBox" ValidationExpression="^[0-9]*$" ValidationGroup="Guardar"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-6 col-md-offset-3">
                            <div class="container">
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" class="text-success" Text="Direccion"></asp:Label>
                                    <asp:TextBox class="form-control" type="direccion" ID="DireccionTextBox" placeholder="Direccion" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="DireccionRequiredFieldValidator1" runat="server" ErrorMessage="El campo &quot;Nombres&quot; esta vacio" ControlToValidate="DireccionTextBox" ForeColor="Red" Display="Dynamic" ToolTip="Campo Direccion es obligatorio" ValidationGroup="Guardar">*</asp:RequiredFieldValidator>                         
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
