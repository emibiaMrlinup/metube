<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/12
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../AdminUp.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Metube 后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script	src="/assets/layui/layui.js"></script>
    <link rel="stylesheet" href="/assets/layui/css/layui.css">
    <script type="text/JavaScript">
        var t = "${pageContext.request.contextPath}";
    </script>
    <script src="/assets/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminUserUpdate.do" method="post">
    <input type="hidden" name="id" hidden="hidden" value="${user.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">昵称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" required lay-verify="required" value="${user.name}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" value="${user.username}"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" value="${user.password}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女" checked>
            <input type="radio" name="sex" value="保密" title="保密">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">个性签名</label>
        <div class="layui-input-block">
            <textarea name="penpal" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</body>
</html>
<%@ include file="../AdminDown.jsp"%>