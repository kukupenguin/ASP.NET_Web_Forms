using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;  //引用sql命名空間

namespace dbprj
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if( Session["username"] != null)
            {
                Label2.Text = "登出";
                Button2.Text = Session["username"].ToString();
                Button2.Style["display"] = "inline-block";
            }
           
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-EPMPSBD;Initial Catalog=GAMEDB;User ID=sa;Password=sqlserverdb");
            SqlDataAdapter daMember = new SqlDataAdapter
                    ("SELECT * from Member WHERE name='" + TextBox1.Text + "'and password='" + TextBox2.Text + "'", con);
            DataTable dt = new DataTable();
            daMember.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["mId"] = dt.Rows[0]["mId"];
                Session["username"] = TextBox1.Text;
                Session["totPlayTimes"] = dt.Rows[0]["totPlayTimes"];
                Label2.Text = "登出";
                Button2.Text = Session["username"].ToString();
                Button2.Style["display"] = "inline-block";
                Session["nowTime"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
                SqlDataSource1.Update();
            }
            else
            {
                Response.Write("<script>alert('登入失敗!');location.href='index.aspx';</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("./Signup.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("./Show.aspx");
        }
    }
}