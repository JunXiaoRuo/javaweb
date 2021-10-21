<%@ page import="com.junruo.hungry.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 18137
  Date: 2021/9/27
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户查询</title>
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<h1 class="text-center">用户查询</h1>
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


<form action="${pageContext.request.contextPath}/findById" method="post" onsubmit="return check()">
    <p class="text-primary">
        ID：<input type="number" name="id" id="uid">
    </p>
    <button type="submit" class="btn btn-success">查询</button>

</form>
<%
    String code = (String) request.getAttribute("code");
    if (code == "0"){
%>
<div class="alert alert-danger">${mess}</div>
<%
    }
%>

<form action="${pageContext.request.contextPath}/findAll" method="post">

    <button type="submit" class="btn btn-primary">查询所有用户</button>
</form>

<%
    String code1 = (String) request.getAttribute("code");
    if (code == "1"){
%>

<table class="table table-hove">
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
    <tr>
        <th>${findUser.id } </th>
        <th>${findUser.name } </th>
        <th>${findUser.username } </th>
        <%--<th>${findUser.password } </th>--%>
        <th>${o.pname }</th>
        <th>${findUser.telephone } </th>
        <th>${findUser.address } </th>
        <th>${findUser.comment } </th>
        <th>${findUser.time } </th>
        <th>${findUser.sname } </th>
        <th><button type="button" class="btn btn-danger" onclick="deleteUser(${findUser.id })">删除</button>&nbsp;<button type="button" class="btn btn-warning" onclick="updateUser(${findUser.id })">修改</button></th>

    </tr>
    </tbody>
</table>

<%
    }
%>





<%
        }else {
%>
<div class="alert alert-danger">您好！<%=user.getName()%>，非管理员，禁止访问。&nbsp;<a href="${pageContext.request.contextPath}/login.jsp">点我登录管理员账号重试</a></div>


<%
        }
%>


<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


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
                httpPost("delete", {"type":1,"id":id});
                //window.location.href="${pageContext.request.contextPath}/delete?type=1&id="+id;
            }
            else{

            }

        }
        function updateUser(id){
            httpPost("findUpdate", {"type":2,"id":id});
            //window.location.href="${pageContext.request.contextPath}/findUpdate?id="+id;
        }


    function check(){
        var uid = $("#uid").val();

        if(uid == null || uid == ""){
            alert("ID不能为空");
            return false;

        }
        return true;
    }

</script>
</html>