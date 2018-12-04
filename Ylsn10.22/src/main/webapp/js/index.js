var currCustConstellation=null;
var custGender=null;

var currShowData=0;
var localPath="http://localhost:8080/Path/";
var urlCustomerList="/customer/getCustomerList";
window.onload=function imgToggle(){
    function lunBo(){

        var oDiv=document.getElementById("index-slide-div");

        var oDiv1=document.getElementById("index-top-div1");

        var oDiv2=document.getElementById("index-top-div2");

        var oUl=document.getElementById('middle-focus');

        var oLi=oUl.getElementsByTagName('li');

        var oUl1=document.getElementById('focus_login_after');

        var oLi1=oUl1.getElementsByTagName('li');

        var oUl2=document.getElementById('focus_login_pre');

        var oLi2=oUl2.getElementsByTagName('li');

        var oPoint =document.getElementById('middle-focus-dot').getElementsByTagName("span");

        var oPoint1 =document.getElementById('focus_login_after_dot').getElementsByTagName("span");

        var oPoint2 =document.getElementById('focus_login_pre_dot').getElementsByTagName("span");

        var time=0;

        var time1=0;

        var time2=0;

        var speed=-oLi[0].offsetWidth;

        var speed1=-oLi1[0].offsetWidth;  //这是每次移动的距离为li的宽度，也就是图片的宽度

        var speed2=-oLi2[0].offsetWidth;

        oUl.style.width=oLi[0].offsetWidth*oLi.length+"px";//设置Ul的宽度

        oUl1.style.width=oLi1[0].offsetWidth*oLi1.length+"px";//设置Ul的宽度

        oUl2.style.width=oLi2[0].offsetWidth*oLi2.length+"px";
        /*基础实现部分*/

        function move() {

            oUl.style.left =oUl.offsetLeft + speed + 'px';//这句就是刚刚的关键点，位移增减，需注意要设置成绝对定位，offsetLeft才有效

            //同时这个绝对定位对网站的排布影响是比较大的，尽量让其的影响范围缩小，最简单的办法就是在其最接近的父元素设置成relative，也就是相对定位

            if (oUl.offsetLeft <=-oLi[0].offsetWidth * oLi.length)

            {

                oUl.style.left ='0';  //这个判断呢是当山水画移到最左端时，让它回到原点，并继续循环移动

            }

            if(oUl.offsetLeft>=oLi[0].offsetWidth){  //这个也一样，方向是Ul往右移动到最后一张图时，又重新回到原点

                oUl.style.left=-oLi[0].offsetWidth * (oLi.length-1)+'px';

            }

            point();

        }
        function move1() {

            oUl1.style.left =oUl1.offsetLeft + speed1 + 'px';//这句就是刚刚的关键点，位移增减，需注意要设置成绝对定位，offsetLeft才有效

            //同时这个绝对定位对网站的排布影响是比较大的，尽量让其的影响范围缩小，最简单的办法就是在其最接近的父元素设置成relative，也就是相对定位


            if (oUl1.offsetLeft <=-oLi1[0].offsetWidth * oLi1.length)

            {

                oUl1.style.left ='0';  //这个判断呢是当山水画移到最左端时，让它回到原点，并继续循环移动

            }

            if(oUl1.offsetLeft>=oLi1[0].offsetWidth){  //这个也一样，方向是Ul往右移动到最后一张图时，又重新回到原点

                oUl1.style.left=-oLi1[0].offsetWidth * (oLi1.length-1)+'px';

            }
            point1();


        }
        function move2() {

            oUl2.style.left =oUl2.offsetLeft + speed2 + 'px';//这句就是刚刚的关键点，位移增减，需注意要设置成绝对定位，offsetLeft才有效

            //同时这个绝对定位对网站的排布影响是比较大的，尽量让其的影响范围缩小，最简单的办法就是在其最接近的父元素设置成relative，也就是相对定位


            if (oUl2.offsetLeft <=-oLi2[0].offsetWidth * oLi2.length)

            {

                oUl2.style.left ='0';  //这个判断呢是当山水画移到最左端时，让它回到原点，并继续循环移动

            }

            if(oUl2.offsetLeft>=oLi2[0].offsetWidth){  //这个也一样，方向是Ul往右移动到最后一张图时，又重新回到原点

                oUl2.style.left=-oLi2[0].offsetWidth * (oLi2.length-1)+'px';

            }

            point2();


        }
        /*setInterval(move,1000)：这个是循环定时器，它会每隔1000ms调用move函数*/
        time=setInterval(move,3000);

        time1=setInterval(move1,3000);

        time2=setInterval(move2,3000);
        //鼠标移入移出事件：很简单，我要让当鼠标移入时轮播图暂停，就先清除定时器，移出时重新打开即可

        oDiv.onmouseover = function(){clearInterval(time);};

        oDiv.onmouseout=function(){time=setInterval(move,3000);};

        oDiv1.onmouseover = function(){clearInterval(time1);};

        oDiv1.onmouseout=function(){time1=setInterval(move1,3000);};

        oDiv2.onmouseover = function(){clearInterval(time2);};

        oDiv2.onmouseout=function(){time2=setInterval(move2,3000);};

        /*小圆点跟随变动：这个是必须的，无论是自动播放，左右切图还是点击小圆点，都会有变动，需要封装成一个子函数*/

        function point(){

            var flag=-oUl.offsetLeft/oLi[0].offsetWidth;

            for (var i = 0; i <oPoint.length; i++) {

                oPoint[i].className ='';

                //全部小圆点清除颜色，因为你事先并不知道有多少个有色，多少个无色，宁可错杀一千，绝不放过一个

            }

            oPoint[flag].className ='index-sListCur';//选中的小圆点背景

        }

        function point1(){

            var flag=-oUl1.offsetLeft/oLi1[0].offsetWidth;

            for (var i = 0; i <oPoint1.length; i++) {

                oPoint1[i].className ='';

                //全部小圆点清除颜色，因为你事先并不知道有多少个有色，多少个无色，宁可错杀一千，绝不放过一个

            }

            oPoint1[flag].className ='index-slideCur';//选中的小圆点背景

        }

        function point2(){

            var flag=-oUl2.offsetLeft/oLi2[0].offsetWidth;

            for (var i = 0; i <oPoint2.length; i++) {

                oPoint2[i].className ='';

                //全部小圆点清除颜色，因为你事先并不知道有多少个有色，多少个无色，宁可错杀一千，绝不放过一个

            }

            oPoint2[flag].className ='index-slideCur';//选中的小圆点背景

        }
        /*左右单击切换图片*/



        var oA=oDiv.getElementsByTagName('a');

        oA[0].onclick=function(){//这里两个oA其实是左右键，

            speed=oLi[0].offsetWidth;//前面是+speed,向左移为什么速度是正的？想一想？

            setTimeout(move,0);//很简单，我们点击向左，实际上是想把当前图左边的一张图显示出来

            point();//因而Ul实际上是向右移动，所以速度为正

        };

        oA[1].onclick=function(){

            speed=-oLi[0].offsetWidth;  //反之也一样

            setTimeout(move,0);

            point();

        };



        /*单击小圆点切换对应图片*/

        for (var i = 0; i <oPoint.length; i++) {

            oPoint[i].index = i;

            oPoint[i].onclick =function () {

                for (var j = 0; j <oPoint.length; j++) {

                    oPoint[j].className= '';

                }

                this.className ='index-sListCur';

                oUl.style.left =-oLi[0].offsetWidth * this.index + 'px';

            }

        }

        for (var i = 0; i <oPoint1.length; i++) {

            oPoint1[i].index = i;

            oPoint1[i].onclick =function () {

                for (var j = 0; j <oPoint1.length; j++) {

                    oPoint1[j].className= '';

                }

                this.className ='index-slideCur';

                oUl1.style.left =-oLi1[0].offsetWidth * this.index + 'px';

            }

        }

        for (var i = 0; i <oPoint2.length; i++) {

            oPoint2[i].index = i;

            oPoint2[i].onclick =function () {

                for (var j = 0; j <oPoint2.length; j++) {

                    oPoint2[j].className= '';

                }

                this.className ='index-slideCur';

                oUl2.style.left =-oLi2[0].offsetWidth * this.index + 'px';

            }

        }

    }
    lunBo();
    getHappinessPhoto("/happiness/getHappinessPhoto?count=18");
    refreshUserList2("/customer/getCustomerListByVisit"+"?custGender="+encodeURI(custGender));
    var url=urlCustomerList+"?custGender="+encodeURI(custGender)+"&custProvince=省份&custCity=城市";
    refreshUserList(url);

};

