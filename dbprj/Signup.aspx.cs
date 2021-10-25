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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("./index.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "")
            {
                Response.Write("<script>alert('名稱或密碼不得為空!');</script>");
            }
            else if (TextBox1.Text.Length > 8)
                Response.Write("<script>alert('名稱長度超過8');</script>");
            else if (TextBox2.Text.Length > 16)
                Response.Write("<script>alert('密碼長度超過16');</script>");
            else if (TextBox3.Text.Length > 10)
                Response.Write("<script>alert('電話超過10位');</script>");
            else
            {
                SqlConnection con = new SqlConnection("Data Source=DESKTOP-EPMPSBD;Initial Catalog=GAMEDB;User ID=sa;Password=sqlserverdb");
                SqlDataAdapter daMember = new SqlDataAdapter
                        ("SELECT * from Member WHERE name='" + TextBox1.Text + "'", con);
                DataTable dt = new DataTable();
                daMember.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('使用者名稱重複!');</script>");


                }
                else
                {
                    Session["nowTime"] = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"); ;
                    SqlDataSource1.Insert();
                    //Response.Redirect("./index.aspx");
                    Response.Write("<script>alert('註冊成功!');location.href='index.aspx';</script>");
                }
            }
        }
    }
}