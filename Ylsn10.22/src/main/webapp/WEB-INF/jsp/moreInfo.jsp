<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2018/10/25 0025
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>关注</title>
    <link href="${pageContext.request.contextPath}/css/public.css" rel="stylesheet" type="text/css" />
    <link href="http://static3.baihe.com/lookAtMe.css" rel="stylesheet" type="text/css" />
</head>

<body>
        <script type="text/javascript">
        var   url_followmelist='${pageContext.request.contextPath}/followAndvisit/getAllFollowMe';
        var xhr = null;
        function refreshFollowMelist(url_followmelist) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", url_followmelist, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUsers;
            xhr.send();
        }
        var objArr = null;
        function loadUsers() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // alert("MyFollow:" + xhr.responseText);
                var result = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result;
                // alert("objArr:"+objArr);
                var tbody = document.getElementById("listInfo");
                tbody.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    tbody.innerHTML += ('    <li>\n' +
                        '                        <a href="http://profile1.baihe.com?oppID=140079711" target="_blank">\n' +
                        '                            <div class="txt"><div></div><p>'+objArr[i].custBirthday+'岁 '+objArr[i].custProvince+''+objArr[i].custCity+'</p></div>\n' +
                        '                            <img src="/Path/'+objArr[i].custPhoto+'">\n' +
                        '                        </a>\n' +
                        '                        <a style="cursor:pointer" class="other" onclick="greet(\'140079711\',\'02.00.10209\');" id="sendMs140079711">打招呼</a>\n' +
                        '                        <a class="red" name='+objArr[i].custId+' onclick="sendMessage(\'140079711\',\'01.00.10210\',\'1540463906312\');" style="cursor:pointer">发消息</a>\n' +
                        '                    </li>');
                }
                if(result===null){
                    var tipsarea=document.getElementById("pageInfo");
                    // tipsarea.style.position="relative";
                    // tipsarea.style.top="50px" ;
                    // tipsarea.style.textAlign="center";
                    tipsarea.innerText="还没有人关注您";
                    return false;
                }else{
                    var tipsarea=document.getElementById("pageInfo");
                    tipsarea.innerText="";
                    return true;
                }
            }}
    </script>

<%@include file="header.jsp"%>
<div id="BAIHE">
    <!--rightCont -->
    <div id="rightCont">
        <div class="lookAtMe">
            <div class="mainNav">
                <a href="javascript:void(0)" onclick="selectInfo(this);look();refreshFollowMelist('${pageContext.request.contextPath}/followAndvisit/getAllVisitme')" id="firstD1" class="info" ><strong class="label01">最近访问
                    <div class="" id="newTotal1"></div>
                </strong><em class="angleB"></em></a>
                <a href="javascript:void(0)" onclick="selectInfo(this);follow();refreshFollowMelist('${pageContext.request.contextPath}/followAndvisit/getAllFollowMe')" id="firstD2" class="info" ><strong class="label03">关注
                    <div class="" id="newTotal2"></div>
                </strong><em class="angleB"></em></a>
            </div>

            <div class="picList">
                <div class="subNav" id="showListInfo">
                    <div class="link" id="link">
                        <%--<a href="#" class="info-1" onclick="sleinfo(this)" >谁关注我（0）</a>--%>
                        <%--<a href="#" class="info-1" class="active" onclick="sleinfo(this)" >我关注谁（0）</a>--%>
                    </div>
                    <p>这里只展示最近<span class="cf60">60</span>个关注过您的异性会员。开通水晶会员，可享查看更多关注我的人等<span class="cf60">更多</span>项特权。<a href="#" class="cf60">立即开通>></a></p>
                </div>
                <ul id="listInfo">
                    <%--<li>--%>
                        <%--<a href="http://profile1.baihe.com?oppID=140079711" target="_blank">--%>
                            <%--<div class="txt"><div></div><p>21岁 江苏苏州</p></div>--%>
                            <%--<img src="http://photo12.baihe.com/2016/07/10/120_150/B3B8A4DC5F39C9362EAA610D1DA2AE3A.jpg">--%>
                        <%--</a>--%>
                        <%--<a style="cursor:pointer" class="other" onclick="greet('140079711','02.00.10209');" id="sendMs140079711">打招呼</a>--%>
                        <%--<a class="red" onclick="sendMessage('140079711','01.00.10210','1540463906312');" style="cursor:pointer">发消息</a>--%>
                    <%--</li>--%>
                </ul>
                <div class="page" id="pageInfo">
                </div>
            </div>
        </div>
    </div>
    <div class="adv90">
        <div class="ad"><iframe name="advert" width="1000" height="90" frameborder="0" scrolling="no" src="http://bhtg.baihe.com/place_282.html"></iframe></div>
    </div>
</div>
<%@include file="footer.jsp"%>
<script type="text/javascript">

    document.getElementById("firstD1").style.color="#f60";
    document.getElementById("firstD1").style.borderBottom="2px solid red";
    function selectInfo(ele){
        var   Array=  document.getElementsByClassName("info");
        for(var i=0;i<Array.length;i++){
            if(ele.innerText==Array[i].innerText){
                ele.style.borderBottom="2px solid red";
                ele.style.color="#f60"
            }else{
                Array[i].style.borderBottom="";
                Array[i].style.color="black";
            }
        }
        return ele.innerText;
    }

    function sleinfo(ele){
        var   Array=  document.getElementsByClassName("info-1");
        for(var i=0;i<Array.length;i++){
            if(ele.innerText===Array[i].innerText){
                ele.style.color="#f60";
            }else{
                Array[i].style.color="black";
            }
        }
        return ele.innerText;
    }

    function follow(){
        var fbody=document.getElementById("link");
        fbody.innerHTML="";
        fbody.innerHTML=('<a href="#" class="info-1" id="care1" onclick="sleinfo(this);refreshFollowMelist(\'${pageContext.request.contextPath}/followAndvisit/getAllFollowMe\')" >谁关注我（${followmeCount}）</a>\n' +
            '                        <a href="#" class="info-1" onclick="sleinfo(this);refreshFollowMelist(\'${pageContext.request.contextPath}/followAndvisit/getAllMyFollow\')" >我关注谁（${myfollowCount}）</a>');
        document.getElementById("care1").style.color="#f60";
    }
    function look() {
        var lbody=document.getElementById("link");
        lbody.innerHTML="";
        lbody.innerHTML=('<a href="#" class="info-1" id="care2"  onclick="sleinfo(this);refreshFollowMelist(\'${pageContext.request.contextPath}/followAndvisit/getAllVisitme\')" >谁看过我（${visitmecount}）</a>\n' +
            '                        <a href="#" class="info-1"  onclick="sleinfo(this);refreshFollowMelist(\'${pageContext.request.contextPath}/followAndvisit/getmyVisitOtherById\')" >我看过谁（${myvisitothercount}）</a>');
        document.getElementById("care2").style.color="#f60";
    }
    window.onload=function(){follow();look();refreshFollowMelist('${pageContext.request.contextPath}/followAndvisit/getAllVisitme')};
</script>
   <%--     <script type="text/javascript">
            var ur =location.href;
            alert(ur);
            var type=ur.split('?')[1].split("=")[1];
            alert(type);
            document.getElementById(type.toString()).style.display="none";

            var e = document.createEvent("MouseEvents");
            e.initEvent("click", true, true);
            document.getElementById(type).dispatchEvent(e);

        </script>--%>
</body>
</html>
