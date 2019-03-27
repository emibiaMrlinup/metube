<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/15
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/07
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="AdminUp.jsp"%>
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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>卡片面板</legend>
</fieldset>

<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">用户信息</div>
                <div class="layui-card-body">
                    用户头像:<img src="http://t.cn/RCzsdCq" class="layui-nav-img" style="height: 50px;width: 50px"><br>
                    编号：${user.id}<br>
                    用户昵称：${user.name}<br>
                    性别：${user.sex}<br>
                    登陆账号：${user.username}<br>
                    登陆密码：${user.password}<br>
                </div>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">个性</div>
                <div class="layui-card-body">
                    个性签名：${user.penpal}<br>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%@ include file="AdminDown.jsp"%>