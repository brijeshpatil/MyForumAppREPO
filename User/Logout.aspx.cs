using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyForumApp.User
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UName"] != null)
            {
                Session.Remove("UName");
            }

            if (Session["UID"] != null)
            {
                Session.Remove("UID");
            }

            if (Session["UProfile"] != null)
            {
                Session.Remove("UProfile");
            }
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("SignIn.aspx");
        }
    }
}