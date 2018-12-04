var xhr = null;
var url_path = "http://localhost:8080/Path/";
var url_getCustByByCustId ="/readMail/getCustomerByCustId";
var url_getAllMessage = "/readMail/getAllMessage";
var url_replyMessage = "/readMail/replyMessage";
var url_loginTime = "/readMail/loginTime";
var img1 = null;
var img2 = null;
var messFromId = 3;
var messToId=1;
window.onload=function () {
    messToId=document.getElementsByName("messToId")[0].value;
    messFromId=document.getElementsByName("messFromId")[0].value;
    getLoginTime(url_loginTime)
    getCustMsgBy(url_getCustByByCustId);
    getImg(url_getCustByByCustId);
    getAllMessage(url_getAllMessage);
};
/*******************获得对方的个人信息*************************/
function getCustMsgBy(url_getCustByByCustId) {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var url_getCust = url_getCustByByCustId+"?messFromId=" + messFromId;;
    xhr.open("GET", url_getCust, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = custMsg;
    xhr.send();
}
function custMsg() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var result = JSON.parse(xhr.responseText);
        var strBirthday = result.custBirthday;
        var strBirthdayArr=strBirthday.split("-");
        var birthYear = strBirthdayArr[0];
        var nowYear = (new Date()).getFullYear();
        var age = nowYear-birthYear;
        document.getElementById("age").innerText = age;
        document.getElementById("marriage").innerText = result.custMarriage;
        document.getElementById("height").innerText = result.custHeight;
        document.getElementById("province").innerText = result.custProvince;
        document.getElementById("education").innerText = result.custEducation;
        document.getElementById("profession").innerText = result.custProFession;
        document.getElementById("income").innerText = result.custIncome;
        document.getElementById("name").innerText = result.custNickname;
        document.getElementsByClassName("images")[0].src="http://localhost:8080/Path/"+result.custPhoto;
        /*document.getElementsByClassName("images")[1].src="http://localhost:8080/Path/"+result.custPhoto;*/
        document.getElementById("introduce").innerText = result.custIntroduce;
        img1 = url_path + result.custPhoto;
    }
}
/****************获得本人照片**********************/
function getImg(url_getCustByByCustId1) {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var url2 = url_getCustByByCustId1 ;
    xhr.open("GET", url2, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = myImage;
    xhr.send();
}
function myImage() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var result = JSON.parse(xhr.responseText);
        img2 = url_path + result.custPhoto;
    }
}
/****************获得双方的聊天记录*******************/
window.setInterval(getAllMessage(url_getAllMessage),3000);
function getAllMessage(url_getAllMessage) {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var url_getMessage = url_getAllMessage + "?messFromId=" + messFromId ;
    xhr.open("GET", url_getMessage, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = allMessage;
    xhr.send();
}
function allMessage() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var messageArr = JSON.parse(xhr.responseText);
        var msgList = document.querySelector('#msg_list');
        var date = null;
        msgList.innerHTML = "";
        for (var i=0;i<messageArr.length;i++){
            date = new Date(messageArr[i].messTime).toLocaleDateString();
            newDiv ="";
            if (messageArr[i].messFromId==messFromId ){
                var newDiv=
                    "	<div class='item left clearfix'>"+
                    "                        <div class='lt-face'>"+
                    "                            <a href=''><img src='"+img1+"' class='images' alt=''></a>"+
                    "                        </div>"+
                    "                        <div class='lt-detail'>"+
                    "                            <div class='lt-time'>"+date+"</div>"+
                    "                            <div class='lt-txt-mod clearfix'>"+
                    "                                <div class='lt-txt'>"+
                    "                                    <span class='tarr' type='sx'></span>"+
                    "                                    <p>"+messageArr[i].messContent+"</p>"+
                    "                                    <a href='' class='close'></a>"+
                    "                                </div>"+
                    "                            </div>"+
                    "                        </div>"+
                    "                    </div>";}
                if (messageArr[i].messFromId==messToId)
                    newDiv+=
                        "	<div class='item right clearfix'>"+
                        "                        <div class='lt-face'>"+
                        "                            <a href=''><img src='"+img2+"' class='images' alt=''></a>"+
                        "                        </div>"+
                        "                        <div class='lt-detail'>"+
                        "                            <div class='lt-time'>"+date+"</div>"+
                        "                            <div class='lt-txt-mod clearfix'>"+
                        "                                <div class='lt-txt'>"+
                        "                                    <span class='tarr' type='sx'></span>"+
                        "                                    <p>"+messageArr[i].messContent+"</p>"+
                        "                                    <a href='' class='close'></a>"+
                        "                                </div>"+
                        "                            </div>"+
                        "                        </div>"+
                        "                    </div>";
                msgList.innerHTML+=newDiv;
        }
    }
}

//回复消息
function replyMessage() {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }

    var messcontent = document.getElementById("txt").value;
    var messfromId = messFromId;
    var messtoId = messToId;

    var Message = "messContent=" + messcontent + "&messToId=" + messfromId + "&messFromId=" + messtoId;
    xhr.open("POST", url_replyMessage, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    xhr.onreadystatechange = message;
    xhr.send(Message);
}
function message() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var result = JSON.parse(xhr.responseText);
        if (result != 0){
            getAllMessage(url_getAllMessage);
        }else{
            alert("发送失败")
        }
    }
}

//获得对方的最近登录时间
function getLoginTime(url_loginTime) {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var url = url_loginTime ;
    xhr.open("GET", url, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = loginTime;
    xhr.send();
}
function loginTime() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var date = new Date(JSON.parse(xhr.responseText));
        var _hour = date.getHours();
        var _minute = date.getMinutes();

        var _second = date.getSeconds();

        var _year = date.getFullYear()

        var _month = date.getMonth();

        var _date = date.getDate();

        if(_hour<10){_hour="0"+_hour;}

        if(_minute<10){_minute="0"+_minute;}

        if(_second<10){_second="0"+_second;}

        _month = _month + 1;

        if(_month < 10){_month = "0" + _month;}

        if(_date<10){_date="0"+_date;}

        var newDate= _year + "-" + _month + "-" + _date + " " + _hour + ":" + _minute + ":" + _second ;

        document.getElementById("time").innerText = newDate;
    }
}
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