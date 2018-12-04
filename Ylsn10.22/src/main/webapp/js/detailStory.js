var xhr = null;
var happId = null;
var custId = null;
var url_getCommByPage = "/comments/getCommByPage";
var url_getCustomerByCustId = "/readMail/getCustomerByCustId";
var url_saveComments = "/comments/saveComments";
var localPath="http://localhost:8080/Path/";
window.onload=function () {
    happId=document.getElementsByName("happId")[0].value;
    custId=document.getElementsByName("custId")[0].value;
    getHappinessPhoto("/happiness/getHappinessPhoto?count=6")
    getCommByPage(url_getCommByPage);
    setInterval( getCommByPage(url_getCommByPage),3000)
};

function getCommByPage(url_getCommByPage) {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var url = url_getCommByPage + "?happId=" + happId;
    xhr.open("GET", url, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = comments;
    xhr.send();
}
function comments() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var page = JSON.parse(xhr.responseText);
        var commentList = page.modelList;
        var content = document.querySelector("#content");
        content.innerHTML = "";
        var date=null;
        var url1 = "http://localhost:8080/Path/";
        for (var i = 0;i<commentList.length;i++){
            var custPhoto = 0;
            var custNickname = null;
            var age = 0;
            var custProvince = null;
            var custCity = null;
            var custEducation = null;
            date = new Date(commentList[i].commTime).toLocaleString();
            getCustomerByCustId(commentList[i].custId);
            var newP =
                "	<p id='zf01' class='words'>"+
                "                    <a href='/customer/message?id="+commentList[i].custId+"'>"+
                "                        <img src='"+url1+""+custPhoto+"' alt=''>"+
                "                    </a>"+
                "                    <span>"+
                "                        <a href='/customer/message?id="+commentList[i].custId+"' class='a3'>"+
                "                    "+custNickname+"&nbsp;&nbsp;"+age+"岁&nbsp;&nbsp;"+custProvince+" "+custCity+"&nbsp;&nbsp;&nbsp;&nbsp;"+custEducation+"&nbsp;&nbsp;"+
                "                        </a>&nbsp;&nbsp;"+date+"<br>　　"+commentList[i].commContent+"  "+
                "                    </span>"+
                "                </p>";
            content.innerHTML+=newP;

            function getCustomerByCustId(id) {
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                }
                var url_getCustomer = url_getCustomerByCustId + "?messToId=" + id;
                xhr.open("GET", url_getCustomer, false);
                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                xhr.onreadystatechange = customerMsg;
                xhr.send();
            }
            function customerMsg() {
                var customer = JSON.parse(xhr.responseText);
                custPhoto = customer.custPhoto;
                custNickname = customer.custNickname;

                var strBirthday = customer.custBirthday;
                var strBirthdayArr=strBirthday.split("-");
                var birthYear = strBirthdayArr[0];
                var nowYear = (new Date()).getFullYear();
                age = nowYear-birthYear;

                custProvince = customer.custProvince;
                custCity = customer.custCity
                custEducation = customer.custEducation;
            }
        }
        //2.页码渲染
        var pagearea = document.getElementById("pageclass");
        pagearea.innerHTML = "";
        var url_getComment = "/comments/getCommByPage";
        //首页
        var url_fight_page = url_getComment + "/page/" + 1 + "/" + happId;
        var fight_page_href = 'javascript:getCommByPage("' + url_fight_page + '")';
        var fightPageEle = "<a  href='" + fight_page_href + "'> 首页</a>";
        pagearea.innerHTML += fightPageEle;
        //上一页
        if (page.currentPageCode != 1) {// 不是首页，则显示上一页
            var url_pre_page = url_getComment + "/page/" + (page.currentPageCode - 1) + "/" + happId;
            var href = 'javascript:getCommByPage("' + url_pre_page + '")';
            var prePageEle = "<a  href='" + href + "'> 上一页</a>";
            pagearea.innerHTML += prePageEle
        }
        //当前页码
        var currentPageEle = " <span>当前是第</span><span id='currentPageCode'>" + page.currentPageCode + "</span> <span>页</span>";;
        pagearea.innerHTML += currentPageEle;
        //下一页
        if (page.currentPageCode != page.totalPages) {
            var url_next_page = url_getComment + "/page/" + (page.currentPageCode + 1) + "/" + happId;
            var href = 'javascript:getCommByPage("' + url_next_page + '")';
            var nextPageEle = "<a  href='" + href + "'> 下一页</a>";
            pagearea.innerHTML += nextPageEle;
        }
        //其他页码
        var othersEle = "<span>共</span><span>" + page.totalPages + "</span><span>页</span>\n" +
            "<input type=\"text\" name=\"\" id=\"skipPageCode\">\n" +
            "<button onclick='skip()'>跳转</button>";
        pagearea.innerHTML += othersEle;
    }
}
//跳转
function skip() {
    var url_getComment = "/comment/getCommByPage";
    var skipPageCode = document.getElementById("skipPageCode").value;
    if (skipPageCode != null && skipPageCode != "") {
        var url_skip_page = url_getComment + "/page/" + document.getElementById("skipPageCode").value + "/" + happId;
        getCommByPage(url_skip_page);
    }
}


//增加评论
function saveComments() {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var commcontent = document.getElementById("comment_content").value;
    var custid = custId;
    var happid = happId;
    var comment = "commContent=" + commcontent + "&custId=" + custid + "&happId=" + happid;
    xhr.open("POST", url_saveComments, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    xhr.onreadystatechange = saveSuccess;
    xhr.send(comment);
}
function saveSuccess() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var result = JSON.parse(xhr.responseText);
        if (result != 0){
            getCommByPage(url_getCommByPage);
            document.getElementById("comment_content").value = "";
        }else {
            alert("发送失败")
        }
    }
}
//根据用户ID获得用户信息



//更多幸福的故事
function getHappinessPhoto(url) {

    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", url, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = loadHappinessPhoto;
    xhr.send();

}
function loadHappinessPhoto() {
    if (xhr.readyState == 4 && xhr.status == 200) {

        var happinessInfoList = JSON.parse(xhr.responseText);
        //1. 数据渲染
        var ulList = document.getElementById("happList");
        ulList.innerHTML = "";
        var pageData="";

        for (var i = 0; i < happinessInfoList.length; i++) {
            var urlImg=localPath+happinessInfoList[i].happinessInfo.happImages.split(",")[1];
            pageData +=
            '   <li><a href="/detailStory?happId='+happinessInfoList[i].happinessInfo.happId+'&happImage='+urlImg+'" target="_blank">'+
            '    <img src="'+urlImg+'">'+
            '   <span>'+happinessInfoList[i].happinessInfo.happTitle+'</span>'+
            '   </a></li>'
        }

        ulList.innerHTML=pageData;
    }
}