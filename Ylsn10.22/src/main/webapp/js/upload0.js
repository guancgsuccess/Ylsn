var xhr = null;
function check() {
    url="happiness/uploadCheck"+"?nickname="+document.getElementsByName("nickname")[0].value;
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", url, false);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = skipUpload;
    xhr.send();
}

function skipUpload() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var state = JSON.parse(xhr.responseText);
        if(state==1)
            alert("抱歉,你们已经上传过了")
        else if(state==2)
            alert("暂无此用户")
        else {

            var nickname=document.getElementsByName("nickname")[0].value;
            var status=document.getElementById("statusSelect").options[document.getElementById("statusSelect").selectedIndex].value;
            var year=1000;
            var month=1;
            var day=11;
            if(status==3){
                year=document.getElementById("dateForm3_month").options[document.getElementById("dateForm3_year").selectedIndex].value;
                 month=document.getElementById("dateForm3_day").options[document.getElementById("dateForm3_month").selectedIndex].value;
                 day=document.getElementById("dateForm3_day").options[document.getElementById("dateForm3_day").selectedIndex].value;
            }else if(status==2){
                 year=document.getElementById("dateForm4_year").options[document.getElementById("dateForm4_year").selectedIndex].value;
                 month=document.getElementById("dateForm4_month").options[document.getElementById("dateForm4_month").selectedIndex].value;
                day=document.getElementById("dateForm4_day").options[document.getElementById("dateForm4_day").selectedIndex].value;
            }else if(status==1){
                 year=document.getElementById("dateForm5_year").options[document.getElementById("dateForm5_year").selectedIndex].value;
                 month=document.getElementById("dateForm5_month").options[document.getElementById("dateForm5_month").selectedIndex].value;
                 day=document.getElementById("dateForm5_day").options[document.getElementById("dateForm5_day").selectedIndex].value;
            }

            var date=year+"-"+month+"-"+day;
            window.location.href="happiness/toUpload"+"?happState="+status+"&happOtherName="+nickname+"&happTime="+date;

        }

    }
}