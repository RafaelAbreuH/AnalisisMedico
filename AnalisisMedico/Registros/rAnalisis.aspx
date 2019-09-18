<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="rAnalisis.aspx.cs" Inherits="AnalisisMedico.Registros.rAnalisis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="card">
       <div class="card-header text-uppercase text-center text-primary">Registro Analisis</div>
   
        <div class="panel-body">
            <div class="card-body">
                <div class="container">
                    <div class="form-row">

                        <%--AnalisisId--%>
                        <div class="col-md-2 col-md-offset-3">
                            <asp:Label ID="AnalisisIdLabel" Text="AnalisisId" runat="server" />
                             <asp:Button class="btn btn-outline-success btn-sm" ID="Button1" runat="server" Text="Buscar" OnClick="BuscarButton_Click" />
                            <asp:TextBox ID="AnalisisIdTextBox" class="form-control input-sm" TextMode="Number" runat="server" placeholder="0"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVId" ValidationGroup="Buscar" ControlToValidate="AnalisisIdTextBox" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>


                        <%--Fecha--%>
                        <div class="col-md-2 col-md-offset-2">
                            <asp:Label Text="Fecha" runat="server" />
                            <asp:TextBox ID="FechaTextBox" class="form-control input-sm" TextMode="Date" runat="server"></asp:TextBox>
                        </div>

                        <%--Paciente--%>
                        <div class="col-md-6 col-md-offset-3">
                            <asp:Label Text="Paciente" runat="server" />
                            <asp:DropDownList ID="PacienteDropDownList" AutoPostBack="true" class="form-control input-sm" runat="server">
                                <asp:ListItem Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-9 col-md-offset-3">
                            <asp:Label Text="" runat="server" />
                        </div>

                        <%--Tipo Analisis--%>

                        <div class="col-md-2 col-md-offset-3">
                            <asp:Label Text="Tipos Analisis" runat="server" />
                            <asp:DropDownList ID="TipoAnalisisDropDownList" AutoPostBack="true" CssClass="form-control" runat="server">
                                <asp:ListItem Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TipoAnalisisDropDownList" ValidationGroup="Guardar" ErrorMessage="TipoAnalisis: Seleccione un tipo de analisis" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>



                        <!--Resultado-->
                        <div class="col-md-2 col-md-offset-1">
                            <asp:Label ID="Label4" runat="server" Text="Resultado">Resultado</asp:Label><br />

                            <asp:TextBox ID="ResultadoTextBox" runat="server" onkeypress="return isLetterKey(event)" placeholder="Ej. Positivo" class="form-control input-sm" Style="font-size: small"></asp:TextBox>
                        </div>


                        <!--Agregar-->
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <div class="input-group-append">
                                <br />
                                <asp:Button Text="Agregar" class="btn btn-primary" runat="server" ID="AgregarButton" OnClick="AgregarButton_Click" />
                            </div>
                            <br />
                        </div>


                        <%--Balance--%>
                        <div class="col-md-3 col-md-offset-3">
                            <asp:Label ID="Balance" runat="server" Text="Balance">Balance</asp:Label><br />
                            <asp:TextBox ID="BalanceTextBox" ReadOnly="true" runat="server" class="form-control input-sm"></asp:TextBox>
                        </div>


                        <%--Monto--%>
                        <div class="col-md-3 col-md-offset-1">
                            <asp:Label ID="Monto" runat="server" Text="Monto">Monto</asp:Label><br />
                            <asp:TextBox ID="MontoTextBox" ReadOnly="true" runat="server" class="form-control input-sm"></asp:TextBox>
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>

                <asp:GridView ID="DetalleGridView" class="col-md-3 col-md-offset-3" runat="server" DataKeyNames="DetalleId" AllowPaging="true" PageSize="10" ShowHeaderWhenEmpty="false" AutoGenerateDeleteButton="true" CellPadding="4" ForeColor="#333333" OnRowDeleting="Grid_RowDeleting" GridLines="None" Width="767px" AutoGenerateColumns="false"   >
                    <Columns>

                        <asp:BoundField DataField="Descripcion" HeaderText="Analisis" />
                        <asp:BoundField />
                        <asp:BoundField DataField="Resultado" HeaderText="Resultado" />
                        <asp:BoundField />
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="text-align: center">Se han eliminado todas las filas</div>
                    </EmptyDataTemplate>
                    <AlternatingRowStyle BackColor="White" />

                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />

                </asp:GridView>
                <br />
                <br />
                <br />
                <div class="panel-footer">
                            <div class="text-center">
                                <div class="form-group" style="display: inline-block">
                                    <asp:Button Text="Nuevo" class="btn btn-outline-primary btn-sm" runat="server" ID="nuevoButton" OnClick="nuevoButton_Click" />
                                    <asp:Button Text="Guardar" class="btn btn-outline-success btn-sm" runat="server" ID="guadarButton" OnClick="guadarButton_Click" ValidationGroup="Guardar" />
                                    <asp:Button Text="Eliminar" class="btn btn-outline-danger btn-sm" runat="server" ID="eliminarButton" OnClick="eliminarButton_Click" />
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div>
</asp:Content>
