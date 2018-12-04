<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2018/10/29 0029
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>修改资料</title>

    <link href="http://static3.baihe.com/public.css" rel="stylesheet" type="text/css" />
    <link href="http://static3.baihe.com/leftNav.css" rel="stylesheet" type="text/css" />
    <link href="http://static3.baihe.com/formStyle.css" rel="stylesheet" type="text/css" />
    <!--<link href="http://static3.baihe.com/myData.css" rel="stylesheet" type="text/css" />-->

    <link href="${pageContext.request.contextPath}/css/myData.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://static4.baihe.com/3rd-lib/jquery-1.8.3.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://static4.baihe.com/3rd-lib/jquery.select-1.3.6.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://static4.baihe.com/common/city.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://static4.baihe.com/3rd-lib/district.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://static4.baihe.com/common/baihe.js" charset="utf-8"></script>
    <script src="http://static4.baihe.com/common/tongji-1.0.1.min.js" type="text/javascript" charset="utf-8"></script>

    <!--<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>-->
    <script src="${pageContext.request.contextPath}/js/select.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/register.js" type="text/javascript"></script>
    <style>
        .form-group{
            display: inline-block;
        }
        #province,#city,#town,#year,#month,#days{
            width: 80px;
            height: 26px;
            border: 1px solid #bdbdbd;
        }
        select{
            width: 150px;
            height: 26px;
            border: 1px solid #bdbdbd;
        }
    </style>
</head>
<body>
<script type="text/javascript" >
    window.onload=function () {
         var  date=document.getElementById("birthday").value ;
        var dates = new Date(date);
        var year =dates.getFullYear();//获取完整的年份(4位,1970-????)
        var month = dates.getMonth() + 1;//获取当前月份(0-11,0代表1月)
        var day = dates.getDate();//获取当前日(1-31)
        // alert(year +"-" + month + "-" + day);
        // var dateString = year +"-" + month + "-" + day;
        document.getElementById("yr").innerText=year+"年";
        document.getElementById("mh").innerText=month+"月";
        document.getElementById("dy").innerText=day+"日";
        document.getElementById("yr").value=year;
        document.getElementById("mh").value=month;
        document.getElementById("dy").value=day;
        document.getElementById("dataOrang").innerText=getPerfect()+"%";
        document.getElementById("strip").style.width=getPerfect()+"%";

    }
    function getPerfect() {

        var prefect=50;
        if(${customer.custPhoto!="xxx.jpg"})
            prefect+=10;
        if(${customer.custWeight!="--"})
            prefect+=5;
        if(${customer.custNation!="--"})
            prefect+=5;
        if(${customer.custBloodType!="--"})
            prefect+=5;
        if(${customer.custZodiac!="--"})
            prefect+=5;
        if(${customer.custConstellation!="--"})
            prefect+=5;
        if(${customer.custHobby!="--"})
            prefect+=5;
        if(${customer.custIntroduce!=null})
            prefect+=5;
        if(${customer.custProFession!="--"})
            prefect+=5;
        return prefect;
    }


