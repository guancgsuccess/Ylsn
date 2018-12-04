<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2018/10/19 0019
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personalCenter.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.cropper.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom_up_img.css">
    <style type="text/css">
        .up-img-cover {width: 100px;height: 100px;}
        .up-img-cover img{width: 100%;}
    </style>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
    <script type="text/javascript">
        window.onload=function () {
            refreshTwoCustList('${pageContext.request.contextPath}/cust/getTwoCust');
        };
    </script>
    <script type="text/javascript">
        //页面加载后，首先加载我关注的用户数据
        //加载用户数据
        var xhr = null;
        function refreshMyFollowList(url_myfollowlist) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", url_myfollowlist, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUsers1;
            xhr.send();
        }
        var objArr = null;
        function loadUsers1() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // alert("MyFollow:" + xhr.responseText);
                var result1 = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result1;
                // alert("objArr:"+objArr);
                var tbody1 = document.getElementById("myFollow");
                tbody1.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    tbody1.innerHTML += (' <li><a href="${pageContext.request.contextPath}/customer/message?id='+objArr[i].custId+'" name='+objArr[i].custId+'><img src="/Path/'+objArr[i].custPhoto+'"></a><a class="aa" href=""> '+objArr[i].custBirthday+'岁  '+objArr[i].custProvince+'</a><a class="bb" href="${pageContext.request.contextPath}/readMail?messFromId='+objArr[i].custId+'">求牵</a></li> ' );
                }
                if(result1.length===0){
                    var tipsarea1=document.getElementById("tips");
                    tipsarea1.style.position="relative";
                    tipsarea1.style.top="50px" ;
                    tipsarea1.style.textAlign="center";
                    tipsarea1.innerText="你没有关注任何人";
                    return false;
                }else{
                    var tipsarea1=document.getElementById("tips");
                    tipsarea1.innerText="";
                    return true;
                }
            }}
    </script>

    <script>
        var   url_followmelist='${pageContext.request.contextPath}/cust/followMe';
        var xhr = null;
        function refreshFollowMeList(url_followmelist) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", url_followmelist, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUsers2;
            xhr.send();
        }
        var objArr = null;
        function loadUsers2() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // alert("MyFollow:" + xhr.responseText);

                var result2 = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result2;
                // alert("objArr:"+objArr);
                var tbody2 = document.getElementById("myFollow");
                tbody2.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    tbody2.innerHTML += (' <li><a href="${pageContext.request.contextPath}/customer/message?id='+objArr[i].custId+'" name='+objArr[i].custId+'><img src="/Path/'+objArr[i].custPhoto+'"></a><a class="aa" href="javascript:void(0)"> '+objArr[i].custBirthday+'岁  '+objArr[i].custProvince+'</a><a class="bb" href="${pageContext.request.contextPath}/readMail?messFromId='+objArr[i].custId+'">求牵</a></li> ' );
                }
                           if(result2.length===0){
                               var tipsarea2=document.getElementById("tips");
                               tipsarea2.style.position="relative";
                               tipsarea2.style.top="50px" ;
                               tipsarea2.style.textAlign="center";
                               tipsarea2.innerText="还没有人关注您";
                               return false;
                           }else{
                               var tipsarea2=document.getElementById("tips");
                               tipsarea2.innerText="";
                               return true;
                           }

            }}
    </script>
    <%--看过我的--%>
    <script>
        //加载关注我的用户数据
        var   url_visitmelist='${pageContext.request.contextPath}/cust/visitMe';
        var xhr = null;
        function refreshVisitMeList(url_visitmelist) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", url_visitmelist, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUsers3;
            xhr.send();
        }
        var objArr = null;
        function loadUsers3() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // alert("MyFollow:" + xhr.responseText);
                var result3 = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result3;
                // alert("objArr:"+objArr);
                var tbody3 = document.getElementById("myFollow");
                tbody3.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    tbody3.innerHTML += (' <li><a href="${pageContext.request.contextPath}/customer/message?id='+objArr[i].custId+'" name='+objArr[i].custId+'><img src="/Path/'+objArr[i].custPhoto+'"></a><a class="aa" href=""> '+objArr[i].custBirthday+'岁  '+objArr[i].custProvince+'</a><a class="bb" href="${pageContext.request.contextPath}/readMail?messFromId='+objArr[i].custId+'">求牵</a></li> ' );
                }
                if(result3.length===0){
                    var tipsarea3=document.getElementById("tips");
                    tipsarea3.style.position="relative";
                    tipsarea3.style.top="50px" ;
                    tipsarea3.style.textAlign="center";
                    tipsarea3.innerText="近期没有人看过您";
                    return false;
                }else{
                    var tipsarea3=document.getElementById("tips");
                    tipsarea3.innerText="";
                    return true;
                }

            }}
    </script>
