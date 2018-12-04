<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/2
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>爱情故事详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detailStory.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/detailStory.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
<form>
    <input type="hidden" name="custId" value="${sessionScope.custId}">
    <input type="hidden" name="happId" value="${happiness.happId}">
</form>
    <div class="frame_960 sd_main">
        <div class="top_section clearfix">
            <h2 class="title">${happiness.happTitle}</h2>
            <div class="col_left">
                <div class="summary">
                        <span class="name">${happiness.happOtherName.split(",")[0]}
                            <i class="icon_heart"></i>${happiness.happOtherName.split(",")[1]}</span>
                    <c:if test="${happiness.happState==0}">
                        <span class="status">会员状态：<em>我们恋爱了</em></span>
                    </c:if>
                    <c:if test="${happiness.happState==1}">
                        <span class="status">会员状态：<em>我们订婚了了</em></span>
                    </c:if>
                    <c:if test="${happiness.happState==2}">
                        <span class="status">会员状态：<em>我们结婚了</em></span>
                    </c:if>
                    <span class="time">发布时间：${happiness.happTime.toLocaleString()}</span>
                </div>
                <div class="pic_show">
                    <div class="pic_box"><img src="${happImage}"></div>
                </div>
            </div>

            <div class="col_right">
                <div class="share"></div>
                <div class="upload_box">
                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;晒&nbsp;幸&nbsp;福</strong><br>
                    <p>分&nbsp;&nbsp;享&nbsp;&nbsp;幸&nbsp;&nbsp;福&nbsp;&nbsp;瞬&nbsp;&nbsp;间，<br>
                        传&nbsp;&nbsp;递&nbsp;&nbsp;成&nbsp;&nbsp;功&nbsp;&nbsp;经&nbsp;&nbsp;验。</p>
                    <a target="_blank" href="${pageContext.request.contextPath}/upload0" rel="nofollow" class="btn_blue_M">我也来上传照片</a>
                </div>
            </div>
        </div>
        <div class="main_content">
            <h3 class="article_title">我们的恋爱历程</h3>
            <div class="article_content">
                <div class="motifs"></div>
               ${happiness.happContent}
            </div>
        </div>
        <div class="box aqgs">
            <h2><font class="font1">更多幸福故事</font></h2>
            <div class="content">
                <div class="content_like">
                    <ul id="happList">

                    </ul>
                </div>
            </div>
            <b class="l4"></b><b class="l3"></b><b class="l2"></b><b class="l1"></b>
        </div>
        <div class="box">
            <a name="zhufu"></a>
            <h2><font class="font1">祝福留言</font></h2>
            <div class="content" id="content">
                <%--评论内容--%>
            </div>
            <div class="pageclass" id="pageclass">
                <%--分页--%>
            </div>

            <div id="fbzf">
                    <p><font class="font2">发表祝福</font></p>

                    <form id="post_form" name="post_form" method="post" action="">
                        <textarea name="comment_content" id="comment_content" cols="" rows="" onclick="if(this.value=='内容为100汉字以内，欢迎发表！')this.value='';" onblur="if(this.value=='')this.value='内容为100汉字以内，欢迎发表！';">内容为100汉字以内，欢迎发表！</textarea>
                        <p class="yzfb">
                            <input id="custId" name="custId" type="hidden" class="custId">
                            <input id="happId" name="happId" type="hidden" class="happId">
                            <input id="commContent" name="commContent" type="hidden" class="commContent">
                            <a href="javascript:send();" class="a5" id="txt">
                                <span onclick="saveComments()">发表</span>
                            </a>
                        </p>
                    </form>
                    <script language="javascript">
                        function send()
                        {
                            var password = document.getElementById("veri_code").value;
                            var	content = document.getElementById("comment_content").value;

                            if(content.length<1 || content=='内容为100汉字以内，欢迎发表！')
                            {
                                alert("请输入祝福留言！");
                                return;
                            }

                            if(getlength(content) > 200)
                            {
                                alert("内容为100汉字以内！");
                                return;
                            }
                        }

                        function con_code()
                        {
                            var ran= Math.round((Math.random()) * 100000000);
                            document.getElementById("antispam_v2").src = "/antispam_v2.php?r=" + ran;
                        }

                        function getlength(str)
                        {
                            var	d = (str.match(/[\x00-\xff]/g)||" ").length;
                            var	s = str.length-d;
                            var	alllen = d+s*2;
                            return alllen;
                        }

                    </script>
                </div>
            <b class="l4"></b><b class="l3"></b><b class="l2"></b><b class="l1"></b>
        </div>
    </div>
<%@include file="footer.jsp"%>
</body>
</html>