</script>
<%@include file="header.jsp"%>
<!-- 内  容 -->
<div id="BAIHE">
    <!-- 左部导航 -->
    <script language="javascript" src="http://static4.baihe.com/common/leftNav.js" id="leftNav" charset='utf-8'></script>
    <!--rightCont -->
    <input type="hidden" id="birthday" value="${customer.custBirthday}">
    <div id="rightCont">
        <div class="myData">
            <h3>
                <div class="speed">
                    <div class="box"><div style="width:0;" class="strip" id="strip"></div></div>
                    <span>资料完整度</span><span class="orangeT" id="dataOrang">0%</span>
                </div>
                <strong>我的资料</strong>
            </h3>
            <div class="mainNav">
                <a href="#" class="active"><strong>基本资料</strong><em class="angleB"></em></a>
            </div>
            <div class="explain">完整的基本资料不仅能让异性初步的了解您，更是异性搜索到您的重要保证，补充以下未填信息资料完整度增加 <span class="orangeT">5%</span>哦！</div>
            <h4 class="mT30">基本信息&nbsp;&nbsp;<span class="cbd">为了保证资料真实有效，灰色字体信息不得随意修改，<a href="http://help.baihe.com/index.php?action=list&cat=517&listid=2" class="blueT" target="_blank">查看修改技巧</a></span></h4>
            <form id="" method="POST">
            <div class="data">
                <div class="cont L">
                    <dl>
                        <dt>昵称：</dt>
                        <dd><input name="nickname" type="text" value="${customer.custNickname}" id="nikename" class="c333" maxLength="12" onblur="checkNikename()"/>
                            <div class="orangeT" id="nikename_msg"></div></dd>
                    </dl>
                    <dl>
                        <dt>性别：</dt>
                        <dd id="gender">${customer.custGender}</dd>
                    </dl>

                    <dl>
                        <dt>生日：</dt>
                        <dd style="z-index:6">
                            <div id="date" style="display: inline-block">
                                <select name="year" id="year">
                                    <option id="yr" value="请选择"></option>
                                </select>
                                <select name="month" id="month">
                                    <option id="mh" value="请选择"></option>
                                </select>
                                <select id="days" class="day">
                                    <option id="dy" value="请选择"></option>
                                </select>
                            </div>

                            <script type="text/javascript">
                                $(function(){
                                    $("#date").selectDate();
                                    $("#days").focusout(function(){
                                        var year = $("#year option:selected").html()
                                        var month = $("#month option:selected").html()
                                        var day = $("#days option:selected").html()
                                        console.log(year+month+day)
                                    })
                                })
                            </script>
                        </dd>
                    </dl>
                    <dl>
                        <dt>属相：</dt>
                        <dd id="animalSign">${customer.custZodiac}</dd>
                    </dl>
                    <dl>
                        <dt>星座：</dt>
                        <dd  id="constellation">${customer.custConstellation}</dd>
                    </dl>
                    <dl>
                        <dt>身高：</dt>
                        <dd class="w01" style="z-index:4">
                            <div class="form-group">
                                <select name="custHeight" id="select" class="myheight">
                                    <div id="mm">
                                        <option value="${customer.custHeight}">${customer.custHeight}</option>
                                        <option value="1" >145厘米以下</option>
                                        <option value="145">145厘米</option>
                                        <option value="146">146厘米</option>
                                        <option value="147">147厘米</option>
                                        <option value="148">148厘米</option>
                                        <option value="149">149厘米</option>
                                        <option value="150">150厘米</option>
                                        <option value="151">151厘米</option>
                                        <option value="152">152厘米</option>
                                        <option value="153">153厘米</option>
                                        <option value="154">154厘米</option>
                                        <option value="155">155厘米</option>
                                        <option value="156">156厘米</option>
                                        <option value="157">157厘米</option>
                                        <option value="158">158厘米</option>
                                        <option value="159">159厘米</option>
                                        <option value="160">160厘米</option>
                                        <option value="161">161厘米</option>
                                        <option value="162">162厘米</option>
                                        <option value="163">163厘米</option>
                                        <option value="164">164厘米</option>
                                        <option value="165">165厘米</option>
                                        <option value="166">166厘米</option>
                                        <option value="167">167厘米</option>
                                        <option value="168">168厘米</option>
                                        <option value="169">169厘米</option>
                                        <option value="170">170厘米</option>
                                        <option value="171">171厘米</option>
                                        <option value="172">172厘米</option>
                                        <option value="173">173厘米</option>
                                        <option value="174">174厘米</option>
                                        <option value="175">175厘米</option>
                                        <option value="176">176厘米</option>
                                        <option value="177">177厘米</option>
                                        <option value="178">178厘米</option>
                                        <option value="179">179厘米</option>
                                        <option value="180">180厘米</option>
                                        <option value="181">181厘米</option>
                                        <option value="182">182厘米</option>
                                        <option value="183">183厘米</option>
                                        <option value="184">184厘米</option>
                                        <option value="185">185厘米</option>
                                        <option value="186">186厘米</option>
                                        <option value="187">187厘米</option>
                                        <option value="188">188厘米</option>
                                        <option value="189">189厘米</option>
                                        <option value="190">190厘米</option>
                                        <option value="191">191厘米</option>
                                        <option value="192">192厘米</option>
                                        <option value="193">193厘米</option>
                                        <option value="194">194厘米</option>
                                        <option value="195">195厘米</option>
                                        <option value="196">196厘米</option>
                                        <option value="197">197厘米</option>
                                        <option value="198">198厘米</option>
                                        <option value="199">199厘米</option>
                                        <option value="200">200厘米</option>
                                        <option value="999">200厘米以上</option>
                                    </div>
                                </select>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>学历：</dt>
                        <dd class="w02" style="z-index:4">
                            <div class="form-group">
                                <select name="custEducation" class="_mydegree" id="_mydegree">
                                    <option value="${customer.custEducation}">${customer.custEducation}</option>
                                    <option value="初中">初中</option>
                                    <option value="中专/职高/技校">中专/职高/技校</option>
                                    <option value="高中">高中</option>
                                    <option value="大专">大专</option>
                                    <option value="本科">本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                    <option value="博士后">博士后</option>
                                </select>
                            </div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>职业：</dt>
                        <dd id="occupation">
                            <select class="sel01" id="profession">
                                <option value="${customer.custProFession}">${customer.custProFession}</option>
                                <option value="计算机/互联网">计算机/互联网</option>
                                <option value="电子电器/通信技术">电子电器/通信技术</option>
                                <option value="机械/仪器仪表">机械/仪器仪表</option>
                                <option value="销售">销售</option>
                                <option value="客服及技术支持">客服及技术支持</option>
                                <option value="财务/审计/税务">财务/审计/税务</option>
                                <option value="证券/金融/投资/银行">证券/金融/投资/银行</option>
                                <option value="保险">保险</option>
                                <option value="生产/营运">生产/营运</option>
                                <option value="质量/安全管理">质量/安全管理</option>
                                <option value="工程/能源">工程/能源</option>
                                <option value="贸易/采购">贸易/采购</option>
                                <option value="物流/仓储/运输">物流/仓储/运输</option>
                                <option value="技工">技工</option>
                                <option value="化工/环保">化工/环保</option>
                                <option value="生物/制药/医疗器械">生物/制药/医疗器械</option>
                                <option value="医院/医疗/护理">医院/医疗/护理</option>
                                <option value="广告">广告</option>
                                <option value="市场/公关">市场/公关</option>
                                <option value="影视/媒体">影视/媒体</option>
                                <option value="写作/出版/印刷">写作/出版/印刷</option>
                                <option value="翻译">翻译</option>
                                <option value="艺术/设计/创意">艺术/设计/创意</option>
                                <option value="建筑/房地产/装饰装修">建筑/房地产/装饰装修</option>
                                <option value="物业管理">物业管理</option>
                                <option value="人力资源">人力资源</option>
                                <option value="高级经营管理">高级经营管理</option>
                                <option value="行政/后勤">行政/后勤</option>
                                <option value="咨询/顾问">咨询/顾问</option>
                                <option value="律师/法务/合规">律师/法务/合规</option>
                                <option value="教育/培训">教育/培训</option>
                                <option value="科研">科研</option>
                                <option value="酒店/旅游/餐饮/娱乐">酒店/旅游/餐饮/娱乐 </option>
                                <option value="美容/健身">美容/健身</option>
                                <option value="商业零售服务">商业零售服务</option>
                                <option value="交通运输服务">交通运输服务</option>
                                <option value="保安/家政服务">保安/家政服务</option>
                                <option value="警察/其它">警察/其它</option>
                                <option value="公务员">公务员</option>
                                <option value="运动员">运动员</option>
                                <option value="农/林/牧/渔">农/林/牧/渔</option>
                                <option value="自由职业/兼职">自由职业/兼职</option>
                                <option value="储备干部/培训生/实习生">储备干部/培训生/实习生</option>
                                <option value="在校学生">在校学生</option>
                                <option value="退休">退休</option>
                                <option value="其他">其他</option>
                            </select>
                        </dd>
                    </dl>
                </div>
                <div class="cont R">
                    <dl style="position:relative; z-index:7">
                        <dt>婚姻状况：</dt>
                        <dd id="marriage">
                            <select id="_mymarriage">
                                <option value="${customer.custMarriage}">${customer.custMarriage}</option>
                                <option value="1">未婚</option>
                                <option value="2">离异</option>
                                <option value="3">丧偶</option>
                                <option value="4">已婚</option>
                            </select>
                            <span class="orangeT">* 只能修改一次</span>
                        </dd>
                    </dl>

                    <dl style="position:relative; z-index:5">
                        <dt>所在地区：</dt>
                        <dd style="z-index:5">
                            <div data-toggle="distpicker"style="display: inline-block">
                                <div class="form-group" >
                                    <select name="custProvince" id="province">
                                        <option value="${customer.custProvince}">${customer.custProvince}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="custCity" id="city">
                                        <option value="${customer.custCity}">${customer.custCity}</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="town" id="town">
                                        <option value="未设置">请选择区</option>
                                    </select>
                                </div>
                            </div>
                        </dd>
                        <!--<div class="selCity"><input name="" id="district" autocomplete="off" type="text" value="请选择所在地区" class="city_input  inputFocus proCityQueryAll proCitySelAll" ov="请选择/输入城市名称"/></div>-->
                        <!-- <span class="orangeT">* 一个月修改一次</span> -->
                    </dl>

                    <dl style="position:relative; z-index:3">
                        <dt>月收入：</dt>
                        <dd class="w01" style="z-index:3">
                            <!--<div class="prompt" id="myincome_msg"></div>-->
                            <div class="form-group">
                                <select name="custIncome" class="_myincome" id="_myincome">
                                    <option value="${customer.custIncome}">${customer.custIncome}</option>
                                    <option value="2000以下">2000以下</option>
                                    <option value="2000-5000">2000-5000</option>
                                    <option value="5000-10000" >5000-10000</option>
                                    <option value="10000-20000">10000-20000</option>
                                    <option value="20000-50000">20000-50000</option>
                                    <option value="50000以上">50000以上</option>
                                </select>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
            </form>
            <div class="clear"></div>
            <h4 class="mT30" style="margin-top: 25px;font-size: 16px">其他资料</h4>
            <div class="data">
                <div class="cont R">
                    <dl>
                        <dt>血型：</dt>
                        <dd id="bloodType">
                            <select class="bloodType" id="MybloodType">
                                <option value="${customer.custBloodType}">${customer.custBloodType}</option>
                                <option value="A型">A型</option>
                                <option value="B型">B型</option>
                                <option value="AB型">AB型</option>
                                <option value="O型">O型</option>
                                <option value="其他">其他</option>
                            </select>
                        </dd>
                    </dl>
                    <dl>
                        <dt>体重：</dt>
                        <dd id="weight">
                            <select class="selCity" id="Myweight">
                                <option value="${customer.custWeight}">${customer.custWeight}</option>
                                <option value="40公斤以下">40公斤以下</option>
                                <option value="40公斤">40公斤</option>
                                <option value="41公斤">41公斤</option>
                                <option value="42公斤">42公斤</option>
                                <option value="43公斤">43公斤</option>
                                <option value="44公斤">44公斤</option>
                                <option value="45公斤">45公斤</option>
                                <option value="46公斤">46公斤</option>
                                <option value="47公斤">47公斤</option>
                                <option value="48公斤">48公斤</option>
                                <option value="49公斤">49公斤</option>
                                <option value="50公斤">50公斤</option>
                                <option value="51公斤">51公斤</option>
                                <option value="52公斤">52公斤</option>
                                <option value="53公斤">53公斤</option>
                                <option value="54公斤">54公斤</option>
                                <option value="55公斤">55公斤</option>
                                <option value="56公斤">56公斤</option>
                                <option value="57公斤">57公斤</option>
                                <option value="58公斤">58公斤</option>
                                <option value="59公斤">59公斤</option>
                                <option value="60公斤">60公斤</option>
                                <option value="61公斤">61公斤</option>
                                <option value="62公斤">62公斤</option>
                                <option value="63公斤">63公斤</option>
                                <option value="64公斤">64公斤</option>
                                <option value="65公斤">65公斤</option>
                                <option value="66公斤">66公斤</option>
                                <option value="67公斤">67公斤</option>
                                <option value="68公斤">68公斤</option>
                                <option value="69公斤">69公斤</option>
                                <option value="70公斤">70公斤</option>
                                <option value="71公斤">71公斤</option>
                                <option value="72公斤">72公斤</option>
                                <option value="73公斤">73公斤</option>
                                <option value="74公斤">74公斤</option>
                                <option value="75公斤">75公斤</option>
                                <option value="76公斤">76公斤</option>
                                <option value="77公斤">77公斤</option>
                                <option value="78公斤">78公斤</option>
                                <option value="79公斤">79公斤</option>
                                <option value="80公斤">80公斤</option>
                                <option value="81公斤">81公斤</option>
                                <option value="82公斤">82公斤</option>
                                <option value="83公斤">83公斤</option>
                                <option value="84公斤">84公斤</option>
                                <option value="85公斤">85公斤</option>
                                <option value="86公斤">86公斤</option>
                                <option value="87公斤">87公斤</option>
                                <option value="88公斤">88公斤</option>
                                <option value="89公斤">89公斤</option>
                                <option value="90公斤">90公斤</option>
                                <option value="91公斤">91公斤</option>
                                <option value="92公斤">92公斤</option>
                                <option value="93公斤">93公斤</option>
                                <option value="94公斤">94公斤</option>
                                <option value="95公斤">95公斤</option>
                                <option value="96公斤">96公斤</option>
                                <option value="97公斤">97公斤</option>
                                <option value="98公斤">98公斤</option>
                                <option value="99公斤">99公斤</option>
                                <option value="100公斤">100</option>
                                <option value="101公斤">101公斤</option>
                                <option value="102公斤">102公斤</option>
                                <option value="103公斤">103公斤</option>
                                <option value="104公斤">104公斤</option>
                                <option value="105公斤">105公斤</option>
                                <option value="106公斤">106公斤</option>
                                <option value="107公斤">107公斤</option>
                                <option value="108公斤">108公斤</option>
                                <option value="109公斤">109公斤</option>
                                <option value="110公斤">110公斤</option>
                                <option value="111公斤">111公斤</option>
                                <option value="112公斤">112公斤</option>
                                <option value="113公斤">113公斤</option>
                                <option value="114公斤">114公斤</option>
                                <option value="115公斤">115公斤</option>
                                <option value="116公斤">116公斤</option>
                                <option value="117公斤">117公斤</option>
                                <option value="118公斤">118公斤</option>
                                <option value="119公斤">119公斤</option>
                                <option value="120公斤">120公斤</option>
                                <option value="121公斤">120公斤以上</option>
                            </select>
                        </dd>
                    </dl>
                    <dl>
                        <dt>民族：</dt>
                        <dd id="Nation">
                            <select id="Nationly">
                                <option value="${customer.custNation}">${customer.custNation}</option>
                                <option value="汉族">汉族</option>
                                <option value="蒙古族">蒙古族</option>
                                <option value="回族">回族</option>
                                <option value="藏族">藏族</option>
                                <option value="维吾尔族">维吾尔族</option>
                                <option value="苗族">苗族</option>
                                <option value="彝族">彝族</option>
                                <option value="壮族">壮族</option>
                                <option value="布依族">布依族</option>
                                <option value="朝鲜族">朝鲜族</option>
                                <option value="其他民族">其他民族</option>
                                <option value="满族">满族</option>
                            </select>
                        </dd>
                    </dl>
                    </div>
                <div class="cont R">
                    <dl>
                        <dt>兴趣爱好：</dt>
                        <dd id="hobby">
                         <textarea id="myhobby" class=""  style="width: 330px;height: 60px">${customer.custHobby}</textarea>
                        </dd>
                    </dl>

                        <dt style="color: #bdbdbd">自我介绍：</dt>
                        <dd id="introduce">
                            <textarea id="myintroduce" class="" style="width: 410px;height: 200px">大家好，我来自${customer.custProvince}${customer.custCity}，在缘来是你真心寻找一个靠谱的她，希望在以后的生活中相互扶持，过上幸福安逸的美好生活，我的愿望并不大，只希望有你相伴。</textarea>
                        </dd>
                        <p style="float: right">您最多可输入225字</p>
                </div>

                </div>
                    <a style="margin-top: 25px;width: 142px;height: 40px;font-size: 16px;line-height: 38px" href="javascript:void(0)" class="orange" id="saveInfo" onclick="myCheck()">保 存</a>
        </div>
    </div>
    <div class="adv90">
        <!-- <iframe name="advert" width="980" height="90" frameborder="0" scrolling="no" src="http://bhtg.baihe.com/bhtginfo.jsp?placeid=130" align="center"></iframe> -->
        <a href="http://w.jiayuan.com/mkt/adwwwclk?uid=159476456&location=bh_mybaihe01_03&product=20&ad_id=4448&clientVer=web&clientID=11&pin=97B31FCB133602ACB3584FC84CA76FF7_159476456&wwwsign=623c77149aed272992c8475efc9f8a32" target="_blank"><img src="http://news.baihe.com/images/201710/2017102003.png" width="980" height="90" border="0"></a>
    </div>
