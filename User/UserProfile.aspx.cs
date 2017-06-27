using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyForumApp.User
{
    public partial class UserProfile : System.Web.UI.Page
    {
        PropertyService PS = new PropertyService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] == null)
            {
                Response.Redirect("Logout.aspx");
            }

            if (!IsPostBack)
            {
                FIllDetails();
            }
        }

        private void FIllDetails()
        {
            int UserID = Convert.ToInt16(Session["UID"].ToString());
            DetailsView1.DataSource = PS.GetUserProfile(UserID);
            DetailsView1.DataBind();
        }

        protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            Label lblTech = (Label)DetailsView1.FindControl("Label5");

            DetailsView1.ChangeMode(e.NewMode);
            FIllDetails();

            if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            {
                DropDownList drpTech = (DropDownList)DetailsView1.FindControl("DropDownList1");
                drpTech.DataSource = PS.GetAllTechnologies();
                drpTech.DataTextField = "TechName";
                drpTech.DataValueField = "TechID";
                drpTech.DataBind();

                foreach (ListItem li in drpTech.Items)
                {
                    if (li.Text == lblTech.Text)
                    {
                        li.Selected = true;
                    }
                }
            }
        }

        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {

            int UserID = Convert.ToInt16(Session["UID"].ToString());
            if (PS.GenerateSessionID(UserID))
            {
                if (e.CommandName == "ChangePass")
                {
                    MailMessage mail = new MailMessage();
                    mail.To.Add("regarpappu9@gmail.com");
                    mail.From = new MailAddress("Your EmailID");
                    mail.Subject = "Password Reset Link";
                    string Body = "msg<br/><br/><a href='http://localhost:50562/User/GeneratePassword.aspx?SessionID=" + PS.GetSessionID(UserID) +"'>Click Here To Reset Link</a>";
                    mail.Body = Body;
                    mail.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential
                    ("Your EmailID", "Your Password");// Enter seders User name and password
                    smtp.EnableSsl = true;

                    smtp.Send(mail);
                }
            }
        }
    }
}