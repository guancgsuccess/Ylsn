var xhr = null;
var currCity=null;
var url_getAll = "/activity/All";
var url_getActivityByCity = "/activity/allActivityByCity";
var url_getNo4People = "/activity/no4People";
var url_getState = "/activity/state";
var url_getPhoto = "/activity/photo";
var url_getStateCount = "/activity/stateCount";
var url_getStateCountByCity = "/activity/stateCountByCity";
/*************************根据定位得到的省份查询****************************/
window.onload=function() {
    var province = document.getElementById("city").innerText;
    var url3 = url_getActivityByCity + "?actiCity=" + province;
    var url4=url_getStateCountByCity +"?actiCity="+province;
    getStateCountByCity(url4);
    city1(url3);
};
/***********************全国****************************/
//页面加载后,首先加载所有的活动数据
function all(url_getAll) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    getStateCount();
    xhr.open("GET",url_getAll,true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getActivity;
    xhr.send();
}

function getActivity() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var page = JSON.parse(xhr.responseText);
        //初始化活动到容器中
        //1.数据渲染
        var activity = page.modelList;
        var hdList = document.querySelector('#hdList');
        var date = null;
        var url = "http://localhost:8080/Path/";
        hdList.innerHTML = "";
        for (var i = 0; i < activity.length; i++) {
            var number = 0;
            var state = null;
            var userList = null;
            date = new Date(activity[i].actiDate).toLocaleDateString();
            getNo4People(activity[i].actiId);
            getState(activity[i].actiId);
            getPhoto(activity[i].actiId);
            var newDiv =
                "               <div class='hd_item clearfix'>" +
                "                <div class='hdlimg'>" +
                "                   <i>" +
                "                        <img src='../img/party/ggico.png' />" +
                "                    </i>" +
                "                    <a href='/activity/detail?actiId="+activity[i].actiId+"' target='_blank' title=''>" +
                "                        <img src='"+url+"" + activity[i].actiImages + "' width='260' height='190' alt='' />" +
                "                    </a>" ;
            if(state=="进行中")
                newDiv+= "<span class=' fixPNG'>" + state + "</span>";
            else
                newDiv+="<span class='ended fixPNG'>" + state + "</span>";
            newDiv+=
                "                </div>" +
                "                <div class='hdlinfo'>" +
                "                    <h5>&nbsp;" + activity[i].actiCity + "&nbsp;公益免费</h5>" +
                "                    <h4><a href='/activity/detail?actiId="+activity[i].actiId+"' target='_blank' title=''>" + activity[i].actiTitle + "</a></h4>" +
                "                    <ul>" +
                "                        <li class='fixPNG' style='background-position:0 0;'>" + date + " &nbsp; " + activity[i].actiTime + "</li>" +
                "                        <li class='fixPNG' style='background-position:2px -19px;'>" + activity[i].actiPlace + "</li>" +
                "                        <li class='fixPNG' style='background-position:0 -38px;'>" +
                "                            男：<span class='b_color'>" + activity[i].actiCount + "</span>人 | 女：<span class='g_color'>" + activity[i].actiCount + "</span>人" +
                "                        </li>" +
                "                    </ul>" +
                "                    <div class='pel'>";
            if (userList!=null&&userList[0] != null)
                newDiv +=
                    "                        <a href='/customer/message?id="+userList[0].custId+"' target='_blank'>" +
                    "                            <dl class='tximg02'>" +
                    "                                <dt class='tx_mask02'></dt>" +
                    "                                <dd class='tx_cont'>" +
                    "                                    <img src='" + url+userList[0].custPhoto + " ' width='36' height='36' alt='' />" +
                    "                                </dd>" +
                    "                            </dl>" +
                    "                        </a>";
            if (userList!=null&&userList[1] != null)
                newDiv +=
                    "                        <a href='/customer/message?id="+userList[1].custId+"' target='_blank'>" +
                    "                            <dl class='tximg02'>" +
                    "                                <dt class='tx_mask02'></dt>" +
                    "                                <dd class='tx_cont'>" +
                    "                                    <img src='" + url+userList[1].custPhoto + "' width='36' height='36' alt='' />" +
                    "                                </dd>" +
                    "                            </dl>" +
                    "                        </a>";
            if (userList!=null&&userList[2] != null)
                newDiv +=
                    "                        <a href='/customer/message?id="+userList[2].custId+"' target='_blank'>" +
                    "                            <dl class='tximg02'>" +
                    "                                <dt class='tx_mask02'></dt>" +
                    "                                <dd class='tx_cont'>" +
                    "                                    <img src='" + url+userList[2].custPhoto  + "' width='36' height='36' alt='' />" +
                    "                                </dd>" +
                    "                            </dl>" +
                    "                        </a>";
            if (userList!=null&&userList[3] != null)
                newDiv +=
                    "                        <a href='/customer/message?id="+userList[3].custId+"' target='_blank'>" +
                    "                            <dl class='tximg02'>" +
                    "                                <dt class='tx_mask02'></dt>" +
                    "                                <dd class='tx_cont'>" +
                    "                                    <img src='" + url+userList[3].custPhoto  + "' width='36' height='36' alt='' />" +
                    "                                </dd>" +
                    "                            </dl>" +
                    "                        </a>";
            newDiv +=
                "                        <p>已报名<a href='/activity/signuplist?actiId="+activity[i].actiId+"'><span id='peopleCount'>" + number + "</span></a>人</p>" +
                "                    </div>" +
                "                </div>" +
                "                <div class='ljbm'><a class='fixPNG' href='/activity/detail?actiId="+activity[i].actiId+"' title=''></a></div>" +
                "            </div>";

            hdList.innerHTML += newDiv;

            //查询参加活动的总人数
            function getNo4People(id) {
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject('Microsoft.XMLHTTP')
                }
                xhr.open("GET", (url_getNo4People + "?actiId=" + id), false);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                xhr.onreadystatechange = getCount;
                xhr.send();
            }

            function getCount() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var count = JSON.parse(xhr.responseText);
                    //document.getElementById("peopleCount").innerText=count;
                    number = count;
                }
            }

            //显示活动状态
            function getState(id) {
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject('Microsoft.XMLHTTP')
                }
                xhr.open("GET", (url_getState + "?actiId=" + id), false);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                xhr.onreadystatechange = stateMsg;
                xhr.send();
            }

            function stateMsg() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText == 1) {
                        state = "进行中";

                    } else {
                        state = "已结束";
                    }
                }
            }

            //根据活动获得人物头像
            function getPhoto(id) {
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject('Microsoft.XMLHTTP')
                }
                xhr.open("GET", (url_getPhoto + "?actiId=" + id), false);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                xhr.onreadystatechange = photoList;
                xhr.send();
            }

            function photoList() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    userList= JSON.parse(xhr.responseText);
                    /*if (customerList.length >= 4) {
                        for (var j = 0; j < 4; j++) {
                            urlImg[j] = url + photo[j];
                        }
                    } else {
                        for (var j = 0; j < photo.length; j++) {
                            urlImg[j] = url + photo[j];
                        }
                    }*/
                }
            }
        }
        //2.页码渲染
        var pagearea = document.getElementById("pagearea");
        pagearea.innerHTML = "";
        var url_getActivity = "/activity/All";
        //首页
        var url_fight_page = url_getActivity + "/page/" + 1;
        var fight_page_href = 'javascript:all("' + url_fight_page + '")';
        var fightPageEle = "<a  href='" + fight_page_href + "'> 首页</a>";
        pagearea.innerHTML += fightPageEle;
        //上一页
        if (page.currentPageCode != 1) {// 不是首页，则显示上一页
            var url_pre_page = url_getActivity + "/page/" + (page.currentPageCode - 1);
            var href = 'javascript:all("' + url_pre_page + '")';
            var prePageEle = "<a  href='" + href + "'> 上一页</a>";
            pagearea.innerHTML += prePageEle
        }
        //当前页码
        var currentPageEle = " <span>当前是第</span><span id='currentPageCode'>" + page.currentPageCode + "</span> <span>页</span>";;
        pagearea.innerHTML += currentPageEle;
        //下一页
        if (page.currentPageCode != page.totalPages) {
            var url_next_page = url_getActivity + "/page/" + (page.currentPageCode + 1);
            var href = 'javascript:all("' + url_next_page + '")';
            var nextPageEle = "<a  href='" + href + "'> 下一页</a>";
            pagearea.innerHTML += nextPageEle;
        }
        //其他页码
        var othersEle = "<span>共</span><span>" + page.totalPages + "</span><span>页</span>\n" +
            "<input type=\"text\" name=\"\" id=\"skipPageCode\">\n" +
            "<button onclick='skip("+page.totalPages+")'>跳转</button>";
        pagearea.innerHTML += othersEle;
    }
}
//跳转
    function skip(totalPages) {
        var url_getActivity = "/activity/All";
        var skipPageCode = document.getElementById("skipPageCode").value;
        if (skipPageCode != null && skipPageCode != ""&&skipPageCode<=totalPages) {
            var url_skip_page = url_getActivity + "/page/" + document.getElementById("skipPageCode").value;
            all(url_skip_page);
        }
    }

