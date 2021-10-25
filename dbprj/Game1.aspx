<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Game1.aspx.cs" Inherits="dbprj.Game1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <style>
    body{
      margin: 0px;
    }
    #Button1{
        float:left;
        margin-left:20px;
        margin-bottom:10px;
        cursor:pointer;
    }
    #Button2{
        float:right;
        margin-right:20px;
        margin-bottom:10px;
        cursor:pointer;
    }

    #gameArea{
      clear:both;
      margin-top: 5vh;
      width: 100%;
      height: 50vh;
      
      background-color:lightblue;
      overflow: hidden;
    }
    #ball{
      width: 30px;
      height: 30px;
      border-radius: 50%;
      position: relative;
      top: 60%;
      left: 40px; 
      background-color: blue;
      z-index: 1;
    }
    #line{
      height: 1px;
      width: 100%;
      background-color: black;
      position: relative;
      top: 60%;
    }
    #rock{
      width: 50px;
      height: 30px;
      background-color: red;
      position: relative;
      top: calc(60% - 31px);
      left: 100%;
      animation: rockMove 2s linear forwards;
    }
    #score{
      position: relative;
      right: 20px;
      float: right;
      font-size: 2vh;
    }
    #rePic{ 
      position: absolute;
      width: 90%;
      height: 50vh;
      background-color: gray;
      opacity: 0.5;
      display: none;
      text-align: center;
       line-height: 250px;
    }
    @keyframes rockMove{
      0%{
        left: 100%;
      }
      100%{
        left: -15%;
      }
    }
    @keyframes ballMove{
      0%{
        top: 60%;
      }
      50%{
        top: 10vh;
      }
      100%{
        top: 60%;
      }
    }
    #toSave{
        position:absolute;
        left:46%;
        display: none;
    }
    #Button3{
        cursor:pointer;
  
    }
    #Label1{ display:none; }
    #GridView1{ margin-bottom: 2%; }
      </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
         <input type="hidden" id="abc" runat='server' />
        <div style="width:90%; margin-left:5%">
    <div style="text-align: center; margin-top: 50px">
        <div>
            <asp:Button ID="Button1" runat="server" Text="回首頁" BackColor="#66FF99" BorderColor="White" Font-Bold="False" Font-Size="Medium" Height="40px" Width="70px" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="玩家名稱" BackColor="#CCFFFF" BorderColor="White" Font-Bold="False" Font-Size="Small" Height="40px" Width="100px" OnClick="Button2_Click" />
        </div>
      <div id="gameArea" style="clear:both">
        <div id="rePic" onclick="gameStart()"><h2>GAME OVER</h2></div>
        <div id="ball"></div>
        <div id="line"></div>
        <div id="rock"></div>
        <span id="score">score 00000</span>
      </div>
    </div>
        </div>
        <div id="toSave"><asp:Button ID="Button3" runat="server" Text="記錄成績" Font-Size="Large" Height="52px" Width="103px" OnClick="Button3_Click" /></div>
                <div style="text-align:center; margin-top:60px" >
        <h1>排行榜</h1>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" SelectCommand="SELECT name,gName,startTime,score FROM [Member], [Record], [Game] WHERE 
