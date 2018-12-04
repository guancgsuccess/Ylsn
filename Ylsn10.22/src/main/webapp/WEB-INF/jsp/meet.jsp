
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>邂逅</title>
    <link rel="stylesheet" href="../../css/meet.css">
    <script src="../../js/jquery-3.3.1.js"></script>
<%--
    <script src="../../js/mymeet.js"></script>
--%>

    <script>
        var xhr = null;
        var url_getCustByRequGender = "/customer/getCustByRequGender";
        var custId=null;
        var meetId=null;
        $(document).on('click',"#talkTa a",function(e) {

            if($("#todayUser").text()*1>0) {
                if (this.className == "b01") {
                   update("/customer/updateMeet?custId="+custId+"&custMeetCount="+($("#todayUser").text()*1-1)+"&custLikeNumber="+$("#haveLoved").text());
                    get_user_info1();
                    getCustByRequGender(url_getCustByRequGender+"?gender="+document.getElementsByName("custGender")[0].value);

                }
                if (this.className == "b03") {
                   update("/customer/updateMeet?custId="+custId+"&custMeetCount="+($("#todayUser").text()*1-1)+"&custLikeNumber="+($("#haveLoved").text()*1+1)+"&meetId="+meetId);
                    get_user_info1();
                    getCustByRequGender(url_getCustByRequGender+"?gender="+document.getElementsByName("custGender")[0].value);

                }

            }
        });

        window.onload=function (ev) {

            get_user_info1();

            getCustByRequGender(url_getCustByRequGender+"?gender="+document.getElementsByName("custGender")[0].value);

        }

    </script>
</head>
<body>
<%@include file="header.jsp"%>
<form>
    <input type="hidden" value="${requirement.requMinAge}" name="requMinAge">
    <input type="hidden" value="${requirement.requMaxAge}" name="requMaxAge">
    <input type="hidden" value="${requirement.requMinHeight}" name="requMinHeight">
    <input type="hidden" value="${requirement.requMaxHeight}" name="requMaxHeight">
    <input type="hidden" value="${requirement.requEducation}" name="requEducation">
    <input type="hidden" value="${requirement.requIncome}" name="requIncome">
    <input type="hidden" value="${requirement.requMarriage}" name="requMarriage">
    <input type="hidden" value="${requirement.requProvince}" name="requProvince">
    <input type="hidden" value="${requirement.requCity}" name="requCity">
    <input type="hidden" value="${custGender}" name="custGender">
</form>
    <div class="meet" id="interface">
        <div class="wrap" id="topNum">
            <div class="edit">
                <a href="${pageContext.request.contextPath}/condition" onclick="">去修改择偶意向&gt;</a>
            </div>
            <span class="meetNum">今天还可以邂逅<em id="todayUser">20</em>位有缘的Ta</span>
            <span class="likeNum">
                    <a href="${pageContext.request.contextPath}/followAndvisit/follviscount?type=firstD1" target="_blank" >已喜欢
                        <i id="haveLoved">0</i>
                    </a>
                </span>
        </div>
        <div id="mainDiv">
            <div class="wrap" style="position:relative; height:452px;">
                <div class="contBox" id="contBoxx" style="display: block; left: 0px;">
          <%--          <div class="meetBox" id="box0">
                        <div class="meetText">
                            <div class="name" encounterid="161434896" gender="0"><a href="" target="_blank">汐汐&nbsp;&nbsp;</a></div><br>
                            <div class="data">
                                <span class="t2">是否匹配我</span>
                                <span class="t1">Ta的资料</span>
                                <dl>
                                    <dt>年　　龄：</dt>
                                    <dd><img src="http://images6.baihe.com/icon/icon_12.gif" alt="匹配">19岁</dd>
                                    <dt>身　　高：</dt>
                                    <dd><img src="http://images6.baihe.com/icon/icon_12.gif" alt="匹配">165cm</dd>
                                    <dt>学　　历：</dt>
                                    <dd><img src="http://images6.baihe.com/icon/icon_12.gif" alt="匹配">大专</dd>
                                    <dt>月 收 入 ：</dt>
                                    <dd><img src="http://images6.baihe.com/icon/icon_12.gif" alt="匹配">2000-5000</dd>
                                    <dt>婚姻状况：</dt>
                                    <dd><img src="http://images6.baihe.com/icon/icon_12.gif" alt="匹配">未婚</dd>
                                    <dt>所在地区：</dt>
                                    <dd><img src="http://images6.baihe.com/icon/icon_13.gif" alt="不匹配">江苏苏州</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="profile">
                            <div class="meetPic">
                                <img src="http://photo1.baihe.com/2018/10/30/450_450/4B3B3370D4F9358962644AA29C5F96B7.jpg" alt="">
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
            <div class="wrap">
                <div class="btnLine" id="talkTa" >
                    <a href="javascript:;" class="b03">
                        <em></em>喜欢</a>
                    <a href="javascript:;" class="b01">
                        <em></em>不喜欢</a>
                    <a href="${pageContext.request.contextPath}/readMail?messFromId=${myFollow.custId}" id="talk" class="b02">
                        <em></em>和Ta聊</a>
                </div>
            </div>
        </div>
    </div>
