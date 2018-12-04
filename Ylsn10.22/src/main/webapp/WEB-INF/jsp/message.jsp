
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <script src="../../js/jquery-3.3.1.js"></script>
    <script  src="../../js/message1.js"></script>
    <link href="../../css/message1.css" rel="stylesheet"/>
    <link href="../../css/loginSimpleAlert.css" rel="stylesheet"/>
    <script src="../../js/loginSimpleAlert.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<form>
    <input type="hidden" value="${customer.custBirthday}" name="custBirthday"/>
    <input type="hidden" value="${gender}" name="gender"/>
    <input type="hidden" value="${nickname}" name="nickname"/>
    <input type="hidden" value="${photo}" name="photo"/>
    <input type="hidden" value="${login.loginTime}" name="loginTime"/>
</form>

<div class="main_1000 bg_white mt15">
    <div class="top_box fn-clear">
        <!--会员信息 start-->
        <div class="member_box">
            <!--轮播图 start-->
            <div class="pic_box">

                <div class="big_pic" id="bigImg">
                    <ul >
                        <li >
                            <table cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td align="center" onclick="if(!if_show_pic(1)){return false;}">
                                            <a onmousedown="" target="_blank" href="">
                                                <img class="img_absolute" style="position: absolute; height: 280px; width: 250px; left: 0px; top: -17.0455px;" src="http://localhost:8080/Path/${customer.custPhoto}">
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </li>
                    </ul>
                <div class="my_info yh not_online">${state}，
                    <span class="col_blue"><a style="cursor:pointer" onclick="seeLoginTime()" >查看最近登录时间</a></span>
                </div>
                </div></div>
            <!--轮播图 end-->

            <!--信息 start-->
            <div class="member_info_r yh">
                <h4 id="nickname">${customer.custNickname}<a href="javascript:void(0);" class="add_follow" onclick="add_follow(${customer.custId})" onmousedown="">+关注</a></h4>

                <p class="col_999">诚信信息是会员自愿提供，目前中国无完整渠道确保100%真实，请理性对待。</p>
                <div class="womanFlash">
                    <img src="http://localhost:8080/Path/${photo}" alt="" class="L" style="width: 60px; border-radius: 50%; float: left;margin-top: 15px" />
                    <div class="cont" style="display: inline-block;float: left">
                        <embed align="middle" width="85" height="85" type="application/x-shockwave-flash" salign="" allowscriptaccess="sameDomain" allowfullscreen="false" flashvars="percent=${score}" menu="true" name="percentCircle" bgcolor="#ffffff" devicefont="false" wmode="transparent" scale="showall" loop="true" play="true" pluginspage="http://www.adobe.com/go/getflashplayer_cn" quality="high" src="../../js/percentCircle.swf">
                    </div>
                    <img src="http://localhost:8080/Path/${customer.custPhoto}" alt="" class="R"  style="width: 60px;border-radius: 50%;float: left;margin-top: 15px"/>
                </div>
                <h6 class="member_name">岁，${customer.custMarriage}，来自<a onmousedown="" href="" class="col_blue" >${customer.custProvince}</a><a onmousedown="send_jy_pv2('|profile_subloc_search|');" href="http://search.jiayuan.com/v2/?key=苏州&amp;sex=f&amp;f=search" class="col_blue" target="_blank">${customer.custCity}</a></h6>
                <ul class="member_info_list fn-clear">
                    <li>
                        <div class="fl f_gray_999">学历：</div>
                        <div class="fl pr">
                            <em>${customer.custEducation}</em>
                        </div>
                    </li>
                    <li>
                        <div class="fl f_gray_999">身高：</div>
                        <div class="fl pr">
                            <em>${customer.custHeight}cm</em>
                        </div>
                    </li>

                    <li>
                        <div class="fl f_gray_999">月薪：</div>
                        <div class="fl pr">
                            <em>${customer.custIncome}</em>
                        </div>
                    </li>
                    <li>
                        <div class="fl f_gray_999">体重：</div>
                        <div class="fl pr">
                            <em>${customer.custWeight}</em>
                        </div>
                    </li>
                    <li>
                        <div class="fl f_gray_999">星座：</div>
                        <div class="fl pr">
                            <em>${customer.custConstellation}</em>
                        </div>
                    </li>
                    <li>
                        <div class="fl f_gray_999">民族：</div>
                        <div class="fl pr">
                            <em>${customer.custNation}</em>
                        </div>
                    </li>
                    <li>
                        <div class="fl f_gray_999">属相：</div>
                        <div class="fl pr">
                            <em>${customer.custZodiac}</em>
                        </div>
                    </li>
                    <li>
                        <div class="fl f_gray_999">血型：</div>
                        <div class="fl pr">
                            <em>${customer.custBloodType}</em>
                        </div>
                    </li>
                </ul>
                <div class="fn-clear mt15">
                    <a  href="${pageContext.request.contextPath}/readMail?messFromId=${customer.custId}"  class="member_btn1" style="cursor:pointer" onclick="" onmousedown="">发信</a>
                    <a class="member_btn2" style="cursor:pointer" onclick="" onmousedown="">打招呼</a>
                </div>
            </div>
            <!--信息  end-->
        </div>
        <!--会员信息 end -->

        <!--广告 start -->
        <div class="banner_box yh">
            <div class="slide_banner" id="ad_pos_pcweb_11">
                <div id="jy_ad_3032">
                    <ul style="font-size: 0;">
                        <li style="display: none;">
                            <a href="http://w.jiayuan.com/mkt/adwwwclk?uid=180578733&amp;location=pcweb_11&amp;product=16&amp;ad_id=3032&amp;clientVer=1&amp;clientID=1&amp;channelID=9999&amp;screenWidth=200&amp;screenHeight=200&amp;pin=9F243A3890DB2BA2E23BBA9A0D46E904_180578733&amp;xxtype=4&amp;insideLink=media.link&amp;wwwsign=0230c37654223d35877b1a99c097ed6c" target="_blank">
                                <img src="http://images.jiayuan.com/w4/wap/i/gift/ximg/20180919/1537321490936.jpg" alt="">
                            </a>
                        </li>
                        <li style="display: block;">
                            <a href="http://w.jiayuan.com/mkt/adwwwclk?uid=180578733&amp;location=pcweb_11&amp;product=16&amp;ad_id=3032&amp;clientVer=1&amp;clientID=1&amp;channelID=9999&amp;screenWidth=200&amp;screenHeight=200&amp;pin=9F243A3890DB2BA2E23BBA9A0D46E904_180578733&amp;xxtype=4&amp;insideLink=media1.link&amp;wwwsign=0230c37654223d35877b1a99c097ed6c" target="_blank">
                                <img src="http://images.jiayuan.com/w4/wap/i/gift/ximg/20180919/1537321490936.jpg" alt="">
                             </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="ems_bg col_blue">
                <a target="_blank" href="http://www.jiayuan.com/msgapp/ems/?uid_hash=fd60a6975414d26c9f69a1463cd149b8&amp;from=profile" onmousedown="send_jy_pv2('|1017864_26|');send_jy_pv2('|1017864_27|181578733');" class="col_blue">喜欢她就发特快专递&gt;&gt;</a>
            </div>
            <div class="jb_text col_999">
                <a style="cursor:pointer" onclick="show_photo_lj_tc(13);return false;" onmousedown="send_jy_pv2('|1017864_32|');send_jy_pv2('|1017864_33|181578733');">推荐</a>&nbsp;&nbsp;&nbsp;｜
                <a onmousedown="send_jy_pv2('|1017864_34|');send_jy_pv2('|1017864_35|181578733');" href="http://www.jiayuan.com/complain/?uid_hash=fd60a6975414d26c9f69a1463cd149b8&amp;old=1" target="_blank">举报</a>
            </div>
        </div>
        <!--广告 end -->
    </div>

    <div class="profile" id="profileCommon">
        <!-- 左侧内容-->
        <div class="profileLeft">
            <div class="tabMenu">
                <h3>她的资料</h3>
            </div>
            <!-- 用户资料 -->
            <div class="perData">
                <h4>自我介绍</h4>
                <div class="intr">
                    ${customer.custIntroduce}
                </div>
                <!-- 设置了隐私资料 -->
                <div class="viewData" >
                    <h4>个人、工作、家庭状况及爱情规划</h4>
                    <ul>
                        <li class="telllater"><div>民　　族：</div><div class="meg" >${customer.custNation}</div></li>

                        <li class="telllater"><div>家乡：</div>  <div  class="meg" >${customer.custProvince}${customer.custCity}</div></li>

                        <li class="telllater"><div>属　　相：</div><div class="meg">${customer.custZodiac}</div></li>

                        <li class="telllater"><div>星　座：</div> <div class="meg">${customer.custConstellation}</div></li>

                        <li class="telllater"><div>血　型：</div><div class="meg">${customer.custBloodType}</div></li>

                        <li class="telllater"><div>职业：</div><div class="meg">${customer.custProFession}</div></li>

                        <li class="telllater"><div>体　重：</div><div class="meg">${customer.custWeight}</div></li>

                        <li class="telllater"><div>爱好：</div><div  class="meg">${customer.custHobby}</div></li>

                    </ul>
                    <div class="clear"></div>
                </div>
                <div class="adv">
                    <a href=""><img src="http://images.jiayuan.com/w4/wap/i/gift/ximg/20180906/1536204894522.jpg" style="width:100%; height:80px;"></a>
                    <!--<iframe wilih="690" height="80" src="http://bhtg.baihe.com/place_285.html" frameborder="0" scrolling="no"></iframe>-->
                </div>

                <h4>择偶意向<!--<span class="cbd">带*的条件为必须满足</span>--></h4>
                <ul>
                    <script>
                        if(${requirement.requMinAge==1})
                            document.writeln('<div style="display:none">');
                    </script>
                    <li class="telllater" ><div>年　龄：</div><div class="meg">${requirement.requMinAge}~${requirement.requMaxAge}&nbsp;岁</div></li>
                    <script>
                        if(${requirement.requMinAge==1})
                            document.writeln('</div>');
                        if(${requirement.requMinAge!=1})
                            document.writeln('<div style="display:none">');
                    </script>
                    <li class="telllater" ><div>年　龄：</div><div class="meg">不限</div></li>
                    <script>
                        if(${requirement.requMinAge!=1})
                            document.writeln('</div>');
                    </script>
                    <li class="telllater" ><div>所在地区：</div> <div class="meg">${requirement.requProvince}${requirement.requCity}</div></li>
                    <script>
                        if(${requirement.requMinHeight==null}&&${requirement.requMaxHeight==null})
                            document.writeln('<div style="display:none">');
                    </script>
                    <li class="telllater" ><div>身　高：</div> <div class="meg">${requirement.requMinHeight}~${requirement.requMaxHeight}&nbsp;厘米</div></li>
                    <script>
                        if(${requirement.requMinHeight==null}&&${requirement.requMaxHeight==null})
                            document.writeln('</div>');
                        if(${requirement.requMinHeight!=null}&&${requirement.requMaxHeight!=null})
                            document.writeln('<div style="display:none">');
                    </script>
                    <li class="telllater" ><div>身　高：</div> <div class="meg">不限</div></li>
                    <script>
                        if(${requirement.requMinHeight!=null}&&${requirement.requMaxHeight!=null})
                            document.writeln('</div>');
                    </script>


                    <li class="telllater" ><div>婚姻状况：</div>  <div class="meg">${requirement.requMarriage}</div></li>

                    <li class="telllater" ><div>学　历：</div> <div class="meg">${requirement.requEducation}</div></li>

                    <li class="telllater" ><div>月收入：</div> <div class="meg" title="2000以下,4000-5000,7000-10000,15000-20000,30000-50000">${requirement.requIncome}</div></li>
                </ul>
            </div>
        </div>

        <!-- 右侧内容-->
        <div class="slidebar bg_white">
            <!--可能感兴趣的人start-->
            <h2 class="slidebar_tit pt20"> <a class="col_blue" href="javascript:search_change1();" onmousedown="">换一组</a> 您可能感兴趣的人 </h2>
            <div id="interested">

                <ul class="pic_list">
                    <!--此行勿删-->
                   <%-- <li class="clearfix">
                        <div class="fl pic_7490 pr">
                            <a href="http://www.jiayuan.com/183404514?src=personalmatch_profile_c&amp;fxly=tj-ymtj-grzlytj&amp;tid=7&amp;index=1/1&amp;reason=new_user&amp;rid=7&amp;algorithm=personalmatch_profile_c&amp;pid=avatar&amp;photo_count=0" target="_blank">
                                <img src="http://images1.jyimg.com/w4/global/i/zwzp_f_n.jpg" width="74" height="90" onmousedown="send_jy_pv2('|1017867_26|');send_jy_pv2('|1017867_27|181578733');">
                            </a>
                        </div>
                        <div class="member_info">
                            <h6>
                                <a class="a_gray_333" href="" onmousedown="" target="_blank">
                                    柠檬  28岁，江苏
                                </a>
                            </h6>
                            <p>她刚注册，正摩拳擦掌找对象</p>
                        </div>
                    </li>--%>

                </ul>
            </div>
            <!--可能感兴趣的人end-->
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
