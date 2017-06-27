using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyForumApp.Admin
{
    public partial class ManageUse : System.Web.UI.Page
    {
        PropertyService PS = new PropertyService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGridUsers();
            }
        }

        private void FillGridUsers()
        {
            GridView1.DataSource = PS.GetAllUsers();
            GridView1.DataBind();
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
            if (chkAll.Checked)
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                    chk.Checked = true;
                }
            }
            else
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                    chk.Checked = false;
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ChangeStatus")
            {
                CheckBox chkAll = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
                if (chkAll.Checked)
                {
                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        int UserID = Convert.ToInt16(GridView1.DataKeys[i].Value);
                        bool CurrentStatus = Convert.ToBoolean(((Label)GridView1.Rows[i].FindControl("lblStatus")).Text);
                        PS.ManageUser(UserID, !CurrentStatus);
                    }
                }
                else
                {
                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                        if (chk.Checked)
                        {
                            int UserID = Convert.ToInt16(GridView1.DataKeys[i].Value);
                            bool CurrentStatus = Convert.ToBoolean(((Label)GridView1.Rows[i].FindControl("lblStatus")).Text);
                            PS.ManageUser(UserID, !CurrentStatus);
                        }
                    }
                }
                FillGridUsers();
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                bool CurrentStatus = Convert.ToBoolean(((Label)GridView1.Rows[i].FindControl("lblStatus")).Text);
                if(CurrentStatus)
                {
                    GridView1.Rows[i].BackColor = System.Drawing.Color.AliceBlue;
                }
                else
                {
                    GridView1.Rows[i].BackColor = System.Drawing.Color.Gray;
                }
            }
        }
    }
}