<%--随机获得四个异性用户--%>
    <script>
        var xhr = null;
        function refreshFourCustList(url_fourcustlist) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", "/cust/getFourCust", true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUsers4;
            xhr.send();
        }
        var objArr = null;
        function loadUsers4() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // alert("refreshFourCustList:" + xhr.responseText);
                var result4 = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result4;
                // alert("objArr:"+objArr);
                var tbody4 = document.getElementById("qqq");
                tbody4.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    tbody4.innerHTML += ('    <div class="look3">\n' +
                        '                      <a href="${pageContext.request.contextPath}/customer/message?id='+objArr[i].custId+'"> <img src="/Path/'+objArr[i].custPhoto+'"></a>\n' +
                        '                        <div class="txt">\n' +
                        '                            <p class="name">'+objArr[i].custNickname+'</p>\n' +
                        '                            <p class="">'+objArr[i].custBirthday+'岁  '+objArr[i].custHeight+'cm  '+objArr[i].custEducation+'</p>\n' +
                        '                            <a href="javascript:void(0)"  name='+objArr[i].custId+' class="flash">喜欢</a>\n' +
                        '                        </div>\n' +
                        '                    </div>' );
                }
            }}
    </script>

    <%--随机获得两个异性--%>
    <script>
        var xhr = null;
        function refreshTwoCustList(url_twocustlist) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", url_twocustlist, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUsers5;
            xhr.send();
        }
        var objArr = null;
        function loadUsers5() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // alert("refreshTwoCustList:" + xhr.responseText);
                var result5 = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result5;
                // alert("objArr:"+objArr);
                var tbody5 = document.getElementById("title-left");
                tbody5.innerHTML = "";
                var tbody6 = document.getElementById("title-right");
                tbody6.innerHTML = "";
                for (var k = 0; k < objArr.length; k++) {
                    if(k===0){
                        tbody5.innerHTML += ('    <div class="pic">\n' +
                            '                            <a class="C33" href="${pageContext.request.contextPath}/customer/message?id='+objArr[k].custId+'"><img src="/Path/'+objArr[k].custPhoto+'"></a>\n' +
                            '                            <a class="C33" href="">\n' +
                            '                                <center>'+objArr[k].custNickname+'</center>\n' +
                            '                                '+objArr[k].custBirthday+'岁 '+objArr[k].custEducation+'\n' +
                            '                            </a>\n' +
                            '                        </div>\n' +
                            '                        <a class="icon" name='+objArr[k].custId+' href="javascript:void(0)" onclick="like(this)" id="icon-left" ><img src="${pageContext.request.contextPath}/img/love1.png">    喜欢她</a>' );

                    }else if(k===1) {
                        tbody6.innerHTML += ('    <div class="pic">\n' +
                            '                            <a class="C33" href="${pageContext.request.contextPath}/customer/message?id='+objArr[k].custId+'"><img src="/Path/'+objArr[k].custPhoto+'"></a>\n' +
                            '                            <a class="C33" href="">\n' +
                            '                                <center>'+objArr[k].custNickname+'</center>\n' +
                            '                                '+objArr[k].custBirthday+'岁 '+objArr[k].custEducation+'\n' +
                            '                            </a>\n' +
                            '                        </div>\n' +
                            '                        <a class="icon" name='+objArr[k].custId+' href="javascript:void(0)" onclick="like(this)" id="icon-right" ><img src="${pageContext.request.contextPath}/img/love2.png">    喜欢她</a> ' );
                    }
                }
            }}
    </script>
