<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="dbprj.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #btnin{
            cursor:pointer;
            background-color:honeydew;
            align-content:center;
            text-align:center;
            display:inline-block;
            border: solid 2px gray;
            width:60px;
            height:40px;
            margin-right:50px;
            line-height: 40px;
            cursor:pointer;
            font-size:20px;
        }
        #Button2{ display:none; line-height:40px; cursor:pointer; }
        #box{
            display:flex;
            justify-content: space-evenly;
            margin-top:10%;
        }
        #game1{
            cursor:pointer;
            width:200px;
            height: 200px;
            display: flex;
            flex-wrap: wrap;
            align-items: flex-end;
            overflow: hidden;
            border:solid 1px gray;
        }
      #ball{
        width: 20%;
        height: 20%;
        border-radius: 50%;
        background-color: blue;
        animation: ballMove 2s 0.3s linear forwards infinite;
        position: relative;
        margin-top: 30%;
        left: 10px;
      }
      #rock{
      width: 30%;
      height: 20%;
      background-color: red;
      animation: rockMove 2s linear forwards infinite;
      position: relative;
    }
      #line{
        height: 1px;
        width: 100%;
        background-color: black;
        align-self: flex-start;
      }
      @keyframes rockMove {
        0%{
          left: 100%;
        }
        100%{
          left: -100%;
        }
      }
      @keyframes ballMove {
        0%{
          bottom : 0%;
        }
        50%{
          bottom: 40%;
        }
        100%{
          bottom : 0%;
        }
      }
      #game2{
        cursor:pointer; 
        width: 200px;
        height: 200px;
        display: flex;
        flex-wrap: wrap;
        align-content: flex-start;
        overflow: hidden;
        border: solid 1px gray;
      }
      #tLine{
        margin-top: 15%;
        height: 1px;
        width: 100%;
        background-color: black;
      }
      #tRock{
        width: 30%;
        height: 20%;
        background-color: red;
        animation: rockMove 2s linear forwards infinite;
        position: relative;
      }
      #ball2{
        margin-top: 40%;
        width: 20%;
        height: 20%;
        border-radius: 50%;
        background-color: blue;
        position: relative;
        right:30px;
        animation: ballMove 2s 0.7s linear forwards infinite;
       
      }
      #bRock{
        align-self: flex-end;
        width: 30%;
        height: 20%;
        background-color: red;
        animation: rockMove 2s 0.3s linear forwards infinite;
        position: relative;
      }
      #bLine{
        height: 1px;
        width: 100%;
        background-color: black;
    
      }
      #log{
          border:solid 3px black;
          background-color:azure;
          position:absolute;
          width:600px;
          height:300px;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          text-align: center;
          display:none;
      }
      .inp{
          margin:30px;
          position:relative;
          right:25px;
      }
      #Button1{ cursor:pointer; }
      #Button3{ cursor:pointer; }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="Button1">
        <div style="margin : 5% 20%">
            <div style="text-align: right">
                <asp:Button ID="Button2" runat="server" Text="玩家名稱" BackColor="#CCFFFF" BorderColor="Black" Font-Bold="False" Font-Size="Small" Height="40px" Width="100px" OnClick="Button2_Click" />
                <div id="btnin" onclick="logBtn()">
                    <asp:Label ID="Label2" runat="server" Text="登入"></asp:Label>
                </div>
            </div>
            <div style="text-align: center"><h1>
                GAME</h1></div>
            <div id="box">
                <div id="game1" onclick="logCheck1()"><div id="ball"></div><div id="rock"></div><div id="line"></div>
            
                  </div>
            
                 <div id="game2" onclick="logCheck2()">
                  <div id="tLine"></div>
                  <div id="tRock"></div>
                  <div id="ball2"></div>
                  <div id="bRock"></div>
                  <div id="bLine"></div>
                </div></>
            </div>
            <div id="log">
                <div class="inp" style="margin-top:70px">名稱：<asp:TextBox ID="TextBox1" runat="server" Height="20px"></asp:TextBox></div>
                <div class="inp">密碼：<asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="20px"></asp:TextBox></div>
                <asp:Button ID="Button1" runat="server" Text="登入" OnClick="Button1_Click" Width="50px" Height="30px" Font-Size="Large" />
                <div style="display:inline-block; margin:20px"><asp:Button ID="Button3" runat="server" Text="註冊" Height="30px" Width="50px" Font-Size="Large" OnClick="Button3_Click" /></div>
            </div>
      </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GAMEDBConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [mId] = @mId" InsertCommand="INSERT INTO [Member] ([name], [password], [phone], [totPlayTimes], [lastLogTime]) VALUES (@name, @password, @phone, @totPlayTimes, @lastLogTime)" SelectCommand="SELECT * FROM [Member] WHERE ([name] = @name)" UpdateCommand="UPDATE [Member] SET [lastLogTime] = @lastLogTime WHERE [name]=@name">
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
                <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="name" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="lastLogTime" SessionField="nowTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
      <script type="text/javascript">
          
          function logBtn() {
              if (document.getElementById("<%=Label2.ClientID %>").innerText == "登入")
                  document.getElementById("log").style.display = "block";
              else {
                  document.getElementById("<%=Label2.ClientID %>").innerText = "登入";
                  document.getElementById("Button2").style.display = "none";
                  
              }
          }
          function logCheck1() {
              if (document.getElementById("<%=Label2.ClientID %>").innerText == "登入")
                  alert("請先登入");
              else {
                  
                 
                  window.location.assign("./Game1.aspx");
              }
          }
          function logCheck2() {
              if (document.getElementById("<%=Label2.ClientID %>").innerText == "登入")
                  alert("請先登入");
              else {
                
                  window.location.assign("./Game2.aspx");
              }
          }
        </script>
    </form>
      </body>
</html>
