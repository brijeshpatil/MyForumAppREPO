using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyForumApp.User
{
    public partial class SignIn : System.Web.UI.Page
    {

        PropertyService PS = new PropertyService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PS.UserName = txtUName.Text;
            PS.Password = txtPass.Text;
            DataTable dt = PS.SignIn(PS.UserName, PS.Password);

            if (dt.Rows.Count > 0)
            {

                if (Convert.ToBoolean(dt.Rows[0]["IsActive"].ToString()))
                {
                    Session["UName"] = txtUName.Text;
                    Session["UID"] = dt.Rows[0]["userid"].ToString();
                    Session["UProfile"] = dt;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblError.Text = "You Account Is Deactivated.!!<br/>Please Contact To Administration.!!!";
                }
            }
            else
            {
                lblError.Text = "Invalid UserName or Password.!!!";
            }

            //if (PS.SignIn(PS.UserName, PS.Password))
            //{
            //    Session["UName"] = txtUName.Text;
            //    Response.Redirect("Home.aspx");
            //}
            //else
            //{
            //    lblError.Text = "Invalid UserName or Password.!!!";
            //}
        }
    }
}