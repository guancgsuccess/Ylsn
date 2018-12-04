<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2018/10/15 0015
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    </head>
    <body>
    <a href="${pageContext.request.contextPath}/activiti" >这是测试页面</a><br>
    ----
    <a href="${pageContext.request.contextPath}/minbox" >跳转到收件箱页面</a><br>
    ----
    <a href="${pageContext.request.contextPath}/register" >跳转到注册页面</a><br>
    ----
    <a href="${pageContext.request.contextPath}/cust/center" >跳转到个人中心页面</a><br>
    -------<br>
    <a href="${pageContext.request.contextPath}/followAndvisit/follviscount" >跳转到最近访问页面</a><br>
    ------<br>
    <a href="${pageContext.request.contextPath}/customer/getMyInfo">跳转到修改个人资料页面</a>

     -------<br>
    <a href="${pageContext.request.contextPath}/upheadPhoto">跳到上传头像页面</a>
    ----------<br>
    <a href="${pageContext.request.contextPath}/footer">跳到网站底部</a>
    ----------<br>
    <a href="${pageContext.request.contextPath}/header">转到网站头部</a>

    </body>
</html>
