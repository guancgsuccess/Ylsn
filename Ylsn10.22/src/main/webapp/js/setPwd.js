var xhr=null;
var url_getPwdByCustId = "/customer/getPwdByCustId";
var url_updatePwdByCustId = "/customer/updatePwdByCustId";

//获得原密码
function getPwdByCustId() {
    if (window.XMLHttpRequest){
        xhr = new XMLHttpRequest();
    }else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var url_getPwd = url_getPwdByCustId ;
    xhr.open("GET",url_getPwd,true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange = getPwd;
    xhr.send();
}
function getPwd() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var oldPwd = document.getElementById("passwdOld").value;
        if (oldPwd == xhr.responseText){
            post(url_updatePwdByCustId, [{name:"custPassword",value:document.getElementById("passwd2").value}]);
        }else {
            document.getElementById("passwdOld_span").innerText = "与原密码不一致"
        }
    }
}
//修改密码
function post(url, params) {
    var temp = document.createElement("form");
    temp.action = url;
    temp.method = "post";
    temp.style.display = "none";
    for (var i=0;i<params.length;i++) {
        var opt = document.createElement("textarea");
        opt.name = params[i].name;
        opt.value = params[i].value;
        temp.appendChild(opt);
    }
    document.body.appendChild(temp);
    temp.submit();
    return temp;
}