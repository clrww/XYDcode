<%--
  Created by IntelliJ IDEA.
  User: clrww
  Date: 2018.5.15
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link href='${pageContext.request.contextPath}/styles/memoNote/fontStyle.css' rel='stylesheet' type='text/css'>
  <%--<title>漂亮的jQuery事件日历插件calendar.js - 素材家园（www.sucaijiayuan.com）</title>--%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/memoNote/calendar.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/memoNote/xcConfirm.css">

  <style type="text/css">
    html {
      font: 500 14px 'roboto';
      color: #333;
      background-color: #fafafa;
    }
    body{
      position: relative;
    }
    a {
      text-decoration: none;
    }
    ul, ol, li {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    #demo {
      width: 300px;
      margin: 50px 150px 10px;
    }
    p {
      margin: 0;
    }
    #dt {
      margin: 30px auto;
      height: 28px;
      width: 200px;
      padding: 0 6px;
      border: 1px solid #ccc;
      outline: none;
    }
    #title h1{
      margin:20px 120px 50px 240px;
    }
    #memoContent{
      position: absolute;
      width: 550px;
      height: 500px;
      /*margin-top: 70px;*/
      /*margin-right: 20px;*/
      top:50px;
      right:50px;
      display:none;
    }
    .memoChild{
      margin-top: 20px;
    }

    #memoStart{
      position: absolute;
      width: 400px;
      height: 500px;
      top:50px;
      right:120px;
    }
    #titleDiv{
      margin-top: 25px;
    }
    #addDiv{
      position: absolute;
      top: 0px;
      right:5px;
      margin-top: 25px;
      margin-bottom:10px;
    }
    #searchDiv{
      position: absolute;
      top: 0px;
      right: 5px;
      margin-top: 0px;
      margin-bottom: 5px;
    }
    #tableDiv{
      margin-top: 20px;
    }

    .memoChild p{
      color:#FF6C60;
    }
    #ca{
      position: absolute;
      top:70px;
      left:100px;
    }
  </style>

  <script src="${pageContext.request.contextPath}/js/seajs/sea.js" id="seajsnode"></script>
  <script src="${pageContext.request.contextPath}/js/memoNote/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/js/memoNote/calendar.js" type="text/javascript" ></script>

</head>
<body>
<div id="title">
  <h1>备忘录</h1>
</div>
<div id="demo">

  <div id="ca"></div>
  <%--<input type="text" id="dt" placeholder="trigger calendar">--%>
  <%--<div id="dd"></div>--%>
</div>
<div id="memoContent">
    <div class="memoChild">
      <%--<input type="text" name="searchContent">--%>
      <%--<input type="button" id="search" value="搜索">--%>
    </div>
    <div class="memoChild">
      <p>添加提醒事件</p>
    </div>
    <div class="memoChild">
      <textarea name="content" rows="10" cols="40" happen=0></textarea>
    </div>
    <div class="memoChild">
        <select name="event" class="label">
        <option>产品提醒</option>
        <option>生日提醒</option>
        <option>客户拜访</option>
        <%--<option>自定义</option>--%>
      </select>
      <span>小时</span>
      <select name="hour" class="hour">

      </select>
      <span>分钟</span>
      <select name="minute" class="minute">

      </select>
    </div>



    <div class="memoChild">
      <input type="button" id="confirm" value="确认" />
      <input type="button" id="cancel" value="返回">
      <%--<input type="file" id="file" >--%>
      <%--获取文件名并显示出来--%>
      <script language="javascript">

      </script>
    </div>
</div>


<div id="memoStart">
  <div id="titleDiv">
    <span>提醒事件</span>
  </div>
  <div id="addDiv">
    <input type="button" id="addEvent" value="添加事件" isAdd=0>
  </div>
  <div id="searchDiv">
    <%--<input type="text" name="searchEvent">--%>
    <input type="button" id="searchBtn" value="搜索" onclick="window.location='${pageContext.request.contextPath}/comprehensiveManageDetail/queryMemoNoteDetail'">
  </div>
  <div id="tableDiv">
    <table border="1" cellspacing="10" width=100% height="500">

    </table>
  </div>

</div>


<script>
  $('#ca').calendar({
    width: 320,
    height: 320,
    data: [
      {
        date: '2015/12/24',
        value: 'Christmas Eve'
      },
      {
        date: '2015/12/25',
        value: 'Merry Christmas'
      },
      {
        date: '2016/01/01',
        value: 'Happy New Year'
      }
    ],
    onSelected: function (view, date, data) {
      console.log('view:' + view)
      console.log(date)
      //getSelectedDate(date);
      //$("#memoContent").remove();
//      $("#memoStart").remove();
      $("#addDiv #addEvent").unbind('click');
      $(".memoChild #confirm").unbind('click');
      $(".memoChild #cancel").unbind('click');
      $("table").empty();
      test(date);
      console.log('data:' + (data || 'None'));
    }
  });

  $('#dd').calendar({
    trigger: '#dt',
    zIndex: 999,
    format: 'yyyy-mm-dd',
    onSelected: function (view, date, data) {
      console.log('event: onSelected')
    },
    onClose: function (view, date, data) {
      console.log('event: onClose')
      console.log('view:' + view)
      console.log('date:' + date)
      console.log('data:' + (data || 'None'));
    }
  });
</script>
<script>
  var loginUserId = "${sessionScope.LOGIN_USER.userId}";
</script>
<script src="${pageContext.request.contextPath}/js/memoNote/xcConfirm.js"></script>
<script src="${pageContext.request.contextPath}/js/memoNote/addAndEditEvent.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/js/memoNote/getEvent.js"></script>
<script src="${pageContext.request.contextPath}/js/memoNote/reGetEvent.js"></script>
</body>
</html>