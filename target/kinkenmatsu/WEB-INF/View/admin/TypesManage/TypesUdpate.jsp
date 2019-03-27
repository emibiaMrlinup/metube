<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/12/18
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../AdminUp.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 4, from LayoutIt!</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<form action="${pageContext.request.contextPath}/UpdateTypes.do" method="post">
    <div class="form-group" style="display: none">
        <label for="exampleInputEmail1">命名</label>te
        <input type="hidden" name="id" value="${type.id}" class="form-control" id="" aria-describedby="emailHelp">
    </div>
    <div class="form-group" >
        <label for="exampleInputEmail1">命名</label>
        <input type="text" name="name" value="${type.name}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect1">选择主栏目</label>
        <select class="form-control" name="parentid" id="exampleFormControlSelect1">

            <option value="${type.parentid}">当前</option>
            <option value="${"0"}">设为主栏目</option>
            <c:forEach items="${typeList}" var="i">
                <c:if test="${i.parentid==0}">
                    <option value="${i.id}">${i.name}</option>
                </c:if>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">提交</button>
</form>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>

<%@ include file="../AdminDown.jsp"%>