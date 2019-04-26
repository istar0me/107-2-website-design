﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Commodity.aspx.cs" Inherits="news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"></asp:BoundField>

                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time"></asp:BoundField>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"></asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Commodity] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="Id" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"></asp:BoundField>
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time"></asp:BoundField>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"></asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
                </Fields>
            </asp:DetailsView>
        </div>
    </form>
</body>
</html>
