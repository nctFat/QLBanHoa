<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="QLBanHoa.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-bottom: 10px;" class="container mt-5">
        Giá bán từ: <asp:TextBox ID="txtGiaTu" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaTu" CssClass="text-danger" runat="server" ErrorMessage="Giá từ không được để rỗng" ControlToValidate="txtGiaTu"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator CssClass="text-danger" ID="revGiaTu" runat="server" ControlToValidate="txtGiaTu" ErrorMessage="Vui lòng nhập số" ValidationExpression="^\d+$"></asp:RegularExpressionValidator><br />

        Đến: <asp:TextBox ID="txtGiaDen" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaDen" CssClass="text-danger" runat="server" ErrorMessage="Giá đến không được để rỗng" ControlToValidate="txtGiaDen"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="revGiaDen" CssClass="text-danger" runat="server" ControlToValidate="txtGiaDen" ErrorMessage="Vui lòng nhập số" ValidationExpression="^\d+$"></asp:RegularExpressionValidator><br />
        <asp:CompareValidator ID="CompareValidator1" CssClass="text-danger" runat="server" ErrorMessage="Giá bắt đầu phải nhỏ hơn giá đến" ControlToCompare="txtGiaDen" ControlToValidate="txtGiaTu" Operator="LessThanEqual" Type="Integer"></asp:CompareValidator><br />

        <asp:Button ID="btnTraCuu" runat="server" Text="Tìm kiếm" CssClass="btn btn-secondary" />
    </div>
    <div class="row">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoaTheoGia">
            <ItemTemplate>
                <div class="col-md-4 text-center">
                    <a href="#">
                        <img src="hinh_san_pham/<%# Eval("hinh") %>" style="width:70%;" />
                    </a>
                    <p><%# Eval("TenHoa") %></p>
                    <p>Giá bán: <span style="color:red;"><%# Eval("gia","{0:#,##0} VNĐ") %></span> </p>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" style="margin-top: 5px;" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="dsHoaTheoGia" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
