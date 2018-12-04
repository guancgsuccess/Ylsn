<%--
  Created by IntelliJ IDEA.
  User: 王德鹏
  Date: 2018/10/18
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缘来是你会员登录_用户登录_缘来是你_中国首席婚恋服务专家</title>
    <link href="/css/login.css" rel="stylesheet">
    <script language="javascript" type="text/javascript" src="/js/jquery.min.js"></script>
    <script language="javascript" type="text/javascript">
        function checkPhone(){
            var phone = document.getElementById("txtLoginEMail").value;
            if(!/^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\d{8}$/.test(phone) ){
                document.getElementById("txtLoginEMail_e").innerText ="格式不正确";
                document.getElementById("txtLoginEMail_e").style.display="block";
                return false;
            }else {
                document.getElementById("txtLoginEMail_e").innerText = null;
                document.getElementById("txtLoginEMail_e").style.display="none";
                return true;
            }
        }

        function fcs(){
            var password = document.getElementById("txtLoginPwd");
            var password_text = document.getElementById("txtLoginPwdRepeat");
            password.style.display = "inline";
            password_text.style.display = "none";
            password.focus();
        }

        function checkPassword(){
            var password = document.getElementById("txtLoginPwd");
            var password_text = document.getElementById("txtLoginPwdRepeat");
            if(password.value==null || password.value=="" || password.value=="密码"){
                password.style.display="none";
                password_text.style.display="inline";
                document.getElementById("txtLoginPwd_e").innerText ="请输入密码";
                document.getElementById("txtLoginPwd_e").style.display="block";
                return false;
            }else{
                document.getElementById("txtLoginPwd_e").innerText = null;
                document.getElementById("txtLoginPwd_e").style.display="none";
                return true;
            }
        }

        function checkVerify(){
            var code = document.getElementById("code").value;
            if(code ==null || code==""){
                document.getElementById("verifyErr").innerText ="请输入验证码";
                document.getElementById("verifyErr").style.display="block";
                return false;
            } else if(getVerCode()!=code) {
                document.getElementById("verifyErr").innerText = "验证码不正确";
                document.getElementById("verifyErr").style.display="block";
                reloadImage();
                return false;
            }else {
                document.getElementById("verifyErr").innerText = null;
                document.getElementById("verifyErr").style.display="none";
                return true;
            }
        }

        function reloadImage() {
            document.getElementById('codeImg').src = '${pageContext.request.contextPath}/image?ts=' + new Date().getTime();
        }

        //获取后台生成的验证码
        function getVerCode() {
            var result = "";
            $.ajax({
                type: "GET",
                url: "/customer/askVerCode",
                dataType: "text",
                async: false,//关闭异步加载,这样只有加载完成才进行下一步
                success: function (data) {
                    result = data;
                },
                error: function () {//失败
                    alert('Ajax调用失败!');
                }
            });
            return result;
        }

        function DoLogin(){
            if(checkPhone()&&checkPassword()){
                var state = document.getElementById("verifyDiv").style.display;
                if (state == "none") {
                    document.getElementById("verifyDiv").style.display = "block";
                } else {
                    if(checkVerify()) {
                        login();
                    }
                }
            }
        }

        var xhr = null;
        var url_loginuser = "${pageContext.request.contextPath}/customer/login";
        function login() {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            var custPhone = document.getElementById("txtLoginEMail").value;
            var custPassword =  document.getElementById("txtLoginPwd").value;
            var isChecked="no";
            if(document.getElementById("chkRememberMe").checked)
                isChecked="yes";
            var formData = "custPhone="+custPhone+"&custPassword="+custPassword+"&isChecked="+isChecked;
            xhr.open("POST", url_loginuser, false);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
            xhr.onreadystatechange =  processLogin;
            xhr.send(formData);
        }

        function  processLogin() {
            if(xhr.readyState==4 && xhr.status ==200 ){
                var result = JSON.parse(xhr.responseText);
                if(result.loginStatus ==0){
                    window.location="${pageContext.request.contextPath}/cust/center";
                }else{
                    document.getElementById("txtLoginEMail_e").innerText=result.loginMessage;
                    document.getElementById("txtLoginEMail_e").style.display="block";
                }
            }
        }

        function autoLogin() {
            var custPhone,custPassword;
            var strcookie = document.cookie;
            var arrcookie = strcookie.split("; ");//分割
            //遍历匹配
            for ( var i = 0; i < arrcookie.length; i++) {
                var arr = arrcookie[i].split("=");
                if (arr[0] == "custPhone") {
                    custPhone = arr[1];
                }
                if (arr[0] == "custPassword") {
                    custPassword = arr[1];
                }
            }
            if(custPhone!=null&&custPassword!=null) {
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                }
                var formData = "custPhone=" + custPhone + "&custPassword=" + custPassword + "&isChecked=";
                xhr.open("POST", url_loginuser, false);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                xhr.onreadystatechange = processLogin;
                xhr.send(formData);
            }
        }
    </script>
