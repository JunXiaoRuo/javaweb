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
                <input type="text" name="name" id="name" placeholder="昵称"><br>
                <input type="text" name="username" id="username" placeholder="用户名"><br>
                <input type="password" name="password"  placeholder="密码" id="password"><br>
                <input type="password"  id="upassword" placeholder="确认密码">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交</button>
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
                <th><button type="button" class="btn btn-danger" onclick="deleteUser(${o.id })">删除</button>&nbsp;<button type="button" class="btn btn-warning" onclick="updateUser(${o.id })">修改</button></th>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<%
}else {
%>
<div class="alert alert-danger">您好！<%=user.getName()%>，非管理员，禁止访问。&nbsp;<a href="/Hungry/login.jsp">点我登录管理员账号重试</a></div>


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
        httpPost("findUpdate", {"id":id});
            //window.location.href="${pageContext.request.contextPath}/findUpdate?id="+id;
        }




</script>

</html>
