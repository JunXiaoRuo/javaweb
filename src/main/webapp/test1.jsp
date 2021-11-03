<%@ page import="com.junruo.hungry.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

<%
    String uname = request.getParameter("name");
%>

<input name="name" type="text" value="<%=uname%>"/>



</body>
</html>