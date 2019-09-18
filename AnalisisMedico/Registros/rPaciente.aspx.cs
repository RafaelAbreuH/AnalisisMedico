using AnalisisMedico.Utils;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace AnalisisMedico.Registros
{
    public partial class rUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id = Utilss.ToInt(Request.QueryString["id"]);
                if (id > 0)
                {
                    RepositorioBase<Pacientes> repositorio = new RepositorioBase<Pacientes>();
                    var registro = repositorio.Buscar(id);

                    if (registro == null)
                    {
                        Utilss.ShowToastr(this.Page, "Registro no existe", "Error", "error");
                    }
                    else
                    {
                        LlenaCampos(registro);
                    }
                }
            }
        }


        protected void Limpiar()
        {
            PacienteIdTextBox.Text = "0";
            nombreTextBox.Text = string.Empty;
            DireccionTextBox.Text = string.Empty;
            TelefonoTextBox.Text = string.Empty;
        }

        protected Pacientes LlenaClase(Pacientes pacientes)
        {
            pacientes.PacienteId = Utilss.ToInt(PacienteIdTextBox.Text);
            pacientes.Nombres = nombreTextBox.Text;
            pacientes.Direccion = DireccionTextBox.Text;
            pacientes.Telefono = TelefonoTextBox.Text;

            return pacientes;
        }

        private void LlenaCampos(Pacientes pacientes)
        {
            PacienteIdTextBox.Text = Convert.ToString(pacientes.PacienteId);
            nombreTextBox.Text = pacientes.Nombres;
            DireccionTextBox.Text = pacientes.Direccion;
            TelefonoTextBox.Text = pacientes.Telefono;
        }

        private bool ExisteEnLaBaseDeDatos()
        {
            RepositorioBase<Pacientes> repositorio = new RepositorioBase<Pacientes>();
            Pacientes pacientes = repositorio.Buscar(Utilss.ToInt(PacienteIdTextBox.Text));
            return (pacientes != null);
        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Pacientes> repositorio = new RepositorioBase<Pacientes>();
            var pacientes = repositorio.Buscar(Utilss.ToInt(PacienteIdTextBox.Text));

            if (pacientes != null)
            {
                Limpiar();
                LlenaCampos(pacientes);
                Utilss.ShowToastr(this, "Busqueda exitosa", "Exito", "success");
            }
            else
            {
                Utilss.ShowToastr(this.Page, "El paciente que intenta buscar no existe", "Error", "error");
                Limpiar();
            }
        }

        protected void nuevoButton_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void guadarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Pacientes> Repositorio = new RepositorioBase<Pacientes>();
            Pacientes pacientes = new Pacientes();
            bool paso = false;

            pacientes = LlenaClase(pacientes);

            if (Utilss.ToInt(PacienteIdTextBox.Text) == 0)
            {
                paso = Repositorio.Guardar(pacientes);
                Limpiar();
            }
            else
            {
                if (!ExisteEnLaBaseDeDatos())
                {

                    Utilss.ShowToastr(this, "No se pudo guardar", "Error", "error");
                    return;
                }
                paso = Repositorio.Modificar(pacientes);
                Limpiar();
            }

            if (paso)
            {
                Utilss.ShowToastr(this, "Guardado", "Exito", "success");
                return;
            }
            else

                Utilss.ShowToastr(this, "No se pudo guardar", "Error", "error");
        }

        protected void eliminarButton_Click(object sender, EventArgs e)
        {
            if (Utilss.ToInt(PacienteIdTextBox.Text) > 0)
            {
                int id = Convert.ToInt32(PacienteIdTextBox.Text);
                RepositorioBase<Pacientes> repositorio = new RepositorioBase<Pacientes>();
                if (repositorio.Eliminar(id))
                {

                    Utilss.ShowToastr(this.Page, "Eliminado con exito!!", "Eliminado", "info");
                }
                else
                    Utilss.ShowToastr(this.Page, "Fallo al Eliminar :(", "Error", "error");
                Limpiar();
            }
            else
            {
                Utilss.ShowToastr(this.Page, "No se pudo eliminar, paciente no existe", "error", "error");
            }
        }
    }
}