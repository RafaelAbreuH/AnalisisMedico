using AnalisisMedico.Utils;
using BLL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisMedico.Registros
{
    public partial class rTipoAnalisis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id = Utilss.ToInt(Request.QueryString["id"]);
                if (id > 0)
                {
                    RepositorioBase<TipoAnalisis> repositorio = new RepositorioBase<TipoAnalisis>();
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
            IdTextBox.Text = "0";
            DescripcionTextBox.Text = string.Empty;
            PrecioTextBox.Text = "0";
        }

        protected TipoAnalisis LlenaClase(TipoAnalisis tipoAnalisis)
        {
            tipoAnalisis.TiposId = Utilss.ToInt(IdTextBox.Text);
            tipoAnalisis.Descripcion = DescripcionTextBox.Text;
            tipoAnalisis.Precio = 0;
            return tipoAnalisis;
        }

        private void LlenaCampos(TipoAnalisis tipoAnalisis)
        {
            IdTextBox.Text = Convert.ToString(tipoAnalisis.TiposId);
            DescripcionTextBox.Text = tipoAnalisis.Descripcion;
            PrecioTextBox.Text = tipoAnalisis.Precio.ToString();
        }

        private bool ExistEnLaBaseDeDatos()
        {
            RepositorioBase<TipoAnalisis> repositorio = new RepositorioBase<TipoAnalisis>();
            TipoAnalisis tipoAnalisis = repositorio.Buscar(Utilss.ToInt(IdTextBox.Text));
            return (tipoAnalisis != null);
        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<TipoAnalisis> repositorio = new RepositorioBase<TipoAnalisis>();
            var tipo = repositorio.Buscar(Utilss.ToInt(IdTextBox.Text));

            if (tipo != null)
            {
                Limpiar();
                LlenaCampos(tipo);
                Utilss.ShowToastr(this, "Busqueda exitosa", "Exito", "success");
            }
            else
            {
                Utilss.ShowToastr(this.Page, "El usuario que intenta buscar no existe", "Error", "error");
                Limpiar();
            }
        }

        protected void nuevoButton_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void guadarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<TipoAnalisis> Repositorio = new RepositorioBase<TipoAnalisis>();
            TipoAnalisis tipoAnalisis = new TipoAnalisis();
            bool paso = false;

            tipoAnalisis = LlenaClase(tipoAnalisis);

            if (Utilss.ToInt(IdTextBox.Text) == 0)
            {
                paso = Repositorio.Guardar(tipoAnalisis);
                Limpiar();
            }
            else
            {
                if (!ExistEnLaBaseDeDatos())
                {

                    Utilss.ShowToastr(this, "No se pudo guardar", "Error", "error");
                    return;
                }
                paso = Repositorio.Modificar(tipoAnalisis);
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
            if (Utilss.ToInt(IdTextBox.Text) > 0)
            {
                int id = Convert.ToInt32(IdTextBox.Text);
                RepositorioBase<TipoAnalisis> repositorio = new RepositorioBase<TipoAnalisis>();
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
                Utilss.ShowToastr(this.Page, "No se pudo eliminar, usuario no existe", "error", "error");
            }
        }
    }
}