</head>
<body>
<div id="body">
    <%@include file="header.jsp"%>
    <div id="main">
        <div id="main-left">
            <div id="main-left-top">
                <div id="top-part1">
                   <c:choose>
                       <c:when test="${empty Photo}">
                           <a href=""><img src="${pageContext.request.contextPath}/img/upload_pic.jpg"></a>
                       </c:when>
                       <c:otherwise>
                           <a href=""><img src="/Path/${Photo}"></a>
                       </c:otherwise>
                   </c:choose>
                    <a href="javascript:void(0)" class="up-img-cover"  id="up-img-touch"><span>上传照片</span></a>
                    <a href="${pageContext.request.contextPath}/customer/getMyInfo" ><span>编辑资料</span></a>
                </div>
                <div id="top-part2">
                    <a class="xx" href=""><p>${Nickname}</p></a>
                    <div class="p2">
                        <span>我的等级</span><label>超级会员</label><label><a href="">升级<img src="${pageContext.request.contextPath}/img/arrow_01.gif"></a></label>
                    </div>
                    <div class="p2">
                        <span>等级认证</span><a href=""><img class="imgss" src="${pageContext.request.contextPath}/img/icon_08.gif"></a><a href=""><img class="imgss" src="${pageContext.request.contextPath}/img/icon_04g.gif"></a><a href=""><img class="imgss" src="${pageContext.request.contextPath}/img/icon_05g.gif"></a>
                        <a href=""><img class="imgss" src="${pageContext.request.contextPath}/img/icon_00g.gif"></a><a href=""><img class="imgss" src="${pageContext.request.contextPath}/img/icon_09g.gif"></a>
                        <span  class="tisheng"><a href="">提升<img src="${pageContext.request.contextPath}/img/arrow_01.gif"></a></span>
                    </div>
                    <div class="p2">
                        <span>爱情账户</span><img class="imgss" src="${pageContext.request.contextPath}/img/star_levelK.png"><span class="tisheng"><a href="">提升<img src="${pageContext.request.contextPath}/img/arrow_01.gif"></a></span>
                    </div>
                </div>
                <div id="top-part3">
                    <span class="zz">安全提示：加强自我防范意识，警惕投资、理财、赌彩等诈骗方式!</span>
                    <div id="top-part3-ul">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/minbox" target="_blank"><span>${unreadCount}</span><p>未读消息</p></a></li>
                            <li><a href="${pageContext.request.contextPath}/followAndvisit/follviscount?type=firstD1" target="_blank"><span>${visitCount}</span><p>访问人数</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="main-left-l">
                <span class="qq">推荐服务</span>
                <div class="rechange">
                    <a href="">
                        <span class="pic-icon">情满金秋</span>
                        <label>进入</label>
                        <p>0元领今日明星特权</p>
                    </a>
                </div>

                <div class="rechange">
                    <a href="">
                        <span class="pic-icon1">金至尊牵线</span>
                        <label>开通</label>
                        <p>专享人工牵线特权</p>
                    </a>
                </div>
                <div class="rechange">
                    <a href="">
                        <span class="pic-icon2">水晶会员</span>
                        <label>开通</label>
                        <p>享受11项尊贵特权</p>
                    </a>
                </div>
                <div class="rechange">
                    <a href="">
                        <span class="pic-icon3">高级会员</span>
                        <label>开通</label>
                        <p>尊享全站免费沟通等特权</p>
                    </a>
                </div>
                <div class="rechange">
                    <a href="">
                        <span class="pic-icon4">红娘牵线</span>
                        <label>开通</label>
                        <p>红娘帮忙牵线搭桥寻对象</p>
                    </a>
                </div>
                <div class="rechange">
                    <a href="">
                        <span class="pic-icon5">红娘服务</span>
                        <label>体验</label>
                        <p>人工红娘一对一服务</p>
                    </a>
                </div>
                <div class="rechange">
                    <a href="">
                        <span class="pic-icon6">我的缘来豆</span>
                        <label>开通</label>
                        <p>百合通用虚拟货币</p>
                    </a>
                </div>
                <div class="rechange">
                    <a href="">
                        <span class="pic-icon7">今日明星</span>
                        <label>开通</label>
                        <p>获得关注的最快途径</p>
                    </a>
                </div>
                <div class="yy">
                    <span class="qq">缘来应用</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon8">丘比特之箭</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon9">心灵匹配测试</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon10">love双重奏</span>
                </div>
                <div class="yy">
                    <span class="qq">缘来账户</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon11">我的优惠券</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon12">我的资料</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon13">我的照片</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon14">我的认证</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon15">实名认证</span>
                </div>
                <div class="rechange2">
                    <span class="pic-icon16">手机认证</span>
                </div>
                <div class="rechange2">
                    <a href="${pageContext.request.contextPath}/condition" target="_blank"><span class="pic-icon17">择偶意向</span></a>
                </div>
                <div class="rechange2">
                   <a href="${pageContext.request.contextPath}/setBlock" target="_blank"><span class="pic-icon18">账号设置</span></a>
                </div>
            </div>
            <div id="main-left-r">
                <div class="carousel" @mouseenter="enter" @mouseleave="leave">
                    <transition-group
                            tag="ul"
                            name="image"
                            enter-active-class="animated lightSpeedIn"
                            leave-active-class="animated lightSpeedOut"
                    >
                        <li v-for='(image,index) in img' :key='index' v-show="index === mark">
                            <a href="javascript:;">
                                <img :src="image">
                            </a>
                        </li>
                    </transition-group>
                    <div class="bullet">
                               <span v-for="(item,index) in img.length" :class="{'active':index === mark}"
                                     @click="change(index)" :key="index"></span>
                    </div>
                    <div class="switch">
                        <span class="prev" @click="prev">&lt;</span>
                        <span class="next" @click="next">&gt;</span>
                    </div>
                    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
                    <script src="${pageContext.request.contextPath}/js/vue.min.js"></script>
                    <script>
                        /*
                         轮播逻辑
                         效果 ==> 图片显示第几章的时候，下面的bullet的第几个就要改变成active
                         点击相应的bullet可以切换到对应的图片
                         */
                        //初始化一个vue实例然后挂载到父元素上，并设定数据为图片的数组，以及后面计数用的mark，mark初始值为0
                        var vm = new Vue({
                            el:'.carousel',
                            data:{
                                mark:0,
                                img:[
                                    '${pageContext.request.contextPath}/img/zt20170621.jpg',
                                    '${pageContext.request.contextPath}/img/zt20161206sj3.jpg',
                                    '${pageContext.request.contextPath}/img/zt20160830sj4.jpg',
                                    '${pageContext.request.contextPath}/img/zt20161206sj3.jpg'
                                ],
                                time:null
                            },
                            methods:{   //添加方法
                                change(i){
                                    this.mark = i;
                                },
                                prev(){
                                    this.mark--;
                                    if(this.mark === -1){
                                        this.mark = 3;
                                        return
                                    }
                                },
                                next(){
                                    this.mark++;
                                    if(this.mark === 4){
                                        this.mark = 0;
                                        return
                                    }
                                },
                                autoPlay(){
                                    this.mark++;
                                    if(this.mark === 4){
                                        this.mark = 0;
                                        return
                                    }
                                },
                                play(){
                                    this.time = setInterval(this.autoPlay,5000);
                                },
                                enter(){
                                    console.log('enter')
                                    clearInterval(this.time);
                                },
                                leave(){
                                    console.log('leave')
                                    this.play();
                                }
                            },
                            created(){
                                this.play()
                            }
                        })
                    </script>
                </div>

                <div id="menutable">
                    <ul>
                        <li><a href="javascript:void(0)" name="${pageContext.request.contextPath}/followAndvisit/follviscount?type=firstD1" id="fship" class="fship" onclick="selectedTitle(this);refreshMyFollowList('${pageContext.request.contextPath}/cust/myFollow')">我关注的</a></li>
                        <li><a href="javascript:void(0)" name="${pageContext.request.contextPath}/followAndvisit/follviscount?type=firstD2" class="fship"  onclick="selectedTitle(this);refreshVisitMeList('${pageContext.request.contextPath}/cust/visitMe')">看过我的</a></li>
                        <li><a href="javascript:void(0)" name="${pageContext.request.contextPath}/followAndvisit/follviscount?type=firstD1" class="fship"  onclick="selectedTitle(this);refreshFollowMeList('${pageContext.request.contextPath}/cust/followMe')">关注我的</a></li>
                    </ul>
                    <p><a style="color:slategrey " id="moreInfo" href="${pageContext.request.contextPath}/followAndvisit/follviscount?type=firstD1" target="_blank">更多></a></p>
                </div>
                <div class="look" id="look">

                    <ul id="myFollow">
                        <c:forEach items="${custFollowBeanList}" var="myFollow">
                            <li><a href="${pageContext.request.contextPath}/customer/message?id=${myFollow.custId}" target="_blank" name=${myFollow.custId}><img src="/Path/${myFollow.custPhoto}"></a><a class="aa" href=""> ${myFollow.custBirthday}岁  ${myFollow.custProvince}</a><a class="bb" href="${pageContext.request.contextPath}/readMail?messFromId=${myFollow.custId}">联系</a></li>
                        </c:forEach>
                    </ul>
                    <div id="tips"></div>
                </div>
                <div class="title">
                    <span class="title-1">今日明星</span>
                    <span id="xx" >曝光度迅速提升!</span>
                    <span class="title-3">立即提升></span>
                </div>
                <div id="look2">
                    <ul>
                        <c:forEach items="${starlist}" var="star">
                            <li><a href="${pageContext.request.contextPath}/customer/message?id=${star.custId}" target="_blank"><img src="/Path/${star.custPhoto}"><div class="count">${star.custBirthday}岁 ${star.custEducation}</div></a><a class="xx" href="${pageContext.request.contextPath}/readMail?messFromId=${star.custId}" name="${star.custId}">打招呼</a></li>
                        </c:forEach>
                    </ul>
                </div>

                <style>
                    .title-1 a{
                        color: black;
                    }
                    .title-1 a:hover{
                        color: orangered;
                    }
                </style>
                <div class="title">
                    <span class="title-1">猜你喜欢</span>
                    <span class="title-1">丨</span>
                    <span class="title-1" ><a  href="${pageContext.request.contextPath}/cust/myLike">已喜欢</a></span>
                    <span class="title-3"><a href="javascript:refreshFourCustList(1)" >换一组></a></span>
                </div>
                <div id="qqq">
                    <c:forEach items="${fourlist}" var="list">
                    <div class="look3">
                            <a href="${pageContext.request.contextPath}/customer/message?id=${list.custId}" target="_blank"> <img src="/Path/${list.custPhoto}"></a>
                            <div class="txt">
                                <p class="name">${list.custNickname}</p>
                                <p class="">${list.custBirthday}岁  ${list.custHeight}cm  ${list.custEducation}</p>
                                <button id="like_btn"><a href="javascript:void(0)" name="${list.custId}" class="flash" onclick="like(this)">喜欢</a></button>
                            </div>
                    </div>
                    </c:forEach>
                </div>
                <script>
                    function like(ele) {
                    ele.innerText="已喜欢";
                     var likebtn= document.getElementById('like_btn');
                        likebtn.disabled="true";
                        var cust_id=ele.name;
                        var result = "";
                        $.ajax({
                            url:'/addToMylike',
                            type:"POST",
                            data:{liked:cust_id}, // 发送数据
                            dataType:"text",
                            async:false,//关闭异步加载,这样只有加载完成才进行下一步
                            success:function (data) {
                                result = data;
                            }
                        });
                        return result;
                    }
                </script>

                <div id="title5" >
                    <span class="title-5">一见钟情</span>
                </div>
                <div id="title3">
                    <div id="title-left">
                    </div>
                    <div id="title-right">
                        <%--<div class="pic" >--%>
                            <%--<a class="C33" href=""><img src="${pageContext.request.contextPath}/static/images/xiaokeai.jpg"></a>--%>
                            <%--<a class="C33" href="">--%>
                                <%--<center>小可爱</center>--%>
                                <%--20岁 中专--%>
                            <%--</a>--%>
                        <%--</div>--%>
                        <%--<a class="icon" href="" id="icon-right" ><img src="${pageContext.request.contextPath}/static/images/love2.png">   喜欢她</a>--%>
                    </div>
                    <div id="title-mid">
                        <a href="javascript:void(0)"<%-- onclick="likeTwo()"--%> id="twoGirl"><img src="${pageContext.request.contextPath}/img/love3.png"></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="main-right">
            <a href=""><img src="${pageContext.request.contextPath}/img/advertising.png"></a>
            <a href=""><img src="${pageContext.request.contextPath}/img/adver2.png"></a>
            <a href=""><img src="${pageContext.request.contextPath}/img/adver3.png"></a>
            <a href=""><img src="${pageContext.request.contextPath}/img/adver4.jpg"></a>
        </div>
    </div>
    <%@include file="footer.jsp"%>
    <%--底部--%>
