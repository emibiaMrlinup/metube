<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/07
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../AdminUp.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 4, from LayoutIt!</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <form class="form-inline" method="post"
                  action="${pageContext.request.contextPath}/AdminUserSearch.do">
                <input class="form-control mr-sm-2" type="text" name="searchValue" />
                <input value="搜索" class="btn btn-primary my-2 my-sm-0" type="submit" />
            </form>
            <table class="table">
                <thead>
                <tr>
                    <th>用户编号</th>
                    <th><trans>昵称</trans></th>
                    <th><trans>账号</trans></th>
                    <th><trans>密码</trans></th>
                    <th><trans>操作</trans></th>
                </tr>
                </thead>
<c:forEach items="${users}" var="u">
                <tbody>

                <tr class="table-success">
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td><trans>${u.username}</trans></td>
                    <td><trans>${u.password}</trans></td>
                    <td><trans>
                        <a href="${pageContext.request.contextPath}/AdminUserDetailView.do?id=${u.id}">查看</a>
                        <a href="${pageContext.request.contextPath}/AdminUserUpdateView.do?id=${u.id}">修改</a>
                        <a href="${pageContext.request.contextPath}/AdminUserDelete.do?id=${u.id}">删除</a>
                    </trans></td>
                </tr>

                </tbody>
</c:forEach>
            </table>
        </div>
    </div>
</div>

<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>
</body>
</html>
<%@ include file="../AdminDown.jsp"%>