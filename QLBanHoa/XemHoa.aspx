<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="QLBanHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* CSS inline cho danh sách thả xuống */
        #ddlLoai {
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin: 0 auto; /* Để căn giữa theo chiều ngang */
            display: block;
            width: fit-content; /* Độ rộng tự động theo nội dung */
        }

        /* CSS inline cho repeater items */
        .hoa-item {
            display: inline-block; /* Hiển thị theo hàng ngang */
            width: 200px; /* Độ rộng của mỗi item */
            margin-right: 20px; /* Khoảng cách giữa các item */
            vertical-align: top; /* Canh vị trí trên cùng của mỗi item */
            text-align: center; /* Căn giữa nội dung của mỗi item */
        }

        .hoa-item img {
            max-width: 100px;
            display: block;
            margin: 0 auto;
        }

        .hoa-item p {
            margin: 5px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  class="container mt-5">
            <asp:SqlDataSource ID= "dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <div style="text-align: center;"> <!-- Để căn giữa theo chiều ngang -->
        Danh mục loại: <asp:DropDownList ID="ddlLoai" AutoPostBack="true" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai" style="margin-bottom: 20px;"></asp:DropDownList>
    </div>
    <asp:SqlDataSource ID="dsHoaTheoLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLoai" DefaultValue="1" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
         <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoaTheoLoai">
        <ItemTemplate>
            <div class="col-md-4 text-center">
                <a href="#">
                    <img src="hinh_san_pham/<%# Eval("hinh") %>"  style="width:70%;"/>
                </a>
                <p><%# Eval("TenHoa") %></p>
                <p>Giá bán: <span style="color:red;"><%# Eval("gia","{0:#,##0} VNĐ") %></span> </p>
                <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success"/> <br />
            </div>

        </ItemTemplate>
    </asp:Repeater>

    </div>
    </div>
</asp:Content>
