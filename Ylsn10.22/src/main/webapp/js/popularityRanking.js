var xhr = null;
var url_getDayVisitCount = "/customer/getDayVisitCountRankingList";
var url_getWeekVisitCount = "/customer/getWeekVisitCountRankingList";
var url_getMonthVisitCount = "/customer/getMonthVisitCountRankingList";
var url_getTotalVisitCount = "/customer/getTotalVisitCountRankingList";
window.onload=function () {
    getDayVisitCount(url_getDayVisitCount);
    getWeekVisitCount(url_getWeekVisitCount);
    getMonthVisitCount(url_getMonthVisitCount);
    getTotalVisitCount(url_getTotalVisitCount);
};
//日榜
function getDayVisitCount(url_getDayVisitCount) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    var custgender = document.getElementById("cond_hot_form_sex_show").innerHTML;
    var custprovince = document.getElementById("cond_hot_form_work_location_show").innerHTML;
    var url = url_getDayVisitCount + '?custGender=' + custgender + '&custProvince=' + custprovince;
    xhr.open("GET",url,false)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getCustomrMesgDay;
    xhr.send();
}
function getCustomrMesgDay() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var custometArr= JSON.parse(xhr.responseText);
        var userList = document.querySelector("#day_user_list")
        var url = "http://localhost:8080/Path/";
        userList.innerHTML = "";
        for (var i=0;i<custometArr.length; i++){
            var strBirthday = custometArr[i].custBirthday;
            var strBirthdayArr=strBirthday.split("-");
            var birthYear = strBirthdayArr[0];
            var nowYear = (new Date()).getFullYear();
            var age = nowYear-birthYear;
            var newLi=
                "                   <li class='' style='z-index: 2;'>"+
                "                        <div class='num num_1'></div>"+
                "                        <div class='hy_num' >"+
                "                            <div style='width:110px;height:135px;background:#f7f7f7;'>"+
                "                                <a href=''>"+
                "                                    <img src='"+url+""+custometArr[i].custPhoto+"'>"+
                "                                </a>"+
                "                            </div>"+
                "                            <div class='user_name'>"+
                "                                <i class='tel' title='手机认证'></i>"+
                "                                <a href=''>"+custometArr[i].custNickname+"</a>"+
                "                            </div>"+
                "                            <p class='user_info'>"+age+","+custometArr[i].custProvince+"<br>"+custometArr[i].custHeight+"cm<br>人气值:"+custometArr[i].custDayVisitCount+"</p>"+
                "                            <p class='detail'><a href='' target='_blank'>查看资料</a></p>"+
                "                            <div class='zh_btn'>"+
                "                                <a class='dzh' href=''>打招呼</a>"+
                "                            </div>"+
                "                        </div>"+
                "                    </li>";
            userList.innerHTML+=newLi;
        }
    }
}

