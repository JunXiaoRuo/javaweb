<%@ page import="com.junruo.hungry.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h1 class="text-center">欢迎使用本系统！</h1>
<hr>
<%
    User user = (User) session.getAttribute("user");
    if (user == null){
//        out.print("<script>alert('请登录后使用！');window.location.href='/Hungry/login.jsp'</script>");
        %>
<div class="alert alert-info">您好！游客。&nbsp;<a href="${pageContext.request.contextPath}/login.jsp">点我登录</a></div>
<%
    }else {
        %>
<div class="alert alert-success">欢迎您：<%=user.getName()%>！&nbsp;<a href="${pageContext.request.contextPath}/logout.jsp">点我注销</a></div>

<%
    String code = (String) request.getAttribute("code");
    if (code == "0"){
%>
<div class="alert alert-danger">${mess}</div>
<%
    }
%>
<button type="button" class="btn btn-success"  onclick="findById()">查询用户(管理员)</button>
<button type="button" class="btn btn-success"  onclick="findFoodAll()">管理菜品(管理员)</button>
<button type="button" class="btn btn-success"  onclick="updateUser('<%=user.getId()%>')">修改个人信息</button>
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


    function findById() {
        window.location.href="${pageContext.request.contextPath}/findById.jsp";
    }
    function findFoodAll() {
        window.location.href="${pageContext.request.contextPath}/findFoodById.jsp";
    }

    function updateUser(id){
        httpPost("findUpdate", {"type":1,"id":id});
        //window.location.href="${pageContext.request.contextPath}/findUpdate?id="+id;
    }

</script>
</html>