(Game.gId=@gId) AND (Member.mId=Record.mId) AND
(Game.gId=Record.gId)  ORDER BY score DESC">
              <SelectParameters>
                  <asp:Parameter DefaultValue="1" Name="gId" />
              </SelectParameters>
                    </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="223px" Width="602px">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="玩家名稱" SortExpression="name" />
                    <asp:BoundField DataField="gName" HeaderText="遊戲名稱" SortExpression="gName" />
                    <asp:BoundField DataField="startTime" HeaderText="開始時間" SortExpression="startTime" />
                    <asp:BoundField DataField="score" HeaderText="分數" SortExpression="score" />
                </Columns>
            </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" DeleteCommand="DELETE FROM [Record] WHERE [mId] = @mId AND [startTime] = @startTime" InsertCommand="INSERT INTO [Record] ([mId], [startTime], [score], [gId]) VALUES (@mId, @startTime, @score, @gId)" SelectCommand="SELECT * FROM [Record]" UpdateCommand="UPDATE [Record] SET [score] = @score, [gId] = @gId WHERE [mId] = @mId AND [startTime] = @startTime">
                        <DeleteParameters>
                            <asp:Parameter Name="mId" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="startTime" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="mId" SessionField="mId" Type="Int32" />
                            <asp:SessionParameter DbType="DateTime" DefaultValue="" Name="startTime" SessionField="nowTime" />
                            <asp:ControlParameter ControlID="Label1" Name="score" PropertyName="Text" Type="Int32" />
                            <asp:SessionParameter Name="gId" SessionField="gId" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="score" Type="Int32" />
                            <asp:Parameter Name="gId" Type="Int32" />
                            <asp:Parameter Name="mId" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="startTime" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [mId] = @mId" InsertCommand="INSERT INTO [Member] ([name], [password], [phone], [totPlayTimes], [lastLogTime]) VALUES (@name, @password, @phone, @totPlayTimes, @lastLogTime)" SelectCommand="SELECT * FROM [Member]" UpdateCommand="UPDATE [Member] SET  [totPlayTimes] = @totPlayTimes WHERE name=@name">
                        <DeleteParameters>
                            <asp:Parameter Name="mId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="totPlayTimes" Type="Int32" />
                            <asp:Parameter Name="lastLogTime" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="totPlayTimes" SessionField="totPlayTimes" />
                            <asp:SessionParameter Name="name" SessionField="username" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
        </div>

    </form>
    <script>
      var ballUp = false;
      const ballE = document.getElementById("ball");
        document.addEventListener("keydown", function (e) {
          e.preventDefault();
        if (
          document.getElementById("rePic").style.display == "block" &&
          (e.keyCode == "38" || e.keyCode == "32")
        ) {
          gameStart();
        } else if (e.keyCode == "38" || e.keyCode == "32") {
          ballE.style.animation = "ballMove 0.6s";
        }
      });
      ballE.addEventListener("animationend", function () {
        ballE.style.animationName = "";
      });

      document.addEventListener("touchstart", function () {
        if (document.getElementById("rePic").style.display != "block")
          ballE.style.animation = "ballMove 0.6s linear";
      });
      //改變障礙物速度
      var rockE = document.getElementById("rock");
      rockE.addEventListener("animationend", function () {
        console.log((Math.floor(Math.random() * 3) + 2) / 2 + "s");
        rockE.style.animationName = "none";
        setTimeout(function () {
          rockE.style.animation = "rockMove 2s linear forwards";
          if (seconds < 100)
            rockE.style.animationDuration =
              (Math.floor(Math.random() * 3) + 2) / 2 + "s";
          else if (seconds < 200)
            rockE.style.animationDuration =
              (Math.floor(Math.random() * 3) + 2) / 3 + "s";
          else
            rockE.style.animationDuration =
              (Math.floor(Math.random() * 3) + 2) / 4 + "s";
        }, 100);
      });
      function checkLose() {
        var bx = document.getElementById("ball").offsetLeft;
        var by = document.getElementById("ball").offsetTop;
        var rx = document.getElementById("rock").offsetLeft;
        var ry = document.getElementById("rock").offsetTop;
        if (Math.abs(bx - rx) <= 30 && Math.abs(by - ry) <= 30) {
          document.getElementById("rock").style.animationPlayState = "paused";
          document.getElementById("ball").style.animationPlayState = "paused";
          clearInterval(checkSet);
          clearInterval(timeSet);
            document.getElementById("rePic").style.display = "block";
            var a = document.getElementById("abc");
            a.value = seconds;
            document.getElementById("toSave").style.display = "block";
            
        }
      }
      var checkSet = setInterval(checkLose, 10);

      function gameStart() {
        location.reload();
      }

      var seconds = 0;
      function time() {
        seconds++;
        var str = "";
        for (var i = 0; i < 5 - seconds.toString().length; i++) str += "0";
        document.getElementById("score").innerHTML = "score " + str + seconds;
      }
      var timeSet = setInterval(time, 100);
    </script>
</body>
</html>
