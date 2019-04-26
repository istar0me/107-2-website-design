<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Label ID="Login_UsernameLabel" runat="server" Text="帳號："></asp:Label>
                <asp:TextBox ID="Login_Username" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="Login_UserNameRequiredFieldValidator" runat="server" ErrorMessage="請填入使用者名稱" ControlToValidate="Login_Username" Display="None" ValidationGroup="Login"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="Login_PasswordLabel" runat="server" Text="密碼："></asp:Label>
                <asp:TextBox ID="Login_Password" runat="server" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="Login_PasswordRequiredFieldValidator" runat="server" ErrorMessage="請填入密碼" ControlToValidate="Login_Password" Display="None" ValidationGroup="Login"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:CheckBox ID="Login_RememberUsernameChkbox" runat="server" Text="記住帳號" />
            </div>
            <asp:Button ID="LoginBtn" runat="server" Text="登入" ValidationGroup="Login" />
            <asp:Button ID="Login_ClearBtn" runat="server" Text="清除" />
            <asp:ValidationSummary ID="Login_ValidationSummary" runat="server" HeaderText="登入驗證錯誤：" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Login" />
        </div>
        <hr />

        <div>
            <div>
                <asp:Label ID="Signup_UsernameLabel" runat="server" Text="帳號："></asp:Label>
                <asp:TextBox ID="Signup_Username" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="Signup_UsernameRequiredFieldValidator" runat="server" ErrorMessage="請填入使用者名稱" ControlToValidate="Signup_Username" Display="None" ValidationGroup="Signup"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="Signup_PasswordLabel" runat="server" Text="密碼："></asp:Label>
                <asp:TextBox ID="Signup_Password" runat="server" TextMode="Password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="Signup_PasswordRequiredFieldValidator" runat="server" ErrorMessage="請填入密碼" ControlToValidate="Signup_Password" Display="None" ValidationGroup="Signup"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:Label ID="Signup_PasswordCmpLabel" runat="server" Text="確認密碼："></asp:Label>
                <asp:TextBox ID="Signup_PasswordCmp" runat="server" TextMode="Password" ToolTip="請再次輸入密碼，確認是否相同"></asp:TextBox><br />
                <asp:CompareValidator ID="Singup_PasswordCompareValidator" runat="server" ErrorMessage="兩次密碼並不相同，請重新檢查" ControlToCompare="Signup_PasswordCmp" ControlToValidate="Signup_Password" Display="None" ValidationGroup="Signup"></asp:CompareValidator>
            </div>
            <div>
                <asp:CheckBox ID="Signup_RememberUsernameChkbox" runat="server" Text="記住帳號" />
            </div>
            <asp:Button ID="SignupBtn" runat="server" Text="註冊" ValidationGroup="Signup" />
            <asp:Button ID="Signup_ClearBtn" runat="server" Text="清除" />
            <asp:ValidationSummary ID="Signup_ValidationSummary" runat="server" HeaderText="驗證錯誤：" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Signup" />
        </div>
    </form>
</body>
</html>
