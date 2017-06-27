using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyForumApp.User
{
    public partial class SignUp : System.Web.UI.Page
    {
        PropertyService PS = new PropertyService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                FillDrpTechnologies();
            }
        }

        private void FillDrpTechnologies()
        {
            drpTechnologies.DataSource = PS.GetAllTechnologies();
            drpTechnologies.DataTextField = "TechName";
            drpTechnologies.DataValueField = "TechID";
            drpTechnologies.DataBind();
            ListItem li = new ListItem();
            li.Text = "Select Your Technology";
            li.Value = "0";
            drpTechnologies.Items.Insert(0, li);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PS.Name = txtName.Text;
            PS.Gender = drpGender.SelectedItem.Text;
            PS.UserName = txtUName.Text;
            PS.Password = txtCPass.Text;
            PS.TechnologyID = Convert.ToInt16(drpTechnologies.SelectedItem.Value);
            PS.DOB = Convert.ToDateTime(txtDBO.Text);
            if (PS.RegNewUser(PS))
            {
                Response.Redirect("SignIn.aspx");
            }
            else
            {
                lblError.Text = "Error...";
            }
        }
    }
}