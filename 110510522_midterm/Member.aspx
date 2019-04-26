<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Member" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
