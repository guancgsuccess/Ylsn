<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王德鹏
  Date: 2018/10/25
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>热门活动_缘来是你</title>
    <style>
        .activity_list .list_item .item_cont .acti_info .item_key {padding-left: 28px;background: url(/img/icon.png) no-repeat 0 0;font-family: "SimSun", "微软雅黑", "宋体", "黑体";}
    </style>
    <link href="/css/activitydetail.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/activitySimpleAlert.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/js/activitySimpleAlert.js"></script>
    <script language="javascript" type="text/javascript">
        function showMore(){
            var ele=document.getElementsByClassName("hide").item(0);
            if(ele.style.display=="none") {
                document.getElementsByClassName("show").item(0).style.display="none";
                ele.style.display = "inline";
                document.getElementsByClassName("col_orange").item(0).innerText = "【收起全部】";
            }else if(ele.style.display=="inline"){
                document.getElementsByClassName("show").item(0).style.display="inline";
                ele.style.display = "none";
                document.getElementsByClassName("col_orange").item(0).innerText = "【阅读全文】";
            }
        }

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

        window.onscroll=function(){
            var scrollt = document.documentElement.scrollTop + document.body.scrollTop;//滚动条滚动高度
            if(scrollt<496)
                document.getElementById("floatWrap").style.display="none";
            else
                document.getElementById("floatWrap").style.display="inline";
        }
    </script>
