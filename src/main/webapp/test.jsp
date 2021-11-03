<%@ page import="com.junruo.hungry.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

    <%
        String name = "login.jsp";
    %>
    <form action="<%=name%>" method="post">
        <button type="submit">提交</button>
    </form>

    <br><hr>

    <% for (int i = 1; i <3; i++) { %>

    file <%=i%>：<input type="text" name="<%="file"+i%>"><br>
    <%
        }
    %>

    <br><hr>

    <%!
        int i=0;

        /**
         * @作者：君若
         * @功能：该方法用来实现一个简单的计数器
         */
        synchronized void add(){
            i++;
        }

    %>
    <% add(); %>
    当前访问次数：<%=i%>


    <br><hr>

    <jsp:include page="test1.jsp" flush="true">
        <jsp:param name="name"  value="wangwu"/>
    </jsp:include>


    <br><hr>
<%--

    <%@ include file="test1.jsp" %>
--%>

    <br><hr>

    <%--
    <jsp:forward page="test1.jsp"/>
--%>
    <br><hr>



    <br><hr>


    <br><hr>


    <br><hr>


    <br><hr>




</body>

    <script>


    </script>
</html>