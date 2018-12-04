<%--
  Created by IntelliJ IDEA.
  User: wwwlj
  Date: 2018/10/22
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>星座速配</title>
    <script src="../../js/jquery-3.3.1.js"></script>
    <script  src="../../js/constellation.js"></script>
    <link href="../../css/constellation.css" rel="stylesheet"/>
</head>
<body>
<%@include file="header.jsp"%>
<div class="search_box">
    <div class="search_bg">
        <div id="query_tip_div" style="width:100%;text-align:center;display:none"><strong id="query_tip" style="font-size:14px;padding:6px;border:0pt none;top:0pt;background:none repeat scroll 0% 0% rgb(255, 241, 168);position:absolute;font-weight:bold;">载入中</strong></div>
        <img src="http://images1.jyimg.com/w4/search/v2/i/search_logo.jpg" class="search_logo" />
        <ul class="search_tab" id="channel_bar">
            <li id="bar_default" class="cur"><a href="${pageContext.request.contextPath}/search/load" class="left">全部会员</a></li>
            <li id="bar_astro"><a href="">星座速配</a></li>
            <li id="bar_hot" style="position:relative;"><a href="${pageContext.request.contextPath}/popularityRanking">佳缘热榜</a></li>
        </ul>

    </div>
    <script>
        showCurChannelBar();
    </script>
    <div class="cont">
        <div class="pd_t10">
            <ul class="xz_list" id="xz_list">
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_baiyang.gif"/>
                        <p>白羊座 3/20-4/20</p>
                    </div>
                    <div class="info ys">
                        <strong>白羊座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:36px;"></em></span>
                        <strong>速配星座：</strong>天秤座<br />
                        <strong>幸运数字：</strong>9
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;在别人的背後批评会让自己扯入麻烦中，对大夥儿七嘴八舌的八卦传言还是躲远一点比较好。<br />
                            &emsp;&emsp;将精神、注意力多放在自己的事情上，别人家的闲事少管。工作上也是先求简单就好，与其积极地抢出头，还是保守一点看好周围的状况再说。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_jinniu.gif"/>
                        <p>金牛座 4/19-5/21</p>
                    </div>
                    <div class="info ys">
                        <strong>金牛座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:72px;"></em></span>
                        <strong>速配星座：</strong>双鱼座<br />
                        <strong>幸运数字：</strong>3
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;想利用璁假剩馀的时间好好做的事就不要再犹豫了。<br />
                            &emsp;&emsp;既然有心那就应该迈出第一步了。感性也很不错的今天，作家、诗人等文字工作者而言有著让人心动的灵感呢，投稿应该会获得采用喔。今天有时间的话最好去看看国外的资讯，可获得不错的情报。爱情方面，外出时有遇到理想对象的预感，穿戴同色调的服饰、配件外出更佳。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_shuangzi.gif"/>
                        <p>双子座 5/20-6/22</p>
                    </div>
                    <div class="info ys">
                        <strong>双子座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>狮子座<br />
                        <strong>幸运数字：</strong>2
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;工作上的沟通运有著不安定气息，职场中的遣词用句需多加留意的一天。<br />
                            &emsp;&emsp;特别是对上司、前辈在提出建议时，要细心些不要伤到对方的自尊，这点可是今天待人面上的关键喔。另外，别人家的传言、坏话，不管是说或听都应避免，由什麽地方会　漏出去的暗示哟。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_juxie.gif"/>
                        <p>巨蟹座 6/21-7/23</p>
                    </div>
                    <div class="info ys">
                        <strong>巨蟹座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:72px;"></em></span>
                        <strong>速配星座：</strong>天秤座<br />
                        <strong>幸运数字：</strong>3
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;人际关系活泼的一天，不过却也因过於活络而有阻塞现象。<br />
                            &emsp;&emsp;要拜访的行程或者是安排会面的人一多就很容易搞混乱了，像是同时间约了不同的人、搞错对象或时间等都要注意了。只要是有关联络、传达的事项，记得一定用笔记录下来。另外今天也是与医疗、慈善活动有缘的日子，如果有这方面的活动尽量参与。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_shizi.gif"/>
                        <p>狮子座 7/22-8/23</p>
                    </div>
                    <div class="info ys">
                        <strong>狮子座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>魔羯座<br />
                        <strong>幸运数字：</strong>1
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;新的人际关系将关系著未来的发展，特别是工作方面相关的往来人物中就有这关键之人的预感。<br />
                            &emsp;&emsp;早上的电话是开启今天运势的成功之钥，一天的约定行程就在电话中迅速敲定。还有，与人相约在外面用餐，让今天洽谈能够更顺利喔。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_chunu.gif"/>
                        <p>处女座 8/22-9/23</p>
                    </div>
                    <div class="info ys">
                        <strong>处女座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>金牛座<br />
                        <strong>幸运数字：</strong>8
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;周围他人的粗心大意看在你眼里如梗於喉，不说出来觉得很难过。<br />
                            &emsp;&emsp;但真说出口了却会惹出意外的麻烦，还是睁苹眼闭苹眼的过去，明则保身为宜。而与同僚、上司间则有一触即发的态势，一味强调自己的想法，似乎没有获胜的机会。还是抱著吃亏就是占便宜的精神，先道歉了事算了。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_tianping.gif"/>
                        <p>天秤座 9/22-10/24</p>
                    </div>
                    <div class="info ys">
                        <strong>天秤座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>狮子座<br />
                        <strong>幸运数字：</strong>1
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;沟通运颇佳的一天，你在其他人心目中的信赖度提升。<br />
                            &emsp;&emsp;今天正是个适合订立契约、交涉商谈的日子，而且结论、成果也很顺利圆满的暗示呢。交涉事项、研讨会议等，今天只要集中精力则成功的可能性大。之前策划的企划案子今天也是发表的好时机。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_tianxie.gif"/>
                        <p>天蝎座 10/23-11/22</p>
                    </div>
                    <div class="info ys">
                        <strong>天蝎座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>魔羯座<br />
                        <strong>幸运数字：</strong>0
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;吃重的工作让今天的你令人感觉有些神经质的倾向，轻轻一碰触就一副坐立不安的样子。<br />
                            &emsp;&emsp;像这种时候更应避免抽烟、饮酒，不仅无济无事，只会更添压力感而已哟。爱情运也应注意拐弯抹角的想套对方的话反而引起误解，真的有疑惑想问的事情就坦率一点直接问个清楚吧。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_sheshou.gif"/>
                        <p>射手座 11/21-12/22</p>
                    </div>
                    <div class="info ys">
                        <strong>射手座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>巨蟹座<br />
                        <strong>幸运数字：</strong>5
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;前方的浓雾还未消散前就暂时别开快车，越是心急越出错的倾向。<br />
                            &emsp;&emsp;最好先压抑一下冲动想偷跑的情绪，谨慎有助於你慢慢但平安地往前进。另外，父亲将是为你解决烦恼事的有力人士，有什麽烦恼别不好意思说出口，试著询问他的意见吧。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_mojie.gif"/>
                        <p>魔羯座 12/21-1/20</p>
                    </div>
                    <div class="info ys">
                        <strong>魔羯座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>金牛座<br />
                        <strong>幸运数字：</strong>8
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;今天提出来的意见能够获得大多数人赞同，不论是在会议或社团活动规划都要多多发言喔。<br />
                            &emsp;&emsp;特别今天对外交涉、商谈你将有机会成为主角，秀出自己最有自信的一面，有气势就有惹人注目的机会。不过商谈过程中听从夥伴的话反而对你不是很有利，还是多相信自己的判断比较准确喔。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_shuiping.gif"/>
                        <p>水瓶座 1/19-2/19</p>
                    </div>
                    <div class="info ys">
                        <strong>水瓶座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:72px;"></em></span>
                        <strong>速配星座：</strong>巨蟹座<br />
                        <strong>幸运数字：</strong>6
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;在工作上让灵感尽量发挥，不过今天也有过度感性的倾向喔。<br />
                            &emsp;&emsp;神经纤细地随著周围一点环境变化就被牵动了，一下热泪盈框、一下又怒气冲冲的。不过反过来看，有时候让感情能够随波奔放也是一种纾解方式，说不定忽然才惊觉平常自己是多麽压抑呢。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
                <li class="clear">
                    <div class="xz">
                        <img src="../../img/constellationImg/xz_shuangyu.gif"/>
                        <p>双鱼座 2/18-3/21</p>
                    </div>
                    <div class="info ys">
                        <strong>双鱼座今日运势</strong><br />
                        <p class="currtime"></p>
                        <strong>爱情运势：</strong><span class="love_xj" style="width:87px;"><em style="width:54px;"></em></span>
                        <strong>速配星座：</strong>双鱼座<br />
                        <strong>幸运数字：</strong>2
                    </div>
                    <div class="info gs">
                        <p>
                            <strong>今日概述：</strong><br />
                            &emsp;&emsp;选边站也要眼睛放亮一点，想要西瓜靠大边依赖别人关照，结果却是靠错边、跟错人的暗示。<br />
                            &emsp;&emsp;一心想要沾别人的光，反而使自己丧失光彩，还可能错失难得的活跃机会。以自己的意志表现能力才能获得认同喔。其实今天在社交活动中你的人气应该不错，少当个跟班就对啦。
                        </p>
                        <a href="${pageContext.request.contextPath}/search/load" class="chakan_btn">查看我的速配好友</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
