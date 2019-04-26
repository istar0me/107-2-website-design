<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Commodity.aspx.cs" Inherits="news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>唬皮拍賣｜商品列表</title>
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
                        <li class="nav-item active">
                            <asp:HyperLink ID="Commodity_Link" class="nav-link" runat="server" NavigateUrl="~/Commodity.aspx">商品列表</asp:HyperLink>
                        </li>
                        <li class="nav-item">
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

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-8">
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Commodity] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Commodity] ([Id], [time], [title], [price]) VALUES (@Id, @time, @title, @price)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Commodity]" UpdateCommand="UPDATE [Commodity] SET [time] = @time, [title] = @title, [price] = @price WHERE [Id] = @original_Id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="time" Type="DateTime"></asp:Parameter>
                                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                                <asp:Parameter Name="price" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="time" Type="DateTime"></asp:Parameter>
                                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                                <asp:Parameter Name="price" Type="String"></asp:Parameter>
                                <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-borderless table-sm">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id"></asp:BoundField>

                                <asp:BoundField DataField="time" HeaderText="上架時間" SortExpression="time" DataFormatString="{0:G}"></asp:BoundField>
                                <asp:BoundField DataField="title" HeaderText="商品名稱" SortExpression="title"></asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="售價" SortExpression="price" DataFormatString="{0:C}"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-sm-4">
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Commodity] WHERE ([Id] = @Id)" DeleteCommand="DELETE FROM [Commodity] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Commodity] ([Id], [time], [title], [price]) VALUES (@Id, @time, @title, @price)" UpdateCommand="UPDATE [Commodity] SET [time] = @time, [title] = @title, [price] = @price WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="time" Type="DateTime"></asp:Parameter>
                                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                                <asp:Parameter Name="price" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="Id" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="time" Type="DateTime"></asp:Parameter>
                                <asp:Parameter Name="title" Type="String"></asp:Parameter>
                                <asp:Parameter Name="price" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" CssClass="table table-striped table-borderless table-sm">
                            <Fields>
                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"></asp:BoundField>
                                <asp:BoundField DataField="time" HeaderText="time" SortExpression="time"></asp:BoundField>
                                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"></asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
                                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" ShowDeleteButton="True"></asp:CommandField>
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
