<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/29
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/setPwd.css">
    <script src="${pageContext.request.contextPath}/js/setPwd.js"></script>
    <script>
        function checkOldPwd() {
            var oldPwd = document.getElementById("passwdOld").value;
            if (oldPwd == null || oldPwd == ""){
                document.getElementById("passwdOld_span").innerText = "密码不能为空";
            } else if (!/^[A-Za-z0-9]{6,16}$/.test(oldPwd)){
                document.getElementById("passwdOld_span").innerText = "请输入6-16位英文字母或数字。";
            } else {
                document.getElementById("passwdOld_span").innerText = null;
            }
        }
        function checkNewPwe() {
            var newPwd = document.getElementById("passwd1").value;
            if (newPwd == null || newPwd == ""){
                document.getElementById("passwd1_span").innerText = "密码不能为空";
            } else if (!/^[A-Za-z0-9]{6,16}$/.test(newPwd)){
                document.getElementById("passwd1_span").innerText = "请输入6-16位英文字母或数字。";
            } else {
                document.getElementById("passwd1_span").innerText = null;
            }
        }
        function checkRePwd() {
            var newPwd = document.getElementById("passwd1").value;
            var rePwd = document.getElementById("passwd2").value;
            if (newPwd != rePwd){
                document.getElementById("passwd2_span").innerText = "两次密码不一致"
            } else if (rePwd == null || rePwd == ""){
                document.getElementById("passwd2_span").innerText = "密码不能为空";
            } else if (!/^[A-Za-z0-9]{6,16}$/.test(rePwd)){
                document.getElementById("passwd2_span").innerText = "请输入6-16位英文字母或数字。";
            } else {
                document.getElementById("passwd2_span").innerText = null;
            }
        }
    </script>
</head>
<body>
<%@include file="header.jsp"%>
<div id="BAIHE">
    <div id="rightCont">
        <div class="myData">
            <h3><strong>账号设置</strong></h3>
            <div class="mainNav">
                <a href="${pageContext.request.contextPath}/setBlock" class="">黑名单<em class="angleB1"></em></a>
                <a href="${pageContext.request.contextPath}/setPwd" class="active">修改密码<em class="angleB2"></em></a>
            </div>
        </div>
        <div class="setting">
            <div class="password">
                <dl>
                    <dt>当前密码</dt>
                    <dd>
                        <input id="passwdOld" name="passwdOld" type="password" onblur="checkOldPwd()">
                        <div id="passwdOld_span" style="color: red">请输入原密码</div>
                    </dd>
                    <dt>新密码</dt>
                    <dd>
                        <input id="passwd1" name="passwd1" type="password" onblur="checkNewPwe()">
                        <div id="passwd1_span" class="ok" style="color: red">请输入6-16位英文字母或数字</div>
                    </dd>
                    <dt>确认新密码</dt>
                    <dd>
                        <input id="passwd2" name="passwd2" type="password" onblur="checkRePwd()">
                        <div id="passwd2_span" style="color: red">请再次输入新密码</div>
                    </dd>
                </dl>
                <a class="orange" onclick="getPwdByCustId()">修改密码</a>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
