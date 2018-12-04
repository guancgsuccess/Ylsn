<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wwwlj
  Date: 2018/10/22
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缘来是你</title>
    <script src="../../js/jquery-3.3.1.js"></script>
    <script src="../../js/index.js"></script>
    <link href="../../css/index.css" rel="stylesheet"/>
</head>
<body>
<form>
    <input type="hidden" value="${sessionScope.custId}" name="custId"/>
    <input type="hidden" value="" name="photo"/>
    <input type="hidden" value="${isAuto}" name="isAuto"/>
</form>
<%@include file="header.jsp"%>
<script type="text/javascript">
    //var urlContext;
    var custId=null;
    if(document.getElementsByName("custId")[0].value!="")
        custId=document.getElementsByName("custId")[0].value;

    if(custId!=null){
        document.writeln('<div style="display:none">');
    }
</script>

<div class="index-top" id="index-top-div2">
    <div class="center index-debark">
        <div class="index-info">
            <ul class="index-debNav fn-clear">
                <li class="index-debLi index-debLiCur">
                    <span class="index-regIco"></span>
                    <span class="index-regSpan" onmousedown="">免费注册</span>
                </li>
            </ul>
            <div class="index-debMain">
                <div class="index-debLists show">
                    <div class="index-debRegister">
                        <div class="index-debL1">
                            <span class="index-debSpan">佳缘</span><span class="index-debTime">15</span><span class="index-debSpan">年</span><span class="index-debTime">2</span><span class="index-debSpan">亿注册会员</span>
                            <span class="index-officeIco" title="此数据来源于北京市东方公证处"></span>
                        </div>
                        <div class="index-debL2">
                            严肃婚恋交友
                            <span class="index-debDot"></span>
                            实名认证
                            <span class="index-debDot"></span>
                            一对一服务
                        </div>
                        <div class="index-debL3">
                            <a href="${pageContext.request.contextPath}/register" onmousedown="" target="_blank" class="index-btn">免费注册</a>
                        </div>
                        <div class="index-debL4">
                            我是会员，<a href="${pageContext.request.contextPath}/login" onmousedown="" class="">立即登录</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="index-slide focus-slide index-slide-top">
        <ul class="index-slideMain" id="focus_login_pre">
            <li class="" style="">
                <a href="http://www.jiayuan.com/usercp/service/diamond_promotion.php?src_key=index2" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_logout_1');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1011/20181011104511486.jpg" alt="">
                </a>
            </li>
            <li class="" style="">
                <a href="http://www.yongjinbao.com.cn/pckhguide/index.html?channel_type=2060000000000" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_logout_2');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1016/20181016023632589.jpg" alt="">
                </a>
            </li>
            <li class="" style="">
                <a href="http://v.youku.com/v_show/id_XMzg1NDkxMTc2NA==.html?spm=a2hww.11359951.m_26657.5~5~1~3~A" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_logout_3');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1019/20181019104558415.jpg" alt="">
                </a>
            </li>
            <li class="" style="">
                <a href="http://vip.jiayuan.com/activity.php?id=44" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_logout_4');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/0817/20180817093810201.png" alt="">
                </a>
            </li>
            <li class="" style="">
                <a href="https://m.10010.com/queen/xiaomi/infinite.html?channel=1444" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_logout_5');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1016/20181016101015128.jpg" alt="">
                </a>
            </li>
            <li class="index-slideCur" style="">
                <a href="http://www.jiayuan.com/jinrong/jrpassport.php?f=45&amp;next_url=https://jr.jiayuan.com/" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_logout_6');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/0801/20180801063103975.jpg" alt="">
                </a>
            </li>
            <li class="" style="">
                <a href="http://date.jiayuan.com/?from=jy_fuc_banner" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_logout_7');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/0801/20180801065556915.jpg" alt="">
                </a>
            </li>
        </ul>
        <div class="index-slideLists" id="focus_login_pre_dot">
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
            <span class="index-sListCur">
            </span><span class=""></span>
        </div>
    </div>
</div>
<script type="text/javascript">
    if(custId!=null){document.writeln('</div>');}
</script>
<script type="text/javascript">
    if(custId==null){
        document.writeln('<div style="display:none">');
        document.getElementById("login").style.display="none";
    }
</script>

