using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyForumApp
{
    public class PropertyService : DataService
    {

        public int TechnologyID { get; set; }
        public string TechnologyName { get; set; }

        public int UserID { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public DateTime DOB { get; set; }
        public DateTime RegDate { get; set; }
        public bool IsActive { get; set; }

        public int QueID { get; set; }
        public string QuestionDetails { get; set; }
        public string QuestionImage { get; set; }
        public DateTime QuestionDate { get; set; }
        public bool IsSolved { get; set; }

        public int AnswerID { get; set; }
        public string AnswerDetails { get; set; }
        public DateTime AnsDate { get; set; }
    }
}