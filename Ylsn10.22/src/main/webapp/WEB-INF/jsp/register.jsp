<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2018/10/18 0018
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="http://static4.baihe.com/common/tongji-1.0.1.min.js" type="text/javascript" charset="utf-8"></script>
    <title>注册页面</title>

    <link href="http://static3.baihe.com/css_bh/public.css" rel="stylesheet" type="text/css" />
    <link href="http://static3.baihe.com/css_bh/topics.css" rel="stylesheet" type="text/css" />
    <link href="http://static3.baihe.com/css_bh/pop.css" rel="stylesheet" type="text/css" />
    <link href="http://static3.baihe.com/landingpage/20140925.css" rel="stylesheet" type="text/css" />
    <link href="http://static3.baihe.com/formStyle.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet">
    <style>
        .cont .infolayer01 a.selectHeight{
            background: #ff8000; color: #fff;}
    </style>

    <script src="http://static4.baihe.com/3rd-lib/jquery-1.8.3.min.js"></script>
    <script  src="http://static4.baihe.com/common/baihe.js" ></script>
    <script  src="http://static4.baihe.com/common/city.js" ></script>
    <script  src="http://static4.baihe.com/3rd-lib/jquery.select-1.3.6.js" ></script>
    <script type="text/javascript" src="http://static4.baihe.com/login/reg_landpageV2.js"></script>
    <script language="javascript" src="http://static4.baihe.com/ckadinfo.js" ></script>

    <script language='javascript'>history.forward(1);</script>

    <script src="${pageContext.request.contextPath}/js/register.js"></script>

    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/select.js"></script>
    <style type="text/css">
        select{
            height: 30px;
            padding: 5px;
            outline: none;
        }
    </style>
</head>
<body>
<script>
    window.onload=function () {
        document.getElementById("login").style.display="none";
        checkPhoneNumber();
    }
</script>
<%@include file="header.jsp"%>
<form id="regForm" name="regForm"  method="POST">
    <div class="content">
        <div class="cont">
            <div class="apply">
                <div id="infoStatu1">
                    <div id="accountstatus">
                        <dl>
                            <dt>注册方式</dt>
                            <dd style="padding-top:3px;">
                                <label style="width:auto; line-height:24px;">手机号注册</label>
                            </dd>
                            <dt>手机号码</dt>
                            <dd>
                                <input name="account" id="account" type="text" class="inp" onblur="checkPhone();" maxlength="40" />
                                <div class="prompt" id="account_msg"></div>
                            </dd>
                        </dl>

                        <script>
                            function reloadImage() {
                                document.getElementById('identity').src = '${pageContext.request.contextPath}/image?ts=' + new Date()
                                    .getTime();
                            }
                        </script>
                        <dl id="phonePicCode">
                            <dt>图形码</dt>
                            <dd style="z-index:2;">
                                <input name="" type="text" class="inp02" id="phonePicCodeVal" onmouseout="checkPhone();checkPhoneandVerCode();"  />
                                <img src="${pageContext.request.contextPath}/image" alt="验证码" width="77" style="cursor:pointer;" height="30"  id="identity"  class="verImg"  >
                                <a href="javascript:void(0);" class="refresh" onclick="reloadImage()" title="看不清，点击换一张">刷新</a>
                                <div class="prompt" id="phonePicValiCode_msg"></div>
                            </dd>
                        </dl>
                        <script type="text/javascript">

                         var wait = 60;
                       function time(btn) {
                           if (wait == 0) {
                               btn.removeAttribute("disabled");
                               btn.value = "获取短信验证码";
                               wait =60;
                           } else {
                               btn.setAttribute("disabled", true);
                               btn.value = wait + "s 后重新发送";
                               wait--;
                               setTimeout(function () {
                                       time(btn);
                                   },
                                   1000)
                           }
                       }

                   function sendMobileCode(btn){
                       time(btn);
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
                   }
                         function checkRead() {
                             if( $("input[type='checkbox']").is(':checked')===true){
                                 return true;
                             }else{
                                 alert("请同意本网站条约!")
                                 return false;
                             }

                         }
                        </script>
                        <div id="divValiCode">
                            <dl>
                                <dt>验证码</dt>
                                <dd>
                                    <input name="" type="text" class="inp" style="width:136px;" id="txtMobileValiCode" onblur="checkMobileCode()"  />
                                    <%--<a href="javascript:void(0);" type="button" class="grey" id="mobileValiCode_btn" onclick="sendMobileCode()" value="获取短信验证码"></a>--%>
                                    <input type="button" onclick="sendMobileCode(this)" class="grey" id="mobileValiCode_btn" value="获取短信验证码">
                                    <div class="prompt" id="mobileValiCode_msg"></div>
                                    <div class="clear"></div>
                                </dd>
                            </dl>
                        </div>

                        <dl>
                            <dt>密码</dt>
                            <dd>
                                <input class="inp" type="password" name="custPassword" id="password" onblur="checkPassword()" size="16" maxlength="16" />
                                <div class="prompt" id="password_msg"></div>
                            </dd>
                        </dl>

                        <dl>
                            <dt>确认密码</dt>
                            <dd>
                                <input class="inp" type="password" name="goldUser_userPass" id="repassword" onblur="checkRePassword()" size="16" maxlength="16" />
                                <div class="prompt" id="Repassword_msg"></div>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div id="infoStatu2">
                    <div id="accountstatus2">
                        <span style="font-size: 22px;color: black;position:relative;bottom: 14px">完善资料</span>
                        <dl>
                            <dt>昵称</dt>
                            <dd>
                                <input class="inp" name="custNickname" id="nikename" type="text" onblur="checkNikename()" />
                                <div class="prompt" id="nikename_msg"></div>
                            </dd>
                            <dt>性别</dt>
                            <dd>
                                <a href="javascript:void(0)" class="sex" id="gender_1" value="男" onclick="selectedGender(this)">我是男生</a>
                                <a href="javascript:void(0)" class="sex" id="gender_0" value="女"onclick="selectedGender(this)">我是女生</a>
                                <input type="hidden" name="custGender" id="gender" value="男" />
                                <div class="prompt" id="sexPmt"><span>*</span>&nbsp;注册后不可更改</div>
                            </dd>

                            <dt>生日</dt>
                            <dd style="z-index:6">
                                <div id="date" style="display: inline-block">
                                    <select name="year" id="year">
                                        <option value="选择年份">选择年份</option>
                                    </select>
                                    <select name="month" id="month">
                                        <option value="选择月份">选择月份</option>
                                    </select>
                                    <select id="days" class="day">
                                        <option value="选择日期">选择日期</option>
                                    </select>
                                    <div style="display: inline-block" class="prompt" id="Birthday_msg"></div>
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
                            <dt>地区</dt>
                            <dd style="z-index:5">
                                <div data-toggle="distpicker"style="display: inline-block">
                                    <div class="form-group">
                                        <select name="custProvince" id="province">
                                            <option value="请选择省">请选择省</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select name="custCity" id="city">
                                            <option value="请选择市">请选择市</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select name="town" id="town">
                                            <option value="未设置">请选择区</option>
                                        </select>
                                    </div>
                                    <div style="display: inline-block" class="prompt" id="City_msg"></div>
                                </div>
                            </dd>
                        </dl>
                    </div>
                </div>
                <dl>
                    <dt>身高</dt>
                    <dd class="w01" style="z-index:4">
                        <div class="prompt" id="myheight_msg"></div>
                        <div class="form-group">
                            <select name="custHeight" id="select" class="myheight">
                                <div id="mm">
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
                                    <option value="175" selected>175厘米</option>
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
                    <dt style="width:42px;">学历</dt>
                    <dd class="w02" style="z-index:4">
                        <div class="prompt" id="mydegree_msg"></div>
                        <div class="form-group">
                            <select name="custEducation" class="_mydegree" id="_mydegree">
                                <option value="初中">初中</option>
                                <option value="中专/职高/技校">中专/职高/技校</option>
                                <option value="高中" selected>高中</option>
                                <option value="大专">大专</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                                <option value="博士后">博士后</option>
                            </select>
                        </div>
                    </dd>
                    <dt>收入</dt>
                    <dd class="w01" style="z-index:3">
                        <div class="prompt" id="myincome_msg"></div>
                        <div class="form-group">
                            <select name="custIncome" class="_myincome" id="_myincome">
                                <option value="2000以下">2000以下</option>
                                <option value="2000-5000">2000-5000</option>
                                <option value="5000-10000" selected>5000-10000</option>
                                <option value="10000-20000">10000-20000</option>
                                <option value="20000-50000">20000-50000</option>
                                <option value="50000以上">50000以上</option>
                            </select>
                        </div>
                    </dd>
                    <dt style="width:42px;">婚姻</dt>
                    <dd class="w02" style="z-index:3">
                        <div class="prompt" id="mymarriage_msg"></div>
                        <div class="form-group">
                            <select name="custMarriage" class="_mymarriage" id="_mymarriage">
                                <option value="未婚" selected>未婚</option>
                                <option value="离异">离异</option>
                                <option value="丧偶">丧偶</option>
                            </select>
                        </div>
                    </dd>
                </dl>
                <div id="vCodeInfo"></div>
                <div class="clear"></div>
                <div style="display:none;"><textarea name="goldUserDesc_userDesc" id="userdesc" cols="30" rows="10"></textarea></div>
                <div class="terms"><input name="promit" type="checkbox" checked="checked" id="promit" value="11" />已经阅读并同意<a href="http://help.baihe.com/index.php?action=list&cat=573&listid=28" target="_blank">缘来是你服务条款</a></div>
                <button name="" type="button" onclick="myCheck();"  class="icon" id="save" >注册完成</button>

                <div id="content"></div>
            </div>
            <div class="right">
                <p>
                    <strong>心灵匹配测试</strong>
                    美国著名婚恋心理学家独家授权<br />
                    <b>23</b>个心理维度全方位解析<br />
                    帮你找到幸福指数更高的理想伴侣<br />
                </p>
                <img src="http://images6.baihe.com/landingpage/images_0925/right_01.gif" alt="" />
                <p class="bTOp">客服：<span>400-1520-555(8:00至20:00)</span><br />邮件：<a href="mailto:service@baihe.com">service@yuanlaishini.com</a></p>
            </div>
            <!--<img style="position: relative;top: 5px">-->
        </div>
    </div>
</form>
<%@include file="footer.jsp"%>

    <script type="text/javascript">
//获得input单选按钮中的value
/*        function getGender()
        {
            var temp=document.getElementsByName("sex");
            for (i=0;i<temp.length;i++){
                //遍历Radio
                if(temp[i].checked){
                    alert("你选择了"+temp[i].value);
                    return temp[i].value;
                    //获取Radio的值
                }
            }
        }*/
                //设置性别默认为男性
                document.getElementById("gender_1").style.backgroundColor="#ffe8d9";
                    function myCheck(){
                        if(checkPhone()==true&&checkCode()==true&&checkMobileCode()==true&&checkPassword()==true&&checkRePassword()==true&&checkNikename()==true&&checkBirthday()==true&&checkCity()==true&&checkRead()==true){
                            //
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
                var url_adduser = "${pageContext.request.contextPath}/customer/save";
            function  addUser() {
            // alert("开始获取表单数据!");
            if (window.XMLHttpRequest){
            xhr = new XMLHttpRequest();
            } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }

            var  province = getValue("province"); var city=getValue("city");//获得省市
            var  height=getValue("select");//获得身高
            var education=getValue("_mydegree");//获得学历
            var _myincome=getValue("_myincome");//获得收入
            var _mymarriage=getValue("_mymarriage");//获得婚姻状况

            var year = getValue("year");var month=getValue("month");var day=getValue("days");
            var dates=year+"-"+month+"-"+day;

            var custGender=document.getElementById("gender").value;
            var custPhone =  document.getElementById("account").value;
            var custPassword =  document.getElementById("password").value;
            var custNickname =  document.getElementById("nikename").value;

            var custBirthday =dates;
            var custProvince = province;
            var custCity = city;
            var custHeight = height;
            var custEducation = education;
            var custIncome = _myincome;
            var custMarriage = _mymarriage;

            var formData ="custPhone="+custPhone+"&custPassword="+custPassword+"&custNickname="+custNickname+"&custGender="+custGender+"&custBirthday="+custBirthday
                +"&custProvince="+custProvince+"&custCity="+custCity+"&custHeight="+custHeight+"&custEducation="+custEducation+"&custIncome="+custIncome+"&custMarriage="+custMarriage;

            xhr.open("POST", url_adduser,true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
            xhr.onreadystatechange =ajaxCallBack;
            xhr.send(formData);
            }
                function ajaxCallBack(){
                    if(xhr.readyState == 4 && xhr.status == 200){
                            window.location.href='${pageContext.request.contextPath}/pageJump';
                    }
                }
</script>

</body>
<script src="${pageContext.request.contextPath}/js/area.js"></script>
<script src="${pageContext.request.contextPath}/js/areaselect.js"></script>
</html>
