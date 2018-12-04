<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/20
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>缘来是你交友网-活动频道</title>
    <link rel="stylesheet" href="/css/party.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/party.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<div id="head_white_css"></div>
<div class="hd_head">
    <div class="w_1000 clearfix">
        <h2 class="hd_navtit">佳缘活动</h2>
        <div class="city_change">
            <p class="current_city" id="city">北京</p>
            <p class="change_btn">［<a href="javascript:;">切换</a>］</p>
            <div id="hd_city_list" class="city_list" style="display:none;">
                <div class="city_close"><span>关闭</span></div>
                <dl>
                    <dt>全　国：</dt>
                    <dd><a href="javascript:all(url_getAll);">全国</a></dd>
                </dl>
                <dl>
                    <dt>华　北：</dt>
                    <dd><a href="javascript:void(0);" onclick="city(this)">北京</a>
                        <a href="javascript:void(0);" onclick="city(this)">天津</a>
                        <a href="javascript:void(0);" onclick="city(this)">河北</a>
                        <a href="javascript:void(0);" onclick="city(this)">山西</a>
                        <a href="javascript:void(0);" onclick="city(this)">内蒙古</a></dd>
                </dl>
                <dl>
                    <dt>东　北：</dt>
                    <dd><a href="javascript:void(0);" onclick="city(this)">黑龙江</a>
                        <a href="javascript:void(0);" onclick="city(this)">吉林</a>
                        <a href="javascript:void(0);" onclick="city(this)">辽宁</a>
                    </dd>
                </dl>
                <dl>
                    <dt>华　东：</dt>
                    <dd><a href="javascript:void(0);" onclick="city(this)">上海</a>
                        <a href="javascript:void(0);" onclick="city(this)">江苏</a>
                        <a href="javascript:void(0);" onclick="city(this)">浙江</a>
                        <a href="javascript:void(0);" onclick="city(this)">安徽</a>
                        <a href="javascript:void(0);" onclick="city(this)">福建</a>
                        <a href="javascript:void(0);" onclick="city(this)">江西</a>
                        <a href="javascript:void(0);" onclick="city(this)">山东</a>
                    </dd>
                </dl>
                <dl>
                    <dt>中　南：</dt>
                    <dd>
                        <a href="javascript:void(0);" onclick="city(this)">深圳</a>
                        <a href="javascript:void(0);" onclick="city(this)">广东</a>
                        <a href="javascript:void(0);" onclick="city(this)">河南</a>
                        <a href="javascript:void(0);" onclick="city(this)">湖北</a>
                        <a href="javascript:void(0);" onclick="city(this)">湖南</a>
                        <a href="javascript:void(0);" onclick="city(this)">广西</a>
                        <a href="javascript:void(0);" onclick="city(this)">海南</a>
                    </dd>
                </dl>
                <dl>
                    <dt>西　南：</dt>
                    <dd>
                        <a href="javascript:void(0);" onclick="city(this)">重庆</a>
                        <a href="javascript:void(0);" onclick="city(this)">四川</a>
                        <a href="javascript:void(0);" onclick="city(this)">贵州</a>
                        <a href="javascript:void(0);" onclick="city(this)">云南</a>
                        <a href="javascript:void(0);" onclick="city(this)">西藏</a>
                    </dd>
                </dl>
                <dl>
                    <dt>西　北：</dt>
                    <dd><a href="javascript:void(0);" onclick="city(this)">陕西</a>
                        <a href="javascript:void(0);" onclick="city(this)">甘肃</a>
                        <a href="javascript:void(0);" onclick="city(this)">青海</a>
                        <a href="javascript:void(0);" onclick="city(this)">宁夏</a>
                        <a href="javascript:void(0);" onclick="city(this)">新疆</a></dd>
                </dl>
                <dl>
                    <dt>港澳台：</dt>
                    <dd><a href="javascript:void(0);" onclick="city(this)">香港</a>
                        <a href="javascript:void(0);" onclick="city(this)">澳门</a>
                        <a href="javascript:void(0);" onclick="city(this)">台湾</a></dd>
                </dl>
            </div>
        </div>
        <script type="text/javascript">
            $(function(){
                $('.city_list dd a').each(function(){
                    $(this).click(function(){
                        $('.current_city').html($(this).html());
                        $('#hd_city_list').hide();
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

        <div class="hd_slgns fixPNG"></div>
    </div>
</div>
<div class="w_1000">
    <div class="hdlm_tit clearfix">
        <ul>
            <li class="active"><a href="?locationId=34&tag=1"  target="_blank" title="">线下活动</a></li>
        </ul>
    </div>
    <!--    <div id="banner_slides" style="display: none;">
            <div class="slides_container">
                <div class="hd_banner"><a href="#" title=""><img src="" width="680" height="250" alt="" /></a></div>
            </div>
            <a href="javascript:;" hidefocus="true" class="prev fixPNG"></a>
            <a href="javascript:;" hidefocus="true" class="next fixPNG"></a>
        </div>-->
    <div class="hot_hd" style="border:none;">
        <div class="imgAd" id="ad_rightImg">
            <i>
                <img src="../img/party/ggico.png" />
            </i>
            <a href="#" target="_blank"><img src="../img/party/1519630465347.jpeg" width="318" height="119" alt="" />
            </a>
        </div>
        <ul>
            <li id="ad_remen">
                <span style="border:1px solid #fa5e73;color:#fa5e73;">热门</span>
                <a href="" target="_blank" title="">
                    爱奇艺《拜托了前任》招募男女嘉宾
                </a>
            </li>
            <li id="ad_tuijian"><span style="border:1px solid #f29045;color:#f29045;">推荐</span><a href="#" target="_blank" title=""></a></li>
            <li id="ad_huodong"><span style="border:1px solid #30b16e;color:#30b16e;">活动</span><a href="#" target="_blank" title=""></a></li>
        </ul>
    </div>
    <div class="leftbar">
        <div class="hd_num">线下活动——报名进行中<span class="hd_in" id="hd_in"></span>场，已结束<span class="hd_end" id="hd_end"></span>场</div>
        <div class="hd_list" id="hdList">

        </div>
        <!--分页-->
        <div class="pages" id="pagearea">
        </div>
    </div>
    <div class="rightbar">
        <div class="hd_latest">
            <div class="rtit"><h4>最新动态</h4></div>
            <div class="hd_state">
                <div id="latest">
                    <ul>
                        <li>
                            <div class="state_time">
                                <!--                                5分钟前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at1.jyimg.com/00/8a/344b7af24c0f43c8bc9995597ff3/344b7af24_4_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>cc</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9391" title="">免费浪漫交友活动报名...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                48分钟前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at3.jyimg.com/ae/05/d263b87444bd83b7a9c4daf97eaa/d263b8744_2_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>好久不见</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9380" title="">2018线下活动志愿...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                1小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at2.jyimg.com/9d/56/b2a34f6fb0c30c2e2ee2f76d4b99/b2a34f6fb_1_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>安妮</h5>
                                    <p>报名了活动<a href="party_info.php?pid=5745" title="">江苏卫视《非诚勿扰》...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                3小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at1.jyimg.com/c7/bb/aca9c00121188f795af2a93a61db/aca9c0012_1_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>追求真爱</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9358" title="">FM89.6武汉交通...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                3小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at3.jyimg.com/64/eb/bc0ab714b3ace5089979c8759f8c/bc0ab714b_2_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>佳缘</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9370" title="">第一时间了解线下交友...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                8小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at1.jyimg.com/01/78/cb3e7792d5486d610f43dc76baqc/cb3e7792d_1_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>菲儿</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9385" title="">企业联谊专场交友活动...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                9小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at4.jyimg.com/b2/1a/411cc052d6f651d9fc23c5af710d/411cc052d_3_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>尹熙</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9372" title="">2018年免费交友派...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                9小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at3.jyimg.com/61/58/b48cb012e41a1816de6b306be003/b48cb012e_2_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>兰陵王</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9370" title="">第一时间了解线下交友...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                9小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at1.jyimg.com/87/ec/e3f4dc3cef1deaca8bd5e80fe79b/e3f4dc3ce_2_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>少食卡路里</h5>
                                    <p>报名了活动<a href="party_info.php?pid=5745" title="">江苏卫视《非诚勿扰》...</a></p>
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <div class="state_time">
                                <!--                                9小时前-->刚刚
                            </div>
                            <dl class="state_info">
                                <dt><img src="http://at4.jyimg.com/f1/a4/2329bbd5519d07a6f040343b9ecc/2329bbd55_2_avatar_p.jpg" width="60" height="74" alt="" /></dt>
                                <dd>
                                    <h5>珍珍</h5>
                                    <p>报名了活动<a href="party_info.php?pid=9366" title="">2018年免费交友派...</a></p>
                                </dd>
                            </dl>
                        </li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">
                $(function(){
                    var scrtime;
                    $("#latest").hover(function(){
                        clearInterval(scrtime);

                    },function(){
                        scrtime = setInterval(function(){
                            var $ul = $("#latest ul");
                            var liHeight = $ul.find("li:last").height();
                            $ul.animate({marginTop : liHeight + 35 + "px"},1000,function(){

                                $ul.find("li:last").prependTo($ul)
                                $ul.find("li:first").hide();
                                $ul.css({marginTop:0});
                                $ul.find("li:first").fadeIn(1000);
                            });
                        },3000);

                    }).trigger("mouseleave");
                });
            </script>
        </div>
        <div class="hd_hosts">
            <div class="rtit"><h4>线下主持人风采</h4></div>
            <div id="slides">
                <div class="slides_container">
                    <div class="slide">
                        <img src="http://images1.jyimg.com/w4/party/v2/compere/sj.jpg" width="110" height="135" alt="" />
                        <div class="caption">
                            <h5>宋佳</h5>
                            <p>主持风格独树一帜，时而温婉大气，时而搞怪、肢体动作丰富，气氛活跃，还能满台“飞”。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hd_question">
            <div class="rtit"><h4>常见问题</h4></div>
            <ul>
                <li>&bull;<a href="v2/question.php#0" target="_blank" title="">LOVE ID 是什么？如何查看？</a></li>
                <li>&bull;<a href="v2/question.php#1" target="_blank" title="">线上支付如何现场验证？</a></li>
                <li>&bull;<a href="v2/question.php#2" target="_blank" title="">已支付活动无法参加如何退款？</a></li>
                <li>&bull;<a href="v2/question.php#3" target="_blank" title="">活动是否有二次确认？</a></li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="ad_space" id="ad_space">
        <i>
        <img src="../img/party/ggico.png" />
        </i>
        <a href="#" title="" target="_blank">
            <img src="http://hd.jyimg.com/w4/party/v2/images/hzAd.jpg" width="1000" height="90" alt=""/>
        </a>
    </div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
