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
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<%session.removeAttribute("user"); session.invalidate();%>

<div class="main">
    <div class="login-form">
        <h1>登录</h1>
        <br>
        <%
            String code = (String) request.getAttribute("code");
            if (code == "0"){
        %>
        <div class="alert alert-danger">${mess}</div>
        <%
            }
        %>
        <div class="head">
            <img src="${pageContext.request.contextPath}/images/user.png" alt=""/>
        </div>
        <form action="${pageContext.request.contextPath}/login" method="post"  onsubmit="return check()">
            <input type="text" class="text" name="username" placeholder="用户名" id="username"/>
            <input type="password" name="password" id="password" placeholder="密码"/>
            <div class="submit">
                <input type="submit"  value="登录" />
            </div>



            <p><a href="${pageContext.request.contextPath}/phoneLogin.jsp">手机号登录</a></p>
            <p><a href="${pageContext.request.contextPath}/reg.jsp">注册账号</a></p>
        </form>
    </div>
</div>





<script src="${pageContext.request.contextPath}/js/md5.js"></script>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
    function check(){
        var username = $("#username").val();
        var password = $("#password").val();

        if(username == null || username == ""){
            alert("ID不能为空");
            return false;

        }else if (password == null || password == ""){
            alert("密码不能为空");
            return false;
        }

        let pwd = document.getElementById('password') // 获取 password 的属性值
        pwd.value = md5(pwd.value)

        return true;
    }

</script>
</html>
