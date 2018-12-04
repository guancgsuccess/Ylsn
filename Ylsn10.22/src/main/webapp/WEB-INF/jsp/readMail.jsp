<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/20
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>阅读信件</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/readMail.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/readMail.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<form>
    <input type="hidden" name="messFromId" value="${messFromId}">
    <input type="hidden" name="messToId" value="${messToId}">
</form>
<div id="head_red_simple_css">
    <div class="headMain">
        <a class="logo"></a>
        <div id="head_logo_bar" class="logoBar"></div>
        <h1 id="head_red_simple" class="pageTitle" style="">阅读信件</h1>
    </div>
</div>
<div id='container'>
    <div class="dialog-area">
        <div class="dialog-mod">
            <!--个人资料-->
            <div class="dialog-detail">
                <div class="avatar-pic">
                    <a target="_blank" href="">
                        <img src="" class="images"/>
                    </a>
                </div>
                <div class="con-mod">
                    <div class="specific">
                        <a class="name" id="name" href="" target="_blank"></a>
                        <span class="icon-box">
							<img src="${pageContext.request.contextPath}/img/ReadMail/40.gif" alt="钻石会员" title="钻石会员" /> <img src="${pageContext.request.contextPath}/img/ReadMail/cx.gif" alt="诚信会员" title="诚信会员" />
						</span>
                        <span>最近登录时间：</span>
                        <span class="time" id="time"></span>
                    </div>
                    <p class="data">
                        <span id="age"></span>岁，
                        <span id="marriage"></span>，
                        <span id="height"></span>cm，
                        <span id="province"></span> ，
                        <span id="education"></span> ,
                        <span id="profession"></span> ，
                        <span id="income"></span>元
                    </p>
                    <div class="member-like clearfix">
                        <div class="like">
                            <span id="introduce"></span>
                        </div>
                        <div class="fun">
                            <ul class="clearfix">
                                <li class="attention"><a id="guanzhu" href="javascript:add_follow(${messFromId})"><i></i>加关注</a></li>
                                <li class="report">
                                    <a target="_blank" href="http://www.jiayuan.com/complain/?old=1&uid_hash=17f07f08144eace9cde50f2bc01f82af&check=jq>">举报<i></i></a>
                                    <div class="report-layer">
                                        <ul>
                                            <li><a href="http://www.jiayuan.com/complain/?old=1&uid_hash=17f07f08144eace9cde50f2bc01f82af&check=jq>">对方借钱</a></li>
                                            <li><a href="http://www.jiayuan.com/complain/?old=1&uid_hash=17f07f08144eace9cde50f2bc01f82af&check=jq>">发广告</a></li>
                                            <li class="bd-none"><a href="http://www.jiayuan.com/complain/?old=1&uid_hash=17f07f08144eace9cde50f2bc01f82af&check=jq>">一夜情</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <p class="e_clear ydxj_aq">
                        <img src="../../img/ReadMail/safe_icon.jpg" width="14" height="15" />
                        <span>
                            安全提示：加强自我防范意识，警惕各类投资赌彩等诈骗方式。为保护隐私，初次沟通，不建议您留下联系方式。
                        </span>
                    </p>
                </div>
            </div>
            <div class="dialog-list">
                <p class="more-report" id="more"></p>
                <!--详细列表-->
                <div class="letter-detail" id="msg_list">
