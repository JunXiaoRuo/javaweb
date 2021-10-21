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
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/bootstrapValidator.css" rel="stylesheet" type="text/css" />


    <script src="${pageContext.request.contextPath}/js/md5.js"></script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.js"></script>

</head>
<body>

<div class="main text-center" >
    <div class="login-form">
        <h1>注册</h1>
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
        <form id="detailForm" action="${pageContext.request.contextPath}/reg" method="post" onsubmit="return check()">
            <input type="text" name="name" id="name" placeholder="昵称">
            <input type="text" name="username" id="username" placeholder="用户名(字母或数字)" onkeyup="value=value.replace(/[\W]/g,'') "
                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
            <input type="password" name="password"  placeholder="密码" id="password" >
            <input type="password"  id="upassword" placeholder="确认密码" name="upassword">
            <p class="message text-warning">请输入8~18位密码</p><br><br>
            <input type="text" name="phone" id="phone" placeholder="手机号">
            <input type="button" id="btn" name="btn" value="发送验证码" onclick="sendCode(this)" ><br><br>
            <input type="text" name="code" id="code" placeholder="输入验证码">
            <div class="submit">
                <input type="submit"  value="注册" >
            </div>



            <p><a href="${pageContext.request.contextPath}/login.jsp">账号密码登录</a></p>
            <p><a href="${pageContext.request.contextPath}/phoneLogin.jsp">手机号登录</a></p>
        </form>
    </div>
</div>



</body>
<script type="text/javascript">
    var password = document.querySelector('#password');
    var message = document.querySelector('.message');

    password.onblur = function() {
        if (this.value.length < 8 || this.value.length > 18) {
            message.innerHTML = '密码长度错误，应为8~18位';
            message.className = 'message text-danger';
        } else {
            message.innerHTML = '密码长度正确';
            message.className = 'message text-success';
        }
    }

    function check(){
        var name = $("#name").val();
        var username = $("#username").val();
        var password = $("#password").val();
        var upassword = $("#upassword").val();
        var phone = $("#phone").val();
        var code = $("#code").val();

        if(phone == null || phone == ""){
            alert("手机号不能为空");
            return false;
        }
        if(code == null || code == ""){
            alert("验证码不能为空");
            return false;
        }

        if(name == null || name == ""){
            alert("昵称不能为空");
            return false;
        }
        if(username == null || username == ""){
            alert("用户名不能为空");
            return false;
        }
        if(password == null || password == ""){
            alert("密码不能为空");
            return false;
        }
        if(upassword == null || upassword == ""){
            alert("确认密码不能为空");
            return false;
        }
        if(upassword != password ){
            alert("两次密码不同");
            return false;
        }

        let pwd = document.getElementById('password') // 获取 password 的属性值
        pwd.value = md5(pwd.value)

        return true;
    }



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

            $.post("sendSmsReg",{"phone":phone.value},function(result){
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


</script>

</html>
