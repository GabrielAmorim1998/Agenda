using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agenda_do_amor
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      

        protected void SqlDataSource1Usuarios_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
          
        }

        protected void SqlDataSource1Usuarios(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                lMsg.Text = "Inserindo um registro duplicado ou com campos em branco";
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSource1Usuarios_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                lMsg.Text = "Alterando um registro sem informar todos os campos";
                e.ExceptionHandled = true;
            }
        }
    }
}
