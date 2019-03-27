<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/07
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
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
<title>已过审视频</title>
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
        <div class="col-sm-12" style="background: white;width:auto;height: 300px;">
            <div class="row">
                <c:forEach items="${TrialVideos}" var="c" >
                    <div class="card" style="width: 15%;height: auto;margin: 10px;border: 0px solid">
                        <a class="VSmallBox" href="${pageContext.request.contextPath}/AdminTothisVideo.do?id=${c.id}" target="_blank" style="text-decoration: none;" >
                            <div style="height: 108px;width: 192px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${c.vpic}" alt="Card image cap"></div>
                            <div class="card-body" style="height: 30px">
                                <p>${c.name}</p>
                            </div>
                        </a>
                        <div class="row">
                            <a class="Arhover layui-icon layui-icon-ok" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/ReTrialing.do?id=${c.id}">打回去重审</a>
                            <a class="Arhover layui-icon layui-icon-delete" style="text-decoration-line: none;" href="${pageContext.request.contextPath}/AdminDeleteVideo.do?id=${c.id}">下架</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div><br>
<%@ include file="../AdminDown.jsp"%>