<%@include file="footer.jsp"%>
<script>

    //获得根据择友条件查询到的用户
    function getCustByRequGender(url) {

        if (window.XMLHttpRequest){
            xhr = new XMLHttpRequest();
        }else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }

        xhr.open("GET",url,false);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
        xhr.onreadystatechange = loadCustomer;
        xhr.send();
    }
    function loadCustomer() {
        if (xhr.readyState == 4 && xhr.status == 200){
            var customer = JSON.parse(xhr.responseText);
            meetId=customer.custId;
            var contBoxx = document.querySelector("#contBoxx")

            contBoxx.innerHTML="";
            var age=new Date().getFullYear()-new Date(customer.custBirthday).getFullYear();
            var RequIncome=0;

            if(document.getElementsByName("requIncome")[0].value=="2000以下")
                RequIncome=2000;
            else if(document.getElementsByName("requIncome")[0].value=="50000以下")
                RequIncome=50000;
            else {
                RequIncome=document.getElementsByName("requIncome")[0].value.split("-")[0]+document.getElementsByName("requIncome")[0].value.split("-")[1]
            }
            var foundIncome=1;
            if(customer.custIncome=="2000以下")
                foundIncome=2000;
            else if(customer.custIncome=="50000以下")
                foundIncome=50000;
            else {
                foundIncome=customer.custIncome.split("-")[0]+customer.custIncome.split("-")[1]
            }
            var newDiv =
                "	<div class='meetBox' >" +
                "                        <div class='meetText'>" +
                "                            <div class='name'><a href='' target='_blank'>" + customer.custNickname + "&nbsp;&nbsp;</a></div><br>" +
                "                            <div class='data'>" +
                "                                <span class='t2'>是否匹配我</span>" +
                "                                <span class='t1'>Ta的资料</span>" +
                "                                <dl>" +
                "                                    <dt>年　　龄：</dt>" ;
            if(age<=document.getElementsByName("requMaxAge")[0].value&&age>=document.getElementsByName("requMinAge")[0].value
                ||document.getElementsByName("requMaxAge")[0].value==null||document.getElementsByName("requMinAge")[0].value==null)
                newDiv += "<dd><img src='http://images6.baihe.com/icon/icon_12.gif' alt='匹配'>"+age+"岁</dd>" ;
            else
                newDiv +="<dd><img src='http://images6.baihe.com/icon/icon_13.gif' alt='不匹配'>"+age+"岁</dd>" ;
            newDiv+=   "<dt>身　　高：</dt>" ;
            if(customer.custHeight<document.getElementsByName("requMaxHeight")[0].value&&customer.custHeight>document.getElementsByName("requMinHeight")[0].value)
                newDiv +="<dd><img src='http://images6.baihe.com/icon/icon_12.gif' alt='匹配'>"+customer.custHeight+"cm</dd>" ;
            else
                newDiv +="<dd><img src='http://images6.baihe.com/icon/icon_13.gif' alt='不匹配'>"+customer.custHeight+"cm</dd>" ;
            newDiv+=   "  <dt>学　　历：</dt>" ;
            if(document.getElementsByName("requEducation")[0].value==customer.custEducation||document.getElementsByName("requEducation")[0].value=="不限"||document.getElementsByName("requEducation")[0].value==null)
                newDiv +=" <dd><img src='http://images6.baihe.com/icon/icon_12.gif' alt='匹配'>"+customer.custEducation+"</dd>" ;
            else
                newDiv +=" <dd><img src='http://images6.baihe.com/icon/icon_13.gif' alt='不匹配'>"+customer.custEducation+"</dd>" ;
            newDiv += "   <dt>月 收 入 ：</dt>" ;
            if(foundIncome>=RequIncome)
                newDiv +=  "  <dd><img src='http://images6.baihe.com/icon/icon_12.gif' alt='匹配'>"+customer.custIncome+"</dd>" ;
            else
                newDiv += "  <dd><img src='http://images6.baihe.com/icon/icon_13.gif' alt='不匹配'>"+customer.custIncome+"</dd>" ;

            newDiv +=  "   <dt>婚姻状况：</dt>" ;
            if(customer.custMarriage==document.getElementsByName("requMarriage")[0].value||document.getElementsByName("requMarriage")[0].value=="不限"||document.getElementsByName("requMarriage")[0].value==null)
                newDiv +=  "   <dd><img src='http://images6.baihe.com/icon/icon_12.gif' alt='匹配'>"+customer.custMarriage+"</dd>" ;
            else
                newDiv +=  "   <dd><img src='http://images6.baihe.com/icon/icon_13.gif' alt='不匹配'>"+customer.custMarriage+"</dd>" ;
            newDiv +=    "   <dt>所在地区：</dt>" ;
            if(document.getElementsByName("requProvince")[0].value==customer.custProvince&&customer.custCity==document.getElementsByName("requCity")[0].value||(document.getElementsByName("requMarriage")[0].value==null&&document.getElementsByName("requMarriage")[0].value==null))
                newDiv +=    "   <dd><img src='http://images6.baihe.com/icon/icon_12.gif' alt='匹配'>"+customer.custProvince+""+customer.custCity+"</dd>" ;
            else
                newDiv +=    "   <dd><img src='http://images6.baihe.com/icon/icon_13.gif' alt='不匹配'>"+customer.custProvince+""+customer.custCity+"</dd>"  ;
            newDiv+=
                "                   </dl></div></div>" +
                "                   <div class='profile'>" +
                "                            <div class='meetPic'>" +
                "                                <img src='/Path/"+customer.custPhoto+"' alt=''>" +
                "                            </div>" +
                "                        </div>" +
                "                    </div>";
            contBoxx.innerHTML = newDiv;

        }
    }

    function get_user_info1() {
        var url="/customer/getCustomer";
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("GET", url, false);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.onreadystatechange = loadUserInfo1;
        xhr.send();
    }


    function loadUserInfo1() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var user = JSON.parse(xhr.responseText);
            document.getElementById("todayUser").innerText=user.custMeetCount;
            document.getElementById("haveLoved").innerText=user.custLikeNumber;
            custId=user.custId;
        }
    }
    function update(url) {
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("GET", url, false);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.send();
    }
</script>
</body>
</html>
