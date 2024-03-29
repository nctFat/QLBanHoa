using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBanHoa
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            //Tạo sql để thêm nhân viên
            string sql = "insert into hoa(tenhoa,gia,hinh,maloai,ngaydang,soluotxem)" +
                " values(@tenhoa,@gia,@hinh,@maloai,@ngaydang,@soluotxem)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //Truyền giá trị cho các tham số truyền vào
            cmd.Parameters.AddWithValue("@tenhoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);
            if (FHinh.HasFile)
            {
                string duong_dan = Server.MapPath("~/Hinh_San_Pham/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapNhat.Text);
            cmd.Parameters.AddWithValue("@soluotxem", 0);
            cmd.Parameters.AddWithValue("@maloai", ddlLoaiHoa.SelectedValue);
            //Thực hiện câu lệnh truy vấn sql
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("XemHoa.aspx");
            else
                lblketqua.Text = "Thêm tin thất bại";
        }
    }
}