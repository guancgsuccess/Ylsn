
var urlCustomer="/customer/getCustomerList";
var custGender1=null;
$(document).ready(function(){

    var age=new Date().getFullYear()-new Date(document.getElementsByName("custBirthday")[0].value).getFullYear();
    document.getElementsByClassName("member_name")[0].innerText=age+document.getElementsByClassName("member_name")[0].innerText;
    custGender1=document.getElementsByName("gender")[0].value;
    document.getElementById("login").getElementsByTagName("span")[0].innerText=document.getElementsByName("nickname")[0].value;
    var url=urlCustomer+"?custGender="+encodeURI(custGender1);
    refreshUserList1(url);

});
function add_follow(id) {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", "/followAndvisit/addFollow?custIdUnactive="+id, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.send();
}
function refreshUserList1(url) {

    if (window.XMLHttpRequest) {
        xhr =new  XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", url, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = loadUsers1;
    xhr.send();

}
var localPath1="http://localhost:8080/Path/";
function loadUsers1() {
    if (xhr.readyState == 4 && xhr.status == 200) {

        var userlist = JSON.parse(xhr.responseText);
        //1. 数据渲染
        var ulList = document.getElementById("interested").getElementsByTagName("ul")[0];
        ulList.innerHTML = "";
        for (var i = 0; i < userlist.length; i++) {
            var urlImg=localPath1+userlist[i].custPhoto;
            var age=new Date().getFullYear()-new Date(userlist[i].custBirthday).getFullYear();
            ulList.innerHTML +=
            '     <li class="clearfix">'+
            '    <div class="fl pic_7490 pr">'+
             '   <a href="javascript:skipToMessage1('+userlist[i].custId+');" target="_blank">'+
                '   <img src="'+urlImg+' " width="74" height="90" onmousedown="" >'+
            '  </a> </div> '+
            ' <div class="member_info"><h6>'+
            '   <a class="a_gray_333" href="javascript:skipToMessage1('+userlist[i].custId+')" onmousedown="" target="_blank">'+ userlist[i].custNickname+'&nbsp; '+age+'岁，&nbsp;'+userlist[0].custProvince+
            '</a> </h6>'+
           ' <p>她刚注册，正摩拳擦掌找对象</p>'+
           ' </div> </li>'
        }
    }
}
function skipToMessage1(id) {
    window.open("/customer/message"+"?id="+id);
}

function search_change1() {

    refreshUserList1(urlCustomer+"?custGender="+encodeURI(custGender1));
}


function seeLoginTime() {
    var onlyChoseAlert = simpleAlert({
        "title":"缘来是你",
        "content":getTaskTime(document.getElementsByName("loginTime")[0].value),
})
}

function getTaskTime(strDate) {
    if(null==strDate || ""==strDate){
        return "";
    }
    var dateStr=strDate.trim().split(" ");
    var strGMT = dateStr[0]+" "+dateStr[1]+" "+dateStr[2]+" "+dateStr[5]+" "+dateStr[3]+" GMT+0800";
    var date = new Date(Date.parse(strGMT));
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    var minute = date.getMinutes();
    minute = minute < 10 ? ('0' + minute) : minute;
    var second = date.getSeconds();
    second = second < 10 ? ('0' + second) : second;

    return y+"年"+m+"月"+d+"日 "+h+":"+minute+":"+second;
};

