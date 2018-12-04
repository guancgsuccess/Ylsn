<%--
  Created by IntelliJ IDEA.
  User: chensz
  Date: 2018/10/21 0021
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        a{
            text-decoration: none;
            color: #ff7f00;
            font-size: 18px;

        }
    </style>
</head>
<script type="text/javascript">
    var time = 4;
    function returnUrlByTime() {
        window.setTimeout('returnUrlByTime()', 1000);
        time = time - 1;
        if(time<=0){
            time = 0;
            window.setTimeout("location.href='${pageContext.request.contextPath}/login';", 0);
        }
        document.getElementById("layer").innerHTML = time;
    }
</script>
<body onload="returnUrlByTime()">
<div style="margin: 0 auto;position: relative;top: 200px;text-align: center" >
    <a href="javascript:void(0)" onclick="window.location.href='${pageContext.request.contextPath}/login' " ><font size="5px" >恭喜您注册成功，<b><span id="layer">3</span></b>秒后会自动跳转，如果没有跳转，请点击此处......</font></a></div>
</body>
</html>
