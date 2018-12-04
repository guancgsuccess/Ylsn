<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王德鹏
  Date: 2018/10/20
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>报名会员_缘来是你</title>
    <style>
        .pages .prev_page { background: #fff url(/img/hd_btn.png) -61px -252px no-repeat;}
        .pages .next_page { background: #fff url(/img/hd_btn.png) -92px -252px no-repeat;}
        .pages a.next_page:hover{background:#fa5e72 url(/img/hd_btn.png) -32px -252px no-repeat;}
        .pages a.prev_page:hover{background:#fa5e72 url(/img/hd_btn.png) -3px -252px no-repeat;}
    </style>
    <link href="/css/activitydetail.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/activitySimpleAlert.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/js/activitySimpleAlert.js"></script>
    <script language="javascript" type="text/javascript">
        var xhr = null;
        var url_loginuser = "${pageContext.request.contextPath}/activity/signup?actiId="+${activity.actiId};
        function enter() {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", url_loginuser, true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
            xhr.onreadystatechange =  processLogin;
            xhr.send();
        }

        function  processLogin() {
            if(xhr.readyState==4 && xhr.status ==200 ){
                var result = JSON.parse(xhr.responseText);
                if(result==0){
                    var onlyChoseAlert = activitySimpleAlert({
                        "content":"稍后我们会有专属顾问与您联络，请保持手机畅通哟~",
                        "buttons":{
                            "确定":function () {
                                onlyChoseAlert.close();
                            }
                        }
                    })
                }else{
                    var onlyChoseAlert = activitySimpleAlert({
                        "content":"您已报名过此活动",
                        "buttons":{
                            "确定":function () {
                                onlyChoseAlert.close();
                            }
                        }
                    })
                }
            }
        }

        function checkTab() {
            var tag=${tag};
            if(tag==2){
                document.getElementById("TabTab03Cone1").style.display="none";
                document.getElementById("TabTab03Cone2").style.display="block";
                document.getElementById("TabTab03Cone3").style.display="none";
                document.getElementById("fonte1").style.backgroundImage="";
                document.getElementById("fonte2").style.backgroundImage="url(/img/hdxq_tab5.jpg)";
                document.getElementById("fonte3").style.backgroundImage="";
            }else if(tag==3){
                document.getElementById("TabTab03Cone1").style.display="none";
                document.getElementById("TabTab03Cone2").style.display="none";
                document.getElementById("TabTab03Cone3").style.display="block";
                document.getElementById("fonte1").style.backgroundImage="";
                document.getElementById("fonte2").style.backgroundImage="";
                document.getElementById("fonte3").style.backgroundImage="url(/img/hdxq_tab5.jpg)";
            }else {
                document.getElementById("TabTab03Cone1").style.display="block";
                document.getElementById("TabTab03Cone2").style.display="none";
                document.getElementById("TabTab03Cone3").style.display="none";
                document.getElementById("fonte1").style.backgroundImage="url(/img/hdxq_tab5.jpg)";
                document.getElementById("fonte2").style.backgroundImage="";
                document.getElementById("fonte3").style.backgroundImage="";
            }
        }

        function setTab03Syne1(num){
            switch (num){
                case 1:
                    document.getElementById("TabTab03Cone1").style.display="block";
                    document.getElementById("TabTab03Cone2").style.display="none";
                    document.getElementById("TabTab03Cone3").style.display="none";
                    document.getElementById("fonte1").style.backgroundImage="url(/img/hdxq_tab5.jpg)";
                    document.getElementById("fonte2").style.backgroundImage="";
                    document.getElementById("fonte3").style.backgroundImage="";
                    break;
                case 2:
                    document.getElementById("TabTab03Cone1").style.display="none";
                    document.getElementById("TabTab03Cone2").style.display="block";
                    document.getElementById("TabTab03Cone3").style.display="none";
                    document.getElementById("fonte1").style.backgroundImage="";
                    document.getElementById("fonte2").style.backgroundImage="url(/img/hdxq_tab5.jpg)";
                    document.getElementById("fonte3").style.backgroundImage="";
                    break;
                case 3:
                    document.getElementById("TabTab03Cone1").style.display="none";
                    document.getElementById("TabTab03Cone2").style.display="none";
                    document.getElementById("TabTab03Cone3").style.display="block";
                    document.getElementById("fonte1").style.backgroundImage="";
                    document.getElementById("fonte2").style.backgroundImage="";
                    document.getElementById("fonte3").style.backgroundImage="url(/img/hdxq_tab5.jpg)";
                    break;
            }
        }
    </script>
</head>
<body onload="checkTab()">
    <div class="nav_wrap">
        <div class="nav">
            <div class="nav_top clear">
                <a href="">
                    <div class="nav_logo">
                        <img src="${pageContext.request.contextPath}/img/logo.png">
                    </div>
                </a>
            </div>
            <div class="nav_bottom clear">
                <div class="nav_list">
                    <a href="${pageContext.request.contextPath}/party" class="nav_sub toast_1">首页</a>
                    <a href="" class="nav_sub toast_4 active">热门活动</a>
                    <a href="" class="nav_sub toast_5">魅力会员</a>
                    <a href="http://date.baihe.com/join_in.php#reloaded" class="nav_sub toast_3">招商加盟</a>
                </div>
                <div class="nav_login">
                    <a href="${pageContext.request.contextPath}/customer/logout" class="login_link logout">退出</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/cust/center" class="login_link col_black">${sessionScope.custNickname}</a>
                    <a href="${pageContext.request.contextPath}/index" class="login_link goback_link">返回缘来是你</a>
                </div>
            </div>
        </div>
    </div>
    <div class="date_container">
        <div class="activity_list">
            <div class="list_item date_shadow clear">
                <div class="item_img left">
                    <img class="lazy" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_nHOPAxog7K.jpeg" src="/Path/${activity.actiImages}" style="display: inline; position: absolute; width: 415.4535px; height: 303.347px; top: -1.67364px; left: 0px;">
                </div>
                <div class="item_cont left">
                    <h2 class="acti_title">${activity.actiTitle}</h2>
                    <p class="acti_word">活动名称:缘来是你会员${activity.actiTitle}活动时间:${actiDate}，${activity.actiTime}活动地点:${activity.actiPlace}${activity.actiIntroduction}</p>
                    <p class="acti_num"><span class="col_red">${count}</span>人已预约</p>
                    <ul class="acti_info">
                        <li id="info_item" class="info_item clear">
                            <span class="item_key user_key left">已报名会员：</span>
                            <ul class="item_list left clear">
                                <c:forEach items="${customerList}" var="customerList" begin="0" end="6">
                                    <li class="left"><img class="lazy" data-original="http://photo6.baihe.com/2015/10/03/290_290/68EC9E8986EE92237031AB34F25A6D04.jpg" src="/Path/${customerList.custPhoto}" style="display: inline; position: absolute; width: 52px; height: 52px; top: 0px; left: 0px;"></li>
                                </c:forEach>
                                <li class="last_item left">...</li>
                            </ul>
                        </li>
                        <li class="info_item clear">
                            <span class="item_key time_key left">时间：</span>
                            <span class="item_value left">${actiDate}&nbsp;&nbsp;${weekDays}&nbsp;&nbsp;${activity.actiTime}</span>
                        </li>
                        <li class="info_item clear">
                            <span class="item_key loca_key left">地点：</span>
                            <span class="item_value left">${activity.actiPlace}</span>
                        </li>
                    </ul>
                    <a id="onlyChoseAlert" href="javascript:h_page_exper(30,9,'details');" onclick="enter()">
                        <span class="date_btn">
                            免费预约
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div id="lmbox">
        <div id="lmbox980">
            <div class="hdxq3_tab" name="5F" id="mao">
                <!-- tab标题切换 -->
                <div class="hdbmqk_bt" style="background: url(/img/hdxq_jxz_10.jpg) repeat-x left top">
                    <div id="bge1" class="xixie1">
                        <div id="fonte1" class="tabe1" onmousedown="setTab03Syne1(1)" style="color: rgb(101, 93, 89); background-image: url(/img/hdxq_tab5.jpg);">全部(${count})</div>
                        <div id="fonte2" class="tabe2" onmousedown="setTab03Syne1(2)" style="color: rgb(101, 93, 89);">男士(${maleCount})</div>
                        <div id="fonte3" class="tabe3" onmousedown="setTab03Syne1(3)" style="color: rgb(101, 93, 89);">女士(${femaleCount})</div>
                    </div>
                    <div class="hdbmqk_ss">
                        <form method="post" name="searchloveid" action="${pageContext.request.contextPath}/activity/search" target="_blank">
                            <input name="loveid" type="text" class="inputstyle1" placeholder="搜索昵称"><a href="javascript:searchloveid.submit();" class="btnstyle1" style="background: url(/img/hdck_05.jpg) no-repeat left top"></a>
                        </form>
                    </div>
                </div>
                <!-- tab内容显示 -->
                <div class="hdbmqk_nr">
                    <div id="TabTab03Cone1" style="display: block;">
                        <ul>
                            <c:forEach items="${page1.modelList}" var="page">
                                <li>
                                    <a onmousedown="send_jy_pv2('|party_memberlist_avatar_end|');" target="_blank" href="${pageContext.request.contextPath}/customer/message?id=${page.custId}" title="${page.custNickname}">
                                        <img src="/Path/${page.custPhoto}" width="110" height="135">
                                    </a>
                                    <p><img src="http://images1.jyimg.com/w4/party/2015/images/hdck_06.jpg" width="16" height="16"><span title="${page.custNickname}">${page.custNickname}</span></p>
                                </li>
                            </c:forEach>
                        </ul>
                        <!-- 翻页 -->
                        <div class="pages">
                            <c:choose>
                                <c:when test="${page1.currentPageCode > 1 }">
                                    <a class="prev_page fixPNG" href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${page1.currentPageCode-1}&tag=1&actiId=${activity.actiId}"></a>
                                </c:when>
                                <c:otherwise>
                                    <span class="prev_page fixPNG"></span>
                                </c:otherwise>
                            </c:choose>
                            <%-- 计算begin、end --%>
                            <c:choose>
                                <%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
                                <c:when test="${page1.totalPages <= 5 }">
                                    <c:set var="begin" value="1" />
                                    <c:set var="end" value="${page1.totalPages }" />
                                </c:when>
                                <c:otherwise>
                                    <%-- 当总页数>10时，通过公式计算出begin和end 31--%>
                                    <c:set var="begin" value="${page1.currentPageCode-2 }" />
                                    <c:set var="end" value="${page1.currentPageCode+2 }" />
                                    <%-- 头溢出 --%>
                                    <c:if test="${begin < 1 }">
                                        <c:set var="begin" value="1" />
                                        <c:set var="end" value="5" />
                                    </c:if>
                                    <%-- 尾溢出 --%>
                                    <c:if test="${end > page1.totalPages }">
                                        <c:set var="begin" value="${page1.totalPages - 4 }" />
                                        <c:set var="end" value="${page1.totalPages }" />
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <%-- 循环遍历页码列表 --%>
                            <c:forEach var="i" begin="${begin }" end="${end }">
                                <c:choose>
                                    <c:when test="${i eq page1.currentPageCode }">
                                        <span class="lml_fyxz down">${i }</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${i}&tag=1&actiId=${activity.actiId}">${i }</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${page1.currentPageCode < page1.totalPages }">
                                    <a class="next_page fixPNG" href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${page1.currentPageCode+1}&tag=1&actiId=${activity.actiId}"></a>
                                </c:when>
                                <c:otherwise>
                                    <span class="next_page fixPNG"></span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div id="TabTab03Cone2" style="display: none;">
                        <ul>
                            <c:forEach items="${page2.modelList}" var="page">
                                <li>
                                    <a onmousedown="send_jy_pv2('|party_memberlist_avatar_end|');" target="_blank" href="${pageContext.request.contextPath}/customer/message?id=${page.custId}" title="${page.custNickname}">
                                        <img src="/Path/${page.custPhoto}" width="110" height="135">
                                    </a>
                                    <p><img src="http://images1.jyimg.com/w4/party/2015/images/hdck_06.jpg" width="16" height="16"><span title="${page.custNickname}">${page.custNickname}</span></p>
                                </li>
                            </c:forEach>
                        </ul>
                        <!-- 翻页 -->
                        <div class="pages">
                            <c:choose>
                                <c:when test="${page2.currentPageCode > 1 }">
                                    <a class="prev_page fixPNG" href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${page2.currentPageCode-1}&tag=2&actiId=${activity.actiId}"></a>
                                </c:when>
                                <c:otherwise>
                                    <span class="prev_page fixPNG"></span>
                                </c:otherwise>
                            </c:choose>
                            <%-- 计算begin、end --%>
                            <c:choose>
                                <%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
                                <c:when test="${page2.totalPages <= 5 }">
                                    <c:set var="begin" value="1" />
                                    <c:set var="end" value="${page2.totalPages }" />
                                </c:when>
                                <c:otherwise>
                                    <%-- 当总页数>10时，通过公式计算出begin和end 31--%>
                                    <c:set var="begin" value="${page2.currentPageCode-2 }" />
                                    <c:set var="end" value="${page2.currentPageCode+2 }" />
                                    <%-- 头溢出 --%>
                                    <c:if test="${begin < 1 }">
                                        <c:set var="begin" value="1" />
                                        <c:set var="end" value="5" />
                                    </c:if>
                                    <%-- 尾溢出 --%>
                                    <c:if test="${end > page2.totalPages }">
                                        <c:set var="begin" value="${page2.totalPages - 4 }" />
                                        <c:set var="end" value="${page2.totalPages }" />
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <%-- 循环遍历页码列表 --%>
                            <c:forEach var="i" begin="${begin }" end="${end }">
                                <c:choose>
                                    <c:when test="${i eq page2.currentPageCode }">
                                        <span class="lml_fyxz down">${i }</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${i}&tag=2&actiId=${activity.actiId}">${i }</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${page2.currentPageCode < page2.totalPages }">
                                    <a class="next_page fixPNG" href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${page2.currentPageCode+1}&tag=2&actiId=${activity.actiId}"></a>
                                </c:when>
                                <c:otherwise>
                                    <span class="next_page fixPNG"></span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div id="TabTab03Cone3" style="display: none;">
                        <ul>
                            <c:forEach items="${page3.modelList}" var="page">
                                <li>
                                    <a onmousedown="send_jy_pv2('|party_memberlist_avatar_end|');" target="_blank" href="${pageContext.request.contextPath}/customer/message?id=${page.custId}" title="${page.custNickname}">
                                        <img src="/Path/${page.custPhoto}" width="110" height="135">
                                    </a>
                                    <p><img src="http://images1.jyimg.com/w4/party/2015/images/hdck_06.jpg" width="16" height="16"><span title="${page.custNickname}">${page.custNickname}</span></p>
                                </li>
                            </c:forEach>
                        </ul>
                        <!-- 翻页 -->
                        <div class="pages">
                            <c:choose>
                                <c:when test="${page3.currentPageCode > 1 }">
                                    <a class="prev_page fixPNG" href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${page3.currentPageCode-1}&tag=3&actiId=${activity.actiId}"></a>
                                </c:when>
                                <c:otherwise>
                                    <span class="prev_page fixPNG"></span>
                                </c:otherwise>
                            </c:choose>
                            <%-- 计算begin、end --%>
                            <c:choose>
                                <%-- 如果总页数不足10页，那么把所有的页数都显示出来！ --%>
                                <c:when test="${page3.totalPages <= 5 }">
                                    <c:set var="begin" value="1" />
                                    <c:set var="end" value="${page3.totalPages }" />
                                </c:when>
                                <c:otherwise>
                                    <%-- 当总页数>10时，通过公式计算出begin和end 31--%>
                                    <c:set var="begin" value="${page3.currentPageCode-2 }" />
                                    <c:set var="end" value="${page3.currentPageCode+2 }" />
                                    <%-- 头溢出 --%>
                                    <c:if test="${begin < 1 }">
                                        <c:set var="begin" value="1" />
                                        <c:set var="end" value="5" />
                                    </c:if>
                                    <%-- 尾溢出 --%>
                                    <c:if test="${end > page3.totalPages }">
                                        <c:set var="begin" value="${page3.totalPages - 4 }" />
                                        <c:set var="end" value="${page3.totalPages }" />
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <%-- 循环遍历页码列表 --%>
                            <c:forEach var="i" begin="${begin }" end="${end }">
                                <c:choose>
                                    <c:when test="${i eq page3.currentPageCode }">
                                        <span class="lml_fyxz down">${i }</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${i}&tag=3&actiId=${activity.actiId}">${i }</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${page3.currentPageCode < page3.totalPages }">
                                    <a class="next_page fixPNG" href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${page3.currentPageCode+1}&tag=3&actiId=${activity.actiId}"></a>
                                </c:when>
                                <c:otherwise>
                                    <span class="next_page fixPNG"></span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