</head>
<body>
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
                    <a href="http://date.baihe.com/shoplist.php#reloaded" class="nav_sub toast_2">全国体验店</a>
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
                    <a id="onlyChoseAlert" href="javascript:void (0)" onclick="enter()">
                        <span class="date_btn">
                            免费预约
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="date_container">
        <div class="activity_detail clear">
            <div class="detail_left left" id="detail_left">
                <!--悬窗 begin-->
                <div id="floatWrap" style="position: fixed; z-index: 9999; top: 0px; display: none;">
                    <div class="floatWrap date_shadow clear">
                        <div class="float_left left">
                            <img class="lazy_left" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_nHOPAxog7K.jpeg" src="/Path/${activity.actiImages}" style="display: inline; position: absolute; width: 150px; height: 91.0042px; top: -0.502092px; left: 0px;">
                        </div>
                        <div class="float_right left">
                            <h2>${activity.actiTitle}</h2>
                            <div class="float_num clear">
                                <p class="left"><span class="col_red">${count}</span>人已预约</p>
                            </div>
                            <a id="" href="javascript:h_page_exper(30,9,'details');" onclick="enter()">
                                <span class="date_btn">
                                    免费预约
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
                <!--悬窗 end-->
                <!--活动详情 begin-->
                <h1 class="date_title" style="background: url(/img/date_title.png) no-repeat 0 0">活动介绍</h1>
                <div class="detail_box date_shadow">
                    <p class="detail_word">
                        <span class="show" style="display: inline;">活动名称:缘来是你会员${activity.actiTitle}活动时间:${actiDate}，${activity.actiTime}活动地点:${activity.actiPlace}${actiIntroduction}</span>
                        <span class="hide" style="display: none;">活动名称:缘来是你会员${activity.actiTitle}活动时间:${actiDate}，${activity.actiTime}活动地点:${activity.actiPlace}${activity.actiIntroduction}</span>
                        <a href="javascript:void(0)" onclick="showMore()" class="col_orange">【阅读全文】</a>
                    </p>
                </div>
                <h1 class="date_title">温馨提示</h1>
                <div class="detail_box date_shadow">
                    <p class="detail_word">参加活动请携带本人身份证登记入场</p>
                </div>
                <h1 class="date_title">体验店介绍</h1>
                <div class="detail_box date_shadow">
                    <p class="detail_word">在爱情中，有这样一类人：
                        懂得自己适合什么人，该找性格相似的还是互补的
                        懂得看清什么是对的爱情，聪明回应亲人的盲目相亲的“好意”，不让自己受委屈
                        懂得在爱情中的重要关口，何为正确选择，获得自我成长
                        这样的人，我们称为具有超高“爱商”的人，她们在爱情中知进退，懂拿捏，知道如何去爱，如何表达爱，如何被宠爱……来找我吧
                        现在的你是否想改变单身的现状？只要你已经成年且是单身，只要您有寻找结婚对象的诚意，只要你有追求幸福的勇气，那就来苏州“缘来是你约会吧”。
                        “约会吧”为单身会员的交流、游玩精心设置了各个功能区域：K歌区、休闲茶区，手游区、书吧区，约会单间区、派对区等。定期举办不同的主题活动：王者荣耀，狼人杀，吃鸡，蒙面派对等等……每天不同的主题派对活动，让会员在开心、快乐中寻找到与自己有共同兴趣爱好的人。从里到外，提升你的情商与形象，找到爱情的自信。
                        全天候的专业婚恋顾问现场约见、精准定位、突破内向、打破尴尬，让你轻松找到自己中意的TA！ 在这里，我们致力于创造一个最安全、更高效、低成本、更轻松的线下社交平台。抓紧行动起来吧！</p>
                </div>
                <h1 class="date_title">约会环境</h1>
                <div class="detail_box date_shadow">
                    <ul class="detail_img clear">
                        <li class="date_shadow"><img class="lazy_left" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_jBGqIb5Rg8.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_jBGqIb5Rg8.jpeg" style="display: inline; position: absolute; width: 350px; height: 235.156px; top: -12.5781px; left: 0px;"></li>
                        <li class="date_shadow"><img class="lazy_left" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_zZqgiNV1Uk.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_zZqgiNV1Uk.jpeg" style="display: inline; position: absolute; width: 350px; height: 235.156px; top: -12.5781px; left: 0px;"></li>
                        <li class="date_shadow"><img class="lazy_left" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_cofL9EwicZ.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_cofL9EwicZ.jpeg" style="display: inline; position: absolute; width: 350px; height: 235.156px; top: -12.5781px; left: 0px;"></li>
                        <li class="date_shadow"><img class="lazy_left" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_BDFVl7GX6p.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_BDFVl7GX6p.jpeg" style="display: inline; position: absolute; width: 350px; height: 235.156px; top: -12.5781px; left: 0px;"></li>
                    </ul>
                </div>
                <!-- 活动详情 end -->
            </div>
            <div class="detail_right right">
                <h1 class="date_title">猜你喜欢</h1>
                <div class="detail_box date_shadow">
                    <ul class="detail_acti">
                        <li class="date_shadow_hover">
                            <a class="acti_img" href=""><img class="lazy_right" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_teqa8OJMuw.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_teqa8OJMuw.jpeg" style="display: inline; position: absolute; width: 360px; height: 219.375px; top: -1.6875px; left: 0px;"></a>
                            <div class="acti_info">
                                <h2><span>高端白领交友</span><em>1565+参加过</em></h2>
                            </div>
                        </li>
                        <li class="date_shadow_hover">
                            <a class="acti_img" href=""><img class="lazy_right" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_NcMPVuE8M4.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_NcMPVuE8M4.jpeg" style="display: inline; position: absolute; width: 360px; height: 219.375px; top: -1.6875px; left: 0px;"></a>
                            <div class="acti_info">
                                <h2><span>爱情招聘会</span><em>1441+参加过</em></h2>
                            </div>
                        </li>
                        <li class="date_shadow_hover">
                            <a class="acti_img" href=""><img class="lazy_right" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_qIAnFAb09o.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_qIAnFAb09o.jpeg" style="display: inline; position: absolute; width: 360px; height: 216px; top: 0px; left: 0px;"></a>
                            <div class="acti_info">
                                <h2><span>你的心思我来猜</span><em>1638+参加过</em></h2>
                            </div>
                        </li>
                        <li class="date_shadow_hover">
                            <a class="acti_img" href=""><img class="lazy_right" data-original="http://images2.jyimg.com/msn/index_pic/2018/date_EwrVWtxXix.jpeg" src="http://images2.jyimg.com/msn/index_pic/2018/date_EwrVWtxXix.jpeg" style="display: inline; position: absolute; width: 360px; height: 219.375px; top: -1.6875px; left: 0px;"></a>
                            <div class="acti_info">
                                <h2><span>八分钟约会</span><em>1772+参加过</em></h2>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
