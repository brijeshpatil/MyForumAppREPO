using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MyForumApp
{
    public class DataService
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;

        #region ManageTechnologies

        /// <summary>
        /// To Add New Technology
        /// </summary>
        /// <param name="TechnologyName"></param>
        /// <returns></returns>
        public bool AddNewTechnology(PropertyService P)
        {
            cmd = new SqlCommand("AddNewTechnology", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TName", P.TechnologyName);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }

        public DataTable GetAllTechnologies()
        {
            da = new SqlDataAdapter("GetAllTechnologies", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }


        public bool UpdateTechnology(PropertyService P)
        {
            cmd = new SqlCommand("UpdateTechnology", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TID", P.TechnologyID);
            cmd.Parameters.AddWithValue("@TName", P.TechnologyName);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }

        public bool DeleteTechnology(PropertyService P)
        {
            cmd = new SqlCommand("DeleteTechnology", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TID", P.TechnologyID);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }
        #endregion

        #region ManageUser

        public bool RegNewUser(PropertyService P)
        {
            cmd = new SqlCommand("RegNewUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", P.Name);
            cmd.Parameters.AddWithValue("@Gender", P.Gender);
            cmd.Parameters.AddWithValue("@DOB", P.DOB);
            cmd.Parameters.AddWithValue("@UName", P.UserName);
            cmd.Parameters.AddWithValue("@Pass", P.Password);
            cmd.Parameters.AddWithValue("@TID", P.TechnologyID);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }

        public DataTable SignIn(string UserName, string Password)
        {
            cmd = new SqlCommand("SignIn", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UName", UserName);
            cmd.Parameters.AddWithValue("@Pass", Password);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        //public bool SignIn(string UserName, string Password)
        //{
        //    cmd = new SqlCommand("SignIn", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@UName", UserName);
        //    cmd.Parameters.AddWithValue("@Pass", Password);
        //    con.Open();
        //    bool Status = Convert.ToBoolean(cmd.ExecuteScalar());
        //    con.Close();
        //    return Status;
        //}
        public DataTable GetAllUsers()
        {
            da = new SqlDataAdapter("GetAllUsers", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public void ManageUser(int UserID, bool Status)
        {
            cmd = new SqlCommand("ManageUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UID", UserID);
            cmd.Parameters.AddWithValue("@Status", Status);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataTable GetUserProfile(int UserID)
        {
            da = new SqlDataAdapter("GetUserProfile", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@UID", UserID);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }


        public bool GenerateSessionID (int UserID)
        {
            cmd = new SqlCommand("insert into SEssionTbl values(@SID,@UID)",con);
            cmd.Parameters.AddWithValue("@SID", Guid.NewGuid());
            cmd.Parameters.AddWithValue("@UID", UserID);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }

        public Guid GetSessionID(int UserID)
        {
            da = new SqlDataAdapter("select SessionID from SEssionTbl where FkUID=@UID",con);
            da.SelectCommand.Parameters.AddWithValue("@UID", UserID);
            dt = new DataTable();
            da.Fill(dt);
            return Guid.Parse(dt.Rows[0]["SessionID"].ToString());
        }

        #endregion

        #region ManageQuestions

        public bool AddNewQuestion(PropertyService P)
        {
            cmd = new SqlCommand("AddNewQuestion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UID", P.UserID);
            cmd.Parameters.AddWithValue("@TID", P.TechnologyID);
            cmd.Parameters.AddWithValue("@QDetails", P.QuestionDetails);
            cmd.Parameters.AddWithValue("@QImage", P.QuestionImage);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }

        public DataTable GetAllQuestionsByTechnology(int TechnologyID)
        {
            da = new SqlDataAdapter("GetAllQuestionsByTechnology", con);
            da.SelectCommand.CommandType=CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@TID", TechnologyID);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        #endregion

        #region ManageAnswers

        public bool SubmitAnswer(PropertyService P)
        {
            cmd = new SqlCommand("SubmitAnswer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@QID", P.QueID);
            cmd.Parameters.AddWithValue("@UID", P.UserID);
            cmd.Parameters.AddWithValue("@ADetails", P.AnswerDetails);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }

        public DataTable GetAnswersByQueID(int QueID)
        {
            da = new SqlDataAdapter("GetAnswersByQueID", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@QID", QueID);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public bool LikeUnLikeAns(int AnsID, int UserID,bool IsLike)
        {
            cmd = new SqlCommand("LikeUnLikeAns", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IsLike", IsLike);
            cmd.Parameters.AddWithValue("@AnsID",AnsID);
            cmd.Parameters.AddWithValue("@UID",UserID);
            con.Open();
            bool Status = Convert.ToBoolean(cmd.ExecuteNonQuery());
            con.Close();
            return Status;
        }

        public bool IsLiked(int AnsID,int UserID)
        {
            cmd = new SqlCommand("IsLiked", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AID", AnsID);
            cmd.Parameters.AddWithValue("@UID", UserID);
            con.Open();
            bool IsLiked = Convert.ToBoolean(cmd.ExecuteScalar());
            con.Close();
            return IsLiked;
        }

        public int GetLikeCount(int AnsID)
        {
            cmd = new SqlCommand("GetLikeCount", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@AID", AnsID);
            con.Open();
            int LikeCounter = Convert.ToInt16(cmd.ExecuteScalar());
            con.Close();
            return LikeCounter;
        }

        #endregion

    }
}