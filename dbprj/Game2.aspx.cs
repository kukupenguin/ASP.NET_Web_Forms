using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dbprj
{
    public partial class Game2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["gId"] = "2";
                Session["nowTime"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");

                
                Button2.Text = Session["username"].ToString();
            }
            else
            {
                
                Response.Redirect("./index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["gId"] = null;
            Response.Redirect("./index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["gId"] = null;
            Response.Redirect("./Show.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = Request.Params["abc"];
            SqlDataSource2.Insert();
            Session["totPlayTimes"] = Convert.ToInt32(Session["totPlayTimes"]) + 1;
            SqlDataSource3.Update();
            Response.Redirect(Request.Url.ToString());
        }
    }
}