</div>
<%@include file="footer.jsp"%>

</body>


<script type="text/javascript">
    function myCheck(){
        if(checkNikename()==true){
            // checkMobileCode()==true&&
            addUser();
            return true
        }else{
            return false;
        }
    }

    function getValue(ele) {
        var obj = document.getElementById(ele); //定位id
        var index = obj.selectedIndex; // 选中索引
        var text = obj.options[index].text; // 选中文本
        var Value = obj.options[index].value; // 选中值
        return Value;
    }

    var xhr = null;
    var url_updateUser = "${pageContext.request.contextPath}/customer/updateUser";
    function  addUser() {
        if (window.XMLHttpRequest){
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        var custNickname =  document.getElementById("nikename").value;
      var  province  = document.getElementById("province").value;
      var  city= document.getElementById("city").value;
        var  height= document.getElementById("select").value;
        var  education= document.getElementById("_mydegree").value;
        var  _myincome= document.getElementById("_myincome").value;
        var  _mymarriage= document.getElementById("_mymarriage").value;
        var  profession= document.getElementById("profession").value;

        // var  province = getValue("province"); var city=getValue("city");//获得省市
        var  year= document.getElementById("year").value;
        var  month= document.getElementById("month").value;
        var  day= document.getElementById("days").value;
        var dates=year+"-"+month+"-"+day;
        // alert(dates);

  //获得个人其他信息
        var  Nationly =  document.getElementById("Nationly").value;
        var  MybloodType =  document.getElementById("MybloodType").value;
        var  Myweight =  document.getElementById("Myweight").value;
        var  myhobby=   document.getElementById("myhobby").value;
        var  myintroduce=   document.getElementById("myintroduce").value;



        var custBirthday =dates;
        var custProvince = province;
        var custCity = city;
        var custHeight = height;
        var custEducation = education;
        var custIncome = _myincome;
        var custMarriage = _mymarriage;
        var custproFession=profession;

        var custNation=Nationly;
        var custWeight=Myweight;
       var custBloodType=MybloodType;
       var custHobby=myhobby;
       var custIntroduce=myintroduce;

        var formData ="custNickname="+custNickname+"&custBirthday="+custBirthday
            +"&custProvince="+custProvince+"&custCity="+custCity+"&custHeight="+custHeight+"&custEducation="+
            custEducation+"&custIncome="+custIncome+"&custMarriage="+custMarriage+"&custProFession="+custproFession+"&custNation="+custNation
            +"&custWeight="+custWeight+"&custBloodType="+custBloodType+"&custHobby="+custHobby+"&custIntroduce="+custIntroduce;

        xhr.open("POST", url_updateUser,true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
        xhr.onreadystatechange =ajaxCallBack;
        xhr.send(formData);
    }
    function ajaxCallBack(){
        if(xhr.readyState == 4 && xhr.status == 200){
            alert("资料修改成功!")
        }
    }
</script>
<script src="${pageContext.request.contextPath}/js/area.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/areaselect.js" type="text/javascript"></script>
</html>
