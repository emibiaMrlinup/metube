<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/3/12
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="UserUp.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>搜索</title>
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
</style>
<div class="layui-body" style="width: 100%;height: auto;overflow-y:scroll;left: 0px">
    <div style="width: 100%;height:150px;background-image: url(/assets/bgres/bg/pink.jpg);">
        <div style="width: 100%;height: 100px"></div>
        <input id="tagnum" type="text" hidden value="${tag}">
        <nav class="navbar navbar-light bg-light justify-content-between push-8">
            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" id="SearchName" placeholder="Search" value="${searchContext}" aria-label="Search">
                <button id="searchVideoBtn" class="btn btn-outline-success my-2 my-sm-0 layui-icon layui-icon-search" style="background: fixed ;border-color: white" type="button">Search</button>
            </form>
        </nav>
    </div>
    <div  class="container-fluid"  style="width: 100%;height: auto;">
        <div class="container" style="width: 100%;height: auto">
            <div class="row"style="height: auto">
                <div class="col-sm-2" style="height: auto">

                </div>
                <div class="col-sm-8 " style="height: auto;">

                    <div class="layui-tab  col-md-12" style="border-radius: 6px;">
                        <ul id="card_tab" class="layui-tab-title">
                            <c:forEach items="${PTypes}" var="i">
                                <c:if test="${i.parentid=='0'}">
                                    <li>${i.name}</li>
                                </c:if>
                            </c:forEach>
                        </ul>
                        <div class="layui-tab-content col-md-12" style="height: auto;">
                            <c:forEach items="${PTypes}" var="k">
                                <c:if test="${k.parentid=='0'}">
                                    <div class="layui-tab-item layui-show col-md-12" style="height: 500px;overflow-y:scroll">
                                        <div class="row col-md-12">
                                            <c:forEach items="${videoList}" var="j" >
                                                <c:if test="${j.classPlace==Integer.parseInt(k.id)}">
                                                    <div class="card" style="width: 160px;height: 160px;margin: 10px;border: 0px solid">
                                                        <a class="VSmallBox" href="${pageContext.request.contextPath}/getthisVideo.do?id=${j.id}" target="_blank" style="text-decoration: none;" >
                                                            <div style="height: 96px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${j.vpic}" alt="Card image cap"></div>
                                                            <div id="CvideoDetail" class="card-body" style="height: 34px">
                                                                <p>${j.name}</p>
                                                            </div>
                                                        </a>
                                                        <div class="row" style="position: relative;left: 20px">
                                                            <div><span>${j.dateshow}</span></div>
                                                            <c:forEach items="${Artor}" var="c" begin="1" end="1">
                                                                <c:if test="${c.id.equals(j.userid)}">
                                                                    <div><a href="${pageContext.request.contextPath}/goFriendPage.do?id=${c.id}" class="layui-icon layui-icon-user Arhover" style="text-decoration-line: none;line-height: 20px">${c.name}</a></div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                </div>
                <div class="col-sm-2 " style="height: auto;">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function searchVideo() {
        $("#searchVideoBtn").click(function () {
            if ($("#SearchName").val()==null||$("#SearchName").val()==""){
                alert("不能为空");
            }else{
                window.location.href="${pageContext.request.contextPath}/searchVideo.do?name="+$("#SearchName").val();
            }
        })

    }
    $(document).ready(function () {
        searchVideo();
        $("#card_tab li").eq(0).attr("class","layui-this");
    })
</script>
<script src="/assets/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>