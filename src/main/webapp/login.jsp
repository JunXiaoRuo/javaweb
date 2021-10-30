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

    <script src="${pageContext.request.contextPath}/js/md5.js"></script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
    <!--樱花特效引入-->
    <script src="${pageContext.request.contextPath}/js/sakuraPlus.js"></script>


    <style>
        body{
            width:100%;
            height:100%;
            background: url(images/background.jpg) no-repeat;
            background-size:cover;
            /* 背景半透明，1为不透明 */
            opacity: 0.8; /* ALL */
            -moz-opacity:0.5;/* FIREFOX */
            filter:alpha(Opacity=50);/* IE */

        }
        .modal {
            position: static;
            display: block;
        }
    </style>

</head>
<body class="text-center">
<%session.removeAttribute("user"); session.invalidate();%>

<div class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">账号密码登录</h2>

            </div>
            <div class="modal-body">
                <%
                    String code = (String) request.getAttribute("code");
                    if (code == "0"){
                %>

                <div class="alert alert-danger">${mess}</div>
                <br>
                <%
                    }
                %>
                <form class="form clo-md-12 center-block" id="regForm" action="${pageContext.request.contextPath}/login" method="post" onsubmit="return check();">
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
                            <input class="form-control" id="password" name="password" type="password" placeholder="密码" required autofocus>
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">登录</button>
                    <br><br>
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="login();">使用手机号登录</button>
                    <button class="btn btn-outline-secondary" type="button" id="button-addon3" onclick="reg();">注册</button>

                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function check(){
        let pwd = document.getElementById('password') // 获取 password 的属性值
        pwd.value = md5(pwd.value)

        return true;
    }

    function login(){
        window.location.href='/phoneLogin.jsp'
    }


    function reg(){
        window.location.href='/reg.jsp'
    }

</script>

</html>
