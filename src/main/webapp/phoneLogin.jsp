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
    <title>手机号登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet" type="text/css" />


    <script src="${pageContext.request.contextPath}/js/md5.js"></script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.js"></script>

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

<div class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">手机号登录</h2>
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
                <form class="form clo-md-12 center-block" id="regForm" action="${pageContext.request.contextPath}/sendSms" method="post" onsubmit="return check();">
                    <div class="form-group-lg" id="telDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-telephone-fill"></i>
                            </span>
                            <input class="form-control" id="phone" name="phone" type="text" placeholder="手机号" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="addressDiv">
                        <div class="input-group">
                            <span class="input-group-text" >
                                <i class="bi bi-info-square-fill"></i>
                            </span>
                            <input class="form-control" id="code" name="code" type="text" placeholder="验证码" required autofocus>
                            <input type="button" id="btn" name="btn" value="发送验证码"class="btn btn-outline-secondary" onclick="sendCode(this)" class="btnSearch">
                        </div>
                    </div>
                    <input type="hidden" name="type" value="2">
                    <br>
                    <button type="submit" class="btn btn-primary">登录</button>
                    <br><br>
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="login();">账号密码登录</button>
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
    var clock = '';
    var nums = 60;
    var btn;
    var phone = document.querySelector('#phone');
    function sendCode(thisBtn)
    {
        if (phone.value.length !== 11) {
            alert("手机号不正确！")
        } else {
            btn = thisBtn;
            btn.disabled = true; //将按钮置为不可点击
            btn.value = nums+'秒后可重新获取';
            clock = setInterval(doLoop, 1000); //一秒执行一次

            $.post("sendSms",{"type":1,"phone":phone.value},function(result){
                alert("已发送")
            });

        }

    }
    function doLoop()
    {
        nums--;
        if(nums > 0){
            btn.value = nums+'秒后可重新获取';
        }else{
            clearInterval(clock); //清除js定时器
            btn.disabled = false;
            btn.value = '点击发送验证码';
            nums = 10; //重置时间
        }
    }

    function check(){

        let pwd = document.getElementById('password') // 获取 password 的属性值
        pwd.value = md5(pwd.value)

        return true;
    }

    function login(){
        window.location.href='/login.jsp'
    }
    function reg(){
        window.location.href='/reg.jsp'
    }

</script>


</html>
