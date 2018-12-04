
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户模块</title>
</head>
<body>
    <div class="container">
        <!-- 添加框 -->
        <div></div>
        <div class="modal fade" id="modalAddEmp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            添加用户
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form id="form_add" class="form-horizontal" role="form">
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">名字</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id = "userName" name="userName" placeholder="请输入用户姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id = "userAge" name="userAge" placeholder="请输入用户年龄">
                                </div>
                            </div>
                            <div class="form-group">
                                <label   class="col-sm-2 control-label">地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id = "userAddress" name="userAddress" placeholder="请输入用户地址">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button id="btnadd"  onclick="addUser()" type="button" class="btn btn-primary" data-dismiss="modal">确认添加</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>

        <!-- 修改框 -->
        <div>
            <div   class="modal fade" id="modalUpdateEmp" tabindex="-2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                修改员工
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form id="form_update" class="form-horizontal" role="form">
                                <input type="text" id ="id" name="id"         hidden="hidden">
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">名字</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="name" class="form-control"  name="userName" placeholder="请输入用户姓名">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">职业</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="age" class="form-control" name="userAge" placeholder="请输入用户年龄">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">薪水</label>
                                    <div class="col-sm-10">
                                        <input type="text" id="address" class="form-control" name="userAddress" placeholder="请输入用户地址">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button id="btnupdate" type="button" class="btn btn-primary" data-dismiss="modal">确认修改</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal -->
            </div>
        </div>

        <a id="btnAdd" class="btn btn-default btn-lg " data-toggle="modal" data-target="#modalAddEmp">添加用户</a>
        <a id="btnLogin" class="btn btn-default btn-lg "  href="${pageContext.request.contextPath}/login">用户登录</a>
        <div id="userlist">
            <table class="table table-hover" id="tbl">
                <caption>用户信息列表</caption>
                <thead>
                <tr>
                    <th>用户编号</th>
                    <th>用户姓名</th>
                    <th>用户年龄</th>
                    <th>用户地址</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody">

                </tbody>
            </table>

            <div id="pagearea">

            </div>
        </div>
    </div>

    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var url_getuser = '${pageContext.request.contextPath}/user/get';
        var url_adduser = '${pageContext.request.contextPath}/user/save';
        var url_updateuser = '${pageContext.request.contextPath}/user/update';
        var url_getuserlist = '${pageContext.request.contextPath}/user/all';
        //页面加载后，首先加载所有的用户数据
        window.onload=function() {
            refreshUserList(url_getuserlist);
        }

        //加载用户数据
        var xhr = null;
        function refreshUserList(url_getuserlist) {
            var objArr = null;
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET", url_getuserlist, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUsers;
            xhr.send();
        }

        function loadUsers() {
            if (xhr.readyState == 4 && xhr.status == 200) {
               // alert("pagemodel:" + xhr.responseText);
                var result = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result.modelList;
                var tbody = document.getElementById("tbody");
                tbody.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    tbody.innerHTML += ('<tr><td>' + objArr[i].id + '</td>' +
                        '<td>' + objArr[i].userName + '</td>' +
                        '<td>' + objArr[i].userAge + '</td>' +
                        '<td>' + objArr[i].userAddress + '</td>' +
                        '<td><a id="btnDel" name="' + objArr[i].id + '"   onclick="delUser(this)">删除</a>  &nbsp&nbsp&nbsp&nbsp  ' +
                        ' <a id="btnModif"  name="' + objArr[i].id + '"  href="javascript:getuser()" data-toggle="modal" data-target="#modalUpdateEmp">修改</a></td></tr>');
                }
                //2. 页码渲染
                var pagearea =   document.getElementById("pagearea");
                pagearea.innerHTML="";
                // var url_getuserlist = '${pageContext.request.contextPath}/users/all/page/2';
                //(1)上一页
                if(result.currentPageCode !=1){// 不是首页，则显示上一页
                    var url_pre_page = url_getuserlist +"/page/"+(result.currentPageCode-1);
                    var  href='javascript:refreshUserList("'+url_pre_page+'")';
                    var prePageEle = "<a  href='"+href+"'> 上一页</a>";
                    pagearea.innerHTML+=prePageEle;
                }
                //(2)当前页码
                var currentPageEle = " <span>当前是第</span><span>"+result.currentPageCode+"</span> <span>页</span>";
                pagearea.innerHTML+=currentPageEle;
                //(3)下一页
                if(result.currentPageCode != result.totalPages){
                    var url_next_page = url_getuserlist +"/page/"+(result.currentPageCode+1);
                    var  href='javascript:refreshUserList("'+url_next_page+'")';
                    var nextPageEle = "<a  href='"+href+"'> 下一页</a>";
                    pagearea.innerHTML+=nextPageEle;
                }
                //(4) 页码其他信息
                var othersEle = "<span>共</span><span>"+result.totalPages+"</span><span>页</span>\n" +
                    "            <input type=\"text\" name=\"\">\n" +
                    "            <button >跳转</button>";
                pagearea.innerHTML+=othersEle;
            }
        }

        //添加新用户
        function  addUser() {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            var userName =  document.getElementById("userName").value;
            var userAge =  document.getElementById("userAge").value;
            var userAddress =  document.getElementById("userAddress").value;
            var formData = "userName=" + document.getElementById("userName").value + "&userAge="+document.getElementById("userAge").value
                        +"&userAddress="+document.getElementById("userAddress").value;
            xhr.open("POST", url_adduser);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
            xhr.onreadystatechange = refresh;
            xhr.send(formData);
        }

         //删除用户
        function delUser(ele) {
            var url_deluser = '${pageContext.request.contextPath}/user/delete';
            // 消息确认框
            if(window.confirm("确认删除？")) {
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                }
                var delId = ele.name;
                url_deluser += "/" + delId;
                xhr.open("DELETE", url_deluser);
                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                xhr.onreadystatechange = refresh;
                xhr.send();
            }
        }

        function refresh() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                refreshUserList(url_getuserlist);
            }
        }

       //获得用户个人信息
        function getuser() {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            var id = document.getElementById("btnModif").name;
            url_getuser +="/"+id;
            alert("url_getuser =" + url_getuser);
            xhr.open("PUT", url_getuser);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadUser4update();
            xhr.send();
        }

        function  loadUser4update() {

        }
    </script>
</body>
</html>
