<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>每日魅力排行榜</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/popularityRanking.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popularityRankingDay.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="search_box">
    <div class="search_bg clear">
        <img src="../img/popularityRanking/search_logo.jpg" class="search_logo" />
        <ul class="search_tab" id="channel_bar">
            <li id="bar_default"><a href="${pageContext.request.contextPath}/search/load" class="left">全部会员</a></li>
            <li id="bar_astro"><a href="${pageContext.request.contextPath}/constellation" target="_blank">星座速配</a></li>
            <li id="bar_hot" style="position:relative;" class="cur"><a href="${pageContext.request.contextPath}/popularityRanking">人气排行</a></li>
        </ul>
    </div>
    <div class="cont">
        <div class="search_info clear" style="padding-bottom:5px;border:0;">
            <ul class="search_list clear">
                <form name="hot_form" id="hot_form" method="post">
                    <li>
                        <div class="select_box w_85">
                            <em id="cond_hot_form_sex_show">女</em>
                            <span id="cond_hot_form_sex_btn" class="select_img"></span>
                            <ul style="z-index: 10000;display: none;" class="select w_85" id="cond_hot_form_sex_options">
                                <li>
                                    <a id="cond_hot_form_sex_opt_f" href="javascript:fun1();" title="女">女</a>
                                </li>
                                <li>
                                    <a id="cond_hot_form_sex_opt_m" href="javascript:fun2();" title="男">男</a>
                                </li>
                            </ul>
                            <%--<input type="hidden" id="custGender" name="custGender">--%>
                        </div>
                    </li>
                    <li>
                        <div class="select_box w_138">
                            <em id="cond_hot_form_work_location_show" class="current_city">北京</em>
                            <p class="change_btn"><a href="javascript:;"><span class="select_img"></span></a></p>
                            <div id="hd_city_list" class="city_list" style="display:none;">
                                <div class="city_close"><span>关闭</span></div>
                                <dl>
                                    <dt>全　国：</dt>
                                    <dd><a href="#">全国</a></dd>
                                </dl>
                                <dl>
                                    <dt>华　北：</dt>
                                    <dd><a href="#">北京</a>
                                        <a href="#">天津</a>
                                        <a href="#">河北</a>
                                        <a href="#">山西</a>
                                        <a href="#">内蒙古</a></dd>
                                </dl>
                                <dl>
                                    <dt>东　北：</dt>
                                    <dd><a href="#">黑龙江</a><a href="#">吉林</a><a href="#">辽宁</a></dd>
                                </dl>
                                <dl>
                                    <dt>华　东：</dt>
                                    <dd><a href="#">上海</a>
                                        <a href="#">江苏</a>
                                        <a href="#">浙江</a>
                                        <a href="#">安徽</a>
                                        <a href="#">福建</a>
                                        <a href="#">江西</a>
                                        <a href="#">山东</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>中　南：</dt>
                                    <dd>
                                        <a href="#">深圳</a>
                                        <a href="#">广东</a>
                                        <a href="#">河南</a>
                                        <a href="#">湖北</a>
                                        <a href="#">湖南</a>
                                        <a href="#">广西</a>
                                        <a href="#">海南</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>西　南：</dt>
                                    <dd>
                                        <a href="#">重庆</a>
                                        <a href="#">四川</a>
                                        <a href="#">贵州</a>
                                        <a href="#">云南</a>
                                        <a href="#">西藏</a></dd>
                                </dl>
                                <dl>
                                    <dt>西　北：</dt>
                                    <dd><a href="#">陕西</a>
                                        <a href="#">甘肃</a>
                                        <a href="#">青海</a>
                                        <a href="#">宁夏</a>
                                        <a href="#">新疆</a></dd>
                                </dl>
                                <dl>
                                    <dt>港澳台：</dt>
                                    <dd><a href="#">香港</a>
                                        <a href="#">澳门</a>
                                        <a href="#">台湾</a></dd>
                                </dl>
                                <%--<input type="hidden" id="custProvince" name="custProvince">--%>
                            </div>
                        </div>
                        <script type="text/javascript">

                            $(function(){
                                $('.city_list dd a').each(function(){
                                    $(this).click(function(){
                                        $('.current_city').html($(this).html());
                                        $('#hd_city_list').hide();
                                        getAllOfDayVisitCount(url_getAllOfDayVisitCountRankingList);
                                    });
                                });
                                $('.change_btn').click(function(){
                                    $('#hd_city_list').show();
                                })
                                $('.city_close span').click(function(){
                                    $('#hd_city_list').hide();
                                })
                            });
                        </script>
                    </li>
                </form>
            </ul>
            <ul class="jy_tab">
                <li><a href="${pageContext.request.contextPath}/popularityRanking">人气排行首页</a></li>
                <li class="cur"><a href="${pageContext.request.contextPath}/popularityRankingDay">人气日榜</a></li>
                <li><a href="">人气周榜</a></li>
                <li><a href="">人气月榜</a></li>
                <li><a href="">人气总榜</a></li>
            </ul>
        </div>
        <!-- active -->
        <h1 class="hy_title clear">
            <div class="f_l">
                <span>人气日榜</span>
                <em>每天其他用户的访问量。</em>
            </div>
        </h1>
        <div class="clear">
            <div class="w_500 f_l">
                <ul class="user_list clear" id="day_user_list" style="padding-right: 20px; z-index: 2;">
                    <%-- <li id="user_li_165126619" class="" style="z-index: 2;">
                         <div class="num num_1"></div>
                         <div class="hy_num" >
                             <div style="width:110px;height:135px;background:#f7f7f7;">
                                 <a href="">
                                     <img src="../img/popularityRanking/82deba5ad_1_avatar_p.jpg">
                                 </a>
                             </div>
                             <div class="user_name">
                                 <i class="tel" title="手机认证"></i>
                                 <a href="" title="悠悠我心">悠悠我心</a>
                             </div>
                             <p class="user_info">27岁,南京<br>160cm<br>人气值:432</p>
                             <p class="detail"><a href="" target="_blank">查看资料</a></p>
                             <div class="zh_btn">
                                 <a class="dzh" href="">打招呼</a>
                             </div>
                         </div>
                     </li>
                     <li id="user_li_165126620" class="" style="z-index: 2;">
                         <div class="num num_1"></div>
                         <div class="hy_num" >
                             <div style="width:110px;height:135px;background:#f7f7f7;">
                                 <a href="">
                                     <img src="../img/popularityRanking/82deba5ad_1_avatar_p.jpg">
                                 </a>
                             </div>
                             <div class="user_name">
                                 <i class="tel" title="手机认证"></i>
                                 <a href="" title="悠悠我心">悠悠我心</a>
                             </div>
                             <p class="user_info">27岁,南京<br>160cm<br>人气值:432</p>
                             <p class="detail"><a href="" target="_blank">查看资料</a></p>
                             <div class="zh_btn">
                                 <a class="dzh" href="">打招呼</a>
                             </div>
                         </div>
                     </li>
                     <li id="user_li_165126621" class="" style="z-index: 2;">
                         <div class="num num_1"></div>
                         <div class="hy_num" >
                             <div style="width:110px;height:135px;background:#f7f7f7;">
                                 <a href="">
                                     <img src="../img/popularityRanking/82deba5ad_1_avatar_p.jpg">
                                 </a>
                             </div>
                             <div class="user_name">
                                 <i class="tel" title="手机认证"></i>
                                 <a href="" title="悠悠我心">悠悠我心</a>
                             </div>
                             <p class="user_info">27岁,南京<br>160cm<br>人气值:432</p>
                             <p class="detail"><a href="" target="_blank">查看资料</a></p>
                             <div class="zh_btn">
                                 <a class="dzh" href="">打招呼</a>
                             </div>
                         </div>
                     </li>
                     <li id="user_li_165126622" class="" style="z-index: 2;">
                         <div class="num num_1"></div>
                         <div class="hy_num" >
                             <div style="width:110px;height:135px;background:#f7f7f7;">
                                 <a href="">
                                     <img src="../img/popularityRanking/82deba5ad_1_avatar_p.jpg">
                                 </a>
                             </div>
                             <div class="user_name">
                                 <i class="tel" title="手机认证"></i>
                                 <a href="" title="悠悠我心">悠悠我心</a>
                             </div>
                             <p class="user_info">27岁,南京<br>160cm<br>人气值:432</p>
                             <p class="detail"><a href="" target="_blank">查看资料</a></p>
                             <div class="zh_btn">
                                 <a class="dzh" href="">打招呼</a>
                             </div>
                         </div>
                     </li>
                     <li id="user_li_165126623" class="" style="z-index: 2;">
                         <div class="num num_1"></div>
                         <div class="hy_num" >
                             <div style="width:110px;height:135px;background:#f7f7f7;">
                                 <a href="">
                                     <img src="../img/popularityRanking/82deba5ad_1_avatar_p.jpg">
                                 </a>
                             </div>
                             <div class="user_name">
                                 <i class="tel" title="手机认证"></i>
                                 <a href="" title="悠悠我心">悠悠我心</a>
                             </div>
                             <p class="user_info">27岁,南京<br>160cm<br>人气值:432</p>
                             <p class="detail"><a href="" target="_blank">查看资料</a></p>
                             <div class="zh_btn">
                                 <a class="dzh" href="">打招呼</a>
                             </div>
                         </div>
                     </li>
                     <li id="user_li_165126624" class="" style="z-index: 2;">
                         <div class="num num_1"></div>
                         <div class="hy_num" >
                             <div style="width:110px;height:135px;background:#f7f7f7;">
                                 <a href="">
                                     <img src="../img/popularityRanking/82deba5ad_1_avatar_p.jpg">
                                 </a>
                             </div>
                             <div class="user_name">
                                 <i class="tel" title="手机认证"></i>
                                 <a href="" title="悠悠我心">悠悠我心</a>
                             </div>
                             <p class="user_info">27岁,南京<br>160cm<br>人气值:432</p>
                             <p class="detail"><a href="" target="_blank">查看资料</a></p>
                             <div class="zh_btn">
                                 <a class="dzh" href="">打招呼</a>
                             </div>
                         </div>
                     </li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    $("#cond_hot_form_sex_show").click(function () {
        $(".select").hide();
    });
    $("#cond_hot_form_sex_btn").click(function () {
        $(".select").show();
    });
    $("#cond_hot_form_sex_opt_f").click(function () {
        $(".select") .hide();
    });
    $("#cond_hot_form_sex_opt_m").click(function () {
        $(".select") .hide();
    });
    function fun1() {
        document.getElementById("cond_hot_form_sex_show").innerHTML = document.getElementById("cond_hot_form_sex_opt_f").innerText;
        getAllOfDayVisitCount(url_getAllOfDayVisitCountRankingList);
    }
    function fun2() {
        document.getElementById("cond_hot_form_sex_show").innerHTML = document.getElementById("cond_hot_form_sex_opt_m").innerText;
        getAllOfDayVisitCount(url_getAllOfDayVisitCountRankingList);
    }
</script>
</body>
</html>