<div class="index-top" id="index-top-div1">
    <div class="center index-debark">
        <div class="index-info">
            <div class="register-card" id="user_info">
                <div class="register-top">
                    <div style="width: 110px;display:inline-block;">
                        <a href="" target="_blank" onmousedown="" class="register-left" style="width: 100%;">
                            <img class="register-pic" id="user_photo" src="" alt="">
                        </a>
                    </div>

                    <div class="register-right">
                        <div class="register-p1 fn-clear">
                            <a href="${pageContext.request.contextPath}/customer/logout" class="register-quit">[退出]</a>
                            <span class="register-txt" id="user_greet"><script>{document.write(get_greet());}</script>好
                                <span class="register-name">梦幻轮回</span></span>
                        </div>
                        <div class="register-p2 fn-clear" id="user_service">
                            <span class="register-ico register-ico-black1"></span>
                            <span class="register-ico register-ico-black2"></span>
                            <span class="register-ico register-ico-black3"></span>
                            <span class="register-ico register-ico-black4"></span>
                        </div>
                    </div>
                </div>
                <div class="register-center fn-clear">

                    <div class="register-list">
                        <div class="register-listTop">
                            <span class="register-listTxt" id="user_complete">51%</span>
                            资料
                        </div>
                        <a onmousedown="" href="${pageContext.request.contextPath}/customer/getMyInfo" target="_blank" class="register-listBtn">完善</a>
                    </div>
                    <div class="register-list">
                        <div class="register-listTop">
                            <span class="register-listTxt" id="user_mailnum">${count}</span>
                            邮件
                        </div>
                        <a onmousedown="" href="${pageContext.request.contextPath}/minbox" target="_blank" class="register-listBtn">查看</a>
                    </div>

                </div>
                <div class="register-bottom">
                    <a class="register-go" href="${pageContext.request.contextPath}/cust/center" target="_blank">
                        进入我的佳缘<span class="register-goIco"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="index-slide focus-slide-login index-slide-top" >
        <ul class="index-slideMain" id="focus_login_after">
            <li class="" >
                <a href="http://www.jiayuan.com/usercp/service/diamond_promotion.php?src_key=index2" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_1');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1011/20181011104527320.jpg" alt="">
                </a>
            </li>
            <li class="" >
                <a href="http://www.yongjinbao.com.cn/pckhguide/index.html?channel_type=2060000000000" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_2');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1016/20181016023659411.jpg" alt="">
                </a>
            </li>
            <li class="index-slideCur" >
                <a href="http://party.jiayuan.com/party_info.php?pid=5745" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_3');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/0828/20180828050321514.jpg" alt="">
                </a>
            </li>
            <li class="" >
                <a href="http://y.jiayuan.com/jq/29045503.aspx?udsid=528853" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_4');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1012/20181012092219901.jpg" alt="">
                </a>
            </li>
            <li class="" >
                <a href="http://www.jiayuan.com/jinrong/jrpassport.php?f=45&amp;next_url=https://jr.jiayuan.com/" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_5');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/0801/20180801063135982.jpg" alt="">
                </a>
            </li>
            <li class="" >
                <a href="http://vip.jiayuan.com/activity.php?id=44" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_6');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/0817/20180817093355954.png" alt="">
                </a>
            </li>
            <li class="" >
                <a href="https://m.10010.com/queen/xiaomi/infinite.html?channel=1444" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_7');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/1016/20181016101119902.jpg" alt="">
                </a>
            </li>
            <li class="" >
                <a href="http://date.jiayuan.com/?from=jy_fuc_banner" target="_blank" onmousedown="javascript:send_jy_pv2('focus_total_login_8');">
                    <img src="http://images.jiayuan.com/w4/global/cms/uploadfile/2018/0801/20180801065613926.jpg" alt="">
                </a>
            </li>
        </ul>
        <div class="index-slideLists" id="focus_login_after_dot">
            <span class="index-slideCur"></span>
            <span class=""></span>
            <span class=""></span>
            <span class=""> </span>
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
        </div>
    </div>
</div>

<script type="text/javascript">
    if(custId!=null){get_user_info();}
    if(custId==null){document.writeln('</div>');}
    if(document.getElementsByName("isAuto")[0].value==1)
        document.getElementById("sp").click();
</script>

