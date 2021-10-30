<%@ page import="com.junruo.hungry.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>菜品管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
</head>
<body class="text-center">
    <h1>菜品管理</h1>
    <hr>
    <%
        User user = (User) session.getAttribute("user");
        if (user == null){
    %>
    <div class="alert alert-danger">您好！游客。无操作权限！&nbsp;<a href="${pageContext.request.contextPath}/login.jsp">点我登录商户账号重试</a></div>

    <%
    }else if (user.getIdent() == 0 || user.getIdent() == 2) {

    %>
    <div class="alert alert-success">您好！<%=user.getName()%>无操作权限！&nbsp;<a href="${pageContext.request.contextPath}/login.jsp">点我登录商户账号重试</a></div>

    <%
        }else{
    %>
    <div class="alert alert-success">您好！<%=user.getName()%> <a href="${pageContext.request.contextPath}/logout.jsp">点我注销</a></div>
    <%
        String code1 = (String) request.getAttribute("code");
        if (code1 == "0"){
    %>
    <div class="alert alert-danger">${mess}</div>
    <%
        }
    %>
    <form action="${pageContext.request.contextPath}/findFood" method="post">
        <p class="text-primary">
            <input type="hidden" name="id" id="uid" value="<%=user.getId()%>">
        </p>
        <button type="submit" class="btn btn-success">点我查询</button>

    </form>

    <br>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        添加菜品
    </button>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">添加菜品</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">

                    <form class="form clo-md-12 center-block" id="regForm" action="${pageContext.request.contextPath}/addFood" method="post" onsubmit="return check();">
                        <div class="form-group-lg" id="telDiv">
                            <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-file-earmark-font-fill"></i>
                            </span>
                                <input class="form-control" id="type" name="type" type="text" placeholder="分类" required autofocus>
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="nameDiv">
                            <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-file-earmark-font-fill"></i>
                            </span>
                                <input class="form-control" id="foodname" name="foodname" type="text" placeholder="菜品名" required autofocus>
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="accountDiv">
                            <div class="input-group">
                           <span class="input-group-text">
                                <i class="bi bi-file-earmark-font-fill"></i>
                            </span>
                                <input class="form-control" id="feature" name="feature" type="text" placeholder="特色"  required autofocus>
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="pwdDiv">
                            <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-file-earmark-font-fill"></i>
                            </span>
                                <input class="form-control" id="material" name="material" type="text" placeholder="食材" required autofocus>
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="upwdDiv">
                            <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-file-earmark-font-fill"></i>
                            </span>
                                <input class="form-control" id="price" name="price" type="text" placeholder="价格" required autofocus>
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="pictureDiv">
                            <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-file-earmark-font-fill"></i>
                            </span>
                                <input class="form-control" id="picture" name="picture" type="text" placeholder="图片地址" required autofocus>
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="commentDiv">
                            <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-file-earmark-font-fill"></i>
                            </span>
                                <input class="form-control" id="comment" name="comment" type="text" placeholder="备注" required autofocus>
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
        String code = (String) request.getAttribute("code");
        if (code == "1"){
    %>


    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th><p class="text-success">编号</p></th>
                <th><p class="text-success">菜品名</p></th>
                <th><p class="text-success">菜品分类</p></th>
                <th><p class="text-success">特色</p></th>
                <th><p class="text-success">食材</p></th>
                <th><p class="text-success">价格</p></th>
                <th><p class="text-success">点餐人数</p></th>
                <th><p class="text-success">状态</p></th>
                <th><p class="text-success">备注</p></th>
                <th><p class="text-success">操作</p></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${foodList }" var="o">
                <tr>
                    <th>${o.id } </th>
                    <th>${o.foodname } </th>
                    <th>${o.typename } </th>
                    <th>${o.feature } </th>
                    <th>${o.material } </th>
                    <th>${o.price } </th>
                    <th>${o.hits } </th>
                    <th>
                        <c:if test="${o.state == 1 }">已上架</c:if>
                        <c:if test="${o.state == 0 }">已下架</c:if>
                    </th>
                    <th>${o.comment } </th>
                    <th>
                        <c:if test="${o.state == 1 }">
                            <button type="button" class="btn btn-danger" onclick="down(${o.id })">下架</button>
                        </c:if>
                        <c:if test="${o.state == 0 }">
                            <button type="button" class="btn btn-success" onclick="up(${o.id })">上架</button>
                        </c:if>
                        <button type="button" class="btn btn-danger" onclick="deleteFood(${o.id })">删除</button>&nbsp;
                        <button type="button" class="btn btn-warning" onclick="updateFood(${o.id })">修改</button>
                    </th>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>



    <%
        }
    %>

    <%
    }
%>
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
        function up(id){
            httpPost("upAndDownFood", {"type":1,"id":id});
        }
        function down(id){
            var r=confirm("是否下架？");
            if (r==true){
                httpPost("upAndDownFood", {"type":2,"id":id});
            }
            else{}
        }
        function deleteFood(id){
            var r=confirm("是否删除？");
            if (r==true){
                httpPost("deleteFood", {"type":3,"id":id});
            }
            else{

            }

        }
        function updateFood(id){
            window.location.href="${pageContext.request.contextPath}/findUpdate?id="+id;
        }
    </script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>