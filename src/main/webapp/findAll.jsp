<%@ page import="java.util.List" %>
<%@ page import="com.junruo.hungry.entity.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 18137
  Date: 2021/9/27
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<html>
<head>
    <title>所有用户</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/md5.js"></script>
    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
</head>
<body>

<h1 class="text-center">查询所有用户</h1>

<hr>
<%
    User user = (User) session.getAttribute("user");
    if (user == null){
        response.sendRedirect("login.jsp");
%>
<div class="alert alert-danger">您好！游客。无操作权限！&nbsp;<a href="${pageContext.request.contextPath}/login.jsp">点我登录管理员账号重试</a></div>

<%
}else if(user.getIdent() == 2){
%>
<div class="alert alert-success">您好！<%=user.getName()%> <a href="${pageContext.request.contextPath}/logout.jsp">点我注销</a></div>
<%
    String code = (String) request.getAttribute("code");
    if (code == "0"){
%>
<div class="alert alert-danger">${mess}</div>
<%
    }
%>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    添加用户
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">添加用户</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <form class="form clo-md-12 center-block" id="regForm" action="${pageContext.request.contextPath}/addUser" method="post" onsubmit="return check();">

                    <div class="form-group-lg" id="nameDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-pencil-fill"></i>
                            </span>
                            <input class="form-control" id="name" name="name" type="text" placeholder="昵称" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="accountDiv">
                        <div class="input-group">
                           <span class="input-group-text">
                                <i class="bi bi-person-fill"></i>
                            </span>
                            <input class="form-control" id="username" name="username" type="text" placeholder="用户名(字母或数字)" onkeyup="value=value.replace(/[\W]/g,'') "
                                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="pwdDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-key-fill"></i>
                            </span>
                            <input class="form-control" id="password" name="password" type="text" placeholder="密码" required autofocus>
                            <span class="badge bg-success message1"><p class="message">请输入8~18位密码</p></span>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="telDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-telephone-fill"></i>
                            </span>
                            <input class="form-control" id="phone" name="phone" type="text" placeholder="手机号" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="userTypeDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-bookmark-plus-fill"></i>
                            </span>
                            <select class="form-select" id="userType" name="userType">
                                <option selected>选择用户类型</option>
                                <option value="0">客户</option>
                                <option value="1">商户</option>
                                <option value="2">管理员</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="commentDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-cursor-text"></i>
                            </span>
                            <input class="form-control" id="comment" name="comment" type="text" placeholder="备注" required autofocus>
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">提交</button>

                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="sexampleModal" tabindex="-1" aria-labelledby="sexampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="sexampleModalLabel">修改用户</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <form class="form clo-md-12 center-block" id="sregForm" action="${pageContext.request.contextPath}/update" method="post" onsubmit="return scheck();">

                    <div class="form-group-lg" id="sidDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-cursor-text"></i>
                            </span>
                            <input class="form-control" id="sid" name="id" type="text" placeholder="ID" readonly="readonly" required autofocus >
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="snameDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-pencil-fill"></i>
                            </span>
                            <input class="form-control" id="sname" name="name" type="text" placeholder="昵称" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="saccountDiv">
                        <div class="input-group">
                           <span class="input-group-text">
                                <i class="bi bi-person-fill"></i>
                            </span>
                            <input class="form-control" id="susername" name="username" type="text" placeholder="用户名(字母或数字)" onkeyup="value=value.replace(/[\W]/g,'') "
                                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="spwdDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-key-fill"></i>
                            </span>
                            <input class="form-control" id="spassword" name="password" type="text" placeholder="密码（留空则不修改）" >
                            <span class="badge bg-success message1"><p class="message">请输入8~18位密码</p></span>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="stelDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-telephone-fill"></i>
                            </span>
                            <input class="form-control" id="sphone" name="telephone" type="text" placeholder="手机号" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="saddDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-cursor-fill"></i>
                            </span>
                            <input class="form-control" id="saddress" name="address" type="text" placeholder="地址" required autofocus>
                            <input type="hidden" value="<%=user.getName()%>" name="sname" id="ssname">
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="suserTypeDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-bookmark-plus-fill"></i>
                            </span>
                            <select class="form-select" id="suserType" name="ident">
                                <option selected>选择用户类型</option>
                                <option value="0">客户</option>
                                <option value="1">商户</option>
                                <option value="2">管理员</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="scommentDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-cursor-text"></i>
                            </span>
                            <input class="form-control" id="scomment" name="comment" type="text" placeholder="备注" >
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">提交</button>

                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>



<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th><p class="text-success">编号</p></th>
                <th><p class="text-success">昵称</p></th>
                <th><p class="text-success">用户名</p></th>
                <%--<th><p class="text-success">密码</p></th>--%>
                <th><p class="text-success">类型</p></th>
                <th><p class="text-success">手机号</p></th>
                <th><p class="text-success">地址</p></th>
                <th><p class="text-success">备注</p></th>
                <th><p class="text-success">修改时间</p></th>
                <th><p class="text-success">修改人</p></th>
                <th><p class="text-success">操作</p></th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${findAll }" var="o">
            <tr>
                <th>${o.id } </th>
                <th>${o.name } </th>
                <th>${o.username } </th>
                <%--<th>${o.password } </th>--%>

                <th>${o.pname }</th>
                <th>${o.telephone } </th>
                <th>${o.address } </th>
                <th>${o.comment } </th>
                <th>${o.time } </th>
                <th>${o.sname } </th>
                <th><button type="button" class="btn btn-danger" onclick="deleteUser(${o.id })">删除</button>&nbsp;<button type="button" class="btn btn-warning" onclick="updateUser(${o.id })" data-bs-toggle="modal" data-bs-target="#sexampleModal">修改</button></th>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<%
}else {
%>
<div class="alert alert-danger">您好！<%=user.getName()%>，非管理员，禁止访问。&nbsp;<a href="login.jsp">点我登录管理员账号重试</a></div>


<%
    }