<div class="" style="width: 1190px;margin: 0px auto">
    <!-- 佳缘第一楼 交友搜缘分 -->
    <div class="index-floor index-tab index-floorOne">
        <div class="tab-top tab-floor1">
            <h2 class="floot-title1">
                <span class="floot-ico"></span>
                <span class="floot-headName">交友搜缘分</span>
            </h2>
            <a href="${pageContext.request.contextPath}/search/load" onmousedown="" class="index-more" target="_blank">
                更多<span class="index-moreIco"></span>
            </a>
            <a href="javascript:void(0);" onclick="search_change();" onmousedown="" class="index-group">
                换一组
                <span class="index-groupIco"></span>
            </a>
            <div class="index-tabNav" id="date-search-nav">
                <a href="javascript:get_recommend_user(0);" onmousedown="send_index_pv(this);" tag="0" class="tabNav-a tabNav-cur">
                    同城人
                    <span class="tabNav-line"></span>
                </a>
                <a onmousedown="send_index_pv(this);" href="javascript:get_recommend_user(1);" tag="1" class="tabNav-a">
                    星座速配<span class="tabNav-line">

                </span>
                </a>
                <a onmousedown="send_index_pv(this);" href="javascript:get_recommend_user(2);" tag="2" class="tabNav-a">
                    90后
                    <span class="tabNav-line"></span>
                </a>
                <a onmousedown="send_index_pv(this);" href="javascript:get_recommend_user(3);" tag="3" class="tabNav-a">
                    80后
                    <span class="tabNav-line"></span>
                </a>
            </div>
        </div>
        <div class="index-tabMain">
            <div class="index-tabList show">
                <div class="pal-wrap">
                    <ul class="pal-ul fn-clear" id="date_search_list">
                       <%-- <li class="">
                            <div class="pal-list">
                                <div class="pal-top">
                                    <img class="pal-img date-search-lazy" style="width: 222px; height: 296px; left: 0px; top: 0px;" src="http://t1.jyimg.com/c8/e2/a5263c2e9cdf5946ac4664799f6c/145896268d.jpg?imageView2/1/w/222/h/296" data-original="http://t1.jyimg.com/c8/e2/a5263c2e9cdf5946ac4664799f6c/145896268d.jpg?imageView2/1/w/222/h/296" alt="" id="date_search_9">
                                    <div class="pal-bottom fn-clear">
                                        <div class="pal-info">
                                            <p class="pal-one ">漫漫人生</p>
                                            <p class="pal-two">
                                                <span class="pal-span1 age">30岁</span>
                                                <span class="pal-span2 height">164cm</span>
                                            </p>
                                        </div>
                                        <a href="javascript:;" class="pal-btn contactBtn">联系ta</a>
                                    </div>
                                    <div class="pal-name nickname">漫漫人生</div>
                                </div>
                            </div>
                        </li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 佳缘广告位 -->
    <div class="index-ad" id="hide_ad_pos_pcweb_151_box">
        <div w="1190" h="100" id="ad_pos_pcweb_151">
            <div style="overflow:hidden;width:1190;height:100;" id="jy_advert_4573">
                <a href="" target="_blank"><img style="border: none;" width="1190" height="100" src="http://images.jiayuan.com/w4/wap/i/gift/ximg/20180803/1533283658616.png" id="jy_advert_4573_img"></a>
            </div>
        </div>
    </div>
    <!-- 今日推荐 -->
    <div class="index-floor index-tab index-floorOne" id="day_recommend">
        <div class="tab-top tab-floor1">
            <h2 class="floot-title1">
                <span class="floot-ico"></span>
                <span class="floot-headName">今日推荐</span>
            </h2>
            <a href="${pageContext.request.contextPath}/search/load" onmousedown="" class="index-more" target="_blank">
                更多<span class="index-moreIco"></span>
            </a>

            </div>

        <div class="index-tabMain">
            <div class="index-tabList show">
                <div class="pal-wrap">
                    <ul class="pal-ul fn-clear" id="day_recommend_list">

                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 轮播图 -->
    <div class="index-slide middle-slide" id="index-slide-div">
        <a href="javascript:;" class="index-slideLeft"></a>
        <a href="javascript:;" class="index-slideRight"></a>
        <ul class="index-slideMain" id="middle-focus">
            <li class="index-slideCur" style="opacity: 1;">
                <a href="http://date.jiayuan.com/eventslist.php?from=jy_fuc_activity" target="_blank" onmousedown="send_index_pv('1035390_4_1');">
                    <img src="../../img/indexImg/20180806050102458.jpg" alt="1">
                </a>
            </li>
            <li class="" >
                <a href="http://date.jiayuan.com/potentialinvestors.php?from=jy_fuc_zs" target="_blank" onmousedown="send_index_pv('1035390_4_2');">
                    <img src="../../img/indexImg/20180806050204467.jpg" alt="2">
                </a>
            </li>
            <li class="" >
                <a href="http://www.jiayuan.com/jinrong/jrpassport.php?f=48&amp;next_url=https://jr.jiayuan.com/bestCurrent/" target="_blank" onmousedown="send_index_pv('1035390_4_3');">
                    <img src="../../img/indexImg/20180803074448151.png" alt="3">
                </a>
            </li>
            <li class="" >
                <a href="javascript:;" onmousedown="send_index_pv('1035390_4_4');">
                    <img src="../../img/indexImg/20180808102540566.jpg" alt="4">
                </a>
            </li>
            <li class="" >
                <a href="http://vip.jiayuan.com/activity.php?id=47" target="_blank" onmousedown="send_index_pv('1035390_4_5');">
                    <img src="../../img/indexImg/20180929051554618.jpg" alt="5">
                </a>
            </li>
            <li class="" >
                <a href="javascript:;" onmousedown="send_index_pv('1035390_4_6');">
                    <img src="../../img/indexImg/20180605044934226.jpg" alt="">
                </a>
            </li>
        </ul>
        <div class="index-slideLists" id="middle-focus-dot">
            <span class="index-sListCur"></span>
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
            <span class=""></span>
        </div>
    </div>

    <!-- 佳缘第三楼 晒幸福 -->
    <div class="index-floor index-tab">
        <div class="tab-top tab-floor3">
            <h2 class="floot-title3">
                <span class="floot-ico"></span>
                <span class="floot-headName">晒幸福</span>
            </h2>
            <a href="${pageContext.request.contextPath}/happiness" onmousedown="" class="index-more" id="xf_more" target="_blank">
                更多<span class="index-moreIco"></span>
            </a>
            <div class="index-tabNav">
                <a href="javascript:;" id="tablink0" class="tabNav-a tabNav-cur">
                </a>
                <a href="javascript:;" id="tablink1" class="tabNav-a">
                </a>
                <a href="javascript:;" id="tablink2" class="tabNav-a">
                </a>
                <a href="javascript:;" id="tablink3" class="tabNav-a">
                </a>
            </div>
        </div>
        <div class="index-tabMain">
            <div class="index-tabList show">
                <div class="bask-wrap fn-clear">
                    <div class="bask-right">
                        <ul class="bask-ul fn-clear" id="story-list">
                           <%-- <li class="bask-block bask-bigBlock">
                                <a onmousedown="send_jy_pv2('|index2012_xf_link|181578733');" target="_blank" href="http://love.jiayuan.com/myspace.php?id=42237" id="open_pop" class="bask-href">
                                    <div class="bask-list ">
                                        <div class="bask-top">
                                            <img style="" class="bask-pic xf-lazy" src="http://images1.jyimg.com/w4/story/i/love/f012cf7363_322x322.jpg" data-original="http://images1.jyimg.com/w4/story/i/love/f012cf7363_322x322.jpg" alt="">
                                        </div>
                                        <div class="bask-info">
                                            <div class="bask-coneter">
                                                <p class="bask-p1">QQ2001&amp;Daisy♥Z</p>
                                                <p class="bask-p2">2008.12.13  </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </li>--%>

                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- 佳缘广告位 -->
    <div class="index-ad">
        <div w="1190" h="100" id="ad_pos_pcweb_152">
            <div style="overflow:hidden;width:1190px;height:100px;" id="jy_advert_4369">
                <a href="http://w.jiayuan.com/mkt/adwwwclk?uid=180578733&amp;location=pcweb_152&amp;product=16&amp;ad_id=4369&amp;clientVer=1&amp;clientID=1&amp;channelID=9999&amp;screenWidth=1190&amp;screenHeight=100&amp;pin=CB10D26159C3DAEC0B1DA9BB88168C56_180578733&amp;xxtype=4&amp;insideLink=media.link&amp;wwwsign=b1ee0f2039576a287f32c384bed275eb" target="_blank">
                    <img style="border: none;" width="1190" height="100" src="../../img/indexImg/1533283690709.jpg" id="jy_advert_4369_img">
                </a>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
