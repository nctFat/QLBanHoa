<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="QLBanHoa.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form>
            <h1>Thêm Hoa</h1>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label style="display: block;">Tên hoa</label>
                    <asp:TextBox ID="txtTenHoa" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="reqTenHoa" CssClass="text-danger" runat="server" ControlToValidate="txtTenHoa" ErrorMessage="Tên hoa không được bỏ trống"></asp:RequiredFieldValidator>            </div>
                </div>
            <div class="form-group">
                <label style="display: block;">Giá tiền</label>
                <asp:TextBox ID="txtGia" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="reqGia" CssClass="text-danger" runat="server" ControlToValidate="txtGia" ErrorMessage="Giá tiền không được bỏ trống"></asp:RequiredFieldValidator><br />
<asp:RegularExpressionValidator ID="regGia" CssClass="text-danger" runat="server" ControlToValidate="txtGia" ErrorMessage="Giá tiền phải là một số" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
    <label style="display: block;">Ngày cập nhật</label>
    <asp:TextBox ID="txtNgayCapNhat" type="date" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="reqNgayCapNhat" CssClass="text-danger" runat="server" ControlToValidate="txtNgayCapNhat" ErrorMessage="Ngày cập nhật không được bỏ trống"></asp:RequiredFieldValidator>
</div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label style="display: block;">Hình</label>
                    <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file"></asp:FileUpload>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label style="display: block;">Danh mục</label>
                    <asp:DropDownList ID="ddlLoaiHoa" CssClass="text-center" runat="server" DataSourceID="dsLoaiHoa" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="dsLoaiHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
            </div>
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary"  Text="Thêm" OnClick="btnSave_Click" />
        </form>
        <asp:Label ID="lblketqua" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