//周榜
function getWeekVisitCount(url_getWeekVisitCount) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    var custgender = document.getElementById("cond_hot_form_sex_show").innerHTML;
    var custprovince = document.getElementById("cond_hot_form_work_location_show").innerHTML;
    var url1 = url_getWeekVisitCount + '?custGender=' + custgender + '&custProvince=' + custprovince;
    xhr.open("GET",url1,false)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getCustomrMesgWeek;
    xhr.send();
}
function getCustomrMesgWeek() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var custometArr= JSON.parse(xhr.responseText);
        var userList = document.querySelector("#week_user_list")
        var url = "http://localhost:8080/Path/";
        userList.innerHTML = "";
        for (var i=0;i<custometArr.length; i++){
            var strBirthday = custometArr[i].custBirthday;
            var strBirthdayArr=strBirthday.split("-");
            var birthYear = strBirthdayArr[0];
            var nowYear = (new Date()).getFullYear();
            var age = nowYear-birthYear;
            var newLi=
                "                   <li class='' style='z-index: 3;'>"+
                "                        <div class='num num_1'></div>"+
                "                        <div class='hy_num' >"+
                "                            <div style='width:110px;height:135px;background:#f7f7f7;'>"+
                "                                <a href=''>"+
                "                                    <img src='"+url+""+custometArr[i].custPhoto+"'>"+
                "                                </a>"+
                "                            </div>"+
                "                            <div class='user_name'>"+
                "                                <i class='tel' title='手机认证'></i>"+
                "                                <a href=''>"+custometArr[i].custNickname+"</a>"+
                "                            </div>"+
                "                            <p class='user_info'>"+age+","+custometArr[i].custProvince+"<br>"+custometArr[i].custHeight+"cm<br>人气值:"+custometArr[i].custWeekVisitCount+"</p>"+
                "                            <p class='detail'><a href='' target='_blank'>查看资料</a></p>"+
                "                            <div class='zh_btn'>"+
                "                                <a class='dzh' href=''>打招呼</a>"+
                "                            </div>"+
                "                        </div>"+
                "                    </li>";
            userList.innerHTML+=newLi;
        }
    }
}
//月榜
function getMonthVisitCount(url_getMonthVisitCount) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    var custgender = document.getElementById("cond_hot_form_sex_show").innerHTML;
    var custprovince = document.getElementById("cond_hot_form_work_location_show").innerHTML;
    var url1 = url_getMonthVisitCount + '?custGender=' + custgender + '&custProvince=' + custprovince;
    xhr.open("GET",url1,false)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getCustomrMesgMonth;
    xhr.send();
}
function getCustomrMesgMonth() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var custometArr= JSON.parse(xhr.responseText);
        var userList = document.querySelector("#month_user_list")
        var url = "http://localhost:8080/Path/";
        userList.innerHTML = "";
        for (var i=0;i<custometArr.length; i++){
            var strBirthday = custometArr[i].custBirthday;
            var strBirthdayArr=strBirthday.split("-");
            var birthYear = strBirthdayArr[0];
            var nowYear = (new Date()).getFullYear();
            var age = nowYear-birthYear;
            var newLi=
                "                   <li class='' style='z-index: 3;'>"+
                "                        <div class='num num_1'></div>"+
                "                        <div class='hy_num' >"+
                "                            <div style='width:110px;height:135px;background:#f7f7f7;'>"+
                "                                <a href=''>"+
                "                                    <img src='"+url+""+custometArr[i].custPhoto+"'>"+
                "                                </a>"+
                "                            </div>"+
                "                            <div class='user_name'>"+
                "                                <i class='tel' title='手机认证'></i>"+
                "                                <a href=''>"+custometArr[i].custNickname+"</a>"+
                "                            </div>"+
                "                            <p class='user_info'>"+age+","+custometArr[i].custProvince+"<br>"+custometArr[i].custHeight+"cm<br>人气值:"+custometArr[i].custMonthVisitCount+"</p>"+
                "                            <p class='detail'><a href='' target='_blank'>查看资料</a></p>"+
                "                            <div class='zh_btn'>"+
                "                                <a class='dzh' href=''>打招呼</a>"+
                "                            </div>"+
                "                        </div>"+
                "                    </li>";
            userList.innerHTML+=newLi;
        }
    }
}

//总榜
function getTotalVisitCount(url_getTotalVisitCount) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    var custgender = document.getElementById("cond_hot_form_sex_show").innerHTML;
    var custprovince = document.getElementById("cond_hot_form_work_location_show").innerHTML;
    var url1 = url_getTotalVisitCount + '?custGender=' + custgender + '&custProvince=' + custprovince;
    xhr.open("GET",url1,false)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getCustomrMesgTotal;
    xhr.send();
}
function getCustomrMesgTotal() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var custometArr= JSON.parse(xhr.responseText);
        var userList = document.querySelector("#total_user_list")
        var url = "http://localhost:8080/Path/";
        userList.innerHTML = "";
        for (var i=0;i<custometArr.length; i++){
            var strBirthday = custometArr[i].custBirthday;
            var strBirthdayArr=strBirthday.split("-");
            var birthYear = strBirthdayArr[0];
            var nowYear = (new Date()).getFullYear();
            var age = nowYear-birthYear;
            var newLi=
                "                   <li class='' style='z-index: 3;'>"+
                "                        <div class='num num_1'></div>"+
                "                        <div class='hy_num' >"+
                "                            <div style='width:110px;height:135px;background:#f7f7f7;'>"+
                "                                <a href=''>"+
                "                                    <img src='"+url+""+custometArr[i].custPhoto+"'>"+
                "                                </a>"+
                "                            </div>"+
                "                            <div class='user_name'>"+
                "                                <i class='tel' title='手机认证'></i>"+
                "                                <a href=''>"+custometArr[i].custNickname+"</a>"+
                "                            </div>"+
                "                            <p class='user_info'>"+age+","+custometArr[i].custProvince+"<br>"+custometArr[i].custHeight+"cm<br>人气值:"+custometArr[i].custTotalVisitCount+"</p>"+
                "                            <p class='detail'><a href='' target='_blank'>查看资料</a></p>"+
                "                            <div class='zh_btn'>"+
                "                                <a class='dzh' href=''>打招呼</a>"+
                "                            </div>"+
                "                        </div>"+
                "                    </li>";
            userList.innerHTML+=newLi;
        }
    }
}