var xhr = null;
function get_user_info() {
    url="customer/getCustomer"+"?custId="+custId;
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", url, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = loadUserInfo;
    xhr.send();
}


function loadUserInfo() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var user = JSON.parse(xhr.responseText);

        document.getElementById("user_greet").getElementsByTagName("span")[0].innerText=user.custNickname;
        document.getElementById("user_photo").src=localPath+user.custPhoto;
        document.getElementsByClassName("head_nick")[0].innerText=user.custNickname;
        document.getElementsByName("photo").value=user.custPhoto;
        document.getElementById("user_complete").innerText=getPerfect(user)+"%";
        currCustConstellation=user.custConstellation;
        custGender=user.custGender;
        document.getElementsByClassName("meet1")[0].href="customer/meet?custGender="+custGender;


    }
}
function getPerfect(user) {

    var prefect=50;
    if(user.custPhoto!="xxx.jpg")
        prefect+=10;
    if(user.custWeight!="--")
        prefect+=5;
    if(user.custNation!="--")
        prefect+=5;
    if(user.custBloodType!="--")
        prefect+=5;
    if(user.custZodiac!="--")
        prefect+=5;
    if(user.custConstellation!="--")
        prefect+=5;
    if(user.custHobby!="--")
        prefect+=5;
    if(user.custIntroduce!=null)
        prefect+=5;
    if(user.custProFession!="--")
        prefect+=5;
    return prefect;
}
function get_greet() {
    var date=new Date();
    var hour=date.getHours();
    if(hour<12&&hour>6)
        return "早上";
    else if(hour>=12&&hour<18)
        return "下午";
    else if(hour>=18&&hour<=23||hour>=0&&hour<=6)
        return "晚上";
    else
        return "你";
}