<%--                    <!--左-->
                    <div class="item left clearfix">
                        <div class="lt-face">
                            <a href=""><img src="" class="images" alt=""></a>
                        </div>
                        <div class="lt-detail">
                            <div class="lt-time">昨天 20:21</div>
                            <div class="lt-txt-mod clearfix">
                                <div class="lt-txt">
                                    <span class="tarr" type="sx"></span>
                                    <p>真诚的我希望遇到同样真诚的你，平凡幸福的陪伴一生。</p>
                                    <a href="" class="close"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--右-->
                    <div class="item right clearfix">
                        <div class="lt-face">
                            <a href=""><img src="../img/ReadMail/057dac25e_3_avatar_p.jpg" alt=""></a>
                        </div>
                        <div class="lt-detail">
                            <div class="lt-time">昨天 20:21</div>
                            <div class="lt-txt-mod clearfix">
                                <div class="lt-txt">
                                    <span class="tarr" type="sx"></span>
                                    <p>真诚的我希望遇到同样真诚的你，平凡幸福的陪伴一生。</p>
                                    <a href="" class="close"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--左-->
                    <div class="item left clearfix">
                        <div class="lt-face">
                            <a href=""><img src="../img/ReadMail/057dac25e_3_avatar_p.jpg" alt=""></a>
                        </div>
                        <div class="lt-detail">
                            <div class="lt-time">昨天 20:21</div>
                            <div class="lt-txt-mod clearfix">
                                <div class="lt-txt">
                                    <span class="tarr" type="sx"></span>
                                    <p>真诚的我希望遇到同样真诚的你，平凡幸福的陪伴一生。</p>
                                    <a href="" class="close"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--右-->
                    <div class="item right clearfix">
                        <div class="lt-face">
                            <a href=""><img src="../img/ReadMail/057dac25e_3_avatar_p.jpg" alt=""></a>
                        </div>
                        <div class="lt-detail">
                            <div class="lt-time">昨天 20:21</div>
                            <div class="lt-txt-mod clearfix">
                                <div class="lt-txt">
                                    <span class="tarr" type="sx"></span>
                                    <p>真诚的我希望遇到同样真诚的你，平凡幸福的陪伴一生。</p>
                                    <a href="" class="close"></a>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>
                <div class="reading-letter">
                    <span class="reading-b">首都网警安全交友提示：</span>对方当前为异地求偶，被索要联系方式或被要求线下见面时，请务必谨慎，避免骚扰及各种诈骗手段！请谨慎交友！
                </div>
            </div>
            <!--发信框-->
            <div class="replay-area" >
                <div class="replay-mod">
                    <div class="replay-function">
                        <ul>
                            <li class="topic">
                                <a href="javascript:;" class="replay-icon" id="moban">
                                    <i></i>
                                    使用模板</a>
                                <div class="layer topic-layer" style="display: none;">
                                    <p class="chat">
                                        <input type="hidden"  class="moban_id" value="">
                                        <span class="pre_text" id="pre_text1">感谢您的来信！很高兴能和您相识。</span>
                                        <span class="state1">
											<a class="w_use" onclick="weUse1()" >使用</a>
                                        </span>
                                    </p>
                                    <p class="chat">
                                        <input type="hidden"  class="moban_id" value="">
                                        <span class="pre_text" id="pre_text2">让我们保持联系吧，希望我是那个你一直在寻找的人。</span>
                                        <span class="state1">
											<a class="w_use" onclick="weUse2()">使用</a>
                                        </span>
                                    </p>
                                    <p class="chat">
                                        <input type="hidden"  class="moban_id" value="">
                                        <span class="pre_text" id="pre_text3">谢谢来信，可以介绍一些你的基本情况吗？如家庭、工作等等。</span>
                                        <span class="state1">
											<a class="w_use" onclick="weUse3()">使用</a>
                                        </span>
                                    </p>
                                </div>
                            </li>
                            <li class="refusal">
                                <a id="refuse" onclick="refuse()" class="replay-icon"><i></i>礼貌拒绝</a>
                            </li>
                        </ul>
                    </div>
                    <form id="sendmsg" action="" method="post">
                        <input name="messContent" id="messContent" type="hidden">
                        <input name="messTime" id="messTime" type="hidden">
                        <input name="messFromId" id="messFromId" type="hidden">
                        <input name="messToId" id="messToId" type="hidden">
                        <div class="replay-txt">
                            <textarea id="txt" name="contents" class="input-txt" ></textarea>
                        </div>
                        <div class="replay-btn">
                            <ul class="clearfix">
                                <li class="mr0">
                                    <a id="free" type="su" class="btn free" href="javascript:replyMessage();" >免费回复</a>
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //使用模板
    $("#moban").click(function () {
        $(".topic-layer").show();
    });
    $(".w_use").click(function () {
        $(".topic-layer").hide();
    });
    $(".input-txt").click(function () {
        $(".topic-layer").hide();
    });
    $("#refuse").click(function () {
        $(".topic-layer").hide();
    });
    //关注
    $("#guanzhu").click(function(){
        var is_guanzhu = $(this).attr('g');
        if(is_guanzhu != '1'){
            var guanzhu_url = $(this).attr('href');
            $.get(guanzhu_url, {}, function(data) {
                //JY_Alert('温馨提示',data);
                $("#guanzhu").attr('g','1').html("<i></i>已关注").addClass('concerns');
            });
        }
        return false;
    });
    function weUse1() {
        document.getElementById("txt").innerText = document.getElementById("pre_text1").innerText;
    }
    function weUse2() {
        document.getElementById("txt").innerText = document.getElementById("pre_text2").innerText;
    }
    function weUse3() {
        document.getElementById("txt").innerText = document.getElementById("pre_text3").innerText;
    }
    //礼貌拒绝
    function refuse() {
        document.getElementById("txt").innerText = "非常感谢你的来信。很遗憾，我们的条件不太匹配，愿早日寻找到幸福！";
    }
</script>
<%@include file="footer.jsp"%>
</body>
</html>
