<%@ page import="com.junruo.hungry.entity.User" %>
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
    <title>修改用户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body  class="text-center">

<%
    User user1 = (User) session.getAttribute("user");
    if (user1 == null) {
        response.sendRedirect("login.jsp");
    }else if(user1.getIdent() == 0 ||user1.getIdent() == 1||user1.getIdent() == 2){

    User user = (User) request.getAttribute("UpUser");
%>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="alert alert-success">
                <div class="main">
                    <div class="login-form">
                        <h1>修改用户信息</h1>
                        <hr>
                        <form action="${pageContext.request.contextPath}/update" method="post"  onsubmit="return check()">
                            <p>
                                <p class="text-danger">ID</p>
                                <input type="text" value="<%=user.getId()%>" name="id" id="id" readonly="readonly">
                            </p>
                            <hr>
                            <p>
                                <p class="text-success"> 昵称</p>
                                <input type="text" value="<%=user.getName()%>" name="name" id="name">
                            </p>
                            <hr>
                            <p>
                                <p class="text-danger">用户名</p>
                                <input type="text" value="<%=user.getUsername()%>" name="username" id="username"  readonly="readonly">
                            </p>
                            <hr>
                            <p>
                                <p class="text-success"> 密码(留空不更改密码)</p>
                                <input type="password" value="" name="password" id="password">
                            </p>
                            <input type="hidden" value="<%=user.getIdent()%>" name="ident" id="ident">
                            <hr>
                            <p><p class="text-success"> 手机号</p>
                                <input type="text" value="<%=user.getTelephone()%>" name="telephone" id="telephone">
                            </p>
                            <hr>
                            <p><p class="text-success"> 地址</p>
                                <input type="text" value="<%=user.getAddress()%>" name="address" id="address">
                            </p>
                            <hr>
                            <p><p class="text-success"> 备注</p>
                                <input type="text" value="<%=user.getComment()%>" name="comment" id="comment">
                            </p>
                            <hr>
                            <p>
                                <input type="hidden" value="<%=user1.getComment()%>" name="sname" id="sname">
                            </p>

                            <p>
                                <input type="submit" value="更新">
                            </p>

                        </form>

                        ${mess}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    }else {
        System.out.println(user1.getIdent());
%>
<div class="alert alert-danger">您好！<%=user1.getName()%>，非管理员，禁止访问。&nbsp;<a href="${pageContext.request.contextPath}/login.jsp">点我登录管理员账号重试</a></div>
<%
    }
%>
<script src="${pageContext.request.contextPath}/js/md5.js"></script>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
<script type="text/javascript">
    function check(){
        let pwd = document.getElementById('password') // 获取 password 的属性值
        pwd.value = md5(pwd.value)

        return true;
    }

</script>

</html>