</head>
<body onload="autoLogin()">
    <div class="right_bg" style="width: 683px;">
        <div class="layer">
            <form name="loginForm" id="loginForm" action="" target="_self" method="post">
                <div class="cont" style="right: 100px;">
                    <input type="hidden" name="ReturnUrl" value="http://u.baihe.com/">
                    <a href="http://www.baihe.com/index.shtml" target="_blank" class="logo"><img src="/img/logoIndex.png" width="110" height="110" alt="缘来是你"></a>
                    <input class="inp01" type="text" name="txtLoginEMail" id="txtLoginEMail" size="16" maxlength="40" onfocus="if(this.value=='手机号'){this.value='';}" onblur="if(!this.value){this.value='手机号';} checkPhone()" value="手机号">
                    <span class="msg" id="txtLoginEMail_e" style="display:none;"></span>
                    <input class="inp01" style="display: none;" name="txtLoginPwd" id="txtLoginPwd" type="password" size="16" maxlength="20" onblur="checkPassword()" onkeypress="javascript:return HandleKeyPress(event);">
                    <input class="inp01" type="text" id="txtLoginPwdRepeat" onfocus="if(this.value=='密码'){this.value='';} fcs()" onblur="if(!this.value){this.value='密码';}" value="密码">
                    <span class="msg" id="txtLoginPwd_e" style="display:none;"></span>
                    <!-- 验证码 -->
                    <div class="refresh" style="display: none" id="verifyDiv">
                        <input type="hidden" id="tmpid" name="tmpId" value="">
                        <input class="inp02" type="text" id="code" name="code" value="" onblur="checkVerify()">
                        <img alt="验证码" width="70" height="30" class="verImg" id="codeImg" src="${pageContext.request.contextPath}/image">
                        <a href="javascript:void(0);" class="icon" id="verfyRe" onclick="reloadImage()">刷新</a>
                    </div>
                    <span class="msg" style="display:none;" id="verifyErr"></span>
                    <!-- 结束 -->
                    <div class="line">
                        <a href="http://my.baihe.com/retrievepwd" target="_blank">忘记密码？</a>
                        <input type="checkbox" onkeypress="HandleKeyPress();" value="Yes" name="chkRememberMe" id="chkRememberMe" class="checkbox"><label for="chkRememberMe">自动登录</label>
                    </div>
                    <input class="btn" type="button" onclick="DoLogin();" value="登 录">
                    <span class="noLogin">没有缘来是你账号？</span><a href="${pageContext.request.contextPath}/register"  class="register">立即注册&gt;</a>
                    <div class="tel">红娘一对一热线：400-1520-559</div>
                </div>
            </form>
        </div>
    </div>
    <div class="foot">
        京ICP备10009806号-1|京公网安备110105000655号|京ICP证041124号|家长监护工程 <br>
        缘来是你股份有限公司|版权所有© 2005 - 2018 缘来是你|客服专线：400-1520-559(8：00 至 20：00)
    </div>
</body>
</html>
