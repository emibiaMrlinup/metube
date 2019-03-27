<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/11
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Metube 后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script	src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
    <link rel="stylesheet" href="/assets/layui/css/layui.css">
    <script type="text/JavaScript">
        var t = ${pageContext.request.contextPath};
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin"  style="width: 60%;position: relative;left: 20%;right: 20%">
    <div class="layui-header">
        <div class="layui-logo">Metube注册页面</div>
    </div>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>Metube注册</legend>
    </fieldset>
    <div class="layui-tab-item layui-show" style="">
        <form action="${pageContext.request.contextPath}/Reg.do" method="post">
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" placeholder="請使用郵箱" class="layui-input">
                </div>
                <p style="color: red;font-size: 14px" class="layui-input-inline">${error.toString()}</p>
            </div>
            <br>
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password"  class="layui-input">
                </div>

            </div>
            <br>
            <div class="layui-inline">
                <label class="layui-form-label"></label>
                <div class="layui-input-inline">
                    <input class="layui-btn layui-btn-fluid" type="submit" value="注册">
                </div>
                <div class="layui-input-inline">
                    <a href="${pageContext.request.contextPath}/toLogin.do">返回登陸</a>
                </div><br>
                <br>
                <p style="position:relative;color: red;font-size: 14px;left: 100px;width: 100%;height: 20px" >${error1.toString()}</p>
            </div>
        </form>
    </div>
</div>

</body>
</html>
