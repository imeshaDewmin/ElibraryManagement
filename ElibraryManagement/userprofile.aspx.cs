using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ElibraryManagement
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null || string.IsNullOrEmpty(Session["username"].ToString()))
                {
                    Response.Write("<script>alert('Session Expired. Please login again.');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {
                    GetUserBookData();
                    GetUserPersonalDetails();
                }
            }
        }

        // Update button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();
            }
        }

        // User defined functions

        void updateUserPersonalDetails()
        {
            string password = "";
            if (TextBox10.Text.Trim() == "")
            {
                password = TextBox9.Text.Trim();
            }
            else
            {
                password = TextBox10.Text.Trim();
            }
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update member_master_tbl set full_name=@full_name, dob=@dob, contact_no=@contact_no, email=@email, province=@province, city=@city, postalcode=@postalcode, full_address=@full_address, password=@password, account_status=@account_status WHERE member_id=@member_id", con);

                    cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@province", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@postalcode", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@account_status", "pending");
                    cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString().Trim());

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                        GetUserPersonalDetails();
                        GetUserBookData();
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid entry');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetUserPersonalDetails()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id=@member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        DataRow row = dt.Rows[0];
                        TextBox1.Text = row["full_name"].ToString();
                        TextBox2.Text = row["dob"].ToString();
                        TextBox3.Text = row["contact_no"].ToString();
                        TextBox4.Text = row["email"].ToString();
                        DropDownList1.SelectedValue = row["province"].ToString().Trim();
                        TextBox6.Text = row["city"].ToString();
                        TextBox7.Text = row["postalcode"].ToString();
                        TextBox5.Text = row["full_address"].ToString();
                        TextBox8.Text = row["member_id"].ToString();
                        TextBox9.Text = row["password"].ToString();

                        Label1.Text = dt.Rows[0]["account_status"].ToString().Trim();

                        if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-success");
                        }
                        else if (dt.Rows[0]["account_status"].ToString().Trim() == "pending")
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                        }
                        else if (dt.Rows[0]["account_status"].ToString().Trim() == "deactive")
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                        }
                        else
                        {
                            Label1.Attributes.Add("class", "badge badge-pill badge-info");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetUserBookData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where member_id=@member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", Session["username"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime returnDate;
                    if (DateTime.TryParse(e.Row.Cells[5].Text, out returnDate))
                    {
                        if (DateTime.Today > returnDate)
                        {
                            e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