/*****************省份**************************/
//页面加载后,首先加载所有的活动数据

function city(target) {
     currCity = target.innerText;
     var url1=url_getActivityByCity+"?actiCity="+currCity;
     var url2=url_getStateCountByCity +"?actiCity="+currCity;
     getStateCountByCity(url2);
     city1(url1);
 }
function city1(url) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    xhr.open("GET",url,true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getActivityByCity;
    xhr.send();
}
 function getActivityByCity() {
     if (xhr.readyState == 4 && xhr.status == 200) {
         var page1 = JSON.parse(xhr.responseText);
         //初始化活动到容器中
         //1.数据渲染
         var activity1 = page1.modelList;
         var hdList1 = document.querySelector('#hdList');
         var date1 = null;
         var url1 = "http://localhost:8080/Path/";
         hdList1.innerHTML = "";
         for (var i = 0; i < activity1.length; i++) {
             var number1 = 0;
             var state1 = null;
             var userList = [];
             date1 = new Date(activity1[i].actiDate).toLocaleDateString();
             getNo4People(activity1[i].actiId);
             getState(activity1[i].actiId);
             getPhoto(activity1[i].actiId);
             var newDiv1 =
                 "               <div class='hd_item clearfix'>" +
                 "                <div class='hdlimg'>" +
                 "                   <i>" +
                 "                        <img src='../img/party/ggico.png' />" +
                 "                    </i>" +
                 "                    <a href='/activity/detail?actiId="+activity1[i].actiId+"' target='_blank' title=''>" +
                 "                        <img src='"+url1+"" + activity1[i].actiImages + "' width='260' height='190' alt='' />" +
                 "                    </a>";
                 if(state1=="进行中")
                     newDiv1+= "<span class=' fixPNG'>" + state1 + "</span>";
                else
                    newDiv1+="<span class='ended fixPNG'>" + state1 + "</span>";
                 newDiv1+=
                 "                </div>" +
                 "                <div class='hdlinfo'>" +
                 "                    <h5>&nbsp;" + activity1[i].actiCity + "&nbsp;公益免费</h5>" +
                 "                    <h4><a href='/activity/detail?actiId="+activity1[i].actiId+"' target='_blank' title=''>" + activity1[i].actiTitle + "</a></h4>" +
                 "                    <ul>" +
                 "                        <li class='fixPNG' style='background-position:0 0;'>" + date1 + " &nbsp; " + activity1[i].actiTime + "</li>" +
                 "                        <li class='fixPNG' style='background-position:2px -19px;'>" + activity1[i].actiPlace + "</li>" +
                 "                        <li class='fixPNG' style='background-position:0 -38px;'>" +
                 "                            男：<span class='b_color'>" + activity1[i].actiCount + "</span>人 | 女：<span class='g_color'>" + activity1[i].actiCount + "</span>人" +
                 "                        </li>" +
                 "                    </ul>" +
                 "                    <div class='pel'>";
             if (userList!=null&&userList[0] != null)
                 newDiv1 +=
                     "                        <a href='/customer/message?id="+userList[0].custId+"' target='_blank'>" +
                     "                            <dl class='tximg02'>" +
                     "                                <dt class='tx_mask02'></dt>" +
                     "                                <dd class='tx_cont'>" +
                     "                                    <img src='" + url1+userList[0].custPhoto + " ' width='36' height='36' alt='' />" +
                     "                                </dd>" +
                     "                            </dl>" +
                     "                        </a>";

             if (userList!=null&&userList[1] != null)
                 newDiv1 +=
                     "                        <a href='/customer/message?id="+userList[1].custId+"' target='_blank'>" +
                     "                            <dl class='tximg02'>" +
                     "                                <dt class='tx_mask02'></dt>" +
                     "                                <dd class='tx_cont'>" +
                     "                                    <img src='" + url1+userList[1].custPhoto + "' width='36' height='36' alt='' />" +
                     "                                </dd>" +
                     "                            </dl>" +
                     "                        </a>";
             if (userList!=null&&userList[2] != null)
                 newDiv1 +=
                     "                        <a href='/customer/message?id="+userList[2].custId+"' target='_blank'>" +
                     "                            <dl class='tximg02'>" +
                     "                                <dt class='tx_mask02'></dt>" +
                     "                                <dd class='tx_cont'>" +
                     "                                    <img src='" + url1+userList[2].custPhoto  + "' width='36' height='36' alt='' />" +
                     "                                </dd>" +
                     "                            </dl>" +
                     "                        </a>";
             if (userList!=null&&userList[3] != null)
                 newDiv1 +=
                     "                        <a href='/customer/message?id="+userList[3].custId+"' target='_blank'>" +
                     "                            <dl class='tximg02'>" +
                     "                                <dt class='tx_mask02'></dt>" +
                     "                                <dd class='tx_cont'>" +
                     "                                    <img src='" + url1+userList[3].custPhoto  + "' width='36' height='36' alt='' />" +
                     "                                </dd>" +
                     "                            </dl>" +
                     "                        </a>";
             newDiv1 +=
                 "                        <p>已报名<a href='/activity/signuplist?actiId="+activity1[i].actiId+"'><span id='peopleCount'>" + number1 + "</span></a>人</p>" +
                 "                    </div>" +
                 "                </div>" +
                 "                <div class='ljbm'><a class='fixPNG' href='/activity/detail?actiId="+activity1[i].actiId+"' title=''></a></div>" +
                 "            </div>";
             hdList1.innerHTML +=newDiv1;

             //查询参加活动的总人数
             function getNo4People(id) {
                 if (window.XMLHttpRequest) {
                     xhr = new XMLHttpRequest();
                 } else {
                     xhr = new ActiveXObject('Microsoft.XMLHTTP')
                 }
                 xhr.open("GET", (url_getNo4People + "?actiId=" + id), false);
                 xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                 xhr.onreadystatechange = getCount;
                 xhr.send();
             }

             function getCount() {
                 if (xhr.readyState == 4 && xhr.status == 200) {
                     var count1 = JSON.parse(xhr.responseText);
                     //document.getElementById("peopleCount").innerText=count;
                     number1 = count1;
                 }
             }

             //显示活动状态
             function getState(id) {
                 if (window.XMLHttpRequest) {
                     xhr = new XMLHttpRequest();
                 } else {
                     xhr = new ActiveXObject('Microsoft.XMLHTTP')
                 }
                 xhr.open("GET", (url_getState + "?actiId=" + id), false);
                 xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                 xhr.onreadystatechange = stateMsg;
                 xhr.send();
             }

             function stateMsg() {
                 if (xhr.readyState == 4 && xhr.status == 200) {
                     if (xhr.responseText == 1) {
                         state1 = "进行中";
                         document.g
                     } else {
                         state1 = "已结束";
                     }
                 }
             }

             //根据活动获得任务头像
             function getPhoto(id) {
                 if (window.XMLHttpRequest) {
                     xhr = new XMLHttpRequest();
                 } else {
                     xhr = new ActiveXObject('Microsoft.XMLHTTP')
                 }
                 xhr.open("GET", (url_getPhoto + "?actiId=" + id), false);
                 xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                 xhr.onreadystatechange = photoList;
                 xhr.send();
             }

             function photoList() {
                 if (xhr.readyState == 4 && xhr.status == 200) {
                     var customerList = JSON.parse(xhr.responseText);
                     userList=customerList
                   /*  if (photo1.length >= 4) {
                         for (var j = 0; j < 4; j++) {
                             urlImg1[j] = url1 + photo1[j];
                         }
                     } else {
                         for (var j = 0; j < photo1.length; j++) {
                             urlImg1[j] = url1 + photo1[j];
                         }
                     }*/
                 }
             }
         }
         //2.页码渲染
         var pagearea1 = document.getElementById("pagearea");
         pagearea1.innerHTML = "";
         var url_getActivity1 = "/activity/allActivityByCity";
         //首页
         var url_fight_page1 = url_getActivity1 + "/page/" + 1+"/"+document.getElementsByClassName("current_city")[0].innerText;
         var fight_page_href1 = 'javascript:city1("' + url_fight_page1 + '")';
         var fightPageEle1 = "<a  href='" + fight_page_href1 + "'> 首页</a>";
         pagearea1.innerHTML += fightPageEle1;
         //上一页
         if (page1.currentPageCode != 1) {// 不是首页，则显示上一页
             var url_pre_page1 = url_getActivity1 + "/page/" + (page1.currentPageCode - 1)+"/"+document.getElementsByClassName("current_city")[0].innerText;
             var href1 = 'javascript:city1("' + url_pre_page1 + '")';
             var prePageEle1 = "<a  href='" + href1 + "'> 上一页</a>";
             pagearea1.innerHTML += prePageEle1
         }
         //当前页码
         var currentPageEle1 = " <span>当前是第</span><span id='currentPageCode'>" + page1.currentPageCode + "</span> <span>页</span>";
         pagearea1.innerHTML += currentPageEle1;
         //下一页
         if (page1.currentPageCode != page1.totalPages) {
             var url_next_page1 = url_getActivity1 + "/page/" + (page1.currentPageCode + 1)+"/"+document.getElementsByClassName("current_city")[0].innerText;
             var href1 = 'javascript:city1("' + url_next_page1 + '")';
             var nextPageEle1 = "<a  href='" + href1 + "'> 下一页</a>";
             pagearea1.innerHTML += nextPageEle1;
         }
         //其他页码
         var othersEle1 = "<span>共</span><span>" + page1.totalPages + "</span><span>页</span>\n" +
             "<input type=\"text\" name=\"\" id=\"skipPageCode\">\n" +
             "<button onclick='skip1("+page1.totalPages+")'>跳转</button>";
         pagearea1.innerHTML += othersEle1;
     }
 }
