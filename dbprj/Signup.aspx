<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="dbprj.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .al{
            height:20px;
            margin:5px;
            position:relative;
            right:50px;
        }
        .sp{
            display:inline-block;
            width:120px;
            text-align:right;
        }
        #Button2{
            display:inherit;
            position:relative;
            left:200px;
            cursor:pointer;
        }
        #Button1{
            cursor:pointer;
        }
    </style>
</head>
  
<body>
    <form id="form1" runat="server" defaultbutton="Button1">
        <div style="text-align:center; width:80%; margin: 4% auto;">
            <asp:Button ID="Button2" runat="server" Text="回首頁" BackColor="#66FF99" BorderColor="White" Font-Bold="False" Font-Size="Medium" Height="40px" Width="70px" OnClick="Button2_Click"  />
            <h1 style="margin-bottom:3%">註冊</h1>
            <p><span class="sp"><asp:Label ID="Label1" class="al" runat="server" Text="使用者名稱："></asp:Label></span>
            <asp:TextBox ID="TextBox1" class="al" runat="server"></asp:TextBox></p>
            <p><span class="sp"><asp:Label ID="Label2" class="al" runat="server" Text="密碼："></asp:Label></span>
            <asp:TextBox ID="TextBox2" class="al" runat="server"></asp:TextBox></p>
            <p>
            <span class="sp"><asp:Label ID="Label3" class="al" runat="server" Text="電話："></asp:Label></span>
            <asp:TextBox ID="TextBox3" class="al" runat="server"></asp:TextBox></p>
            <br />
            <asp:Button ID="Button1" runat="server" Text="註冊" Font-Size="Large" Height="30px" OnClick="Button1_Click" Width="55px" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [mId] = @mId" InsertCommand="INSERT INTO [Member] ([name], [password], [phone], [totPlayTimes], [lastLogTime]) VALUES (@name, @password, @phone, @totPlayTimes, @lastLogTime)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Member]" UpdateCommand="UPDATE [Member] SET [name] = @name, [password] = @password, [phone] = @phone, [totPlayTimes] = @totPlayTimes, [lastLogTime] = @lastLogTime WHERE [mId] = @mId">
                <DeleteParameters>
                    <asp:Parameter Name="mId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="password" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox3" Name="phone" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="0" Name="totPlayTimes" Type="Int32" />
                    <asp:SessionParameter DbType="DateTime" DefaultValue="" Name="lastLogTime" SessionField="nowTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="totPlayTimes" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="lastLogTime" />
                    <asp:Parameter Name="mId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        
    </form>
</body>
</html>
