<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2018/10/31 0031
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script id="_1540946437014_2841" src="https://fp.tongdun.net/fp/detect.json?partnerCode=baihe&amp;token_id=BH1540904413739235523&amp;appName=baihe&amp;paramz=-%5E%5E-%5E%5E7c4c9624cbf989a3e6b8f0a0ba955520%5E%5E-&amp;v=M9t4lSqQpUcREYkvVnLj3LdCtSiwWpb93bsdyKzj1omvwywYnop06MqHOApoDpRy&amp;idf=1540946436835-11891275651&amp;w=FhD%2Fm8LfNrfsCrpQEXC9j%2FwdXdAc8gIowD4Fm6Aab7ae1mMdS%2Fy~Rl8JBBsEC8PECqlO2H2qnGwdCHcXRJNXLIyyiRLvdNhZ&amp;ct=mmpp%2FMpgalj%3D&amp;_callback=_1540946437014_2841&amp;h=2bfeed7abc8dd2476a350a64b16eae3a"></script><script type="text/javascript" async="" src="http://static.fraudmetrix.cn/fm.js?ver=0.1&amp;t=428041"></script><script src="//hm.baidu.com/hm.js?5caa30e0c191a1c525d4a6487bf45a9d"></script>
    <link href="http://static3.baihe.com/public.css" rel="stylesheet" type="text/css">
    <link href="http://static3.baihe.com/leftNav.css" rel="stylesheet" type="text/css">
    <link href="http://static3.baihe.com/lookAtMe.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://static4.baihe.com/3rd-lib/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://static4.baihe.com/common/baihe.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/middle_cnxh2015.js"></script>
    <script src="http://static4.baihe.com/msg/message.js"></script><link href="http://static3.baihe.com/mCustomScrollbar.css" rel="stylesheet" type="text/css"><link href="http://static3.baihe.com/pop/msgLayer.css" rel="stylesheet" type="text/css"><link href="http://static3.baihe.com/pop/pop_search.css" rel="stylesheet" type="text/css"><script type="text/javascript" src="http://static4.baihe.com/msg/jquery.mCustomScrollbar.concat.min.js"></script><script type="text/javascript" src="http://static4.baihe.com/3rd-lib/jquery.select-1.3.6.js"></script><script type="text/javascript" src="http://static4.baihe.com/3rd-lib/district.js"></script><link href="http://static3.baihe.com/formStyle.css" rel="stylesheet" type="text/css">
    <script src="http://static4.baihe.com/msg/greet.js"></script>
    <script type="text/javascript" src="http://static4.baihe.com/msg/jquery.sinaEmotion.js"></script>
    <script type="text/javascript" src="http://static4.baihe.com/msg/expression_icon.js"></script>
    <script src="http://static4.baihe.com/common/tongji-1.0.1.min.js?time=2018-10-31" type="text/javascript" charset="utf-8"></script>
    <link rel="shortcut icon" href="http://images6.baihe.com/favicon.ico"><script type="text/javascript" async="async" charset="utf-8" src="http://bj-trail.ntalker.com/trail/trail/userinfo.php?action=getregion&amp;siteid=kf_9847&amp;userid=kf_9847_ISME9754_159476456&amp;callback=trail_getregion_EDBCDA22"></script>

</head>

<body>
<style type="text/css">     .adTxtImgUpF{        display: block;        position: fixed;        _position: absolute;        width: 30px;        height: 18px;        background: url(http://static6.baihe.com/client/adTxtImgUpF.png) no-repeat center bottom;        _background: url(http://static6.baihe.com/client/adTxtImgUpF.gif) no-repeat center bottom;        text-align: center;        bottom: 6px;        right: 1.4%;        overflow: hidden;        zoom: 1;        z-index: 101;     } </style>
<%@include file="header.jsp"%>
<div id="BAIHE" numm="0">
    <!-- 左部导航 -->
    <script language="javascript" src="http://static4.baihe.com/common/leftNav.js" id="leftNav" charset='utf-8'></script>
    <!--rightCont -->
    <div id="rightCont">
        <div class="lookAtMe">
            <div class="mainNav">
                <a href="javascript:void(0)" event="3&quot;" class="active"><strong class="label04">你喜欢的人</strong><em class="angleB"></em></a>
            </div>

            <div class="picList" id="picList">
                <!--三级导航与说明-->
                <div class="subNav">
                    <p><br>喜欢列表最多展示一天哦，喜欢Ta，就关注他吧~</p>
                </div>

                <ul id="ulList">
                    <c:forEach items="${customerList}" var="list">
                        <li><a target="_blank" href="http://profile1.baihe.com?oppID=128346174"><div class="txt"><div></div><p>${list.custBirthday}岁&nbsp;&nbsp;&nbsp;${list.custEducation}</p></div><img src="/Path/cust-photo/${list.custPhoto}" width="120" height="150"></a><a style="cursor:pointer" onclick="addfocus(159476456,128346174);" class="other" id="loveFoucs128346174">关注</a><a onclick="sendMessage(128346174,'01.00.10206');" style="cursor:pointer" class="red">发消息</a></li>
                    </c:forEach>

                </ul>
                <!--<div class="page" id="pageList"><div class="num">1/1</div><a class="nextOver" style="cursor:pointer" onclick="pagination(2)">后</a></div>-->
            </div>
        </div>
    </div>
    <div class="adv90">
        <div class="ad"><iframe name="advert" width="1000" height="90" frameborder="0" scrolling="no" src="http://bhtg.baihe.com/place_282.html"></iframe></div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
