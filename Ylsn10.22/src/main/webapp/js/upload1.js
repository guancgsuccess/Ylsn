window.onload=function upload() {

}
$(document).ready(function(){

    getPhotoList();
    timeFormat();
});
function Trim(x) {
    return x.replace(/^\s+|\s+$/gm,'');
}

function dosubmit()
{
    var subject = Trim(document.getElementById("subject").value);
    var meetdetail = Trim(document.getElementById("historyContentId").value);
    if (subject==''){
        alert("请输入故事主题！");
        document.contentForm.subject.value='';
        document.contentForm.subject.focus();
        return;
    }
    if(subject.length>20){
        alert("故事主题文字过长！");
        return ;
    }
    if (meetdetail==''){
        alert("请输入故事内容！");
        document.contentForm.meetdetail.value='';
        document.contentForm.meetdetail.focus();
        return;
    }

    document.contentForm.submit();

}

function timeFormat() {
    var date=document.getElementsByName("happTimeFormat")[0].value;
    document.getElementsByName("happTime")[0].value=new Date(date).getFullYear()+"-"+new Date(date).getMonth()+"-"+new Date(date).getDay();
}
function preview(obj){
    var files=/\.bmp$|\.BMP$|\.gif$|\.jpg$|\.png$|\.PNG$|\.jpeg$|\.JPEG$|\.GIF$|\.JPG$\b/;
    var photoPath=obj.value;
    if(!files.test(photoPath)){
        alert("请指定正确的图片文件，只能上传gif、jpg、bmp、png、jpeg类型图片");
        document.uplaodphotoform.reset();
        return;
    }
}
function checkphotoform(){
    var photoPath1 = document.getElementById("fileData1").value;
    var photodesc1 = document.getElementById("desc").value;
    if(Trim(photoPath1)==''){
        alert("请选择照片！");
        return false;
    }
    if(Trim(photoPath1)!=''){
        if(!checkPhotoPath(photoPath1)){
            alert("请指定正确的照片文件，只能上传gif、jpg、bmp、png、jpeg类型照片！");
            return false;
        }
        if(Trim(photodesc1)==''){
            alert("照片说明不能为空！");
            document.getElementById("desc").focus();
            return false;
        }
    }
    if(document.getElementById("agreepro").checked!=true){
        alert("请阅读并同意珍爱网服务条款！");
        document.getElementById("agreepro").focus();
        return false;
    }
    return true;
}

function setDefaultlovestoryPhoto(photoName,a){
    if (a.checked) return false;
    if(confirm("您真的要将此照片设为首页照吗？")){
        var url = "/happiness/HomePhoto/"+photoName;
        $.ajax({
            url: url,
            success:function(data){
                alert(data);
                getPhotoList();
            }
        });
    } else {
        return false;
    }
    return true;
}
function checkPhotoPath(photoPath){
    var files=/\.bmp$|\.BMP$|\.gif$|\.jpg$|\.png$|\.PNG$|\.jpeg$|\.JPEG$|\.GIF$|\.JPG$\b/;
    if(!files.test(photoPath)){
        return false;
    }
    return true;
}

function deletePhoto(photoName) {
    alert("wsedfrghj");
    var url='/happiness/deletePhoto/'+photoName;
    $.ajax({
        url: url,
        success:function(data){
            alert(data);
            getPhotoList();
        }
    });
}

var xhr = null;
function getPhotoList() {

    var url="/happiness/getPhotoList";
    if (window.XMLHttpRequest) {
        xhr = new XMLHttpRequest();
    } else {
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET", url, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = loadPhoto;
    xhr.send();
}


function loadPhoto() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var photoPathList = JSON.parse(xhr.responseText);
        var photoListDIV = document.getElementById("newStoryPhotoListDIV");
        photoListDIV.innerHTML = "";
        if (photoPathList != null) {
            //1. 数据渲染
            var urlImg = '';
            for (var i = 0; i < photoPathList.length; i++) {
                urlImg = "/Path/" + photoPathList[i];
                var photoName="'"+photoPathList[i]+"'";
                photoListDIV.innerHTML +=
                    '     <title></title>' +
                    '     <div class="BrowsepicBox"><img src="' + urlImg + '"></div>'
                if(photoName.toString().split(".")[1]=="jpg'")
                    photoListDIV.innerHTML += '<input type="radio"  name="radiobutton" checked="checked"  onmousedown="return setDefaultlovestoryPhoto(' + photoName + ',this);">设为首页照 &nbsp; &nbsp;'
                else
                    photoListDIV.innerHTML+= ' <input type="radio"  name="radiobutton"  onmousedown="return setDefaultlovestoryPhoto(' + photoName + ',this);">设为首页照 &nbsp; &nbsp;'

                photoListDIV.innerHTML+=   '<a href="javascript:void(0)" class="textRight underlines lred04" onclick="deletePhoto('+photoName+')">删除</a>'

            }
        }
    }
}


function textCounter(field,countfield,leavingsfield,maxlimit) {

    if (field.value.length > maxlimit) // if too long...trim it!
    {
        field.value = field.value.substring(0, maxlimit);
        alert(" 限3000字内！");
    } else {
        //leavingsfield.innerHTML=maxlimit - field.value.length;
        document.getElementById(countfield).innerHTML=field.value.length;
    }
}
function checksubject(){
    var subject=document.getElementById("subject").value;
    if(subject!=null&&subject!="")
        if(subject.length>20)
        {
            alert("故事主题输入过长");
            document.getElementById("subject").focus();
            return ;
        }
}

//解决如果事先有的文字的计数
function initTextAreaStrCounts(){
    var areaStr = document.getElementById("historyContentId").value;
    if (null == areaStr || "" == Trim(areaStr)) {
        document.getElementById("counter2").innerHTML = 0;
        return;
    }
    document.getElementById("counter2").innerHTML = areaStr.length;
}

function fileUpload() {

    var formData = new FormData();
    formData.append('fileData1',  $('#fileData1')[0].files[0]);

    if(!validate_img($('#fileData1'))){
        return;
    }

    $.ajax({

        url: '/happiness/uploadPhoto',
        type: 'POST',
        cache: false,
        data: formData,
        processData: false,
        contentType: false,
        beforeSend:function(){

        },

        success:function(data){
            alert(data);
            getPhotoList();
        },

        error:function(){

        }

    });

}


//限制上传文件的类型和大小
function validate_img(ele){
    // 返回 KB，保留小数点后两位
    //alert((ele.files[0].size/(1024*1024)).toFixed(2));
    var file = ele.val();
    if(!/.(gif|jpg|jpeg|png|GIF|JPG|bmp|PNG)$/.test(file)){

        alert("图片类型必须是.gif,jpeg,jpg,png,bmp,PNG,GIF,JPG中的一种");
        return false;
    }else{
        //alert((ele.files[0].size).toFixed(2));
        //返回Byte(B),保留小数点后两位
        if(((ele[0].files[0].size).toFixed(2))>=(2*1024*1024)){

            alert("请上传小于2M的图片");
            return false;
        }else  return true;
    }
    return false;

}
