<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/29
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>黑名单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/setBlack.css">
    <script src="${pageContext.request.contextPath}/js/setBlack.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<div id="BAIHE">
    <div id="rightCont">
        <div class="myData">
            <h3><strong>账号设置</strong></h3>
            <div class="mainNav">
                <a href="${pageContext.request.contextPath}/setBlock" class="active">黑名单<em class="angleB1"></em></a>
                <a href="${pageContext.request.contextPath}/setPwd" class="">修改密码<em class="angleB2"></em></a>
            </div>
        </div>
        <div class="blackList">
            <!-- 有内容 -->
            <div class="list" id="list">

            </div>
            <div id="pageInfo" class="page">

            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