function refreshUserList(url) {

        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("GET", url, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.onreadystatechange = loadUsers;
        xhr.send();

}

function loadUsers() {
    if (xhr.readyState == 4 && xhr.status == 200) {

        var userlist = JSON.parse(xhr.responseText);
        //1. 数据渲染
        var ulList = document.getElementById("date_search_list");
        ulList.innerHTML = "";
        for (var i = 0; i < userlist.length; i++) {
            var urlImg=localPath+userlist[i].custPhoto;
            var age=new Date().getFullYear()-new Date(userlist[i].custBirthday).getFullYear();
            ulList.innerHTML +=
                ' <li class=" ">'+
               '<div class="pal-list" >'+
                '<div class="pal-top" >'+
                '<img class="pal-img date-search-lazy" onclick="skipToMessage('+userlist[i].custId+')"  style="width: 222px; height: 296px; left: 0px; top: 0px;" src="'+urlImg+' ">'+
                '<div class="pal-bottom fn-clear">'+
                '<div class="pal-info">'+
                '<p class="pal-one ">'+userlist[i].custNickname+'</p>'+
                '<p class="pal-two">'+
                '<span class="pal-span1 age">'+ age+'岁</span>'+
            '<span class="pal-span2 height">'+userlist[i].custHeight+'cm</span></p></div>'+
            '<a href="/customer/message?id='+userlist[i].custId+'" class="pal-btn contactBtn">联系ta</a></div>'+
                '<div class="pal-name nickname">'+userlist[i].custNickname+'</div> </div></div></li>'
        }
    }
}
function skipToMessage(id) {
    window.open("/customer/message"+"?id="+id);
}
function send_index_pv(currA) {

    var listA=document.getElementById("date-search-nav").getElementsByTagName("a");
    for(var i=0;i<listA.length;i++){
        listA[i].className="tabNav-a";
    }
    currA.className="tabNav-a tabNav-cur";
}

function refreshUserList2(url) {

    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", url, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = loadUsers2;
    xhr.send();

}

function loadUsers2() {
    if (xhr.readyState == 4 && xhr.status == 200) {

        var userlist = JSON.parse(xhr.responseText);
        //1. 数据渲染
        var ulList = document.getElementById("day_recommend_list");
        ulList.innerHTML = "";
        for (var i = 0; i < userlist.length; i++) {
            var urlImg=localPath+userlist[i].custPhoto;
            var age=new Date().getFullYear()-new Date(userlist[i].custBirthday).getFullYear();
            ulList.innerHTML +=
                ' <li class=" ">'+
                '<div class="pal-list" >'+
                '<div class="pal-top" >'+
                '<img class="pal-img date-search-lazy" onclick="skipToMessage('+userlist[i].custId+')"  style="width: 222px; height: 296px; left: 0px; top: 0px;" src="'+urlImg+' ">'+
                '<div class="pal-bottom fn-clear">'+
                '<div class="pal-info">'+
                '<p class="pal-one ">'+userlist[i].custNickname+'</p>'+
                '<p class="pal-two">'+
                '<span class="pal-span1 age">'+ age+'岁</span>'+
                '<span class="pal-span2 height">'+userlist[i].custHeight+'cm</span></p></div>'+
                '<a href="/customer/message?id='+userlist[i].custId+'" class="pal-btn contactBtn">联系ta</a></div>'+
                '<div class="pal-name nickname">'+userlist[i].custNickname+'</div> </div></div></li>'
        }
    }
}

function get_recommend_user(id) {
    if(id==0) {
        currShowData=0;
        refreshUserList(urlCustomerList + "?custGender=" + encodeURI(custGender) + "&custProvince=省份&custCity=城市");
    } else if(id==1) {
        currShowData=1;
        refreshUserList(urlCustomerList + "?custConstellation=" + currCustConstellation + "&custGender=" + encodeURI(custGender));
    } else if(id==2) {
        currShowData=2;
        refreshUserList(urlCustomerList + "?custGender=" + encodeURI(custGender) + "&minYear=1990&maxYear=2000");
    } else if(id==3) {
        currShowData=3;
        refreshUserList(urlCustomerList + "?custGender=" + encodeURI(custGender) + "&minYear=1980&maxYear=1990");
    }else {
        currShowData=0;
        refreshUserList(urlCustomerList+"?custGender="+encodeURI(custGender)+"&custProvince=省份&custCity=城市");
    }
}

function search_change() {

        if(currShowData==0) {
            refreshUserList(urlCustomerList + "?custGender=" + encodeURI(custGender) + "&custProvince=省份&custCity=城市");
        } else if(currShowData==1) {
            refreshUserList(urlCustomerList + "?custConstellation=" + currCustConstellation + "&custGender=" + encodeURI(custGender));
        } else if(currShowData==2) {
            refreshUserList(urlCustomerList + "?custGender=" + encodeURI(custGender) + "&minYear=1990&maxYear=2000");
        } else if(currShowData==3){
            refreshUserList(urlCustomerList + "?custGender=" + encodeURI(custGender) + "&minYear=1980&maxYear=1990");
        }else {
            refreshUserList(urlCustomerList + "?custGender=" + encodeURI(custGender) + "&custProvince=省份&custCity=城市");
            currShowData==0;
        }
}


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
        var ulList = document.getElementById("story-list");
        ulList.innerHTML = "";
        var date="";
        var pageData="";
        var nickname=""
        for (var i = 0; i < happinessInfoList.length; i++) {
            var urlImg=localPath+happinessInfoList[i].happinessInfo.happImages.split(",")[1];
            date=new Date(happinessInfoList[i].happinessInfo.happTime).toLocaleDateString();
            nickname=happinessInfoList[i].happinessInfo.happImages.split(",")[0];
            if(i==0)
                pageData += '   <li class="bask-block bask-bigBlock">';
            else
                pageData+= '   <li class="bask-block">';
            pageData +=
             '   <a onmousedown="" target="_blank" href="/detailStory?happId='+happinessInfoList[i].happinessInfo.happId+'&happImage='+urlImg+'"  class="bask-href">'+
            '  <div class="bask-list ">'+
            '  <div class="bask-top">'+
            '    <img style="" class="bask-pic xf-lazy" src="'+urlImg+'"  alt=""> </div>'+
            '   <div class="bask-info">'+
            '   <div class="bask-coneter">'+
            '   <p class="bask-p1">'+nickname+'&amp;'+happinessInfoList[i].happinessInfo.happOtherName+'</p>'+
            '     <p class="bask-p2">'+date+' </p> </div> </div> </div> </a> </li>';

        }
        ulList.innerHTML=pageData;
    }
}

