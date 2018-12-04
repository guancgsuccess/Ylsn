<%--
  Created by IntelliJ IDEA.
  User: wwwlj
  Date: 2018/10/26
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传图片</title>
    <script src="../../js/jquery-3.3.1.js"></script>
    <script src="../../js/upload1.js"></script>
    <link href="../../css/upload1.css" rel="stylesheet"/>
</head>
<body>
<%@include file="header.jsp"%>
<div class="lsmainBox listBox-bg">
    <h1 class="title01"><span>书写我的美丽情缘，上传成功故事！</span></h1>
    <a href="http://static.zhenai.com/lovestory/listStory.jsps" class="but2"><span>更多成功故事&gt;&gt;</span></a>
    <a href="http://profile.zhenai.com/lovestory/addlovestorypre.jsps" class="but3"><span>上传成功故事</span></a>
    <div class="addstoryBox">
        <div class="databox">
            <h3><a href="" class="lbule">珍爱成功故事</a> &gt; 上传爱情故事</h3>
            <form action="${pageContext.request.contextPath}/happiness/saveHappiness" method="post" name="contentForm">
                <input type="hidden" name="happOtherName" value="${happiness.happOtherName}">
                <input type="hidden" name="custId" value="${sessionScope.custId}">
                <input type="hidden" name="happState" value="${happiness.happState}">
                <input type="hidden" name="happTime" value="">
                <input type="hidden" name="happTimeFormat" value="${happiness.happTime}">
                <ul class="clearfix">
                    <li><strong class="w200">故事主题：</strong>
                        <p><input name="happTitle" type="text" id="subject" onblur="checksubject()" size="20" maxlength="100" value="" class="subject"></p></li>
                    <li><strong class="w200">故事内容：</strong>
                        <p>
                            <textarea name="happContent" cols="70" rows="8" wrap="hard" id="historyContentId" onkeyup="textCounter(this,'counter2','leavings2',3000);"></textarea>
                            <br>
                            （字数300字以上。您已输入<span id="counter2" class="tred">0</span>字。）</p></li>
                    <form action="" enctype="multipart/form-data" method="post" id="uplaodphotoform" name="uplaodphotoform" target="target_upload">
                        <input type="hidden" name="isHome" value="0">
                        <li><strong class="w200">上传幸福合影：</strong>
                            <p>幸福的合影是时光的定格，更是爱的见证！上传你们的合影，让瞬间记载永恒！<br>
                                建议照片清晰，婚纱照最佳，最多可上传30张。<br>
                                <input type="file" id="fileData1" name="fileData1" class="inputBox" style="width:250px;" onchange="javascript:preview(this);">
                                <input type="button" class="bt4 bolds" value="上传相片" align="absmiddle" onclick="fileUpload()"><br>
                                <input name="agreepro" id="agreepro" type="checkbox" value="1" checked="checked">
                                我已阅读并同意
                                <a href="http://album.zhenai.com/help/announce.jsp" target="_blank" class="underlines">《肖像许可使用说明》</a><br><br>
                                <span class="tred bolds">照片预览</span>
                            </p>
                            <div id="phototemp"></div>
                            <div id="newStoryPhotoListDIV">
                               <%-- <title></title>
                                <!--照片预览 start-->
                                <div class="BrowsepicBox"><img src="http://photo.zastatic.com/photo/lovestory/1539740060431_2.jpg"></div>
                                <input type="radio" name="radiobutton" value="12190" onmousedown="return setDefaultlovestoryPhoto(12190,8264,this);">设为首页照 &nbsp; &nbsp;
                                <a href="#this" class="textRight underlines lred04" onclick="deletePhoto(12190,8264);">删除</a>
                                <!--照片预览 end-->--%>
                            </div>
                            <p></p></li>
                        <li><strong class="w200">&nbsp;</strong><p><input name="" type="button" value="提交成功故事" class="resg_bt" style="font-size:14px;" onclick="dosubmit()"></p></li>
                    </form></ul></form>

            <iframe id="target_upload" name="target_upload" src="" style="display:none"></iframe>
        </div>
    </div>
    <div class="storylist-b"></div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
