<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>注册界面</title>
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

    <script>
        function login(){
            window.location.href='/phoneLogin.jsp'
        }
    </script>
</head>
<body class="text-center" >

<div class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">注册</h2>
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
                <form class="form clo-md-12 center-block" id="regForm" action="${pageContext.request.contextPath}/reg" method="post" onsubmit="return check();">

                    <div class="form-group-lg" id="nameDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-pencil-fill"></i>
                            </span>
                            <input class="form-control" id="name" name="name" type="text" placeholder="昵称" required autofocus>
                        </div>
                    </div>
                    <br>
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
                            <span class="badge bg-success message1"><p class="message">请输入8~18位密码</p></span>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="upwdDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-key-fill"></i>
                            </span>
                            <input class="form-control" id="upassword" name="upassword" type="password" placeholder="确认密码" required autofocus>
                            <span class="badge bg-success message2 visually-hidden"><p>两次密码不一致</p></span>
                        </div>
                    </div>
                    <br>
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
                    <br>
                    <button type="submit" class="btn btn-primary">注册</button>
                    <br><br>
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="login();">登录</button>

                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var password = document.querySelector('#password');
    var upassword = document.querySelector('#upassword');
    var message = document.querySelector('.message');
    var message2 = document.querySelector('.message2');
    var message1 = document.querySelector('.message1');
    var zmnumReg = /^[0-9a-zA-Z]*$/;

    password.onblur = function() {
        if (this.value.length < 8 || this.value.length > 18) {
            message1.className = 'badge bg-danger message1'
            message.innerHTML = '密码长度错误，应为8~18位';
            message.className = 'message';
        } else if (!zmnumReg.test(this.value)){
            message.innerHTML = '密码只能是字母或者数字';
            message1.className = 'badge bg-danger message1'
            message.className = 'message';
        }else {
            message.innerHTML = '密码格式正确';
            message1.className = 'badge bg-danger message1 visually-hidden'
            message.className = 'message';
        }
    }

    upassword.onblur = function() {
        if(this.value != password.value ){
            message2.className = 'badge bg-danger message2'
        }else {
            message2.className = 'badge bg-danger message2  visually-hidden'
        }
    }

    function check(){
        let pwd = document.getElementById('password') // 获取 password 的属性值
        pwd.value = md5(pwd.value)

        return true;
    }



    var clock = '';
    var nums = 60;
    var btn;
    var phone = document.querySelector('#phone');
    var reg_tel = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
    function sendCode(thisBtn)
    {
        if (phone.value.length !== 11) {
            alert("请输入11位手机号码！")
        } else if (!reg_tel.test(phone.value)) {
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
