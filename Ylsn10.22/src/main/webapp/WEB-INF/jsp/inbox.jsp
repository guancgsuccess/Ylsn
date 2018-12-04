<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2018/10/18 0018
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inbox.css">

    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simpleAlert.css">
    <script  type="text/javascript" src="${pageContext.request.contextPath}/js/inbox.js"></script>
    <script  src="${pageContext.request.contextPath}/js/simpleAlert.js"></script>
    <style>
    #deleteAll {line-height:18px;position: relative;left: 5px; }
    #deleteAll img{width: 15px; height: 15px;position: relative;margin-top: 4px;margin-left: 4px; }
    #deleteAll a{color: black;position: relative;top: -2px;}
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div id="body">
    <div id="main">
        <div id="main-left" >
            <div id="title">
                <ul>
                    <li><a href="javascript:void(0)" id="unread" class="message" onclick="selectedTitle(this);refreshSenderList('${pageContext.request.contextPath}/message/msg')">未读消息</a></li>
                    <li><a href="javascript:void(0)" id="read" class="message" onclick="selectedTitle(this);refreshReadList('${pageContext.request.contextPath}/message/readmsg')">已读消息</a></li>
                    <li><a href="javascript:void(0)" id="mysend" class="message" onclick="selectedTitle(this);refreshSendList('${pageContext.request.contextPath}/message/sendmsg')">已发消息</a></li>
                </ul>
            </div>

            <div id="mid">
                <div id="mid-title">
                    <ul>
                        <li>全部消息</li>
                    </ul>
                </div>
                <div id="mid-title2">
                    <input type="text" placeholder="请输入对方昵称">
                    <a href="#" ><img  src="${pageContext.request.contextPath}/img/search.png"></a>
                </div>
            </div>

            <div id="letter">
                <ul id="box">
                </ul>
            </div>

            <div id="deleteAll" style="float: left;width: 100px;height: 20px;text-decoration: none;line-height: 18px;font-size:15px;" ></div>
            <div id="pagearea" style="float: right"></div>

            <%--<div id="tips" style="height: 30px;position: relative;top: 165px;left: 100px;"></div>--%>
            <div id="tips"></div>
            <%--<-ajax部分实现未读信息功能  ->--%>
            <script type="text/javascript">

                //页面加载后，首先加载所有的用户数据
             var   url_getsendlist='${pageContext.request.contextPath}/message/msg';
                window.onload=function() {
                    refreshSenderList( url_getsendlist);
                };
                //加载用户数据
                var xhr = null;
                function refreshSenderList(url_getsendlist) {
                    var objArr = null;

                    if (window.XMLHttpRequest) {
                        xhr = new XMLHttpRequest();
                    } else {
                        xhr = new ActiveXObject('Microsoft.XMLHTTP');
                    }
                    xhr.open("GET", url_getsendlist, true);
                    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                    xhr.onreadystatechange = loadUsers;
                    xhr.send();
                }

                function loadUsers() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // alert("pagemodel:" + xhr.responseText);

                        var result = JSON.parse(xhr.responseText);
                        //1. 数据渲染
                        objArr  = result.modelList;
                        // alert("objArr:"+objArr);
                       pagecount= result.totalPages;
                       // alert("pagecount"+pagecount);
                        var tbody = document.getElementById("box");
                        tbody.innerHTML = "";
                        for (var i = 0; i < objArr.length; i++) {

                            tbody.innerHTML += (' <li>\n' +
                                '                        <div class="letter-one">\n' +
                                '                            <div class="del" >\n' +
                                '                                <a href="#" name='+objArr[i].custId+' onclick="deletemess(this)" ><img src="${pageContext.request.contextPath}/img/del.gif"></a>\n' +
                                '                            </div>\n' +
                                '                            <div class="kk">\n' +
                                '                                <a href=""><img class="aa" src="/Path/'+objArr[i].custPhoto+'"></a>\n' +
                                '                            </div>\n' +
                                '                            <div class="ll">\n' +
                                '                                <div class="ll-1">\n' +
                                '                                    <a href=""><span class="name">'+objArr[i].custNickname+'</span></a>\n' +
                                '                                    <span class="info">  '+objArr[i].custBirthday+'岁, '+objArr[i].custMarriage+', '+ objArr[i].custProvince+', '+ objArr[i].custHeight+'cm</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="ll-2">\n' +
                                '                                    <label><img src="${pageContext.request.contextPath}/img/time.png">'+objArr[i].messTime+'</label>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="look">\n' +
                                '                                <a onclick="see('+objArr[i].custId+')"><span>查看('+objArr[i].countMsg+')</span></a>\n' +
                                '                            </div>\n' +
                                '                        </div>\n' +
                                '                    </li>\n' +
                                '                  ' );
                        }

                        if(result.totalPages===0){
                            var pagearea = document.getElementById("pagearea");
                            pagearea.innerText="";
                            var deletearea=document.getElementById("deleteAll");
                            deletearea.innerText="";
                            var tipsarea=document.getElementById("tips");
                            tipsarea.style.marginTop="130px";
                            tipsarea.style.textAlign="center";
                            tipsarea.innerText="无未读消息!快向心动的人表白吧!";
                            return false;
                        }else{
                            var tipsarea=document.getElementById("tips");
                            tipsarea.innerText="";
                        //删除所有按钮
                        var deletearea=document.getElementById("deleteAll");
                        deletearea.innerHTML=('  <img src="${pageContext.request.contextPath}/img/delete.png">\n' +
                            '                <a href="Javascript:void(0)"onclick="deleteAllmess()">删除所有</a>');

                        //2. 页码渲染
                        var pagearea = document.getElementById("pagearea");
                        pagearea.innerHTML="";

                        //(1)上一页
                        if(result.currentPageCode !=1){// 不是首页，则显示上一页
                            var url_pre_page = url_getsendlist +"/page/"+(result.currentPageCode-1);
                            var  href='javascript:refreshSenderList("'+url_pre_page+'")';
                            var prePageEle = "<a  href='"+href+"'> 上一页</a>";
                            pagearea.innerHTML+=prePageEle;
                        }
                        //(2)当前页码
                        var currentPageEle = " <span>当前是第 </span><span>"+  result.currentPageCode  +"</span><span>  页      </span>";
                        pagearea.innerHTML+=currentPageEle;

                        //(3)下一页
                        if(result.currentPageCode != result.totalPages){
                            var url_next_page = url_getsendlist +"/page/"+(result.currentPageCode+1);
                            var  href='javascript:refreshSenderList("'+url_next_page+'")';
                            var nextPageEle = "<a  href='"+href+"'>   下一页</a>";
                            pagearea.innerHTML+=nextPageEle;

                        }
                        //(4) 页码其他信息
                        var othersEle = "<span>      共   </span><span>"+  result.totalPages  +"</span><span>   页</span>\n" ;
                        pagearea.innerHTML+=othersEle;
                        //页码渲染
                            return true;
                         }
                    }
                }
                function see(id) {
                    update("${pageContext.request.contextPath}/message/read?messFromId="+id);
                    window.location.href="${pageContext.request.contextPath}/readMail?messFromId="+id;
                }
                function update(url) {
                    if (window.XMLHttpRequest) {
                        xhr = new XMLHttpRequest();
                    } else {
                        xhr = new ActiveXObject('Microsoft.XMLHTTP');
                    }
                    xhr.open("GET", url, false);
                    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                    xhr.send();
                }
                function deletemess(ele) {
                    var dblChoseAlert = simpleAlert({
                        "title":"确定删除?",
                        "buttons":{
                            "确定":function () {
                                if (window.XMLHttpRequest) {
                                    xhr = new XMLHttpRequest();
                                } else {
                                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                                }
                                var delId = ele.name;

                                var url_deluse = '${pageContext.request.contextPath}/message/deleteunread/';
                                var url_deluser=url_deluse+delId;
                                 var  url_getsendlis='${pageContext.request.contextPath}/message/msg';
                                xhr.open("DELETE", url_deluser);
                                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                                xhr.onreadystatechange = function(){refreshSenderList(url_getsendlis);};
                                xhr.send();
                                dblChoseAlert.close();
                            },
                            "取消":function () {
                                dblChoseAlert.close();
                            }
                        }
                    });
                }

                function deleteAllmess() {
                    var dblChoseAlert = simpleAlert({
                        "title":"确定删除所有消息?",
                        "buttons":{
                            "确定":function () {
                                if (window.XMLHttpRequest) {
                                    xhr = new XMLHttpRequest();
                                } else {
                                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                                }
                                var url_deluser = '${pageContext.request.contextPath}/message/deleteallmsg';

                                var  url_getsendlis='${pageContext.request.contextPath}/message/msg';
                                xhr.open("DELETE", url_deluser);
                                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                                xhr.onreadystatechange = function(){refreshSenderList(url_getsendlis);};
                                xhr.send();
                                dblChoseAlert.close();
                            },
                            "取消":function () {
                                dblChoseAlert.close();
                            }
                        }
                    });
                }
            </script>

            <%--实现已读--%>
            <script type="text/javascript">
                var   url_getsendlist2='${pageContext.request.contextPath}/message/readmsg';
                //加载用户数据
                var xhr = null;
                function refreshReadList(url_getsendlist2) {
                    var objArr = null;

                    if (window.XMLHttpRequest) {
                        xhr = new XMLHttpRequest();
                    } else {
                        xhr = new ActiveXObject('Microsoft.XMLHTTP');
                    }
                    xhr.open("GET", url_getsendlist2, true);
                    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                    xhr.onreadystatechange = loadUsers2;
                    xhr.send();
                }

                function loadUsers2() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // alert("pagemodel:" + xhr.responseText);

                        var result = JSON.parse(xhr.responseText);
                        //1. 数据渲染
                        objArr  = result.modelList;
                        // alert("objArr:"+objArr);
                        pagecount= result.totalPages;
                        // alert("pagecount"+pagecount);
                        var tbody = document.getElementById("box");
                        tbody.innerHTML = "";
                        for (var i = 0; i < objArr.length; i++) {

                            tbody.innerHTML += (' <li>\n' +
                                '                        <div class="letter-one">\n' +
                                '                            <div class="del" >\n' +
                                '                                <a href="#" name='+objArr[i].custId+' onclick="deletemess2(this)" ><img src="${pageContext.request.contextPath}/img/del.gif"></a>\n' +
                                '                            </div>\n' +
                                '                            <div class="kk">\n' +
                                '                                <a href=""><img class="aa" src="/Path/'+objArr[i].custPhoto+'"></a>\n' +
                                '                            </div>\n' +
                                '                            <div class="ll">\n' +
                                '                                <div class="ll-1">\n' +
                                '                                    <a href=""><span class="name">'+objArr[i].custNickname+'</span></a>\n' +
                                '                                    <span class="info">  '+objArr[i].custBirthday+'岁, '+objArr[i].custMarriage+', '+ objArr[i].custProvince+', '+ objArr[i].custHeight+'cm</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="ll-2">\n' +
                                '                                    <label><img src="${pageContext.request.contextPath}/img/time.png">'+objArr[i].messTime+'</label>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="look">\n' +
                                '                                <a href="${pageContext.request.contextPath}/readMail?messFromId='+objArr[i].custId+'" name='+objArr[i].custId+'><span>查看</span></a>\n' +
                                '                            </div>\n' +
                                '                        </div>\n' +
                                '                    </li>\n' +
                                '                  ' );
                        }

                        if(result.totalPages===0){
                            var pagearea = document.getElementById("pagearea");
                            pagearea.innerText="";
                            var deletearea=document.getElementById("deleteAll");
                            deletearea.innerText="";
                            var tipsarea=document.getElementById("tips");
                            tipsarea.style.marginTop="130px";
                            tipsarea.style.textAlign="center";
                            tipsarea.innerText="无已读消息!快向心动的人表白吧!";
                            return false;
                        }else{
                            var tipsarea=document.getElementById("tips");
                            tipsarea.innerText="";
                            //删除所有按钮
                            var deletearea=document.getElementById("deleteAll");
                            deletearea.innerHTML=('  <img src="${pageContext.request.contextPath}/img/delete.png">\n' +
                                '                <a href="Javascript:void(0)"onclick="deleteReadmess()">删除所有</a>');
                            //2. 页码渲染
                            var pagearea = document.getElementById("pagearea");
                            pagearea.innerHTML="";
                            //(1)上一页
                            if(result.currentPageCode !=1){// 不是首页，则显示上一页
                                var url_pre_page = url_getsendlist2 +"/page/"+(result.currentPageCode-1);
                                var  href='javascript:refreshReadList("'+url_pre_page+'")';
                                var prePageEle = "<a  href='"+href+"'> 上一页</a>";
                                pagearea.innerHTML+=prePageEle;
                            }
                            //(2)当前页码
                            var currentPageEle = " <span>当前是第 </span><span>"+  result.currentPageCode  +"</span><span>  页      </span>";
                            pagearea.innerHTML+=currentPageEle;

                            //(3)下一页
                            if(result.currentPageCode != result.totalPages){
                                var url_next_page = url_getsendlist2 +"/page/"+(result.currentPageCode+1);
                                var  href='javascript:refreshReadList("'+url_next_page+'")';
                                var nextPageEle = "<a  href='"+href+"'>   下一页</a>";
                                pagearea.innerHTML+=nextPageEle;

                            }
                            //(4) 页码其他信息
                            var othersEle = "<span>      共   </span><span>"+  result.totalPages  +"</span><span>   页</span>\n" ;
                            pagearea.innerHTML+=othersEle;
                            //页码渲染
                            return true;
                        }

                    }
                }

                function deletemess2(ele) {
                    var dblChoseAlert = simpleAlert({
                        "title":"确定删除?",
                        "buttons":{
                            "确定":function () {
                                if (window.XMLHttpRequest) {
                                    xhr = new XMLHttpRequest();
                                } else {
                                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                                }
                                var delId = ele.name;
                                // alert(delId);
                                var url_deluse = '${pageContext.request.contextPath}/message/deleteread/';
                                var url_deluser=url_deluse+delId;
                                // alert("url_deluser="+url_deluser);
                                var  url_getsendlis='${pageContext.request.contextPath}/message/readmsg';
                                xhr.open("DELETE", url_deluser);
                                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                                xhr.onreadystatechange = function(){refreshReadList(url_getsendlis);};
                                xhr.send();
                                dblChoseAlert.close();
                            },
                            "取消":function () {
                                dblChoseAlert.close();
                            }
                        }
                    });
                }

                function deleteReadmess() {
                    var dblChoseAlert = simpleAlert({
                        "title":"确定删除所有消息?",
                        "buttons":{
                            "确定":function () {
                                if (window.XMLHttpRequest) {
                                    xhr = new XMLHttpRequest();
                                } else {
                                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                                }
                                var url_deluser = '${pageContext.request.contextPath}/message/deletereadmsg';

                                var  url_getsendlis='${pageContext.request.contextPath}/message/readmsg';
                                xhr.open("DELETE", url_deluser);
                                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                                xhr.onreadystatechange = function(){refreshReadList(url_getsendlis);};
                                xhr.send();
                                dblChoseAlert.close();
                            },
                            "取消":function () {
                                dblChoseAlert.close();
                            }
                        }
                    });
                }
            </script>

            <%--实现已发消息--%>
            <script type="text/javascript">
                var   url_getSendList='${pageContext.request.contextPath}/message/sendmsg';

                //加载用户数据
                var xhr = null;
                function refreshSendList(url_getSendList) {
                    var objArr = null;
                    if (window.XMLHttpRequest) {
                        xhr = new XMLHttpRequest();
                    } else {
                        xhr = new ActiveXObject('Microsoft.XMLHTTP');
                    }
                    xhr.open("GET", url_getSendList, true);
                    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                    xhr.onreadystatechange = loadUsers3;
                    xhr.send();
                }

                function loadUsers3() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // alert("pagemodel:" + xhr.responseText);

                        var result3 = JSON.parse(xhr.responseText);
                        //1. 数据渲染
                        objArr  = result3.modelList;
                        // alert("objArr:"+objArr);
                        // pagecount= result3.totalPages;
                        // alert("pagecount"+pagecount);
                        var tbody = document.getElementById("box");
                        tbody.innerHTML = "";
                        for (var i = 0; i < objArr.length; i++) {
                            tbody.innerHTML += (' <li>\n' +
                                '                        <div class="letter-one">\n' +
                                '                            <div class="del" >\n' +
                                '                                <a href="#" name='+objArr[i].custId+' onclick="deletemess3(this)" ><img src="${pageContext.request.contextPath}/img/del.gif"></a>\n' +
                                '                            </div>\n' +
                                '                            <div class="kk">\n' +
                                '                                <a href=""><img class="aa" src="/Path/'+objArr[i].custPhoto+'"></a>\n' +
                                '                            </div>\n' +
                                '                            <div class="ll">\n' +
                                '                                <div class="ll-1">\n' +
                                '                                    <a href=""><span class="name">'+objArr[i].custNickname+'</span></a>\n' +
                                '                                    <span class="info">  '+objArr[i].custBirthday+'岁, '+objArr[i].custMarriage+', '+ objArr[i].custProvince+', '+ objArr[i].custHeight+'cm</span>\n' +
                                '                                </div>\n' +
                                '                                <div class="ll-2">\n' +
                                '                                    <label><img src="${pageContext.request.contextPath}/img/time.png">'+objArr[i].messTime+'</label>\n' +
                                '                                </div>\n' +
                                '                            </div>\n' +
                                '                            <div class="look">\n' +
                                '                                <a href="${pageContext.request.contextPath}/readMail?messFromId='+objArr[i].custId+'"><span>查看</span></a>\n' +
                                '                            </div>\n' +
                                '                        </div>\n' +
                                '                    </li>\n' +
                                '                  ' );
                        }
                        // alert(result3.totalPages);
                        if(result3.totalPages===0){
                            var pagearea = document.getElementById("pagearea");
                            pagearea.innerText="";
                            var deletearea=document.getElementById("deleteAll");
                            deletearea.innerText="";
                            var tipsarea=document.getElementById("tips");
                            tipsarea.style.marginTop="130px";
                            tipsarea.style.textAlign="center";
                            tipsarea.innerText="你没有给任何人发送过消息!快向关注的人表白吧!";
                            return false;
                        }else{
                            var tipsarea=document.getElementById("tips");
                            tipsarea.innerText="";
                            //删除所有按钮
                            var deletearea=document.getElementById("deleteAll");
                            deletearea.innerHTML=('  <img src="${pageContext.request.contextPath}/img/delete.png">\n' +
                                '                <a href="Javascript:void(0)"onclick="deleteSendmess()">删除所有</a>');
                            //2. 页码渲染
                            var pagearea = document.getElementById("pagearea");
                            pagearea.innerHTML="";
                            //(1)上一页
                            if(result3.currentPageCode !=1){// 不是首页，则显示上一页
                                var url_pre_page = url_getSendList +"/page/"+(result3.currentPageCode-1);
                                var  href='javascript:refreshSendList("'+url_pre_page+'")';
                                var prePageEle = "<a  href='"+href+"'> 上一页</a>";
                                pagearea.innerHTML+=prePageEle;
                            }
                            //(2)当前页码
                            var currentPageEle = " <span>当前是第 </span><span>"+  result3.currentPageCode  +"</span><span>  页      </span>";
                            pagearea.innerHTML+=currentPageEle;
                            //(3)下一页
                            if(result3.currentPageCode != result3.totalPages){
                                var url_next_page = url_getSendList +"/page/"+(result3.currentPageCode+1);
                                var  href='javascript:refreshSendList("'+url_next_page+'")';
                                var nextPageEle = "<a  href='"+href+"'>   下一页</a>";
                                pagearea.innerHTML+=nextPageEle;
                            }
                            //(4) 页码其他信息
                            var othersEle = "<span>      共   </span><span>"+  result3.totalPages  +"</span><span>   页</span>\n" ;
                            pagearea.innerHTML+=othersEle;
                            return true;
                        }

                    }
                }

                function deletemess3(ele) {
                    var dblChoseAlert = simpleAlert({
                        "title":"确定删除?",
                        "buttons":{
                            "确定":function () {
                                if (window.XMLHttpRequest) {
                                    xhr = new XMLHttpRequest();
                                } else {
                                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                                }
                                var delId = ele.name;
                                // alert(delId);
                                var url_delusers = '${pageContext.request.contextPath}/message/deleteTo/';
                                var url_deluser=url_delusers+delId;
                                // alert("url_deluser="+url_deluser);
                                var  url_getsendlis='${pageContext.request.contextPath}/message/sendmsg';
                                xhr.open("DELETE", url_deluser);
                                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                                xhr.onreadystatechange = function(){refreshSendList(url_getsendlis);};
                                xhr.send();
                                dblChoseAlert.close();
                            },
                            "取消":function () {
                                dblChoseAlert.close();
                            }
                        }
                    });
                }

                function deleteSendmess() {
                    var dblChoseAlert = simpleAlert({
                        "title":"确定删除所有消息?",
                        "buttons":{
                            "确定":function () {
                                if (window.XMLHttpRequest) {
                                    xhr = new XMLHttpRequest();
                                } else {
                                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                                }
                                var url_deluser = '${pageContext.request.contextPath}/message/deletesendmsg';

                                var  url_getsendlis='${pageContext.request.contextPath}/message/sendmsg';
                                xhr.open("DELETE", url_deluser);
                                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                                xhr.onreadystatechange = function(){refreshSendList(url_getsendlis);};
                                xhr.send();
                                dblChoseAlert.close();
                            },
                            "取消":function () {
                                dblChoseAlert.close();
                            }
                        }
                    });
                }
            </script>
        </div>

        <div id="main-right" >
            <a href=""><img src="${pageContext.request.contextPath}/img/advertising.png"></a>
            <a href=""><img src="${pageContext.request.contextPath}/img/adver2.png"></a>
        </div>

    </div>
    <%@include file="footer.jsp"%>
</div>
<script type="text/javascript">
    function loadData(num) {
        $("#PageCount").val("89");
    }
    document.getElementById("unread").style.color="#ff8758";
</script>
</body>
</html>
