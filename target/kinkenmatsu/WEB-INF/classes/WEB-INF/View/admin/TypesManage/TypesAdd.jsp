<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/12/18
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="${pageContext.request.contextPath}/AddTypes.do" method="post">
    <div class="form-group" >
        <label for="exampleInputEmail1">命名</label>
        <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div class="form-group">
        <label for="exampleFormControlSelect1">选择主栏目</label>
        <select class="form-control" name="parentid" id="exampleFormControlSelect1">

            <option >请选择栏目</option>
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

