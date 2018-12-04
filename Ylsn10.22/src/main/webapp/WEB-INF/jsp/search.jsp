<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: 王德鹏
  Date: 2018/10/26
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>交友_会员搜索_缘来是你交友网</title>
    <style>
        body {background: url(/img/search/body_bg.jpg) repeat scroll 0 0;height: 1800px;}
        .search-wrapper ul li.cur span {background: url(/img/search/i1.png);color: #fff;font: bold 14px/45px "宋体";text-shadow: -1px -1px #BC1337;}
        .search-wrapper ul li span.b2 {background: url(/img/search/i8.png) no-repeat;}
        .search-wrapper ul li span.b3 {background: url(/img/search/i6.png) no-repeat;}
        .search_l {width: 5px;height: 41px;float: left;background: url(/img/search/i4.png) no-repeat;position: relative;z-index: 3;}
        .search_i {width: 486px;height: 41px;float: left;background: url(/img/search/i2.png) repeat-x;position: relative;z-index: 23;}
        .search_i i {display: block;z-index: 10;width: 20px;height: 19px;background: url(/img/search/btn.png) no-repeat scroll -94px -8px;position: absolute;left: 10px;top: 11px;}
        .search_button {display: block;width: 114px;height: 41px;float: left;background: url(/img/search/i3.png) no-repeat;}
        .crumbs {height: 30px;border: 1px solid #cccccc;background: url(/img/search/crumbs.gif) repeat-x scroll 0 0;margin-bottom: 10px;clear: both;}
        .crumbs ul li {float: left;line-height: 30px;background: url(/img/search/crumbs.gif) no-repeat scroll right -32px;padding: 0 25px 0 15px;color: #666;position: relative;font-size: 14px;}
        .crumbs ul li {float: left;line-height: 30px;background: url(/img/search/crumbs.gif) no-repeat scroll right -32px;padding: 0 25px 0 15px;color: #666;position: relative;}
        .hot-label span {display: block;padding-left: 10px;line-height: 26px;font-size: 12px;color: #e97676;background: url(/img/search/hot-label-bg.png) left 0 no-repeat;cursor: pointer;}
        .hot-label-active span,.hot-label:hover span {background: url(/img/search/hot-label-bg.png) no-repeat left -60px;color: #fff}
        .JY-item-arr {position: absolute;top: 9px;background: url(/img/search/new-ar2.png) no-repeat;width: 10px;height: 6px;cursor: pointer;}
        .JY-item-arr {position: absolute;top: 9px;background: url(/img/search/new-ar2.png) no-repeat;width: 10px;height: 6px;cursor: pointer;}
        .JY-px a.x1 i, .JY-px a.x2 i, .JY-px a.x3 i {background-image: url(/img/search/newimg1.jpg);}
        .tel {background: url(/img/search/tel.jpg) no-repeat scroll top;}
        .zshy {background: url(/img/search/icon_zshy.jpg) no-repeat scroll top;}
        #select_box {width: 67px;padding: 0 20px 0 13px;height: 25px;line-height: 24px;background: url(/img/search/dropdownBg.gif) no-repeat;position: relative;z-index: 2;line-height: 24px;}
        .JY-close {display: none;position: absolute;z-index: 3;width: 15px;height: 15px;top: 5px;right: 5px;cursor: pointer;background: url(/img/search/new-close.png) 4px 4px no-repeat rgb(125, 180, 236);}
    </style>
    <link rel="stylesheet" href="/css/search.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery.cityselect.js"></script>
    <script language="javascript" type="text/javascript">
        var mode="all";
        $(document).on('click',function(e){
            var e = e || window.event; //浏览器兼容性
            var elem = e.target || e.srcElement;
            while (elem) { //循环判断至跟节点，防止点击的是div的id=‘test’的子元素
                if (elem.className && elem.className=='JY-item'||elem.className=='JY-item JY-def') {
                    return;
                }
                elem = elem.parentNode;
            }
            hideDiv();
        });

        function hideDiv(){
            for(var i=0;i<$(".JY-title").length;i++){
                document.getElementsByClassName("JY-sp").item(i).style.display="none";
            }
        }

        $(document).on('click',".JY-title",function(e){
            hideDiv();
            document.getElementsByClassName(this.parentNode.getAttribute("data-type")).item(0).style.display="block";
        })

        $(document).on('click',"#JY-more",function(e){
            this.parentNode.style.display="none";
            document.getElementById("moreSelect").style.display="block";
            document.getElementById("collapse").style.display="block";
        })

        $(document).on('click',"#JY-collapse",function(e){
            this.parentNode.style.display="none";
            document.getElementById("moreSelect").style.display="none";
            document.getElementById("more").style.display="block";
        })

        function deleteResult(tag){
            hideDiv();
            $("div[data-type='"+tag+"']").insertAfter($('#moreSel>div:last'));
            var len=$("div[data-type='"+tag+"']").children('div').children('h6').text();
            var sub=len.substring(len.length,len.length-2);
            $("div[data-type='"+tag+"']").children('span').children('b').text(sub);
            login(1);
        }

        $(document).on('click',".JY-sp-b",function(e) {
            var val1 = $(this).prev().children(":first-child").find("option:selected").text();
            if($(this).prev().children(":first-child").is('label')){
                var arr=new Array();
                $(this).prev().children().children("input:checkbox:checked").each(function(){
                    arr.push($(this).val());
                });
                if(arr=="")
                    return;
                var vars=arr.join(",");
                $(this).parent().parent().children(":last-child").parent().children(":first-child").children(":first-child").text(vars);
            }else {
                if ($(this).prev().children(":first-child").siblings().size() == 0) {
                    $(this).parent().parent().children(":last-child").parent().children(":first-child").children(":first-child").text(val1);
                } else {
                    var sp = $(this).prev().children(":last-child").text();
                    var var2 = $(this).prev().children(":last-child").prev().find("option:selected").text();
                    if ($(this).prev().children(":last-child").text() == "") {
                        $(this).parent().parent().children(":last-child").parent().children(":first-child").children(":first-child").text("(来自)" + val1 + "-" + var2);
                    } else {
                        if (var2 == "不限")
                            $(this).parent().parent().children(":last-child").parent().children(":first-child").children(":first-child").text(val1 + sp + "以上");
                        else
                            $(this).parent().parent().children(":last-child").parent().children(":first-child").children(":first-child").text(val1 + "到" + var2 + sp);
                    }
                }
            }
            if($(this).parent().parent().parent().next().text()=="")
                $(this).parent().parent().children(":last-child").parent().insertAfter($("#more").prev().children(":last-child"));
            hideDiv();
            login(1);
        })

        var xhr = null;
        var url_loginuser = "${pageContext.request.contextPath}/search/condition";
        function login(pc) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            var url="pagecode="+pc+"&";
            for(var i=0;i<$(".JY-item").length;i++){
                url+=document.getElementsByClassName("JY-item").item(i).dataset.type+"="+document.getElementsByClassName("JY-title-val").item(i).innerHTML+"&";
            }
            url+="md="+mode;
            xhr.open("POST", url_loginuser, true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
            xhr.onreadystatechange =  processLogin;
            xhr.send(url);
        }

        function  processLogin() {
            if(xhr.readyState==4 && xhr.status ==200 ){
                var result = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr = result.modelList;
                document.getElementById("s_user_num").innerText=result.totalRecord;
                var tbody = document.getElementById("normal_user_container");
                tbody.innerHTML = "";

                for (var i = 0; i < objArr.length; i++) {
                    var imgPath="/Path/"+objArr[i].custPhoto;
                    var age=new Date().getFullYear()-objArr[i].custBirthday.substr(0,4);
                    tbody.innerHTML += (
                    '<li style="z-index: 1;">'+
                        '<div class="hy_box" onclick="">'+
                            '<div class="search_userHead">'+
                                '<a class="openBox os_stat" href="/customer/message?id='+objArr[i].custId+'">'+
                                    '<img src="'+imgPath+'" width="110" height="135">'+
                                '</a>'+
                            '</div>'+
                            '<div class="user_name">'+
                                '<i class="tel" title="手机认证"></i>'+
                                '<i class="zshy" title="钻石会员"></i>'+
                                '<a class="os_stat">'+objArr[i].custNickname+'</a>'+
                            '</div>'+
                            '<div id="18" style="display: none">Mon Sep 01 00:00:00 CST 1997</div>'+
                            '<p class="user_info">'+age+'岁 '+objArr[i].custCity+'<!--21岁 大连--></p>'+
                            '<p class="zhufang">'+
                                '<span>'+objArr[i].custMarriage+'</span>'+
                                '<span>'+objArr[i].custEducation+'</span>'+
                            '</p>'+
                            '<div class="zh_btn">'+
                                '<a class="dzh" href="">'+
                                    '<span class="dzh_text1">打招呼</span>'+
                                '</a>'+
                            '</div>'+
                        '</div>'+
                    '</li>');
                }
                //2. 页码渲染
                var pagearea =   document.getElementById("pagearea");
                pagearea.innerHTML="";
                //首页
                var firHref = 'javascript:login("' + 1 + '")';
                var firPageEle = "<li><a  href='" + firHref + "'> 首页</a></li>";
                pagearea.innerHTML += firPageEle;
                //上一页
                if(result.currentPageCode !=1)  // 不是首页，则显示上一页
                    var url_pre_page = (result.currentPageCode - 1);
                else
                    var url_pre_page = 1;
                var preHref = 'javascript:login("' + url_pre_page + '")';
                var prePageEle = "<li><a  href='" + preHref + "'> 上一页</a></li>";
                pagearea.innerHTML += prePageEle;
                //当前页码
                var currentPageEle = " <li id='select_box' onmousemove='pageMouseOver(this)' onmouseout='pageMouseOut(this)'><strong>第"+result.currentPageCode+"页</strong><div class='pageNo' style='display: none;'></div></li>";
                pagearea.innerHTML+=currentPageEle;
                for(var i=1;i<=result.totalPages;i++)
                    $("div[class='pageNo']").append( '<a href="javascript:login('+i+')">第'+i+'页</a>');
                //下一页
                if(result.currentPageCode != result.totalPages)
                    var url_next_page = (result.currentPageCode+1);
                else
                    var url_next_page = (result.currentPageCode);
                var  nextHref='javascript:login("'+url_next_page+'")';
                var nextPageEle = "<li><a  href='"+nextHref+"'> 下一页</a></li>";
                pagearea.innerHTML+=nextPageEle;
            }
        }

        $(document).ready(function() {
            for(var i=1;i<=${page.totalPages};i++)
                $("div[class='pageNo']").append( '<a href="javascript:login('+i+');">第'+i+'页</a>');
        });

        $(document).ready(function() {
            $("select[name='age1']").change(function () {
                for(var i=18;i<=99;i++)
                    $("select[name='age2'] option[value='"+i+"']").remove();
                for(var j=$(this).val();j<=99;j++)
                    $("select[name='age2']").append("<option value='"+j+"'>"+j+"</option>");
            });
        });

        $(document).ready(function() {
            $("select[name='height1']").change(function () {
                for(var i=140;i<=260;i++)
                    $("select[name='height2'] option[value='"+i+"']").remove();
                for(var j=$(this).val();j<=260;j++)
                    $("select[name='height2']").append("<option value='"+j+"'>"+j+"</option>");
            });
        });

        $(function(){
            $("#city").citySelect({
                prov:"北京",
                city:"东城区"
            });
        });
        /* ---------------------------------------------------------------------*/
        function pageMouseOver(x) {
            x.lastChild.style.display="block";
        }

        function pageMouseOut(x) {
            x.lastChild.style.display="none";
        }

        function blr(x){
            x.value="请输入要搜索的昵称";
            x.style.color="#999";
        }

        function fcs(x){
            x.value="";
            x.style.color="black";
        }

        function newSort(x) {
            $("#JY-px-id").children("a").removeClass("cur");
            mode=x;
            if(mode=="all")
                $("#sort_default").addClass("cur");
            else if(mode=="ml")
                $("#sort_charm").addClass("cur");
            else if(mode=="log")
                $("#sort_last_login").addClass("cur");
            else if(mode=="zc")
                $("#sort_create_time").addClass("cur");
            login(1);
        }
    </script>
</head>
<body>
<c:import url="header.jsp"></c:import>
    <div class="search-wrapper">
        <!--<div class="new_search"><a href="../?old" onclick="javascript:send_jy_pv2('search_v2_c_old')"></a><a href="javascript:void(0);"></a></div>-->
        <ul id="sex_select" class="fn-clear">
            <li id="all_user" class="cur"><span class="b1" >全部会员</span></li>
        </ul>
        <div class="fn-clear">
            <div class="search_l"></div>
            <div class="search_i">
                <input type="text" class="keyword" maxlength="50" value="请输入要搜索的条件" onblur="blr(this)" onfocus="fcs(this)">
                <i class="JY-arr"></i>
            </div>
            <a onclick="mainResult();" class="search_button" href="javascript:void(0);"></a>
        </div>
    </div>
    <div id="ad_pos_pcweb_111" w="970" h="80" style="margin: 0px auto 10px auto;width:970px;">
        <div style="overflow: hidden;width: 970px;height: 80px;" id="jy_advert_3114">
            <a href="" target="_blank">
                <img src="/img/search/1531723472201.jpg" style="border: none;width: 970px;height: 80px;" id="jy_advert_3114_img">
            </a>
        </div>
    </div>
    <div class="search_cont fn-clear">
        <div class="search_left">
            <div class="crumbs">
                <ul class="fn-clear">
                    <li id="showTopType" >全部会员</li>
                    <li class="ls_dzh_add">
                        30天内登录过的会员中，有<i class="JY-arr" id="s_user_num" >${page.totalRecord}</i>人符合条件
                    </li>
                </ul>
            </div>
            <div class="searchResult">
                <!--筛选 start-->
                <!--2013-12-2-->
                <div class="JY-sc">
                    <dl class="JY-selected clear">
                        <dt class="JY-lt">您已选择：</dt>
                        <dd class="JY-selected-list clear">
                            <!--性别-->
                            <div class="JY-item JY-def" data-index="1" data-type="xb">
                            <span class="JY-title">
                                <b class="JY-title-val">${requirement.requGender}</b>
                                <i class="JY-item-arr"></i>
                            </span>
                                <span class="JY-close" onclick="deleteResult('xb')" title="点击&quot;x&quot;取消此项限制"></span>
                                <div class="JY-sp xb" style="display: none;">
                                    <h6 class="JY-sp-t">请选择性别</h6>
                                    <div class="JY-sp-i clear">
                                        <select name="Sex">
                                            <option value="1">男</option>
                                            <option value="2" selected="">女</option>
                                        </select>
                                    </div>
                                    <button class="JY-sp-b" info="xb">确认</button>
                                </div>
                            </div>
                            <!--/性别-->
                            <div class="JY-item" data-index="2" data-type="dq">
                            <span class="JY-title">
                                <b class="JY-title-val">(来自)${requirement.requProvince}-${requirement.requCity}</b>
                                <i class="JY-item-arr"></i>
                            </span>
                                <span class="JY-close" onclick="deleteResult('dq')" title="点击&quot;x&quot;取消此项限制"></span>
                                <div class="JY-sp dq" style="display: none;">
                                    <h6>请选择地区</h6>
                                    <div class="JY-sp-i clear" id="city">
                                        <select name="dq-Province" class="prov"></select>
                                        <span></span>
                                        <select name="dq-City" class="city" disabled="disabled"></select>
                                        <span></span>
                                    </div>
                                    <button class="JY-sp-b" info="dq">确认</button>
                                </div>
                            </div><div class="JY-item" data-index="3" data-type="nl">
                            <span class="JY-title">
                                <b class="JY-title-val">${requirement.requMinAge}到${requirement.requMaxAge}岁</b>
                                <i class="JY-item-arr"></i>
                            </span>
                            <span class="JY-close" onclick="deleteResult('nl')" title="点击&quot;x&quot;取消此项限制"></span>
                            <div class="JY-sp nl" style="display: none;">
                                <h6>请选择年龄</h6>
                                <div class="JY-sp-i clear">
                                    <select name="age1">
                                        <option value="18" selected="selected">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                        <option value="32">32</option>
                                        <option value="33">33</option>
                                        <option value="34">34</option>
                                        <option value="35">35</option>
                                        <option value="36">36</option>
                                        <option value="37">37</option>
                                        <option value="38">38</option>
                                        <option value="39">39</option>
                                        <option value="40">40</option>
                                        <option value="41">41</option>
                                        <option value="42">42</option>
                                        <option value="43">43</option>
                                        <option value="44">44</option>
                                        <option value="45">45</option>
                                        <option value="46">46</option>
                                        <option value="47">47</option>
                                        <option value="48">48</option>
                                        <option value="49">49</option>
                                        <option value="50">50</option>
                                        <option value="51">51</option>
                                        <option value="52">52</option>
                                        <option value="53">53</option>
                                        <option value="54">54</option>
                                        <option value="55">55</option>
                                        <option value="56">56</option>
                                        <option value="57">57</option>
                                        <option value="58">58</option>
                                        <option value="59">59</option>
                                        <option value="60">60</option>
                                        <option value="61">61</option>
                                        <option value="62">62</option>
                                        <option value="63">63</option>
                                        <option value="64">64</option>
                                        <option value="65">65</option>
                                        <option value="66">66</option>
                                        <option value="67">67</option>
                                        <option value="68">68</option>
                                        <option value="69">69</option>
                                        <option value="70">70</option>
                                        <option value="71">71</option>
                                        <option value="72">72</option>
                                        <option value="73">73</option>
                                        <option value="74">74</option>
                                        <option value="75">75</option>
                                        <option value="76">76</option>
                                        <option value="77">77</option>
                                        <option value="78">78</option>
                                        <option value="79">79</option>
                                        <option value="80">80</option>
                                        <option value="81">81</option>
                                        <option value="82">82</option>
                                        <option value="83">83</option>
                                        <option value="84">84</option>
                                        <option value="85">85</option>
                                        <option value="86">86</option>
                                        <option value="87">87</option>
                                        <option value="88">88</option>
                                        <option value="89">89</option>
                                        <option value="90">90</option>
                                        <option value="91">91</option>
                                        <option value="92">92</option>
                                        <option value="93">93</option>
                                        <option value="94">94</option>
                                        <option value="95">95</option>
                                        <option value="96">96</option>
                                        <option value="97">97</option>
                                        <option value="98">98</option>
                                        <option value="99">99</option>
                                    </select>
                                    <span class="JY-t">至</span>
                                    <select name="age2"><option value="0">不限</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23" selected="selected">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option><option value="64">64</option><option value="65">65</option><option value="66">66</option><option value="67">67</option><option value="68">68</option><option value="69">69</option><option value="70">70</option><option value="71">71</option><option value="72">72</option><option value="73">73</option><option value="74">74</option><option value="75">75</option><option value="76">76</option><option value="77">77</option><option value="78">78</option><option value="79">79</option><option value="80">80</option><option value="81">81</option><option value="82">82</option><option value="83">83</option><option value="84">84</option><option value="85">85</option><option value="86">86</option><option value="87">87</option><option value="88">88</option><option value="89">89</option><option value="90">90</option><option value="91">91</option><option value="92">92</option><option value="93">93</option><option value="94">94</option><option value="95">95</option><option value="96">96</option><option value="97">97</option><option value="98">98</option><option value="99">99</option></select>
                                    <span>岁</span>
                                </div>
                                <button class="JY-sp-b" info="nl">确认</button>
                            </div>
                        </div><div class="JY-item" data-index="4" data-type="sg">
                            <span class="JY-title">
                                <b class="JY-title-val">${requirement.requMinHeight}到${requirement.requMaxHeight}厘米</b>
                                <i class="JY-item-arr"></i>
                            </span>
                            <span class="JY-close" onclick="deleteResult('sg')" title="点击&quot;x&quot;取消此项限制"></span>
                            <div class="JY-sp sg" style="display: none;">
                                <h6>请选择身高</h6>
                                <div class="JY-sp-i clear">
                                    <select name="height1">
                                        <option value="140" selected="selected">140</option>
                                        <option value="141">141</option>
                                        <option value="142">142</option>
                                        <option value="143">143</option>
                                        <option value="144">144</option>
                                        <option value="145">145</option>
                                        <option value="146">146</option>
                                        <option value="147">147</option>
                                        <option value="148">148</option>
                                        <option value="149">149</option>
                                        <option value="150">150</option>
                                        <option value="151">151</option>
                                        <option value="152">152</option>
                                        <option value="153">153</option>
                                        <option value="154">154</option>
                                        <option value="155">155</option>
                                        <option value="156">156</option>
                                        <option value="157">157</option>
                                        <option value="158">158</option>
                                        <option value="159">159</option>
                                        <option value="160">160</option>
                                        <option value="161">161</option>
                                        <option value="162">162</option>
                                        <option value="163">163</option>
                                        <option value="164">164</option>
                                        <option value="165">165</option>
                                        <option value="166">166</option>
                                        <option value="167">167</option>
                                        <option value="168">168</option>
                                        <option value="169">169</option>
                                        <option value="170">170</option>
                                        <option value="171">171</option>
                                        <option value="172">172</option>
                                        <option value="173">173</option>
                                        <option value="174">174</option>
                                        <option value="175">175</option>
                                        <option value="176">176</option>
                                        <option value="177">177</option>
                                        <option value="178">178</option>
                                        <option value="179">179</option>
                                        <option value="180">180</option>
                                        <option value="181">181</option>
                                        <option value="182">182</option>
                                        <option value="183">183</option>
                                        <option value="184">184</option>
                                        <option value="185">185</option>
                                        <option value="186">186</option>
                                        <option value="187">187</option>
                                        <option value="188">188</option>
                                        <option value="189">189</option>
                                        <option value="190">190</option>
                                        <option value="191">191</option>
                                        <option value="192">192</option>
                                        <option value="193">193</option>
                                        <option value="194">194</option>
                                        <option value="195">195</option>
                                        <option value="196">196</option>
                                        <option value="197">197</option>
                                        <option value="198">198</option>
                                        <option value="199">199</option>
                                        <option value="200">200</option>
                                        <option value="201">201</option>
                                        <option value="202">202</option>
                                        <option value="203">203</option>
                                        <option value="204">204</option>
                                        <option value="205">205</option>
                                        <option value="206">206</option>
                                        <option value="207">207</option>
                                        <option value="208">208</option>
                                        <option value="209">209</option>
                                        <option value="210">210</option>
                                        <option value="211">211</option>
                                        <option value="212">212</option>
                                        <option value="213">213</option>
                                        <option value="214">214</option>
                                        <option value="215">215</option>
                                        <option value="216">216</option>
                                        <option value="217">217</option>
                                        <option value="218">218</option>
                                        <option value="219">219</option>
                                        <option value="220">220</option>
                                        <option value="221">221</option>
                                        <option value="222">222</option>
                                        <option value="223">223</option>
                                        <option value="224">224</option>
                                        <option value="225">225</option>
                                        <option value="226">226</option>
                                        <option value="227">227</option>
                                        <option value="228">228</option>
                                        <option value="229">229</option>
                                        <option value="230">230</option>
                                        <option value="231">231</option>
                                        <option value="232">232</option>
                                        <option value="233">233</option>
                                        <option value="234">234</option>
                                        <option value="235">235</option>
                                        <option value="236">236</option>
                                        <option value="237">237</option>
                                        <option value="238">238</option>
                                        <option value="239">239</option>
                                        <option value="240">240</option>
                                        <option value="241">241</option>
                                        <option value="242">242</option>
                                        <option value="243">243</option>
                                        <option value="244">244</option>
                                        <option value="245">245</option>
                                        <option value="246">246</option>
                                        <option value="247">247</option>
                                        <option value="248">248</option>
                                        <option value="249">249</option>
                                        <option value="250">250</option>
                                        <option value="251">251</option>
                                        <option value="252">252</option>
                                        <option value="253">253</option>
                                        <option value="254">254</option>
                                        <option value="255">255</option>
                                        <option value="256">256</option>
                                        <option value="257">257</option>
                                        <option value="258">258</option>
                                        <option value="259">259</option>
                                        <option value="260">260</option>
                                    </select>
                                    <span class="JY-t">至</span>
                                    <select name="height2"><option value="0">不限</option><option value="140">140</option><option value="141">141</option><option value="142">142</option><option value="143">143</option><option value="144">144</option><option value="145">145</option><option value="146">146</option><option value="147">147</option><option value="148">148</option><option value="149">149</option><option value="150">150</option><option value="151">151</option><option value="152">152</option><option value="153">153</option><option value="154">154</option><option value="155">155</option><option value="156">156</option><option value="157">157</option><option value="158">158</option><option value="159">159</option><option value="160">160</option><option value="161">161</option><option value="162">162</option><option value="163">163</option><option value="164">164</option><option value="165">165</option><option value="166">166</option><option value="167">167</option><option value="168">168</option><option value="169">169</option><option value="170">170</option><option value="171">171</option><option value="172">172</option><option value="173">173</option><option value="174">174</option><option value="175">175</option><option value="176">176</option><option value="177">177</option><option value="178">178</option><option value="179">179</option><option value="180">180</option><option value="181">181</option><option value="182">182</option><option value="183">183</option><option value="184">184</option><option value="185">185</option><option value="186">186</option><option value="187">187</option><option value="188">188</option><option value="189">189</option><option value="190">190</option><option value="191">191</option><option value="192">192</option><option value="193">193</option><option value="194">194</option><option value="195">195</option><option value="196">196</option><option value="197">197</option><option value="198">198</option><option value="199">199</option><option value="200">200</option><option value="201">201</option><option value="202">202</option><option value="203">203</option><option value="204">204</option><option value="205">205</option><option value="206">206</option><option value="207">207</option><option value="208">208</option><option value="209">209</option><option value="210">210</option><option value="211">211</option><option value="212">212</option><option value="213">213</option><option value="214">214</option><option value="215">215</option><option value="216">216</option><option value="217">217</option><option value="218">218</option><option value="219">219</option><option value="220">220</option><option value="221">221</option><option value="222">222</option><option value="223">223</option><option value="224">224</option><option value="225">225</option><option value="226">226</option><option value="227">227</option><option value="228">228</option><option value="229">229</option><option value="230">230</option><option value="231">231</option><option value="232">232</option><option value="233">233</option><option value="234">234</option><option value="235">235</option><option value="236">236</option><option value="237">237</option><option value="238">238</option><option value="239">239</option><option value="240">240</option><option value="241">241</option><option value="242">242</option><option value="243">243</option><option value="244">244</option><option value="245">245</option><option value="246">246</option><option value="247">247</option><option value="248">248</option><option value="249">249</option><option value="250">250</option><option value="251">251</option><option value="252">252</option><option value="253">253</option><option value="254">254</option><option value="255">255</option><option value="256">256</option><option value="257">257</option><option value="258">258</option><option value="259">259</option><option value="260">260</option></select>
                                    <span>厘米</span>
                                </div>
                                <button class="JY-sp-b" info="sg">确认</button>
                            </div>
                        </div><div id="ihasPhoto" info="23" class="JY-item" data-index="23" data-type="zp">
                            <span class="JY-title">
                                <b class="JY-title-val">${requPhoto}</b>
                                <i class="JY-item-arr"></i>
                            </span>
                            <span class="JY-close" onclick="deleteResult('zp')" title="点击&quot;x&quot;取消此项限制"></span>
                            <div class="JY-sp zp" style="display: none;">
                                <h6>请选择照片</h6>
                                <div class="JY-sp-i clear">
                                    <select name="hasPhoto">
                                        <option value="1" selected="selected">有照片</option>
                                    </select>
                                </div>
                                <button class="JY-sp-b" info="zp">确认</button>
                            </div>
                        </div></dd>
                        <dd id="more" class="mb10" style="display: block;">
                            <a id="JY-more" class="JY-add" href="javascript:void(0)">设置更多条件</a>
                        </dd>
                    </dl>
                    <!---------------------------------------------------------------------------------------------------------->
                    <dl id="moreSelect" class="JY-select clear" style="display: none;">
                        <dt class="JY-lt">更多选择：</dt>
                        <dd id="more_to_sel" class="JY-select-list clear">
                            <!--地区-->

                            <!--/地区-->
                            <!--年龄-->

                            <!--/年龄-->
                            <!--身高-->

                            <!--/身高-->
                            <!--婚史-->
                            <div id="moreSel">
                                <div style="display: none;"></div>
                                <div class="JY-item" data-index="5" data-type="hs">
                        <span class="JY-title">
                            <b class="JY-title-val">婚史</b>
                            <i class="JY-item-arr"></i>
                        </span>
                                    <span class="JY-close" onclick="deleteResult('hs')" title="点击&quot;x&quot;取消此项限制"></span>
                                    <div class="JY-sp hs" style="display: none;">
                                        <h6>请选择婚史</h6>
                                        <div class="JY-sp-i clear">
                                            <select name="Marital">
                                                <option value="1">未婚</option>
                                                <option value="2">离异</option>
                                                <option value="3">丧偶</option>
                                            </select>
                                        </div>
                                        <button class="JY-sp-b" info="hs">确认</button>
                                    </div>
                                </div>
                                <!--/婚史-->
                                <!--学历-->
                                <div class="JY-item" data-index="6" data-type="xl">
                            <span class="JY-title">
                                <b class="JY-title-val">学历</b>
                                <i class="JY-item-arr"></i>
                            </span>
                                    <span class="JY-close" onclick="deleteResult('xl')" title="点击&quot;x&quot;取消此项限制"></span>
                                    <div class="JY-sp xl" style="display: none;">
                                        <h6 class="JY-sp-t">请选择学历</h6>
                                        <div class="JY-sp-i JY-ys clear">
                                            <select name="Educational">
                                                <option value="0">初中</option>
                                                <option value="10">中专/职高/技校</option>
                                                <option value="20">高中</option>
                                                <option value="50">大专</option>
                                                <option value="40">本科</option>
                                                <option value="50">硕士</option>
                                                <option value="60">博士</option>
                                                <option value="70">博士后</option>
                                            </select>
                                        </div>
                                        <button class="JY-sp-b" info="xl">确认</button>
                                    </div>
                                </div>
                                <!--/学历-->
                                <!--月薪-->
                                <div class="JY-item" data-index="7" data-type="yx">
                        <span class="JY-title">
                            <b class="JY-title-val">月薪</b>
                            <i class="JY-item-arr"></i>
                        </span>
                                    <span class="JY-close" onclick="deleteResult('yx')" title="点击&quot;x&quot;取消此项限制"></span>
                                    <div class="JY-sp yx" style="display: none;">
                                        <h6 class="JY-sp-t">请选择月薪</h6>
                                        <div class="JY-sp-i  JY-ys clear">
                                            <select name="Salary">
                                                <option value="10">2000以下</option>
                                                <option value="20">2000-5000</option>
                                                <option value="30">5000-10000</option>
                                                <option value="40">10000-20000</option>
                                                <option value="50">20000以上</option>
                                            </select>
                                        </div>
                                        <button class="JY-sp-b" info="yx">确认</button>
                                    </div>
                                </div>
                                <!--/月薪-->
                                <!--民族-->
                                <div class="JY-item" data-index="15" data-type="mz">
                        <span class="JY-title">
                            <b class="JY-title-val">民族</b>
                            <i class="JY-item-arr"></i>
                        </span>
                                    <span class="JY-close" onclick="deleteResult('mz')" title="点击&quot;x&quot;取消此项限制"></span>
                                    <div class="JY-sp mz" style="display: none;">
                                        <h6>请选择民族</h6>
                                        <div class="JY-sp-i clear">
                                            <select name="Nation">
                                                <option value="1">汉族</option>
                                                <option value="2">藏族</option>
                                                <option value="3">朝鲜族</option>
                                                <option value="4">蒙古族</option>
                                                <option value="5">回族</option>
                                                <option value="6">满族</option>
                                                <option value="7">维吾尔族</option>
                                                <option value="8">壮族</option>
                                                <option value="9">彝族</option>
                                                <option value="10">苗族</option>
                                                <option value="11">其它</option>
                                            </select>
                                        </div>
                                        <button class="JY-sp-b" info="mz">确认</button>
                                    </div>
                                </div>
                                <!--/民族-->
                                <!--血型-->
                                <div class="JY-item" data-index="16" data-type="xx">
                            <span class="JY-title">
                                <b class="JY-title-val">血型</b>
                                <i class="JY-item-arr"></i>
                            </span>
                                    <span class="JY-close" onclick="deleteResult('xx')" title="点击&quot;x&quot;取消此项限制"></span>
                                    <div class="JY-sp xx" style="display: none;">
                                        <h6>请选择血型</h6>
                                        <div class="JY-sp-i clear">
                                            <select name="Blood">
                                                <option value="1">A型</option>
                                                <option value="2">B型</option>
                                                <option value="3">O型</option>
                                                <option value="4">AB型</option>
                                            </select>
                                        </div>
                                        <button class="JY-sp-b" info="xx">确认</button>
                                    </div>
                                </div>
                                <!--/血型-->
                                <!--生肖-->
                                <div id="sel_sx" class="JY-item" data-index="17" data-type="sx">
                        <span class="JY-title">
                            <b class="JY-title-val">生肖</b>
                            <i class="JY-item-arr"></i>
                        </span>
                                    <span class="JY-close" onclick="deleteResult('sx')" title="点击&quot;x&quot;取消此项限制"></span>
                                    <div class="JY-sp sx" style="display: none;">
                                        <h6>请选择生肖</h6>
                                        <div class="JY-sp-i JY-la pb0 clear" id="zodiac"><label><input type="checkbox" name="sx" value="龙"><span>龙</span></label><label><input type="checkbox" name="sx" value="兔"><span>兔</span></label><label><input type="checkbox" name="sx" value="虎"><span>虎</span></label><label><input type="checkbox" name="sx" value="牛"><span>牛</span></label><label><input type="checkbox" name="sx" value="鼠"><span>鼠</span></label><label><input type="checkbox" name="sx" value="猪"><span>猪</span></label><label><input type="checkbox" name="sx" value="狗"><span>狗</span></label></div>
                                        <button class="JY-sp-b" info="sx">确认</button>
                                    </div>
                                </div>
                                <!--/生肖-->
                                <!--星座-->
                                <div class="JY-item" data-index="18" data-type="xz">
                            <span class="JY-title">
                                <b class="JY-title-val">星座</b>
                                <i class="JY-item-arr"></i>
                            </span>
                                    <span class="JY-close" onclick="deleteResult('xz')" title="点击&quot;x&quot;取消此项限制"></span>
                                    <div class="JY-sp xz" style="display: none;">
                                        <h6>请选择星座</h6>
                                        <div class="JY-sp-i JY-la pb0 clear">
                                            <label><input value="白羊座" type="checkbox" name="xz"><span>白羊座</span></label>
                                            <label><input value="金牛座" type="checkbox" name="xz"><span>金牛座</span></label>
                                            <label><input value="双子座" type="checkbox" name="xz"><span>双子座</span></label>
                                            <label><input value="巨蟹座" type="checkbox" name="xz"><span>巨蟹座</span></label>
                                            <label><input value="狮子座" type="checkbox" name="xz"><span>狮子座</span></label>
                                            <label><input value="处女座" type="checkbox" name="xz"><span>处女座</span></label>
                                            <label><input value="天秤座" type="checkbox" name="xz"><span>天秤座</span></label>
                                            <label><input value="天蝎座" type="checkbox" name="xz"><span>天蝎座</span></label>
                                            <label><input value="射手座" type="checkbox" name="xz"><span>射手座</span></label>
                                            <label><input value="摩羯座" type="checkbox" name="xz"><span>魔羯座</span></label>
                                            <label><input value="水瓶座" type="checkbox" name="xz"><span>水瓶座</span></label>
                                            <label><input value="双鱼座" type="checkbox" name="xz"><span>双鱼座</span></label>
                                        </div>
                                        <button class="JY-sp-b" info="xz">确认</button>
                                    </div>
                                </div>
                            </div>
                            <!--/星座-->
                        </dd>
                        <dd id="collapse" class="mb10" style="display: none">
                            <a id="JY-collapse" class="JY-add" href="javascript:void(0)">收起</a>
                        </dd>
                    </dl>
                </div>
                <div class="JY-filter">
                    <ul class="clear JY-filter-2" >
                        <li class="JY-px" id="JY-px-id">
                            <a class="" id="sort_default" href="javascript:void(0);" onclick="newSort('all')" >综合排序</a>
                            <a class="x1" id="sort_charm" href="javascript:void(0);" onclick="newSort('ml')"  title="人气值由高到低">人气值<i></i></a>
                            <a class="x2" id="sort_last_login" href="javascript:void(0);" onclick="newSort('log')"  title="最近登录时间由近到远">登录时间<i></i></a>
                            <a class="x3" id="sort_create_time" href="javascript:void(0);" onclick="newSort('zc')"  title="注册时间由近到远">注册时间<i></i></a>
                        </li>
                    </ul>
                </div>
                <div class="fixed_heigh" style="height:1278px;">
                    <ul class="user_list fn-clear" id="normal_user_container" style="position: relative; z-index: 1;">
                        <c:forEach items="${page.modelList}" var="pageArr">
                            <li style="z-index: 1;">
                                <div class="hy_box" onclick="">
                                    <div class="search_userHead">
                                        <a class="openBox os_stat" href="${pageContext.request.contextPath}/customer/message?id=${pageArr.custId}">
                                            <img src="/Path/${pageArr.custPhoto}" width="110" height="135">
                                        </a>
                                    </div>
                                    <div class="user_name">
                                        <i class="tel" title="手机认证"></i>
                                        <i class="zshy" title="钻石会员"></i>
                                        <a class="os_stat">${pageArr.custNickname}</a>
                                    </div>
                                    <div id="${pageArr.custId}" style="display: none">${pageArr.custBirthday}</div>
                                    <p class="user_info">岁 ${pageArr.custCity}</p>
                                    <p class="zhufang">
                                        <span>${pageArr.custMarriage}</span>
                                        <span>${pageArr.custEducation}</span>
                                    </p>
                                    <div class="zh_btn">
                                        <a class="dzh" href="" >
                                            <span class="dzh_text1">打招呼</span>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <script>
                                var date=document.getElementById("${pageArr.custId}").innerText;
                                document.getElementById("${pageArr.custId}").nextElementSibling.innerHTML=new Date().getFullYear()-date.substr(date.length-4)+document.getElementById("${pageArr.custId}").nextElementSibling.innerHTML;
                            </script>
                        </c:forEach>
                    </ul>
                    <c:choose>
                        <c:when test="${page1.currentPageCode > 1 }">
                            <a class="prev_page fixPNG" href="${pageContext.request.contextPath}/activity/signuplist?pagecode=${page1.currentPageCode-1}&tag=1"></a>
                        </c:when>
                        <c:otherwise>
                            <span class="prev_page fixPNG"></span>
                        </c:otherwise>
                    </c:choose>
                    <div class="pageclass">
                        <ol id="pagearea">
                            <li><a href="javascript:login(1);">首页</a></li>
                            <c:choose>
                                <c:when test="${page.currentPageCode != 1 }">
                                    <li><a href="javascript:login(${page.currentPageCode}-1);">上一页</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="javascript:login(1);">上一页</a></li>
                                </c:otherwise>
                            </c:choose>
                            <li id="select_box" onmousemove="pageMouseOver(this)" onmouseout="pageMouseOut(this)"><strong>第1页</strong><div class="pageNo" style="display: none;"></div></li>
                            <c:choose>
                                <c:when test="${page.currentPageCode != page.totalPages }">
                                    <li><a href="javascript:login(${page.currentPageCode}+1);">下一页</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="javascript:login(${page.totalPages});">下一页</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
