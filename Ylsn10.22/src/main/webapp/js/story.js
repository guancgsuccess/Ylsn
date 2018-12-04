
var number=1;
$(document).ready(function () {
    refreshHappinessList1("/happiness/getHappinessPhoto?count=5");
})
$(window).scroll(function(){
    var scrollTop = $(this).scrollTop();    //滚动条距离顶部的高度
    var scrollHeight = $(document).height();   //当前页面的总高度
    var clientHeight = window.screen.height;    //当前可视的页面高度
    // console.log("top:"+scrollTop+",doc:"+scrollHeight+",client:"+clientHeight);
    if(scrollTop + clientHeight >= scrollHeight){   //距离顶部+当前高度 >=文档总高度 即代表滑动到底部 count++;         //每次滑动count加1
        //alert(scrollTop+"--"+scrollHeight+"--"+clientHeight);
        number++;
        refreshHappinessList1("/happiness/getHappinessPhoto?count="+number*5);
        //filterData(serviceTypeId,industryId,cityId,count); //调用筛选方法，count为当前分页数
    }else if(scrollTop<=0){
        //滚动条距离顶部的高度小于等于0 TODO
        //alert("下拉刷新，要在这调用啥方法？");
    }
});
function refreshHappinessList1(url) {

    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", url, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = loadHappiness1;
    xhr.send();

}

function loadHappiness1() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var happinessInfoList = JSON.parse(xhr.responseText);
        //1. 数据渲染
        var ulList = document.getElementById("j-storyList");
        ulList.innerHTML = "";
        var date="";
        var pageData="";
        var nickname="";
        var state="";
        var content="";
        for (var i = 0; i < happinessInfoList.length; i++) {
            var urlImg="/Path/"+happinessInfoList[i].happinessInfo.happImages.split(",")[1];
            nickname=happinessInfoList[i].happinessInfo.happImages.split(",")[0];
            state=getState(happinessInfoList[i].happinessInfo.happState);
            content=happinessInfoList[i].happinessInfo.happContent.substr(0,90);
            ulList.innerHTML +=
            '   <div class="storyItem clearfix"> <div class="storyImg">'+
            '    <a href="/detailStory?happId='+happinessInfoList[i].happinessInfo.happId+'&happImage='+urlImg+'" target="_blank">'+
            '   <img src="'+urlImg+'" alt=""> </a>'+
            '   <span class="arrow">'+state+'</span> </div>'+
            '   <div class="storyTxt">'+
            '   <h2>'+
            '   <a href="/detailStory?happId='+happinessInfoList[i].happinessInfo.happId+'&happImage='+urlImg+'" target="_blank">'+happinessInfoList[i].happinessInfo.happTitle+'</a> </h2>'+
            '   <p class="txt1">'+nickname+'&amp;'+happinessInfoList[i].happinessInfo.happOtherName+'</p>'+
            '    <p class="txt2">'+content+'...</p>'+
            '   <div class="txtBtm clearfix">'+
            '   <a href="/detailStory?happId='+happinessInfoList[i].happinessInfo.happId+'&happImage='+urlImg+'" target="_blank" class="btnR2">围观幸福</a> </div> </div>'
        }
    }
}

function getState(state) {
    if(state==3)
        return "热恋中";
    else if(state==2)
        return "已订婚";
    else
        return "已结婚";
}