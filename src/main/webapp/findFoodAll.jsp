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
    <title>所有菜品</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
</head>
<body>

<h1 class="text-center">查询所有菜品</h1>

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

<div class="table-responsive">
    <table class="table table-hover">
        <thead>
        <tr>
            <th><p class="text-success">编号</p></th>
            <th><p class="text-success">用户ID</p></th>
            <th><p class="text-success">菜品名</p></th>
            <th><p class="text-success">菜品分类</p></th>
            <th><p class="text-success">特色</p></th>
            <th><p class="text-success">食材</p></th>
            <th><p class="text-success">价格</p></th>
            <th><p class="text-success">点餐人数</p></th>
            <th><p class="text-success">状态</p></th>
            <th><p class="text-success">备注</p></th>
            <th><p class="text-success">操作</p></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${foodList }" var="o">
            <tr>
                <th>${o.id } </th>
                <th>${o.uid } </th>
                <th>${o.foodname } </th>
                <th>${o.typename } </th>
                <th>${o.feature } </th>
                <th>${o.material } </th>
                <th>${o.price } </th>
                <th>${o.hits } </th>
                <th>
                    <c:if test="${o.state == 1 }">已上架</c:if>
                    <c:if test="${o.state == 0 }">已下架</c:if>
                </th>
                <th>${o.comment } </th>
                <th>
                    <c:if test="${o.state == 1 }">
                        <button type="button" class="btn btn-danger" onclick="down(${o.id })">下架</button>
                    </c:if>
                    <c:if test="${o.state == 0 }">
                        <button type="button" class="btn btn-success" onclick="up(${o.id })">上架</button>
                    </c:if>
                    <button type="button" class="btn btn-danger" onclick="deleteFood(${o.id })">删除</button>&nbsp;
                    <button type="button" class="btn btn-warning" onclick="updateFood(${o.id })">修改</button>
                </th>
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

    function up(id){
        httpPost("upAndDownFood", {"type":5,"id":id});
    }

    function down(id){
        var r=confirm("是否下架？");
        if (r==true){
            httpPost("upAndDownFood", {"type":6,"id":id});
        }
        else{}
    }
    function deleteFood(id){
        var r=confirm("是否删除？");
        if (r==true){
            httpPost("deleteFood", {"type":2,"id":id});
            //window.location.href="${pageContext.request.contextPath}/deleteFood?type=2&id="+id;
        }
        else{

        }

    }
    function updateFood(id){
        httpPost("findUpdate", {"type":2,"id":id});
            //window.location.href="${pageContext.request.contextPath}/findUpdate?id="+id;
        }




</script>

</html>
