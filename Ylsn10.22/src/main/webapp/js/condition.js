var xhr=null;
var url_getRequirement = "/requirement/getRequirement";
var url_updateCondition = "/requirement/updateRequirement";
var custId=1;


window.onload=function () {
    custId=document.getElementsByName("custId")[0].value;
    document.getElementsByClassName("head_nick")[0].innerText=document.getElementsByName("custNickname")[0].value;
    getRequirement(url_getRequirement)
};

function getRequirement(url_getRequirement) {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    var url_condition = url_getRequirement + "?custId=" + custId;
    xhr.open("GET", url_condition, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = getCondition;
    xhr.send();
}
function getCondition() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var requirement = JSON.parse(xhr.responseText);
        document.getElementById("minAge").innerText = requirement.requMinAge;
        document.getElementById("maxAge").innerText = requirement.requMaxAge;
        document.getElementById("province").innerText = requirement.requProvince;
        document.getElementById("city").innerText = requirement.requCity;
        document.getElementById("minHeight").innerText = requirement.requMinHeight;
        document.getElementById("maxHeight").innerText = requirement.requMaxHeight;
        document.getElementById("marriageHistory").innerText = requirement.requMarriage;
        if (requirement.requHasphoto == 0){
            document.getElementById("photo").innerText = "不限";
        } else if (requirement.requHasphoto ==1){
            document.getElementById("photo").innerText = "有照片";
        } else {
            document.getElementById("photo").innerText = "无照片";
        }
        document.getElementById("education").innerText = requirement.requEducation;
        document.getElementById("salary").innerText = requirement.requIncome;
        document.getElementById("gender").innerText = requirement.requGender;
        document.getElementById("nation").innerText = requirement.requNation;
        document.getElementById("bloodType").innerText = requirement.requBloodType;
        document.getElementById("zodiac").innerText = requirement.requZodiac;
        document.getElementById("constellation").innerText = requirement.requConstellation;
        bindData(requirement);
    }
}
function bindData(requirement) {
    //省份,城市
    $(function(){
        $("#fuck2").citySelect({
            prov:requirement.requProvince,
            city:requirement.requCity
        });
    });
    //最小年龄
    var oldOptions1 = document.getElementById("requMinAge").options;
    for (var j = 0; j < oldOptions1.length; j++) {
        if(oldOptions1[j].text==requirement.requMinAge) {
            oldOptions1[j].selected = "selected";
            break;
        }
    }
    //最大年龄
    var oldOptions2 = document.getElementById("requMaxAge").options;
    for (var j = 0; j < oldOptions2.length; j++) {
        if(oldOptions2[j].text==requirement.requMaxAge) {
            oldOptions2[j].selected = "selected";
            break;
        }
    }
    //婚姻状况
    var oldOptions3 = document.getElementById("requMarriage").options;
    for (var j = 0; j < oldOptions3.length; j++) {
        if(oldOptions3[j].text==requirement.requMarriage) {
            oldOptions3[j].selected = "selected";
            break;
        }
    }
    //最小身高
    var oldOptions4 = document.getElementById("requMinHeight").options;
    for (var j = 0; j < oldOptions4.length; j++) {
        if(oldOptions4[j].text==requirement.requMinHeight) {
            oldOptions4[j].selected = "requMinHeight";
            break;
        }
    }
    //最大身高
    var oldOptions5 = document.getElementById("requMaxHeight").options;
    for (var j = 0; j < oldOptions5.length; j++) {
        if(oldOptions5[j].text==requirement.requMaxHeight) {
            oldOptions5[j].selected = "selected";
            break;
        }
    }
    //学历
    var oldOptions6 = document.getElementById("requEducation").options;
    for (var j = 0; j < oldOptions6.length; j++) {
        if(oldOptions6[j].text==requirement.requEducation) {
            oldOptions6[j].selected = "selected";
            break;
        }
    }
    //有无照片
    var oldOptions7 = document.getElementById("requHasPhoto").options;
    for (var j = 0; j < oldOptions7.length; j++) {
        if(oldOptions7[j].value==requirement.requHasphoto) {
            oldOptions7[j].selected = "selected";
            break;
        }
    }
    //性别
    var oldOptions8 = document.getElementById("requGender").options;
    for (var j = 0; j < oldOptions8.length; j++) {
        if(oldOptions8[j].text==requirement.requGender) {
            oldOptions8[j].selected = "selected";
            break;
        }
    }
    //薪资
    var oldOptions9 = document.getElementById("requIncome").options;
    for (var j = 0; j < oldOptions9.length; j++) {
        if(oldOptions9[j].text==requirement.requIncome) {
            oldOptions9[j].selected = "selected";
            break;
        }
    }
    //民族
    var oldOptions10 = document.getElementById("requNation").options;
    for (var j = 0; j < oldOptions10.length; j++) {
        if(oldOptions10[j].text==requirement.requNation) {
            oldOptions10[j].selected = "selected";
            break;
        }
    }
    //血型
    var oldOptions11 = document.getElementById("requBloodType").options;
    for (var j = 0; j < oldOptions11.length; j++) {
        if(oldOptions11[j].text==requirement.requBloodType) {
            oldOptions11[j].selected = "selected";
            break;
        }
    }
    //生肖
    var oldOptions12 = document.getElementById("requZodiac").options;
    for (var j = 0; j < oldOptions12.length; j++) {
        if(oldOptions12[j].text==requirement.requZodiac) {
            oldOptions12[j].selected = "selected";
            break;
        }
    }
    //星座
    var oldOptions13 = document.getElementById("requConstellation").options;
    for (var j = 0; j < oldOptions13.length; j++) {
        if(oldOptions13[j].text==requirement.requConstellation) {
            oldOptions13[j].selected = "selected";
            break;
        }
    }
}
function updateComdition() {
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    //性别数据
    var obj1 = document.getElementById("requGender");
    var requgender = obj1.options[obj1.selectedIndex].text;
    //最小年龄
    var obj2 = document.getElementById("requMinAge");
    var requminAge = obj2.options[obj2.selectedIndex].text;
    //最大年龄
    var obj3 = document.getElementById("requMaxAge");
    var requmaxAge = obj3.options[obj3.selectedIndex].text;
    //省份
    var obj4 = document.getElementById("requProvince");
    var requprovince = obj4.options[obj4.selectedIndex].text;
    //城市
    var obj5 = document.getElementById("requCity");
    var requcity = obj5.options[obj5.selectedIndex].text;
    //最小身高
    var obj6 = document.getElementById("requMinHeight");
    var requminHeight = obj6.options[obj6.selectedIndex].text;
    //最大身高
    var obj7 = document.getElementById("requMaxHeight");
    var requmaxHeight = obj7.options[obj7.selectedIndex].text;
    //是否结婚
    var obj8 = document.getElementById("requMarriage");
    var requmarriage = obj8.options[obj8.selectedIndex].text;
    //学历
    var obj9 = document.getElementById("requEducation");
    var requeducation = obj9.options[obj9.selectedIndex].text;
    //薪资
    var obj10 = document.getElementById("requIncome");
    var requincome = obj10.options[obj10.selectedIndex].text;
    //是否有照片
    var obj11 = document.getElementById("requHasphoto");
    var requhasphoto = obj11.options[obj11.selectedIndex].value;
    //民族
    var obj12 = document.getElementById("requNation");
    var requnation = obj12.options[obj12.selectedIndex].text;
    //血型
    var obj13 = document.getElementById("requBloodType");
    var requbloodType = obj13.options[obj13.selectedIndex].text;
    //生肖
    var obj14 = document.getElementById("requZodiac");
    var requzodiac = obj14.options[obj14.selectedIndex].text;
    //星座
    var obj15 = document.getElementById("requConstellation");
    var requconstellation = obj15.options[obj15.selectedIndex].text;

    var custid = document.getElementsByName("custId")[0].value;
    var formdata = "requGender=" + requgender + "&requMinAge=" + requminAge
        + "&requMaxAge=" + requmaxAge + "&requProvince=" + requprovince
        + "&requCity=" + requcity + "&requMinHeight=" + requminHeight
        + "&requMaxHeight=" + requmaxHeight + "&requMarriage=" + requmarriage
        + "&requEducation=" + requeducation + "&requIncome=" + requincome
        + "&requHasPhoto=" + requhasphoto + "&requNation=" + requnation
        + "&requBloodType=" + requbloodType + "&requZodiac=" + requzodiac
        + "&requConstellation=" + requconstellation + "&custId=" + custid;
    xhr.open("POST", url_updateCondition, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    xhr.onreadystatechange = condition;
    xhr.send(formdata);
}
function condition() {
    if (xhr.readyState == 4 && xhr.status == 200){
        var result = JSON.parse(xhr.responseText);
        if (result != 0){
            getRequirement(url_getRequirement)
        }else{
            alert("提交失败")
        }
    }
}