var xhr=null;
var url_getAllOfDayVisitCountRankingList = "/customer/getAllOfDayVisitCountRankingList";

window.onload=function () {
    getAllOfDayVisitCount(url_getAllOfDayVisitCountRankingList);
};

function getAllOfDayVisitCount(url_getAllOfDayVisitCountRankingList) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    var custgender = document.getElementById("cond_hot_form_sex_show").innerHTML;
    var custprovince = document.getElementById("cond_hot_form_work_location_show").innerHTML;
    var url = url_getAllOfDayVisitCountRankingList + '?custGender=' + custgender + '&custProvince=' + custprovince;
    xhr.open("GET",url,false)
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getAllCustomrMesgDay;
    xhr.send();
}
function getAllCustomrMesgDay() {
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