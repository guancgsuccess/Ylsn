/**
 * Created by chen on 2018/10/14 0014.
 */
// 样式修改
function selectedTitle(ele){
    //其他的样式 恢复原样
    var shipNoArr =  document.getElementsByClassName("message");
    for(var i =0;i<shipNoArr.length;i++){

        if(ele.innerText ==  shipNoArr[i].innerText){
            ele.style.color ="#ff8758";
        }else{
            shipNoArr[i].style.color ="#666";
        }
    }
    return ele.innerText;
}











