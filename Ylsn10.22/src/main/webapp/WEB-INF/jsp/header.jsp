<%--
  Created by IntelliJ IDEA.
  User: wwwlj
  Date: 2018/10/23
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
	<meta charset="UTF-8">
    <title>缘来是你交友网：国内领先的在线婚恋交友网站</title>
    <link href="../../css/header.css" rel="stylesheet">
</head>
<body>
<div id="ylsnHeader">
    <div class="head">
        <h1>
            <a href="" class="logo"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
        </h1>
        <div class="nav">
            <ul>
                <li><a href="javascript:window.open('/index')">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/cust/center" target="_blank">会员中心</a></li>
                <li><a href="${pageContext.request.contextPath}/search/load" target="_blank">搜索</a></li>
                <li>
                    <a href="#">发现</a>
                    <div class="navMenu">
                        <a href="${pageContext.request.contextPath}/index?isAuto=1" >今日推荐</a>
                        <a href="#day_recommend" style="display: inline" ><span id="sp" style="height: 1px"></span></a>
                        <a href="${pageContext.request.contextPath}/customer/meet" target="_blank" class="meet1">邂逅</a>
                        <a href="javascript:window.open('${pageContext.request.contextPath}/constellation')" target="_blank">星座速配</a>
                    </div>
                </li>
                <li><a href="${pageContext.request.contextPath}/party" target="_blank">活动</a></li>
                <li><a href="javascript:window.open('/happiness')">幸福墙</a></li>
                <li><a href="${pageContext.request.contextPath}/popularityRanking" target="_blank">人气榜</a></li>
            </ul>
        </div>
        <div class="login" id="login">
            <span class="head_nick">${sessionScope.custNickname}<!--动态--></span>
            &nbsp;|
            <a href="${pageContext.request.contextPath}/customer/logout">退出</a>
        </div>
    </div>
</div>
</body>
</html>
