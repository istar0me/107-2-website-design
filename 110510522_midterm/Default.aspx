<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>唬皮拍賣｜首頁</title>
    <link rel="shortcut icon" type="image/x-icon" href="media/favicon.ico" />

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/umd/popper.js"></script>
    <script src="Scripts/umd/popper-utils.js"></script>
    <script src="Scripts/bootstrap.js"></script>

    <style>
        .carousel-item {
            height: 100vh;
            min-height: 350px;
            background: no-repeat center center scroll;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top" id="navbar">
                <a class="navbar-brand" href="Default.aspx">唬皮拍賣</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
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

            <div class="modal" tabindex="-1" role="dialog" id="LoginSignin_Modal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">登入/註冊</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        <ul class="nav nav-tabs nav-fill justify-content-center" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="login-tab" data-toggle="tab" href="#login" role="tab"
                                                    aria-controls="login" aria-selected="true">登入</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="signin-tab" data-toggle="tab" href="#signin" role="tab"
                                                    aria-controls="signin" aria-selected="false">註冊</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent">

                                            <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="signin-tab">
                                                <div class="input-group mb-3" style="margin-top: 20px">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">帳號</span>
                                                    </div>
                                                    <asp:TextBox ID="Login_Username" runat="server" class="form-control" ValidationGroup="Login" MaxLength="12"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="Login_UserNameRequiredFieldValidator" runat="server" ErrorMessage="請填入使用者名稱" ControlToValidate="Login_Username" Display="None" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">密碼</span>
                                                    </div>
                                                    <asp:TextBox ID="Login_Password" runat="server" TextMode="Password" class="form-control" ValidationGroup="Login" MaxLength="12"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="Login_PasswordRequiredFieldValidator" runat="server" ErrorMessage="請填入密碼" ControlToValidate="Login_Password" Display="None" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <asp:CheckBox ID="Login_RememberUsernameChkbox" runat="server" Text="記住帳號" />
                                                    <asp:Button ID="LoginBtn" class="btn btn-block btn-success" runat="server" Text="登入" ValidationGroup="Login" OnClick="LoginBtn_Click" />
                                                    <asp:Button ID="Login_ClearBtn" class="btn btn-block btn-outline-danger" runat="server" Text="清除" OnClick="Login_ClearBtn_Click" />
                                                    <asp:ValidationSummary ID="Login_ValidationSummary" runat="server" HeaderText="登入驗證錯誤：" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Login" />
                                                </div>
                                            </div>

                                            <%-- sigin --%>

                                            <div class="tab-pane fade" id="signin" role="tabpanel" aria-labelledby="signin-tab">
                                                <div class="input-group mb-3" style="margin-top: 20px">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="Username">帳　　號</span>
                                                    </div>
                                                    <asp:TextBox ID="Signup_Username" runat="server" class="form-control" placeholder="限英數字，6 ~ 12 碼" ValidationGroup="Signup" MaxLength="12"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="Signup_UsernameRequiredFieldValidator" runat="server" ErrorMessage="請填入使用者名稱" ControlToValidate="Signup_Username" Display="None" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="Password">密　　碼</span>
                                                    </div>
                                                    <asp:TextBox ID="Signup_Password" runat="server" TextMode="Password" class="form-control" placeholder="限英數字，6 ~ 12 碼" ValidationGroup="Signup" MaxLength="12"></asp:TextBox><br />
                                                    <asp:RequiredFieldValidator ID="Signup_PasswordRequiredFieldValidator" runat="server" ErrorMessage="請填入密碼" ControlToValidate="Signup_Password" Display="None" ValidationGroup="Signup"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="PasswordComfirm">密碼確認</span>
                                                    </div>
                                                    <asp:TextBox ID="Signup_PasswordCmp" runat="server" TextMode="Password" class="form-control" placeholder="請再次輸入密碼，並確認是否相同" ValidationGroup="Signup" MaxLength="12"></asp:TextBox><br />
                                                    <asp:CompareValidator ID="Singup_PasswordCompareValidator" runat="server" ErrorMessage="兩次密碼並不相同，請重新檢查" ControlToCompare="Signup_PasswordCmp" ControlToValidate="Signup_Password" Display="None" ValidationGroup="Signup"></asp:CompareValidator>
                                                </div>
                                                <asp:Button ID="SignupBtn" class="btn btn-block btn-primary" runat="server" Text="註冊" ValidationGroup="Signup" OnClick="SignupBtn_Click" />
                                                <asp:Button ID="Signup_ClearBtn" class="btn btn-block btn-outline-danger" runat="server" Text="清除" OnClick="Signup_ClearBtn_Click" />
                                                <asp:ValidationSummary ID="Signup_ValidationSummary" runat="server" HeaderText="驗證錯誤：" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Signup" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Account] WHERE (([Username] = @Username) AND ([Password] = @Password))" OnSelecting="SqlDataSource1_Selecting">
                    <SelectParameters>
                        <asp:Parameter Name="Username" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Account] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Account] ([Username], [Password]) VALUES (@Username, @Password)" SelectCommand="SELECT * FROM [Account]" UpdateCommand="UPDATE [Account] SET [Password] = @Password WHERE [Username] = @Username">
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
            <div>
            </div>

            <%-- container --%>
            <%--<div class="container-fluid px-0" style="margin: auto">--%>
            <%--<div class="row">--%>

            <%-- carousel --%>
            <div id="carousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel" data-slide-to="1"></li>
                    <li data-target="#carousel" data-slide-to="2"></li>
                    <li data-target="#carousel" data-slide-to="3"></li>
                    <li data-target="#carousel" data-slide-to="4"></li>
                </ol>
                <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="media/carousel/1.jpg" alt="First slide" />
                        <div class="carousel-caption d-none d-md-block">
                            <h1>Apple Macbook Pro 13"(early 2012)</h1>
                            <h3>$16666</h3>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="media/carousel/2.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>小米方盒子藍芽喇叭</h1>
                            <h3>$666</h3>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="media/carousel/3.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>Lenovo ThinkPad L460 i5/8G/512G</h1>
                            <h3>$16666</h3>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="media/carousel/4.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>Redmi Note 7 4G/64G</h1>
                            <h3>$6666</h3>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="media/carousel/5.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h1>小米 18W 快速充電器</h1>
                            <h3>$245</h3>
                        </div>
                    </div>
                </div>
            </div>
            <%--</div>--%>
            <%--</div>--%>
    </form>
</body>
</html>
