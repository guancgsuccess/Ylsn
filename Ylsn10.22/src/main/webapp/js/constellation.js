/**
 * Created by wwwlj on 2018/9/30.
 */
window.onload=function getCurrTime(){
    var timeP=document.getElementsByClassName("currtime");
    var myDate = new Date();//获取系统当前时间
    for(var i=0;i<timeP.length;i++) {
        timeP[i].innerText = "(" + myDate.getFullYear() + "年" + (myDate.getMonth() + 1) + "月" + myDate.getDate() + "日)";
    }
}

function getChannelBarId()
    {
        var id;
        switch(t){
        case  0:
        case  1:
        case  6:
        case  7:
        case 10:
        id = 'bar_default';
        break;
        case  9:
        id = 'bar_astro';
        break;
        case 12:
        id = 'bar_newuser';
        break;
        case 13:
        id = 'bar_online';
        break;
        case 1004:
        case 1005:
        case 1006:
        case 1007:
        id = 'bar_hot';
        break;
        default:
        id = 'bar_default';
        }
        return id;
        }
var JQ = $.noConflict();
function chooseSearchChannel(liId)
    {
        var channels = JQ("#channel_bar > li");
        for(var i=0; i<channels.length; i++){
        if(channels[i].id==liId)
        JQ(channels[i]).addClass('cur');
        else
        JQ(channels[i]).removeClass('cur');
        }
        }
function showCurChannelBar()
    {
        chooseSearchChannel(getChannelBarId());
        }



