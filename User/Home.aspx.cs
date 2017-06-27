using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyForumApp.User
{
    public partial class Home : System.Web.UI.Page
    {
        PropertyService PS = new PropertyService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] == null)
            {
                Response.Redirect("SignIn.aspx");
            }
            if (!IsPostBack)
            {
                FillDataListQuestions();
            }
        }

        private void FillDataListQuestions()
        {
            DataList1.DataSource = PS.GetAllQuestionsByTechnology(Convert.ToInt16(((DataTable)Session["UProfile"]).Rows[0]["FkTechID"].ToString()));
            DataList1.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            if (fpImage.HasFile)
            {
                string FileNameFormat = "CF_" + Session["UID"].ToString() + "_" + System.DateTime.Now.Day + "_" + DateTime.Now.Month + "_" + DateTime.Now.Year + "_" + System.DateTime.Now.Hour + "_" + DateTime.Now.Minute + "_" + DateTime.Now.Second;
                //Response.Write(FileNameFormat);
                string fpPath = "../QuestionImages/";
                string imgName = fpImage.PostedFile.FileName;
                string[] imgsData = imgName.Split('.');
                imgName = FileNameFormat + "." + imgsData[1];
                fpImage.SaveAs(Server.MapPath(fpPath + imgName));
                PS.QuestionImage = fpPath + imgName;
            }
            else
            {
                PS.QuestionImage = "";
            }
            PS.QuestionDetails = txtQuestionDetails.Text;
            PS.UserID = Convert.ToInt16(Session["UID"].ToString());
            PS.TechnologyID = Convert.ToInt16(((DataTable)Session["UProfile"]).Rows[0]["FkTechID"].ToString());
            if (PS.AddNewQuestion(PS))
            {
                FillDataListQuestions();
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Image img = (Image)e.Item.FindControl("Image1");
            if (img.ImageUrl == "")
            {
                img.Visible = false;
            }
            else
            {
                img.Visible = true;
            }

            PS.QueID = Convert.ToInt16(DataList1.DataKeys[e.Item.ItemIndex].ToString());
            DataList DataListAnswers = (DataList)e.Item.FindControl("DataListAnswers");
            DataListAnswers.DataSource = PS.GetAnswersByQueID(PS.QueID);
            DataListAnswers.DataBind();


        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ReplyBtn")
            {
                Panel pnlAnswers = (Panel)e.Item.FindControl("pnlAnswers");
                pnlAnswers.Visible = true;
            }

            if (e.CommandName == "SubmitAns")
            {
                PS.AnswerDetails = ((TextBox)e.Item.FindControl("txtAnswer")).Text;
                PS.QueID = Convert.ToInt16(DataList1.DataKeys[e.Item.ItemIndex].ToString());
                PS.UserID = Convert.ToInt16(Session["UID"].ToString());
                if (PS.SubmitAnswer(PS))
                {
                    FillDataListQuestions();
                }
            }
        }

        protected void DataListAnswers_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Like")
            {
                //string[] vals = e.CommandArgument.ToString().Split(',');
                LinkButton lnkLike = (LinkButton)e.Item.FindControl("LinkButton2");
                bool IsLiked = false;
                if (lnkLike.Text == "Like")
                {
                    IsLiked = true;
                }
                else
                {
                    IsLiked = false;
                }

                PS.LikeUnLikeAns(Convert.ToInt16(e.CommandArgument.ToString()), Convert.ToInt16(Session["UID"].ToString()), IsLiked);
                FillDataListQuestions();
            }
        }

        protected void DataListAnswers_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkLike = (LinkButton)e.Item.FindControl("LinkButton2");
            int AnsID = Convert.ToInt16(lnkLike.CommandArgument.ToString());
            int UserID = Convert.ToInt16(Session["UID"].ToString());

            if (PS.IsLiked(AnsID, UserID))
            {
                lnkLike.Text = "UnLike";
            }
            else
            {
                lnkLike.Text = "Like";
            }

            Label lblLikeCounter = (Label)e.Item.FindControl("lblLikeCounter");
            lblLikeCounter.Text = PS.GetLikeCount(AnsID).ToString();

        }
    }
}