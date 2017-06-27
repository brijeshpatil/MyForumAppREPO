using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyForumApp.Admin
{
    public partial class ManageTechnologies : System.Web.UI.Page
    {
        PropertyService PS = new PropertyService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGridTechnologies();
            }
        }

        private void FillGridTechnologies()
        {
            GridView1.DataSource = PS.GetAllTechnologies();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PS.TechnologyName = txtTName.Text;
            if (PS.AddNewTechnology(PS))
            {
                FillGridTechnologies();
                lblError.Text = "Record Saved.!!!";
            }
            else
            {
                lblError.Text = "Error.!!!";
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillGridTechnologies();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillGridTechnologies();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            PS.TechnologyID = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
            PS.TechnologyName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
            if (PS.UpdateTechnology(PS))
            {
                GridView1.EditIndex = -1;
                FillGridTechnologies();
            }
            else
            {
                lblError.Text = "Record Not Updated";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            PS.TechnologyID = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
            if (PS.DeleteTechnology(PS))
            {
                GridView1.EditIndex = -1;
                FillGridTechnologies();
            }
            else
            {
                lblError.Text = "Record Not Deleted";
            }
        }
    }
}