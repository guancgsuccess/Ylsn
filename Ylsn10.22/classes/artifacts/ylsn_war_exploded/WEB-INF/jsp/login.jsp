<%--
  Created by IntelliJ IDEA.
  User: 王德鹏
  Date: 2018/9/27
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
    <form method="post">
        <span id="tip" style="color: red; font-size: 10px;"></span><br>
        用户名：<input type="text" name="userName" id="userName"><br>
        密码：<input type="password" name="userPwd" id="userPwd"><br>
        <input type="button" value="登录" onclick="login()">
    </form>

    <script>
        var xhr = null;
        var url_loginuser = "${pageContext.request.contextPath}/user/login";
        function login() {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            var username = document.getElementById("userName").value;
            var password =  document.getElementById("userPwd").value;
            var formData = "userName="+username+"&userPwd="+password;
            xhr.open("POST", url_loginuser, true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
            xhr.onreadystatechange =  processLogin;
            xhr.send(formData);
        }

        function  processLogin() {
            if(xhr.readyState==4 && xhr.status ==200 ){
                var result = JSON.parse(xhr.responseText);
                if(result.loginStatus ==0){
                    window.location="${pageContext.request.contextPath}/user";
                }else{
                    document.getElementById("tip").innerText=result.loginMessage;
                }
            }
        }
    </script>
</body>
</html>
