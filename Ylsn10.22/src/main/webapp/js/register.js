/**
 * Created by chen on 2018/10/17 0017.
 */

//获取后台返回的结果
function checkphone() {
   var id=document.getElementById("account").value;
    var result = "";
    $.ajax({
        url:'/askCheckPhone',
        type:"GET",
        data:{phone:id}, // 发送数据
        dataType:"text",
        async:false,//关闭异步加载,这样只有加载完成才进行下一步
        success:function (data) {
            result = data;
        }
    });
    return result;
}


//电话号码验证
function checkPhone() {
    var phone = document.getElementById("account").value;
    document
    if (phone ==null || phone ==""){
        epath="img/error.png";
        document.getElementById("account_msg").innerHTML = '<img  style="position: relative;top: 6px" src="'+epath+'" />电话号码不能为空';
        return false;
    }else if (!/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/.test(phone)) {
        epath="img/error.png";
        document.getElementById("account_msg").innerHTML = '<img  style="position: relative;top: 6px" src="'+epath+'" />必须为11位电话号码';
        return false;
    } else if(checkphone()==="exist") {
        epath="img/error.png";
        document.getElementById("account_msg").innerHTML = '<img  style="position: relative;top: 5px" src="' + epath + '" />手机号已被注册';
        return false;
    }else{
        path = "img/ok.png";
        document.getElementById("account_msg").innerHTML = '<img  style="position: relative;top: 5px" src="' + path + '" />';
        return true;
    }
}

//加载时执行
function checkPhoneNumber() {
    var phone = document.getElementById("account").value;
    var mobileBtn=  document.getElementById("mobileValiCode_btn");
    if (phone ==null || phone ==""){
        mobileBtn.disabled="true";
        return false;
    }else if (!/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/.test(phone)) {
        mobileBtn.disabled="true";
        return false;
    } else if(checkphone()==="exist") {
        mobileBtn.disabled="true";
        return false;
    }else{
        mobileBtn.removeAttribute("disabled");
        return true;
    }
}

function checkPhoneandVerCode(){
    var mobileBtn=  document.getElementById("mobileValiCode_btn");
    if(checkPhone()==true&&checkCode()==true){
        mobileBtn.removeAttribute("disabled");
    }else{
        mobileBtn.disabled="true";
    }
}



//获取后台生成的验证码
function getVerCode() {
    var result = "";
    $.ajax({
        url:'/customer/askVerCode',
        type:"GET",
        dataType:"text",
        async:false,//关闭异步加载,这样只有加载完成才进行下一步
        success:function (data) {
            result = data;
        }
    });
    return result;
}
//验证码验证
function checkCode() {
 var  codeVal= document.getElementById("phonePicCodeVal").value;
if(codeVal==null||codeVal==""){

    epath="img/error.png";
    document.getElementById("phonePicValiCode_msg").innerHTML = '<img  style="position: relative;top: 5px" src="' + epath + '" />验证码为空';
    return false;

}else if(codeVal.length!=4){
        document.getElementById("phonePicValiCode_msg").innerText="验证码不正确";
        reloadImage();
        return false;
}else  if(getVerCode()!=codeVal){
    document.getElementById("phonePicValiCode_msg").innerText="验证码不正确";
    reloadImage();
    return false;
    }else{
    document.getElementById("phonePicValiCode_msg").innerText="验证码正确";
    return true;
    }
}
// 向用户发送手机验证码
/*function sendMobileCode(btn){
        var result = "";
        var telephone= document.getElementById("account").value;
        // alert(telephone);
        $.ajax(
            {
                url:'/SendMobile',
                type:"GET",
                data:{telephone:telephone}, // 发送数据
                dataType:"text",
                async:false,//关闭异步加载,这样只有加载完成才进行下一步
                success:function (data) {
                    result = data;
                }
            });
        return result;
    var wait = 60;
    btn.setAttribute("disabled", true);
    btn.value = wait + "s 后重新发送";
    wait--;
    setTimeout(function () {
            time(btn);
        },
        1000)
}*/

//获取后台生成的手机验证码
function getMobileCode() {
    var result = "";
    $.ajax(
        {
            url:'/GetMobileCode',
            type:"GET",
            dataType:"text",
            async:false,//关闭异步加载,这样只有加载完成才进行下一步
            success:function (data) {
                result = data;
            }
        });
    return result;
}

