<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/12/18
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<div id="vc1" style="width: auto;height: auto">
    <div class="modal fade" id="TypesModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div id="addTypesForm" class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="vc2" style="width: auto;height: auto">

</div>
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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 4, from LayoutIt!</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<div  class="container-fluid px-0"  style="width: 100%">
    <div class="container px-0" style="width: 100%">
        <div style="width: 100%;height: 70px">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#TypesModalCenter">
                添加栏目
            </button>
        </div>
        <div class="row">
            <div class="col-sm-6" style="height: auto;">
                <table class="table table-striped table-dark">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">主栏目</th>
                        <th scope="col">操作</th>
                    </tr>
                    </thead>
                    <c:forEach items="${types}" var="i">
                        <c:if test="${i.parentid==0}">
                    <tbody>
                    <tr>
                        <th scope="row">${i.id}</th>
                        <th scope="row">${i.name}</th>
                        <th scope="row">
                            <a class="layui-icon layui-icon-edit" href="${pageContext.request.contextPath}/Updateypes.do?id=${i.id}">修改</a>
                            <a class="layui-icon layui-icon-delete" href="${pageContext.request.contextPath}/deleteMaintypes.do?id=${i.id}">删除</a>
                        </th>
                    </tr>
                    </tbody>
                    </c:if>
                    </c:forEach>
                </table>
            </div>
            <div class="col-sm-6" style="height: auto;">
                <table class="table table-striped table-dark">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">子栏目</th>
                    <th scope="col">所属栏目</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <c:forEach items="${types}" var="i">
                    <c:if test="${i.parentid!=0}">
                        <tbody>
                        <tr>
                            <th scope="row">${i.id}</th>
                            <th scope="row">${i.name}</th>
                            <c:forEach items="${types}" var="c">
                                <c:if test="${i.parentid==c.id}">
                            <th scope="row">${c.name}</th>
                                </c:if>
                            </c:forEach>
                            <th scope="row">
                                <a class="layui-icon layui-icon-edit"  href="${pageContext.request.contextPath}/Updateypes.do?id=${i.id}">修改</a>
                                <a class="layui-icon layui-icon-delete" href="${pageContext.request.contextPath}/deletetypes.do?id=${i.id}">删除</a>
                            </th>
                        </tr>
                        </tbody>
                    </c:if>
                </c:forEach>
                </table>
            </div>
        </div>

    </div>
</div>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        typesAddview();
    })
    function  typesAddview() {
        var srcs="${pageContext.request.contextPath}/toAddtypes.do";
        $("#addTypesForm").load(srcs);
    }
</script>
<%@ include file="../AdminDown.jsp"%>
