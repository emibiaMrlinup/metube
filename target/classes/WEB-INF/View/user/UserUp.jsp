<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script	src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
    <link rel="stylesheet" href="/assets/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/easyUI/demo/demo.css">
    <script type="text/javascript" src="/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="/easyUI/jquery.easyui.min.js"></script>
    <script type="text/JavaScript">
       // var t = ${pageContext.request.contextPath};
    </script>
</head>
<style type="text/css">
    body .layui-nav .layui-nav-more{display: none}
</style>
<body class="layui-layout-body" style="padding: 0px;height: auto">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="background:rgba(255,255,255,0.5)" >
        <div class="layui-logo">Metube Sharing</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left " style="color: black">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/NormalToAdminMainPage.do" style="color: black">后台管理</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/ToMainPage.do" style="color: black">主站</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;" style="color: black">其它管理</a>
                <dl class="layui-nav-child">
                    <dd><a id="ToMessagePage" href="#" >私信@</a></dd>
                    <dd><a id="ToUpdatePWD" href="#">安全管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <c:if test="${normalUser==null}">
                <li class="layui-nav-item" ><a href="${pageContext.request.contextPath}/Adminlogout.do" style="color: black">请先登录</a></li>
            </c:if>
            <c:if test="${normalUser!=null}">
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/ToSelfManage.do" onclick="javascript:;" style="color: black">

                    <c:if test="${normalUser.userpic==null||normalUser.userpic.equals('')}">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    </c:if>
                    <c:if test="${normalUser.userpic != null}">
                        <img src="${normalUser.userpic}" class="layui-nav-img">
                    </c:if>
                    <c:if test="${normalUser.name==null||normalUser.name.equals('')}">
                    ${normalUser.username}
                    </c:if>
                    <c:if test="${normalUser.name != null||!''.equals(normalUser.name)}">
                        ${normalUser.name}
                    </c:if>
                </a>
            </li>
            <li class="layui-nav-item" ><a href="${pageContext.request.contextPath}/Adminlogout.do" style="color: black">退了</a></li>
            </c:if>
        </ul>
    </div>
</div>
<script type="text/javascript">
    $("#ToMessagePage").click(function () {
        window.open("${pageContext.request.contextPath}/ToMessagePage.do");
    })
    $("#ToUpdatePWD").click(function () {
        window.open("${pageContext.request.contextPath}/ToUpdatePWD.do");
    })
</script>