</div>
<!--图片上传框-->
<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">
    <div class="am-modal-dialog up-frame-parent up-frame-radius">
        <div class="am-modal-hd up-frame-header">
            <label>修改头像</label>
            <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
        </div>
        <div class="am-modal-bd  up-frame-body">
            <div class="am-g am-fl">
                <div class="am-form-group am-form-file">
                    <div class="am-fl">
                        <button type="button" class="am-btn am-btn-default am-btn-sm">
                            <i class="am-icon-cloud-upload" style="">选择要上传的文件</i> </button>
                    </div>
                    <input type="file" id="inputImage">
                </div>
            </div>
            <div class="am-g am-fl">
                <div class="up-pre-before up-frame-radius">
                    <img alt="" src="" id="image" >
                </div>
                <div class="up-pre-after up-frame-radius">
                </div>
            </div>
            <div class="am-g am-fl">
                <div class="up-control-btns">
                    <span class="am-icon-rotate-left"  onclick="rotateimgleft()"></span>
                    <span class="am-icon-rotate-right" onclick="rotateimgright()"></span>
                    <span class="am-icon-check" id="up-btn-ok" url="/uploadPoster"></span>
                </div>
            </div>

        </div>
    </div>
</div>

<!--加载框-->
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">正在上传...</div>
        <div class="am-modal-bd">
            <span class="am-icon-spinner am-icon-spin"></span>
        </div>
    </div>
</div>

<!--警告框-->
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">信息</div>
        <div class="am-modal-bd"  id="alert_content">
            上传成功!
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/js/amazeui.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/cropper.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/custom_up_img.js" charset="utf-8"></script>
<script>
    document.getElementById("fship").style.color="red";
    document.getElementById("fship").style.borderBottom="2px solid orangered";
    // 样式修改
    function selectedTitle(ele){
        //其他的样式 恢复原样
        var shipNoArr =  document.getElementsByClassName("fship");
        for(var i =0;i<shipNoArr.length;i++){

            if(ele.innerText ==  shipNoArr[i].innerText){
                ele.style.color ="red";
                ele.style.borderBottom="2px solid orangered";
                var xx=ele.name;
                document.getElementById("moreInfo").href=xx;
            }else{
                shipNoArr[i].style.color ="black";
                shipNoArr[i].style.borderBottom="2px solid white";
            }
        }
        return ele.innerText;
    }

    $("#twoGirl").one('click',function(){
        $("#icon-left").click();
        $("#icon-right").click();
    })
</script>

</body>
</html>
