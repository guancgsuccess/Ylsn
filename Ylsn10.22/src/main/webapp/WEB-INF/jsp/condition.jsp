<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/20
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>择偶要求</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cityselect.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/condition.css">
    <script src="${pageContext.request.contextPath}/js/condition.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $("select[name='requMinAge']").change(function () {
                for(var i=18;i<=99;i++)
                    $("select[name='requMaxAge'] option[value='"+i+"']").remove();
                for(var j=$(this).val();j<=99;j++)
                    $("select[name='requMaxAge']").append("<option value='"+j+"'>"+j+"</option>");
            });
        });

        $(document).ready(function() {
            $("select[name='requMinHeight']").change(function () {
                for(var i=130;i<=226;i++)
                    $("select[name='requMaxHeight'] option[value='"+i+"']").remove();
                for(var j=$(this).val();j<=226;j++)
                    $("select[name='requMaxHeight']").append("<option value='"+j+"'>"+j+"</option>");
            });
        });
    </script>
</head>
<body>
<%@include file="header.jsp"%>
<form>
    <input type="hidden" value="${sessionScope.custId}" name="custId">
    <input type="hidden" value="${custNickname}" name="custNickname">
</form>
<div id="BAIHE">
    <div id="leftCont">
        <div class="service bor js_nav_svr">
            <h3>推荐服务</h3>
            <div class="js_nav_show">
                <a class="cont" target="">
                    <span class="orange">进 入</span>
                    <em class="icon_dc">全城告白</em>
                    直降¥1000
                </a>
                <a class="cont" target="">
                    <span class="orange">开 通</span>
                    <em class="icon_jzzqx">金至尊牵线</em>
                    专享人工牵线特权
                </a>
                <a class="cont" target="_blank" href="">
                    <span class="orange">开 通</span>
                    <em class="icon_sj">水晶会员</em>
                    享受11项尊贵特权</a>
                <a class="cont" target="_blank" href="">
                    <span class="orange">开 通</span>
                    <em class="icon_gj">高级会员</em>
                    尊享全站免费沟通等特权
                </a>
                <a class="cont" target="_blank" href="">
                    <span class="orange">开 通</span>
                    <em class="icon_hn">红娘牵线</em>
                    红娘帮忙牵线搭桥寻对象</a>
                <a class="cont" target="_blank" href="">
                    <span class="orange">体 验</span>
                    <em class="icon_vip">红娘服务</em>
                    人工红娘一对一服务</a>
                <a class="cont" target="_blank" href="">
                    <span class="orange">开 通</span>
                    <em class="icon_hd">我的百合豆</em>
                    百合通用虚拟货币</a>
                <a class="cont" target="_blank" href="">
                    <span class="orange">开 通</span>
                    <em class="icon_pm">今日明星</em>
                    获得关注的最快途径
                </a>
            </div>
        </div>
        <div class="box bor">
            <h3>百合应用</h3>
            <a href="" target="_blank">
                <em class="icon_cupid">丘比特之箭</em>
                <div class="line"></div>
            </a>
            <a href="" target="_blank">
                <em class="icon_xlpp">心灵匹配测试</em>
                <div class="line"></div>
            </a>
            <a href="" target="_blank">
                <em class="icon_love">Love双重奏</em>
            </a>
        </div>
        <div class="box bor js_fixedLeft">
            <h3>百合账户</h3>
            <a href="" target="_blank">
                <em class="icon_yhj">我的优惠券</em>
            </a>
            <a href="" target="_blank">
                <em class="icon_info">我的资料</em>
                <div class="line"></div>
            </a>
            <a href="" target="_blank">
                <em class="icon_pic">我的照片</em>
                <div class="line"></div>
            </a>
            <a href="" target="_blank">
                <em class="icon_wdrz">我的认证</em>
            </a>
            <a href="" target="_blank">
                <em class="icon_smrz">实名认证</em>
                <div class="line"></div>
            </a>
            <a href="" target="_blank">
                <em class="icon_sjrz">手机认证</em>
                <div class="line"></div>
            </a>
            <a href="${pageContext.request.contextPath}/condition" target="_blank">
                <em class="icon_opt">择偶意向</em>
            </a>
            <a href="${pageContext.request.contextPath}/setBlock" target="_blank">
                <em class="icon_setUp">账号设置</em>
            </a>
        </div>
    </div>
    <div class="usercp_mid">
    <div class="usercp_match" id="w_usercp_match" style="margin-top:0">
        <h2 class="w_userh2">
            <b class="l1"></b>
            <b class="l2"></b>
            <b class="l3"></b>
            <b class="l4"></b>
        </h2>
        <div class="content">
            <div class="changematch">
                <p class="tit w_tit1 ws_title" >您的择偶要求</p>
                <ul class="clearfix">
                    <li>
                        <p>年龄范围：<span id="minAge"></span>岁 到 <span id="maxAge"></span>岁</p>
                        <p>所在地区：<span id="province"></span>省 <span id="city"></span>市</p>
                    </li>
                    <li>
                        <p>身高范围：<span id="minHeight"></span>厘米 到 <span id="maxHeight"></span>厘米</p>
                        <p>婚史：<span id="marriageHistory"></span></p>
                    </li>
                    <li>
                        <p>有无照片：<span id="photo"></span></p>
                        <p>学历：<span id="education"></span></p>
                    </li>
                    <li>
                        <p>薪资:<span id="salary"></span></p>
                        <p>性别:<span id="gender"></span></p>
                    </li>
                    <li>
                        <p>民族:<span id="nation"></span></p>
                        <p>血型:<span id="bloodType"></span></p>
                    </li>
                    <li>
                        <p>生肖:<span id="zodiac"></span></p>
                        <p>星座:<span id="constellation"></span></p>
                    </li>
                </ul>
                <div style="font-weight: bolder; margin:10px 0;" class="ws_title">设置择偶要求</div>
                <form id="frm_match" method="post" action="">
                    <table class="w_table">
                        <!-- 地区 start -->
                        <tr class="place">
                            <td class="md_l">地区：</td>
                            <td>
                                <div id="fuck2" class="citys">
                                    <select class="prov" name="requProvince" id="requProvince" ></select>
                                    &nbsp;
                                    <select class="city" name="requCity" id="requCity" disabled="disabled"></select>
                                </div>
                            </td>
                        </tr>
                        <!-- 地区 end -->
                        <!-- 年龄 start -->
                        <tr>
                            <td class="md_l">年龄：</td>
                            <td>
                                <select name="requMinAge" class="m_select70" id="requMinAge">
                                    <option label="18" value="18" >18</option>
                                    <option label="19" value="19">19</option>
                                    <option label="20" value="20">20</option>
                                    <option label="21" value="21">21</option>
                                    <option label="22" value="22">22</option>
                                    <option label="23" value="23">23</option>
                                    <option label="24" value="24">24</option>
                                    <option label="25" value="25">25</option>
                                    <option label="26" value="26">26</option>
                                    <option label="27" value="27">27</option>
                                    <option label="28" value="28">28</option>
                                    <option label="29" value="29">29</option>
                                    <option label="30" value="30">30</option>
                                    <option label="31" value="31">31</option>
                                    <option label="32" value="32">32</option>
                                    <option label="33" value="33">33</option>
                                    <option label="34" value="34">34</option>
                                    <option label="35" value="35">35</option>
                                    <option label="36" value="36">36</option>
                                    <option label="37" value="37">37</option>
                                    <option label="38" value="38">38</option>
                                    <option label="39" value="39">39</option>
                                    <option label="40" value="40">40</option>
                                    <option label="41" value="41">41</option>
                                    <option label="42" value="42">42</option>
                                    <option label="43" value="43">43</option>
                                    <option label="44" value="44">44</option>
                                    <option label="45" value="45">45</option>
                                    <option label="46" value="46">46</option>
                                    <option label="47" value="47">47</option>
                                    <option label="48" value="48">48</option>
                                    <option label="49" value="49">49</option>
                                    <option label="50" value="50">50</option>
                                    <option label="51" value="51">51</option>
                                    <option label="52" value="52">52</option>
                                    <option label="53" value="53">53</option>
                                    <option label="54" value="54">54</option>
                                    <option label="55" value="55">55</option>
                                    <option label="56" value="56">56</option>
                                    <option label="57" value="57">57</option>
                                    <option label="58" value="58">58</option>
                                    <option label="59" value="59">59</option>
                                    <option label="60" value="60">60</option>
                                    <option label="61" value="61">61</option>
                                    <option label="62" value="62">62</option>
                                    <option label="63" value="63">63</option>
                                    <option label="64" value="64">64</option>
                                    <option label="65" value="65">65</option>
                                    <option label="66" value="66">66</option>
                                    <option label="67" value="67">67</option>
                                    <option label="68" value="68">68</option>
                                    <option label="69" value="69">69</option>
                                    <option label="70" value="70">70</option>
                                    <option label="71" value="71">71</option>
                                    <option label="72" value="72">72</option>
                                    <option label="73" value="73">73</option>
                                    <option label="74" value="74">74</option>
                                    <option label="75" value="75">75</option>
                                    <option label="76" value="76">76</option>
                                    <option label="77" value="77">77</option>
                                    <option label="78" value="78">78</option>
                                    <option label="79" value="79">79</option>
                                    <option label="80" value="80">80</option>
                                    <option label="81" value="81">81</option>
                                    <option label="82" value="82">82</option>
                                    <option label="83" value="83">83</option>
                                    <option label="84" value="84">84</option>
                                    <option label="85" value="85">85</option>
                                    <option label="86" value="86">86</option>
                                    <option label="87" value="87">87</option>
                                    <option label="88" value="88">88</option>
                                    <option label="89" value="89">89</option>
                                    <option label="90" value="90">90</option>
                                    <option label="91" value="91">91</option>
                                    <option label="92" value="92">92</option>
                                    <option label="93" value="93">93</option>
                                    <option label="94" value="94">94</option>
                                    <option label="95" value="95">95</option>
                                    <option label="96" value="96">96</option>
                                    <option label="97" value="97">97</option>
                                    <option label="98" value="98">98</option>
                                    <option label="99" value="99">99</option>

                                </select>
                                &nbsp;至&nbsp;
                                <select name="requMaxAge" class="m_select70" id="requMaxAge">
                                    <option label="18" value="18">18</option>
                                    <option label="19" value="19">19</option>
                                    <option label="20" value="20">20</option>
                                    <option label="21" value="21">21</option>
                                    <option label="22" value="22">22</option>
                                    <option label="23" value="23">23</option>
                                    <option label="24" value="24">24</option>
                                    <option label="25" value="25">25</option>
                                    <option label="26" value="26">26</option>
                                    <option label="27" value="27">27</option>
                                    <option label="28" value="28">28</option>
                                    <option label="29" value="29">29</option>
                                    <option label="30" value="30">30</option>
                                    <option label="31" value="31">31</option>
                                    <option label="32" value="32">32</option>
                                    <option label="33" value="33">33</option>
                                    <option label="34" value="34">34</option>
                                    <option label="35" value="35">35</option>
                                    <option label="36" value="36">36</option>
                                    <option label="37" value="37">37</option>
                                    <option label="38" value="38">38</option>
                                    <option label="39" value="39">39</option>
                                    <option label="40" value="40">40</option>
                                    <option label="41" value="41">41</option>
                                    <option label="42" value="42">42</option>
                                    <option label="43" value="43">43</option>
                                    <option label="44" value="44">44</option>
                                    <option label="45" value="45">45</option>
                                    <option label="46" value="46">46</option>
                                    <option label="47" value="47">47</option>
                                    <option label="48" value="48">48</option>
                                    <option label="49" value="49">49</option>
                                    <option label="50" value="50">50</option>
                                    <option label="51" value="51">51</option>
                                    <option label="52" value="52">52</option>
                                    <option label="53" value="53">53</option>
                                    <option label="54" value="54">54</option>
                                    <option label="55" value="55">55</option>
                                    <option label="56" value="56">56</option>
                                    <option label="57" value="57">57</option>
                                    <option label="58" value="58">58</option>
                                    <option label="59" value="59">59</option>
                                    <option label="60" value="60">60</option>
                                    <option label="61" value="61">61</option>
                                    <option label="62" value="62">62</option>
                                    <option label="63" value="63">63</option>
                                    <option label="64" value="64">64</option>
                                    <option label="65" value="65">65</option>
                                    <option label="66" value="66">66</option>
                                    <option label="67" value="67">67</option>
                                    <option label="68" value="68">68</option>
                                    <option label="69" value="69">69</option>
                                    <option label="70" value="70">70</option>
                                    <option label="71" value="71">71</option>
                                    <option label="72" value="72">72</option>
                                    <option label="73" value="73">73</option>
                                    <option label="74" value="74">74</option>
                                    <option label="75" value="75">75</option>
                                    <option label="76" value="76">76</option>
                                    <option label="77" value="77">77</option>
                                    <option label="78" value="78">78</option>
                                    <option label="79" value="79">79</option>
                                    <option label="80" value="80">80</option>
                                    <option label="81" value="81">81</option>
                                    <option label="82" value="82">82</option>
                                    <option label="83" value="83">83</option>
                                    <option label="84" value="84">84</option>
                                    <option label="85" value="85">85</option>
                                    <option label="86" value="86">86</option>
                                    <option label="87" value="87">87</option>
                                    <option label="88" value="88">88</option>
                                    <option label="89" value="89">89</option>
                                    <option label="90" value="90">90</option>
                                    <option label="91" value="91">91</option>
                                    <option label="92" value="92">92</option>
                                    <option label="93" value="93">93</option>
                                    <option label="94" value="94">94</option>
                                    <option label="95" value="95">95</option>
                                    <option label="96" value="96">96</option>
                                    <option label="97" value="97">97</option>
                                    <option label="98" value="98">98</option>
                                    <option label="99" value="99">99</option>

                                </select>
                            </td>
                        </tr>
                        <!-- 年龄 end -->
                        <!-- 婚姻状况 start -->
                        <tr>
                            <td class="md_l">婚姻状况：</td>
                            <td>
                                <select name="marital-requMarriage" class="m_select195" id="requMarriage">
                                    <option value="0">--不限--</option>
                                    <option label="未婚" value="1">未婚</option>
                                    <option label="已婚" value="2">离异</option>
                                    <option label="丧偶" value="3">丧偶</option>
                                </select>
                            </td>
                        </tr>
                        <!-- 婚姻状况 end -->
                        <!-- 身高 start -->
                        <tr>
                            <td class="md_l">身高：</td>
                            <td>
                                <select name="requMinHeight" class="m_select70" id="requMinHeight">
                                    <option label="130" value="130">130</option>
                                    <option label="131" value="131">131</option>
                                    <option label="132" value="132">132</option>
                                    <option label="133" value="133">133</option>
                                    <option label="134" value="134">134</option>
                                    <option label="135" value="135">135</option>
                                    <option label="136" value="136">136</option>
                                    <option label="137" value="137">137</option>
                                    <option label="138" value="138">138</option>
                                    <option label="139" value="139">139</option>
                                    <option label="140" value="140">140</option>
                                    <option label="141" value="141">141</option>
                                    <option label="142" value="142">142</option>
                                    <option label="143" value="143">143</option>
                                    <option label="144" value="144">144</option>
                                    <option label="145" value="145">145</option>
                                    <option label="146" value="146">146</option>
                                    <option label="147" value="147">147</option>
                                    <option label="148" value="148">148</option>
                                    <option label="149" value="149">149</option>
                                    <option label="150" value="150">150</option>
                                    <option label="151" value="151">151</option>
                                    <option label="152" value="152">152</option>
                                    <option label="153" value="153">153</option>
                                    <option label="154" value="154">154</option>
                                    <option label="155" value="155">155</option>
                                    <option label="156" value="156">156</option>
                                    <option label="157" value="157">157</option>
                                    <option label="158" value="158">158</option>
                                    <option label="159" value="159">159</option>
                                    <option label="160" value="160">160</option>
                                    <option label="161" value="161">161</option>
                                    <option label="162" value="162">162</option>
                                    <option label="163" value="163">163</option>
                                    <option label="164" value="164">164</option>
                                    <option label="165" value="165">165</option>
                                    <option label="166" value="166">166</option>
                                    <option label="167" value="167">167</option>
                                    <option label="168" value="168">168</option>
                                    <option label="169" value="169">169</option>
                                    <option label="170" value="170">170</option>
                                    <option label="171" value="171">171</option>
                                    <option label="172" value="172">172</option>
                                    <option label="173" value="173">173</option>
                                    <option label="174" value="174">174</option>
                                    <option label="175" value="175">175</option>
                                    <option label="176" value="176">176</option>
                                    <option label="177" value="177">177</option>
                                    <option label="178" value="178">178</option>
                                    <option label="179" value="179">179</option>
                                    <option label="180" value="180">180</option>
                                    <option label="181" value="181">181</option>
                                    <option label="182" value="182">182</option>
                                    <option label="183" value="183">183</option>
                                    <option label="184" value="184">184</option>
                                    <option label="185" value="185">185</option>
                                    <option label="186" value="186">186</option>
                                    <option label="187" value="187">187</option>
                                    <option label="188" value="188">188</option>
                                    <option label="189" value="189">189</option>
                                    <option label="190" value="190">190</option>
                                    <option label="191" value="191">191</option>
                                    <option label="192" value="192">192</option>
                                    <option label="193" value="193">193</option>
                                    <option label="194" value="194">194</option>
                                    <option label="195" value="195">195</option>
                                    <option label="196" value="196">196</option>
                                    <option label="197" value="197">197</option>
                                    <option label="198" value="198">198</option>
                                    <option label="199" value="199">199</option>
                                    <option label="200" value="200">200</option>
                                    <option label="201" value="201">201</option>
                                    <option label="202" value="202">202</option>
                                    <option label="203" value="203">203</option>
                                    <option label="204" value="204">204</option>
                                    <option label="205" value="205">205</option>
                                    <option label="206" value="206">206</option>
                                    <option label="207" value="207">207</option>
                                    <option label="208" value="208">208</option>
                                    <option label="209" value="209">209</option>
                                    <option label="210" value="210">210</option>
                                    <option label="211" value="211">211</option>
                                    <option label="212" value="212">212</option>
                                    <option label="213" value="213">213</option>
                                    <option label="214" value="214">214</option>
                                    <option label="215" value="215">215</option>
                                    <option label="216" value="216">216</option>
                                    <option label="217" value="217">217</option>
                                    <option label="218" value="218">218</option>
                                    <option label="219" value="219">219</option>
                                    <option label="220" value="220">220</option>
                                    <option label="221" value="221">221</option>
                                    <option label="222" value="222">222</option>
                                    <option label="223" value="223">223</option>
                                    <option label="224" value="224">224</option>
                                    <option label="225" value="225">225</option>
                                    <option label="226" value="226">226</option>

                                </select>
                                &nbsp;至&nbsp;
                                <select name="requMaxHeight" class="m_select70" id="requMaxHeight">
                                    <option label="130" value="130">130</option>
                                    <option label="131" value="131">131</option>
                                    <option label="132" value="132">132</option>
                                    <option label="133" value="133">133</option>
                                    <option label="134" value="134">134</option>
                                    <option label="135" value="135">135</option>
                                    <option label="136" value="136">136</option>
                                    <option label="137" value="137">137</option>
                                    <option label="138" value="138">138</option>
                                    <option label="139" value="139">139</option>
                                    <option label="140" value="140">140</option>
                                    <option label="141" value="141">141</option>
                                    <option label="142" value="142">142</option>
                                    <option label="143" value="143">143</option>
                                    <option label="144" value="144">144</option>
                                    <option label="145" value="145">145</option>
                                    <option label="146" value="146">146</option>
                                    <option label="147" value="147">147</option>
                                    <option label="148" value="148">148</option>
                                    <option label="149" value="149">149</option>
                                    <option label="150" value="150">150</option>
                                    <option label="151" value="151">151</option>
                                    <option label="152" value="152">152</option>
                                    <option label="153" value="153">153</option>
                                    <option label="154" value="154">154</option>
                                    <option label="155" value="155">155</option>
                                    <option label="156" value="156">156</option>
                                    <option label="157" value="157">157</option>
                                    <option label="158" value="158">158</option>
                                    <option label="159" value="159">159</option>
                                    <option label="160" value="160">160</option>
                                    <option label="161" value="161">161</option>
                                    <option label="162" value="162">162</option>
                                    <option label="163" value="163">163</option>
                                    <option label="164" value="164">164</option>
                                    <option label="165" value="165">165</option>
                                    <option label="166" value="166">166</option>
                                    <option label="167" value="167">167</option>
                                    <option label="168" value="168">168</option>
                                    <option label="169" value="169">169</option>
                                    <option label="170" value="170">170</option>
                                    <option label="171" value="171">171</option>
                                    <option label="172" value="172">172</option>
                                    <option label="173" value="173">173</option>
                                    <option label="174" value="174">174</option>
                                    <option label="175" value="175">175</option>
                                    <option label="176" value="176">176</option>
                                    <option label="177" value="177">177</option>
                                    <option label="178" value="178">178</option>
                                    <option label="179" value="179">179</option>
                                    <option label="180" value="180">180</option>
                                    <option label="181" value="181">181</option>
                                    <option label="182" value="182">182</option>
                                    <option label="183" value="183">183</option>
                                    <option label="184" value="184">184</option>
                                    <option label="185" value="185">185</option>
                                    <option label="186" value="186">186</option>
                                    <option label="187" value="187">187</option>
                                    <option label="188" value="188">188</option>
                                    <option label="189" value="189">189</option>
                                    <option label="190" value="190">190</option>
                                    <option label="191" value="191">191</option>
                                    <option label="192" value="192">192</option>
                                    <option label="193" value="193">193</option>
                                    <option label="194" value="194">194</option>
                                    <option label="195" value="195">195</option>
                                    <option label="196" value="196">196</option>
                                    <option label="197" value="197">197</option>
                                    <option label="198" value="198">198</option>
                                    <option label="199" value="199">199</option>
                                    <option label="200" value="200">200</option>
                                    <option label="201" value="201">201</option>
                                    <option label="202" value="202">202</option>
                                    <option label="203" value="203">203</option>
                                    <option label="204" value="204">204</option>
                                    <option label="205" value="205">205</option>
                                    <option label="206" value="206">206</option>
                                    <option label="207" value="207">207</option>
                                    <option label="208" value="208">208</option>
                                    <option label="209" value="209">209</option>
                                    <option label="210" value="210">210</option>
                                    <option label="211" value="211">211</option>
                                    <option label="212" value="212">212</option>
                                    <option label="213" value="213">213</option>
                                    <option label="214" value="214">214</option>
                                    <option label="215" value="215">215</option>
                                    <option label="216" value="216">216</option>
                                    <option label="217" value="217">217</option>
                                    <option label="218" value="218">218</option>
                                    <option label="219" value="219">219</option>
                                    <option label="220" value="220">220</option>
                                    <option label="221" value="221">221</option>
                                    <option label="222" value="222">222</option>
                                    <option label="223" value="223">223</option>
                                    <option label="224" value="224">224</option>
                                    <option label="225" value="225">225</option>
                                    <option label="226" value="226">226</option>

                                </select>&nbsp;厘米
                            </td>
                        </tr>
                        <!-- 身高 end -->
                        <!-- 学历 start -->
                        <tr>
                            <td class="md_l">学历：</td>
                            <td>
                                <select name="requEducation" class="m_select195" id="requEducation">
                                    <option value="0">--不限--</option>
                                    <option label="高中中专及以下" value="10">高中中专及以下</option>
                                    <option label="大专" value="20">大专</option>
                                    <option label="本科" value="30">本科</option>
                                    <option label="双学士" value="40">双学士</option>
                                    <option label="硕士" value="50">硕士</option>
                                    <option label="博士" value="60">博士</option>
                                </select>
                            </td>
                        </tr>
                        <!-- 学历 end -->
                        <tr>
                            <td class="md_l">有无照片：</td>
                            <td>
                                <select name="marital-requHasphoto" class="m_select195" id="requHasphoto">
                                    <option value="0">--不限--</option>
                                    <option label="有照片" value="1">有照片</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="md_l">性别：</td>
                            <td>
                                <select name="requGender" class="m_select195" id="requGender">
                                    <option value="0">--不限--</option>
                                    <option label="男" value="1">男</option>
                                    <option label="女" value="2">女</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="md_l">薪资：</td>
                            <td>
                                <select name="requIncome" class="m_select195" id="requIncome">
                                    <option value="0">--不限--</option>
                                    <option label="2000以下" value="1">2000以下</option>
                                    <option label="2000～5000" value="2">2000～5000</option>
                                    <option label="5000～10000" value="3">5000～10000</option>
                                    <option label="10000～20000" value="4">10000～20000</option>
                                    <option label="20000～50000" value="5">20000～50000</option>
                                    <option label="50000以上" value="6">50000以上</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="md_l">民族：</td>
                            <td>
                                <select name="requNation" class="m_select195" id="requNation">
                                    <option value="0">--不限--</option>
                                    <option label="汉族" value="1">汉族</option>
                                    <option label="藏族" value="2">藏族</option>
                                    <option label="朝鲜族" value="3">朝鲜族</option>
                                    <option label="蒙古族" value="4">蒙古族</option>
                                    <option label="回族" value="5">回族</option>
                                    <option label="满族" value="6">满族</option>
                                    <option label="维吾尔族" value="7">维吾尔族</option>
                                    <option label="壮族" value="8">壮族</option>
                                    <option label="彝族" value="9">彝族</option>
                                    <option label="苗族" value="10">苗族</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="md_l">血型：</td>
                            <td>
                                <select name="requBloodType" class="m_select195" id="requBloodType">
                                    <option value="0">--不限--</option>
                                    <option label="A型" value="1">A型</option>
                                    <option label="B型" value="2">B型</option>
                                    <option label="O型" value="3">O型</option>
                                    <option label="AB型" value="4">AB型</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="md_l">生肖：</td>
                            <td>
                                <select name="requZodiac" class="m_select195" id="requZodiac">
                                    <option value="0">--不限--</option>
                                    <option label="鼠" value="1">鼠</option>
                                    <option label="牛" value="2">牛</option>
                                    <option label="虎" value="3">虎</option>
                                    <option label="兔" value="4">兔</option>
                                    <option label="龙" value="5">龙</option>
                                    <option label="蛇" value="6">蛇</option>
                                    <option label="马" value="7">马</option>
                                    <option label="羊" value="8">羊</option>
                                    <option label="猴" value="9">猴</option>
                                    <option label="鸡" value="10">鸡</option>
                                    <option label="狗" value="11">狗</option>
                                    <option label="猪" value="12">猪</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="md_l">星座：</td>
                            <td>
                                <select name="requConstellation" class="m_select195" id="requConstellation">
                                    <option value="0">--不限--</option>
                                    <option label="白羊座" value="1">白羊座</option>
                                    <option label="金牛座" value="2">金牛座</option>
                                    <option label="双子座" value="3">双子座</option>
                                    <option label="巨蟹座" value="4">巨蟹座</option>
                                    <option label="狮子座" value="5">狮子座</option>
                                    <option label="处女座" value="6">处女座</option>
                                    <option label="天秤座" value="7">天秤座</option>
                                    <option label="天蝎座" value="8">天蝎座</option>
                                    <option label="射手座" value="9">射手座</option>
                                    <option label="摩羯座" value="10">摩羯座</option>
                                    <option label="水瓶座" value="11">水瓶座</option>
                                    <option label="双鱼座" value="12">双鱼座</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <table class="w_degree">
                        <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <input type="button"  class="save" value="保存" onclick="updateComdition()">
                                <input type="reset"  class="skip" value="清除择偶要求">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div><b class="l4 b2"></b><b class="l3 b2"></b><b class="l2 b2"></b><b class="l1"></b></div>
    </div>
</div>
</div>
<%@include file="footer.jsp"%>
<script type="text/javascript">
</script>
</body>
</html>
