<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/07
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../AdminUp.jsp"%>
<div id="addColldialogPlay">
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>等待审核视频</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>
<script	src="/assets/layui/layui.js"></script>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
<style type="text/css">
    .carousel-item img{
        max-width: 100%;
        height:auto;
    }
    body{
        position: relative;
    }
    .VSmallBox:hover{
        color: deeppink;
    }
    .btn-outline-success{
        color: black;
    }
    .center-in-center{
        position: absolute;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }
    .in_center-in-center{
        position:relative;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }
    .Arhover:hover{
        color: #00bbee;
    }
</style>
<div class="container" style="width: 100%;height: auto">
    <div class="row">
        <div class="layui-tab">
            <input id="tagnum" type="text" hidden value="${tag}">
            <ul id="tagul" class="layui-tab-title">
                <li class="">背景图</li>
                <li>轮播图</li>
                <li>导航图</li>
                <a href="${pageContext.request.contextPath}/ToAddTheme.do" class="Arhover layui-icon layui-icon-add-1">添加主题图片</a>
            </ul>
            <div id="ddiv" class="layui-tab-content">
                <div id="0" class="layui-tab-item">
                    <div class="row">
                        <c:forEach items="${themes}" var="c">
                            <c:if test="${c.type.equals('1')}">
                        <div class="card" style="width: auto;height: auto;margin: 10px;border: 0px solid">
                            <div>
                        <div style="height: 300px;width: 580px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${c.url}" alt="Card image cap"></div>
                        <div class="card-body" style="height: 30px">
                            <span style="font-size: 25px;font-family: Calibri">${c.name}</span>
                        </div>
                        </div>
                        <div class="row">
                            <a class="Arhover layui-icon layui-icon-delete" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/DeletePic.do?id=${c.id}">删除</a>&nbsp&nbsp
                                <c:if test="${c.use!='1'}">
                            <a class="Arhover  VSmallBox" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/SetSelfBg.do?id=${c.id}">设为个人页面背景</a>&nbsp&nbsp
                                </c:if>
                            <c:if test="${c.use.equals('1')}">
                                <a class="Arhover layui-bg-gray" style="text-decoration-line: none;" href="#">使用中..</a>&nbsp&nbsp
                            </c:if>
                          </div>
                        </div>
                                <br>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div id="1" class="layui-tab-item">
                    <div class="row">
                        <c:forEach items="${themes}" var="c">
                            <c:if test="${c.type.equals('2')}">
                                <div class="card" style="width: auto;height: auto;margin: 10px;border: 0px solid">
                                    <div>
                                        <div style="height: 300px;width: 450px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${c.url}" alt="Card image cap"></div>
                                        <div class="card-body" style="height: 30px">
                                            <span style="font-size: 25px;font-family: Calibri">${c.name}</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <a class="Arhover layui-icon layui-icon-delete" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/DeletePic.do?id=${c.id}">删除</a>
                                    </div>
                                </div>
                                <br>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div id="2" class="layui-tab-item">
                    <div class="row">
                        <c:forEach items="${themes}" var="c">
                            <c:if test="${c.type.equals('3')}">
                                <div class="card" style="width: auto;height: auto;margin: 10px;border: 0px solid">
                                    <div>
                                        <div style="height: 150px;width: 500px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${c.url}" alt="Card image cap"></div>
                                        <div class="card-body" style="height: 30px">
                                            <span style="font-size: 25px;font-family: Calibri">${c.name}</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <a class="Arhover layui-icon layui-icon-delete" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/DeletePic.do?id=${c.id}">删除</a>&nbsp&nbsp
                                        <c:if test="${c.use!='1'}">
                                            <a class="Arhover  VSmallBox" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/SetHeadBg.do?id=${c.id}">设为首页导航栏背景</a>&nbsp&nbsp
                                        </c:if>
                                        <c:if test="${c.use.equals('1')}">
                                            <a class="Arhover layui-bg-gray" style="text-decoration-line: none;" href="#">使用中..</a>&nbsp&nbsp
                                        </c:if>
                                        <c:if test="${c.use!='2'}">
                                            <a class="Arhover  VSmallBox" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/SetSelfHeadBg.do?id=${c.id}">设为个人页导航栏背景</a>&nbsp&nbsp
                                        </c:if>
                                        <c:if test="${c.use.equals('2')}">
                                            <a class="Arhover layui-bg-gray" style="text-decoration-line: none;" href="#">使用中..</a>&nbsp&nbsp
                                        </c:if>
                                    </div>
                                </div>
                                <br>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><br>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#tagul li").eq($("#tagnum").val()).attr("class","layui-this");
        if ($("#tagnum").val()==0){
            $("#0").attr("class","layui-tab-item layui-show");
        }else if ($("#tagnum").val()==1) {
            $("#1").attr("class","layui-tab-item layui-show");
        }else if ($("#tagnum").val()==2) {
            $("#2").attr("class","layui-tab-item layui-show");
        }else{
            $("#0").attr("class","layui-tab-item layui-show");
        }
    })
</script>
<%@ include file="../AdminDown.jsp"%>