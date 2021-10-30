<%@ page import="com.junruo.hungry.entity.User" %>
<%@ page import="java.util.Date" %>
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


    <script src="${pageContext.request.contextPath}/js/md5.js"></script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">

</head>
<body>
<h1 class="text-center">欢迎使用本系统！</h1>
<hr>
<%
    String today = new Date().toString();
%>
<div class="alert alert-info">今天是：<%=today%></div>
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
<button type="button" class="btn btn-success"  onclick="updateUser(<%=user.getId()%>)" data-bs-toggle="modal" data-bs-target="#sexampleModal">修改个人信息</button>


<!-- Modal -->
<div class="modal fade" id="sexampleModal" tabindex="-1" aria-labelledby="sexampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="sexampleModalLabel">修改资料</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <form class="form clo-md-12 center-block" id="sregForm" action="${pageContext.request.contextPath}/update" method="post" onsubmit="return scheck();">

                    <div class="form-group-lg" id="sidDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-cursor-text"></i>
                            </span>
                            <input class="form-control" id="sid" name="id" type="text" placeholder="ID" readonly="readonly" required autofocus >
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="saccountDiv">
                        <div class="input-group">
                           <span class="input-group-text">
                                <i class="bi bi-person-fill"></i>
                            </span>
                            <input class="form-control" id="susername" name="username" type="text" placeholder="用户名(字母或数字)" onkeyup="value=value.replace(/[\W]/g,'') "
                                   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required autofocus readonly="readonly">
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="snameDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-pencil-fill"></i>
                            </span>
                            <input class="form-control" id="sname" name="name" type="text" placeholder="昵称" required autofocus>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="spwdDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-key-fill"></i>
                            </span>
                            <input class="form-control" id="spassword" name="password" type="text" placeholder="密码（留空则不修改）" >
                            <span class="badge bg-success message1"><p class="message">请输入8~18位密码</p></span>
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="stelDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-telephone-fill"></i>
                            </span>
                            <input class="form-control" id="sphone" name="telephone" type="text" placeholder="手机号" required autofocus  readonly="readonly">
                            <input type="button" id="btn" name="btn" value="修改手机号" class="btn btn-outline-secondary" onclick="update(this)" class="btnSearch">
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="saddDiv">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-cursor-fill"></i>
                            </span>
                            <input class="form-control" id="saddress" name="address" type="text" placeholder="地址" required autofocus>
                            <input type="hidden" value="<%=user.getName()%>" name="sname" id="ssname">
                        </div>
                    </div>
                    <br>
                    <div class="form-group-lg" id="suserTypeDiv">
                        <div class="input-group">
                            <select class="form-select visually-hidden" id="suserType" name="ident" >
                                <option selected>选择用户类型</option>
                                <option value="0">客户</option>
                                <option value="1">商户</option>
                                <option value="2">管理员</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">提交</button>

                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>



<%

    }
%>



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
        var sid = document.getElementById("sid")
        var sname = document.getElementById("sname")
        var susername = document.getElementById("susername")
        var sphone = document.getElementById("sphone")
        var saddress = document.getElementById("saddress")
        var suserType = document.getElementById("suserType")
        $.ajax({
            type:"post",    //post put get 等等
            url:"findUpdate",
            //编写注册功能时，要将异步设置为false（缺省为true）
            //如果async是ture,对于FireFox浏览器，会刷新掉alert()弹出框的内容
            // 对于Chrome浏览器，第一次注册时会执行error的回调函数，输出“请求在连接过程中出现错误..”
            async:false,
            data:{       //要传入ashx文件的数据
                "id":id,
                "type":1
            },
            success:function (data){
                var jsonObj = JSON.parse( data );
                sid.value = jsonObj.id;
                sname.value = jsonObj.name;
                susername.value = jsonObj.username;
                sphone.value = jsonObj.telephone;
                saddress.value = jsonObj.address;
                suserType.value = jsonObj.ident;
            },
            error:function (XMLHttpRequest, textStatus, errorThrown){   //连接至ashx文件失败时，执行函数
                //XMLHttpRequest在这个例子里没有用到
                // textStatus是表示状态的字符串，这里textStatus的值是"error"
                // errorThrown包含连接失败的信息，可以输出查看
                alert("请求在连接过程中出现错误..\n" + errorThrown);
            }
        });
        //httpPost("findUpdate", {"type":1,"id":id});
        //window.location.href="${pageContext.request.contextPath}/findUpdate?id="+id;
    }
    function scheck(){
        let pwd = document.getElementById('spassword') // 获取 password 的属性值
        pwd.value = md5(pwd.value)
        return true;
    }

    function update(thisBtn){
        alert("暂时不支持修改手机号，敬请期待！")
    }

</script>
</html>
