<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>唬皮拍賣｜會員管理</title>
    <link rel="shortcut icon" type="image/x-icon" href="media/favicon.ico" />

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/umd/popper.js"></script>
    <script src="Scripts/umd/popper-utils.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top" id="navbar">
                <a class="navbar-brand" href="Default.aspx">唬皮拍賣</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <asp:HyperLink ID="Commodity_Link" class="nav-link" runat="server" NavigateUrl="~/Commodity.aspx">商品列表</asp:HyperLink>
                        </li>
                        <li class="nav-item active">
                            <asp:HyperLink ID="Member_Link" class="nav-link" runat="server" NavigateUrl="~/Member.aspx">會員管理</asp:HyperLink>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <asp:HyperLink ID="LoginSignin_Link" class="nav-link" runat="server" data-toggle="modal" NavigateUrl="#LoginSignin_Modal">登入/註冊</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="Logout_Btn" class="nav-link" runat="server" OnClick="Logout_Btn_Click">登出</asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </nav>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Account] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Account] ([Username], [Password]) VALUES (@Username, @Password)" SelectCommand="SELECT * FROM [Account]" UpdateCommand="UPDATE [Account] SET [Password] = @Password WHERE [Username] = @Username">
                <DeleteParameters>
                    <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
                    <asp:BoundField DataField="Username" HeaderText="帳號" ReadOnly="True" SortExpression="Username"></asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="密碼" SortExpression="Password"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Username" DataSourceID="SqlDataSource2" AllowPaging="True">
                <Fields>
                    <asp:BoundField DataField="Username" HeaderText="帳號" ReadOnly="True" SortExpression="Username"></asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="密碼" SortExpression="Password"></asp:BoundField>
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Account] WHERE ([Username] = @Username)" DeleteCommand="DELETE FROM [Account] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Account] ([Username], [Password]) VALUES (@Username, @Password)" UpdateCommand="UPDATE [Account] SET [Password] = @Password WHERE [Username] = @Username">
                <DeleteParameters>
                    <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="Username" Type="String"></asp:ControlParameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
