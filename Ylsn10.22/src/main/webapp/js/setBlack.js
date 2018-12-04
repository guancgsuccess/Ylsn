var xhr = null;
var url_getBlackCustMsg = "/blacklist/getBlackCustMsg";
var url_deleteBlacklist = "/blacklist/deleteBlacklist";
var custId=1;

window.onload=function () {
    getBlackCustMsg(url_getBlackCustMsg);
};

function getBlackCustMsg(url_getBlackCustMsg) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    var url = url_getBlackCustMsg + "?custId=" + custId;
    xhr.open("GET",url,true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getCustomer;
    xhr.send();
}
function getCustomer() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var page = JSON.parse(xhr.responseText);
        //初始化活动到容器中
        //1.数据渲染
        var customer = page.modelList;
        var list = document.querySelector('#list');
        var urlImg = "http://localhost:8080/Path/";
        list.innerHTML="";
        for (var i=0;i<customer.length;i++){
            var strBirthday = customer[i].custBirthday;
            var strBirthdayArr=strBirthday.split("-");
            var birthYear = strBirthdayArr[0];
            var nowYear = (new Date()).getFullYear();
            var age = nowYear-birthYear;
            var newDl =
                "	<dl>"+
                "                    <dt>"+
                "                        <a href='' target='_blank'>"+
                "                            <img src='"+urlImg+""+customer[i].custPhoto+"' alt=''>"+
                "                        </a>"+
                "                    </dt>"+
                "                    <dd>"+
                "                        <div class='txt'>"+
                "                            <a href='http://profile1.baihe.com?oppID=130044045' target='_blank' class='link'>"+customer[i].custNickname+" </a>"+
                "                            <span>"+age+"岁&nbsp;"+customer[i].custHeight+"cm&nbsp;"+customer[i].custEducation+"</span>"+
                "                            <p>"+customer[i].custIntroduce+"</p>"+
                "                        </div>"+
                "                        <a href='javascript:void(0);' onclick='deleteBlacklist("+custId+","+customer[i].custId+")' class='orange'>恢复沟通</a>"+
                "                    </dd>"+
                "               </dl>";
                list.innerHTML += newDl;
        }
        //2.页码渲染
        var pagearea = document.getElementById("pageInfo");
        pagearea.innerHTML="";
        var url_getBlacklist = "/blacklist/getBlackCustMsg";
        //前
        if (page.currentPageCode !=1 ) {
            var url_pre_page = url_getBlacklist + "/page/" + (page.currentPageCode - 1) + "/" + custId;
            var pre_page_href = 'javascript:getBlackCustMsg("' + url_pre_page + '")';
            var prePageEle = "<a href='" + pre_page_href + "' class='prevOver'>前</a>";
            pagearea.innerHTML += prePageEle;
        }
        //当前页/总页数
        var currentPageEle = "<div class='num'><span id='currentPageCode'>"+page.currentPageCode+"</span>/"+page.totalPages+"</div>";
        pagearea.innerHTML +=currentPageEle;
        //后
        if (page.currentPageCode != page.totalPages){
            var url_next_page = url_getBlacklist + "/page/" +(page.currentPageCode+1) + "/" + custId;
            var next_page_href = 'javascript:getBlackCustMsg("'+url_next_page+'")';
            var nextPageEle = "<a href='"+next_page_href+"' class='nextOver'>后</a>";
            pagearea.innerHTML += nextPageEle;
        }
    }
}

function deleteBlacklist(custId,custBlackId) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    var url_delete = url_deleteBlacklist + "?custId=" + custId + "&custBlackId=" + custBlackId;
    xhr.open("DELETE",url_delete,true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange =deleteReminding;
    xhr.send();
}
function deleteReminding() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var pageCode = url_getBlackCustMsg + "/page/" + document.getElementById("currentPageCode").innerText + "/" + custId;
        if (xhr.responseText == 1){
            getBlackCustMsg(pageCode);
        } else {
            alert("删除失败");
        }
    }
}