//验证手机验证码
function  checkMobileCode(){
    var  phoneCodeVal1= document.getElementById("txtMobileValiCode").value;
     var phoneCodeVal="#code#="+phoneCodeVal1;
    if(phoneCodeVal1==null||phoneCodeVal1==""){
        epath="img/error.png";
        document.getElementById("mobileValiCode_msg").innerHTML = '<img  style="position: relative;top: 5px" src="' + epath + '" />验证码为空';
        return false;
    }else if(getMobileCode()!=phoneCodeVal){
        document.getElementById("mobileValiCode_msg").innerText="验证码不正确";
        return false;
    }else{
        path = "img/ok.png";
        document.getElementById("mobileValiCode_msg").innerHTML = '<img  style="position: relative;top: 5px" src="' + path + '" />';
        return true;
    }
}
// 密码验证
function checkPassword(){
    var password =  document.getElementById("password").value;
    if(password ==null || password==""){
        epath="img/error.png";
        document.getElementById("password_msg").innerHTML ='<img  style="position: relative;top: 6px" src="'+epath+'" />密码不能为空';
        return false;
    }else if(!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{4,16}$/.test(password) ){
        epath="img/error.png";
        document.getElementById("password_msg").innerHTML ='<img  style="position: relative;top: 6px" src="'+epath+'" />必须有数字和字母,且长度在4-16位';
        return false;
    } else{
        path="img/ok.png";
        document.getElementById("password_msg").innerHTML ='<img  style="position: relative;top: 5px" src="'+path+'" />';
        return true;
    }
}

// 确认密码验证
function checkRePassword(){
    var password =  document.getElementById("password").value;
    var repassword =  document.getElementById("repassword").value;
    if( repassword==null|| repassword=="" ){
        document.getElementById("Repassword_msg").innerText ="请先输入密码";
        return false;
    }else if(password !=repassword ){
        epath="img/error.png";
        document.getElementById("Repassword_msg").innerHTML ='<img  style="position: relative;top: 6px" src="'+epath+'" />两次密码不一致';
        return false;
    }else{
        path="img/ok.png";
        document.getElementById("Repassword_msg").innerHTML ='<img  style="position: relative;top: 5px" src="'+path+'" />';
        return true;
    }
}

//获取后台返回用户名检查的结果
function checknikename() {
    var nikename=document.getElementById("nikename").value;
    var result = "";
    $.ajax({
        url:'/askCheckNikename',
        type:"GET",
        data:{nikename:nikename}, // 发送数据
        dataType:"text",
        async:false,//关闭异步加载,这样只有加载完成才进行下一步
        success:function (data) {
            result = data;
        }
    });
    return result;
}

//用户名验证
function checkNikename() {
    var username = document.getElementById("nikename").value;
    if (username == null || username == "") {
        document.getElementById("nikename_msg").innerText = "昵称不能为空";
        return false;
    } else if (!/^[A-Za-z0-9\u4e00-\u9fa5]{1,12}$/.test(username)) {
        document.getElementById("nikename_msg").innerText = "必须是1-12汉字数字与字母组成的字符";
        return false;
    } else if(checknikename()==="exist"){
        document.getElementById("nikename_msg").innerText = "用户名已存在";
        return false;
    }else {
        path="../../img/ok.png";
        document.getElementById("nikename_msg").innerHTML ='<img  style="position: relative;top: 5px" src="'+path+'" />';
        return true;
    }
}
// 选中性别后 样式修改
function selectedGender(ele){
    //其他 性别的样式恢复原样
    //获得a标签中的value属性的值
    // alert( $("#gender_1").attr("value"))
    // alert( $("#gender_0").attr("value"))
    // alert(ele.id);
    if(ele.id==="gender_1"){
        document.getElementById("gender").value="男";
    }else if (ele.id==="gender_0") {
        document.getElementById("gender").value="女";
    }

    var sexNoArr =  document.getElementsByClassName("sex");
    for(var i =0;i<sexNoArr.length;i++){
        if(ele.innerText === sexNoArr[i].innerText){
            ele.style.backgroundColor ="#ffe8d9"
        }else{
            sexNoArr[i].style.backgroundColor ="#fff";
        }
    }
    return ele.innerText;
}

//生日验证
function  checkBirthday() {
    var year = getValue("year");var month=getValue("month");var day=getValue("days");
    if(year=="选择年份"||month=="选择月份"||day=="选择日期"){
        epath="img/error.png";
        document.getElementById("Birthday_msg").innerHTML ='<img  style="position: relative;top: 6px" src="'+epath+'" />请选择生日日期';
        return false;
    }else{
        document.getElementById("Birthday_msg").innerText = "";
        return true;
    }
}
//地址验证
function  checkCity() {
    var  province = getValue("province"); var city=getValue("city");//获得省市
    if(province=="请选择省"||city=="请选择"){
        epath="img/error.png";
        document.getElementById("City_msg").innerHTML ='<img  style="position: relative;top: 6px" src="'+epath+'" />请选择地区';
        return false;
    }else{
        document.getElementById("City_msg").innerText = "";
        return true;
    }
}
