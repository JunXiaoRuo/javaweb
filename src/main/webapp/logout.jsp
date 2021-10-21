<%--
  Created by IntelliJ IDEA.
  User: 18137
  Date: 2021/9/27
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出登录</title>
</head>
<body>
<%session.removeAttribute("user"); session.invalidate(); out.print("<script>alert('用户即将退出，确定后退出该页面。');window.location.href='/main.jsp'</script>"); %>

</body>
</html>
