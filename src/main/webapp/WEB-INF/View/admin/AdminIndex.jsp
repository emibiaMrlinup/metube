<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/8
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
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
        var t = "${pageContext.request.contextPath}";
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Metube 后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="#">控制台</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/AdminToMainPage.do">主站</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/ToAdminSelfManage.do" onclick="javascript:;" style="color: white">

                    <c:if test="${AdminInfo.userpic==null||AdminInfo.userpic.equals('')}">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    </c:if>
                    <c:if test="${AdminInfo.userpic != null}">
                        <img src="${AdminInfo.userpic}" class="layui-nav-img">
                    </c:if>
                    <c:if test="${AdminInfo.name==null||AdminInfo.name.equals('')}">
                        ${AdminInfo.username}
                    </c:if>
                    <c:if test="${AdminInfo.name != null||!''.equals(AdminInfo.name)}">
                        ${AdminInfo.name}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/getAdminDetail.do">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/Adminlogout.do">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="#" onclick="javascript:;">内容管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/ToThemeManage.do" onclick="javascript:;">主题图片管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/Adgetclass.do" onclick="javascript:;">栏目管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="#" onclick="javascript:;">视频库管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/Trialing.do" onclick="javascript:;">待过审视频管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/Trialed.do" onclick="javascript:;">已过审视频管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/UserList.do" onclick="javascript:;">用户列表</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <%--
              Created by IntelliJ IDEA.
              User: emibia
              Date: 2018/11/8
              Time: 10:45
              To change this template use File | Settings | File Templates.
            --%>
            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="/assets/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