%>


</body>
<script type="text/javascript">
    //发送POST请求跳转到指定页面
    function httpPost(URL, PARAMS) {
        var temp = document.createElement("form");
        temp.action = URL;
        temp.method = "post";
        temp.style.display = "none";

        for (var x in PARAMS) {
            var opt = document.createElement("textarea");
            opt.name = x;
            opt.value = PARAMS[x];
            temp.appendChild(opt);
        }

        document.body.appendChild(temp);
        temp.submit();

        return temp;
    }

    function deleteUser(id){
        var r=confirm("是否删除？");
        if (r==true){
            httpPost("delete", {"type":2,"id":id});
            //window.location.href="${pageContext.request.contextPath}/delete?type=2&id="+id;
        }
        else{

        }

    }


    function updateUser(id){
        var sid = document.getElementById("sid")
        var sname = document.getElementById("sname")
        var susername = document.getElementById("susername")
        var sphone = document.getElementById("sphone")
        var saddress = document.getElementById("saddress")
        var suserType = document.getElementById("suserType")
        var scomment = document.getElementById("scomment")
        $.ajax({
            type:"post",    //post put get 等等
            url:"findUpdate",
            //编写注册功能时，要将异步设置为false（缺省为true）
            //如果async是ture,对于FireFox浏览器，会刷新掉alert()弹出框的内容
            // 对于Chrome浏览器，第一次注册时会执行error的回调函数，输出“请求在连接过程中出现错误..”
            async:false,
            data:{       //要传入ashx文件的数据
                "id":id,
                "type":3
            },
            success:function (data){
                var jsonObj = JSON.parse( data );
                sid.value = jsonObj.id;
                sname.value = jsonObj.name;
                susername.value = jsonObj.username;
                sphone.value = jsonObj.telephone;
                saddress.value = jsonObj.address;
                suserType.value = jsonObj.ident;
                scomment.value = jsonObj.comment;
            },
            error:function (XMLHttpRequest, textStatus, errorThrown){   //连接至ashx文件失败时，执行函数
                //XMLHttpRequest在这个例子里没有用到
                // textStatus是表示状态的字符串，这里textStatus的值是"error"
                // errorThrown包含连接失败的信息，可以输出查看
                alert("请求在连接过程中出现错误..\n" + errorThrown);
            }
        });
    }


   /* function updateUser(id){
        httpPost("findUpdate", {"type":2,"id":id});
            //window.location.href="${pageContext.request.contextPath}/findUpdate?id="+id;
        }*/




</script>

<script type="text/javascript">

    var password = document.querySelector('#password');
    var message = document.querySelector('.message');
    var message1 = document.querySelector('.message1');
    var zmnumReg = /^[0-9a-zA-Z]*$/;

    password.onblur = function() {
        if (this.value.length < 8 || this.value.length > 18) {
            message1.className = 'badge bg-danger message1'
            message.innerHTML = '密码长度错误，应为8~18位';
            message.className = 'message';
        } else if (!zmnumReg.test(this.value)){
            message.innerHTML = '密码只能是字母或者数字';
            message1.className = 'badge bg-danger message1'
            message.className = 'message';
        }else {
            message.innerHTML = '密码格式正确';
            message1.className = 'badge bg-danger message1 visually-hidden'
            message.className = 'message';
        }
    }

    function check(){
        let pwd = document.getElementById('password') // 获取 password 的属性值
        pwd.value = md5(pwd.value)
        return true;
    }

    function scheck(){
        let pwd = document.getElementById('spassword') // 获取 password 的属性值
        pwd.value = md5(pwd.value)
        return true;
    }



</script>

</html>
