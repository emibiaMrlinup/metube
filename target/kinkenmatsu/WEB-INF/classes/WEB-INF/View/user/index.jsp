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
<%@include file="UserUp.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>
<script	src="/assets/layui/layui.js"></script>
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
</style>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
<div class="layui-body" style="width: auto;height: auto;overflow-y:scroll;left: 0px">
    <div id="headfull" style="width: 100%;height:200px;background-image: url(/assets/bgres/bg/pink.jpg)">
        <div style="width: 100%;height: 150px"></div>
        <nav class="navbar navbar-light bg-light justify-content-between push-8">
            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" id="SearchName" placeholder="Search" aria-label="Search">
                <button id="searchVideoBtn" class="btn btn-outline-success my-2 my-sm-0 layui-icon layui-icon-search" style="background: fixed ;border-color: white" type="button">Search</button>
                <script type="text/javascript">
                    function searchVideo() {

                            $("#searchVideoBtn").click(function () {
                                if ($("#SearchName").val()==null||$("#SearchName").val()==""){
                                    alert("不能为空");
                            }else{
                                    window.open("${pageContext.request.contextPath}/searchVideo.do?name="+$("#SearchName").val());
                            }
                            })

                    }
                    $(document).ready(function () {
                        searchVideo();
                        $.ajax({
                            url:"${pageContext.request.contextPath}/getHeadBg.do",
                            type:"GET",
                            success:function (data) {
                                $("#headfull").attr("style","width: 100%;height:200px;background-image: url("+data.theme.url+");" +
                                    "background-repeat: no-repeat;background-size: 100% 100%; -moz-background-size: 100% 100%;");
                            }
                        })
                        $.ajax({
                            url:"${pageContext.request.contextPath}/getViewFF.do",
                            type:"GET",
                            success:function (data) {
                                $.each(data.theme,function(index,item){
                                    if (index==0){
                                        var img = $('<img class="d-block w-100 h-100 img-fluid" src="" alt="Third slide">');
                                        img.attr("src",item.url);
                                        var div = $('<div class="carousel-item active"></div>');
                                        div.append(img);
                                    } else {
                                        var img = $('<img class="d-block w-100 h-100 img-fluid" src="" alt="Third slide">');
                                        img.attr("src",item.url);
                                        var div = $('<div class="carousel-item"></div>');
                                        div.append(img);
                                    }
                                    $("#ViewFF").append(div);
                                })
                            }
                        })
                    })
                </script>
            </form>
        </nav>
    </div>
    <div  class="container-fluid"  style="width: 100%;height: auto">
                <div class="container" style="width: 100%;height: auto">
                    <div class="row"style="height: auto">
                        <div class="col-sm-2" style="height: auto">

                        </div>
                <div class="col-sm-8 " style="height: auto;">
                  <div style="width: 100%;height: auto">
                      <ul class="layui-nav" lay-filter=""style="background: white">
                        <c:forEach items="${types}" var="i">
                            <c:if test="${i.parentid==0}">
                        <li class="layui-nav-item" style="background: white">
                            <a href="${pageContext.request.contextPath}/getTothisTypes.do?id=${i.id}" onclick="javascript:;" style="color: black;text-decoration-line: none;">${i.name}</a>
                            <dl class="layui-nav-child">
                                <c:forEach items="${types}" var="c">
                                    <c:if test="${c.parentid!=0}">
                                        <c:if test="${c.parentid==i.id}">
                                <!-- 二级菜单 -->
                                <dd><a href="${pageContext.request.contextPath}/getTothisCTypes.do?id=${c.id}" class="layui-icon layui-icon-note">${c.name}</a></dd>
                                        </c:if>
                                        </c:if>
                                </c:forEach>
                            </dl>
                        </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                  </div>
                    <div class="container" style="width: 100%;height: auto">
                        <div class="row">
                        <div class="col-sm-4" style="background: white;width:auto;height: 200px;">
                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                <div id="ViewFF" class="carousel-inner">
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>

                        <div class="col-sm-8" style="background: white;height: 200px">
                            <div class="row">
                                <c:forEach items="${PvideoList}" var="c" >
                                <div class="card" style="width: 24%;height: 96px;margin: 2px">
                                   <a href="${pageContext.request.contextPath}/getthisVideo.do?id=${c.id}"><img class="card-img-top w-100 h-100 img-fluid" src="${c.vpic}" alt="Card image cap"></a>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        </div>
                    </div><br>
                    <div>
                    <div class="container" style="width: 100%;height: auto">
                        <!--推广-->
                        <div class="row">
                            <div class="col-sm-1" style="background: white;width:auto;height: 50px;"><div style="height: 50px;width: 50px"><img src="/assets/bgres/buttomicon/tuiguangIcon.png"></div> </div>
                            <div class="col-sm-11" style="background: white;width:auto;height: 50px;"><span style="font-size: 30px;font-family: Calibri;position: relative;top: 10px">推广</span></div>
                        </div>
                    </div><br>
                    <div class="container" style="width: 100%;height: auto">
                        <div class="row">
                            <div class="col-sm-12" style="background: white;width:auto;height: 150px;">
                                <div class="row">
                                <c:forEach items="${TvideoList}" var="j">
                                    <div class="card" style="width: 15%;height: 150px;margin: 5px;border: 0px solid">
                                    <a class="VSmallBox" href="${pageContext.request.contextPath}/getthisVideo.do?id=${j.id}" target="_blank" style="text-decoration: none;" >
                                        <div style="height: 100px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${j.vpic}" alt="Card image cap"></div>
                                        <div class="card-body" style="height: 50px">
                                            <p>${j.name}</p>
                                        </div>
                                    </a>
                                </div>
                                </c:forEach>
                            </div>
                            </div>
                        </div>
                    </div>
                    </div><br>
                    <c:forEach items="${Ptypes}" var="i">
                    <div>
                    <div class="container" style="width: 100%;height: auto">
                        <!--影视-->
                        <div class="row">
                            <div class="col-sm-1" style="background: white;width:auto;height: 50px;"><div style="height: 50px;width: 50px"><img src="/assets/bgres/buttomicon/tuiguangIcon.png"></div></div>
                            <div class="col-sm-8" style="background: white;width:auto;height: 50px;"><span style="font-size: 30px;font-family: Calibri;position: relative;top: 10px">${i.name}</span></div>
                            <div class="col-sm-3" style="background: white;width:auto;height: 50px;">
                                <div class="row">
                                    <button class="" href="#" disabled style="background:white ;color: deeppink;border: 0px solid">共计<span class="layui-badge ">
                                        <% int num =0; %>
                                        <c:forEach items="${videoList}" var="g" varStatus="status">
                                            <c:if test="${g.classPlace==i.id}">
                                                <%  num++; %>
                                            </c:if>
                                        </c:forEach>
                                        <%=num %>
                                    </span>个视频</button><p>|</p>
                                    <button class="" style="background: white;color: deeppink;border: white 0px solid">
                                        <a href="${pageContext.request.contextPath}/getTothisTypes.do?id=${i.id}" style="text-decoration: none;" >更多</a>
                                        <span class="layui-badge">>></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div><br>
                    <div class="container" style="width: 100%;height: auto">
                        <div class="row">
                            <div class="col-sm-12" style="background: white;width:auto;height: 300px;">
                                <div class="row">
                                    <% if (num<12){%>
                                    <c:forEach items="${videoList}" var="j">
                                        <c:if test="${j.classPlace==i.id}">
                                        <div class="card" style="width: 15%;height: 150px;margin: 5px;border: 0px solid">
                                            <a class="VSmallBox" href="${pageContext.request.contextPath}/getthisVideo.do?id=${j.id}" target="_blank" style="text-decoration: none;" >
                                                <div style="height: 100px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${j.vpic}" alt="Card image cap"></div>
                                                <div class="card-body" style="height: 50px">
                                                    <p>${j.name}</p>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
                                    </c:forEach>
                                    <% }else {%>
                                    <c:forEach items="${videoList}" var="j" begin="1" end="12">
                                        <c:if test="${j.classPlace==i.id}">
                                            <div class="card" style="width: 15%;height: 150px;margin: 5px;border: 0px solid">
                                                <a class="VSmallBox" href="${pageContext.request.contextPath}/getthisVideo.do?id=${j.id}" target="_blank" style="text-decoration: none;" >
                                                    <div style="height: 100px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="${j.vpic}" alt="Card image cap"></div>
                                                    <div class="card-body" style="height: 50px">
                                                        <p>${j.name}</p>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                        </div><br>
                            </c:forEach>
                </div>
                <div class="col-sm-2" style="height: auto">

                </div>
            </div>
        </div>
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