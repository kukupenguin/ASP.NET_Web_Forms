using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbprj
{
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("./index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("./index.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            SqlDataSource1.Update();
            Response.Redirect(Request.Url.ToString());

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Delete();
            Session["username"] = null;
            //Response.Redirect("./index.aspx");
            Response.Write("<script>alert('刪除成功!');location.href='index.aspx';</script>");
        }
    }
}