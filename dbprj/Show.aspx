<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="dbprj.Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .TB{
            margin:15px;
            display:inline-block;
        }
        #changeBox{
            width:400px;
            height:150px;
            margin: 0px auto;
            display : none;
        }
        #TextBox3{ margin-bottom:10px; }
        #Button1{ cursor:pointer; }
        #Button2{ cursor:pointer; }
        #Button3{ cursor:pointer; }
        #Button4{ 
            position:relative;
            left:100px;
            cursor:pointer;
        }
        #GridView2{ text-align: center; margin-bottom:2%; }
    </style>
</head>
<body style="width:80%; margin:10px auto">
    <form id="form1" runat="server" defaultbutton="Button3">
        <asp:Button ID="Button4" runat="server" Text="回首頁" BackColor="#66FF99" BorderColor="White" Font-Bold="False" Font-Size="Medium" Height="40px" Width="70px" OnClick="Button1_Click" />
        <div style="text-align:center">
            <h2>玩家資料</h2>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [mId] = @mId" InsertCommand="INSERT INTO [Member] ([name], [password], [phone], [totPlayTimes], [lastLogTime]) VALUES (@name, @password, @phone, @totPlayTimes, @lastLogTime)" SelectCommand="SELECT * FROM [Member] WHERE ([name] = @name)" UpdateCommand="UPDATE [Member] SET [password] = @password, [phone] = @phone WHERE [name] = @name">
                <DeleteParameters>
                    <asp:Parameter Name="mId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="totPlayTimes" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="lastLogTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="name" SessionField="username" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="name" SessionField="username" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="password" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox3" Name="phone" PropertyName="Text" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="mId" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Height="84px" Width="549px">
                <Columns>
                    <asp:BoundField DataField="mId" HeaderText="編號" InsertVisible="False" ReadOnly="True" SortExpression="mId" />
                    <asp:BoundField DataField="name" HeaderText="玩家名稱" SortExpression="name" />
                    <asp:BoundField DataField="password" HeaderText="密碼" SortExpression="password" />
                    <asp:BoundField DataField="phone" HeaderText="電話" SortExpression="phone" />
                    <asp:BoundField DataField="totPlayTimes" HeaderText="總遊玩次數" SortExpression="totPlayTimes" />
                    <asp:BoundField DataField="lastLogTime" HeaderText="上次登入時間" SortExpression="lastLogTime" />
                </Columns>
            </asp:GridView>
            <p><span id="openForm" onclick="openForm()"><asp:Button ID="Button1" runat="server" Text="更改玩家資料" Height="26px" Width="117px"  OnClientClick="return false;" /></span>
            <asp:Button ID="Button2" runat="server" Text="刪除此帳號" Height="26px" Width="97px" OnClick="Button2_Click" /></p>
            <div id="changeBox" style="background-color:lightsteelblue"> 
            <p class="TB">密碼：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></p>
            <p class="TB">電話：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></p>
                <p style="margin:0px"><asp:Button ID="Button3" runat="server" Text="更新" Height="27px" Width="52px" OnClick="Button3_Click" /></p>
            </div>

            <h2>遊戲紀錄</h2>
        </div>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" SelectCommand="SELECT name,gName,startTime,score FROM [Member], [Record], [Game] WHERE (name=@name) AND (Member.mId=Record.mId) AND
(Game.gId=Record.gId) ORDER BY [startTime] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="name" SessionField="username" />
            </SelectParameters>
                </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" HorizontalAlign="Center" DataSourceID="SqlDataSource3" Height="188px" Width="544px" AutoGenerateColumns="False">
    
            <Columns>
                <asp:BoundField DataField="name" HeaderText="玩家名稱" SortExpression="name" />
                <asp:BoundField DataField="gName" HeaderText="遊戲名稱" SortExpression="gName" />
                <asp:BoundField DataField="startTime" HeaderText="開始時間" SortExpression="startTime" />
                <asp:BoundField DataField="score" HeaderText="分數" SortExpression="score" />
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [name]=@name" SelectCommand="SELECT * FROM [Member]">
            <DeleteParameters>
                <asp:SessionParameter Name="name" SessionField="username" />
            </DeleteParameters>
        </asp:SqlDataSource>


        <script type="text/javascript">
            function openForm() {
                document.getElementById("changeBox").style.display = "block";

            }
        </script>
    </form>
</body>
</html>