//跳转
function skip1(totalPages) {
    var url_getActivity1 = "/activity/allActivityByCity";
    var skipPageCode1 = document.getElementById("skipPageCode").value;
    if (skipPageCode1 != null && skipPageCode1 != ""&&skipPageCode1<=totalPages) {
        var url_skip_page1 = url_getActivity1 + "/page/" + document.getElementById("skipPageCode").value + "/" + document.getElementsByClassName("current_city")[0].innerText;
        city1(url_skip_page1);
    }
}
//根据获得查询进行中或已结束的活动个数;(全国)
function getStateCount() {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    xhr.open("GET",url_getStateCount,false);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = stateCount;
    xhr.send();
}
//根据获得查询进行中或已结束的活动个数;(省份)
function getStateCountByCity(url2) {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    xhr.open("GET",url2,false);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = stateCount;
    xhr.send();
}
function stateCount() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var stateNumber = JSON.parse(xhr.responseText);
        var sum1 = 0;
        var sum2 = 0;
        for (var i = 0; i < stateNumber.length; i++) {
            if (stateNumber[i] == 1) {
                sum1++;
            } else{
                sum2++;
            }
        }
        document.getElementById("hd_in").innerText = sum1;
        document.getElementById("hd_end").innerText = sum2;
    }
}
