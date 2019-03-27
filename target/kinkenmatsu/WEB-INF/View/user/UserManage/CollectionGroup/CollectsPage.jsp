<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/27
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Metube 個人管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script	src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
    <link rel="stylesheet" href="/assets/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/easyUI/demo/demo.css">
    <script type="text/javascript" src="/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="/easyUI/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <link href="/assets/bootstrap/icon/font/css/open-iconic.css" rel="stylesheet">
    <script type="text/JavaScript">
        // var t = ${pageContext.request.contextPath};
    </script>
</head>
<body style="padding: 0px">

    <div  class="container-fluid px-0" style="width: 100%">
        <div class="container px-0" style="width: 100%">
            <div class="row">
                    <div class="col-sm-3" style="height: 500px">
                        <nav class="nav flex-column" style="width: 100%">
                            <a class="nav-link layui-icon layui-icon-add-1" data-toggle="modal" data-target="#exampleModal" id="addCollectsDialog">新建收藏夹</a>
                        </nav>
                        <nav id="collectsNav" class="nav flex-column" style="width: 100%">
                            <c:forEach items="${myCollects}" var="i">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle layui-icon layui-icon-file" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="width: 100%">
                                            ${i.name}
                                    </button>
                                    <div class="dropdown-menu" >
                                        <a class="nav-link dropdown-item layui-icon layui-icon-edit" data-toggle="modal" data-target="#updateModal" id="updateCollectsDialog" href="${pageContext.request.contextPath}/updateCollects?id=${i.id}">修改</a>
                                        <a class="dropdown-item layui-icon layui-icon-delete" id="deleteCollects" href="${pageContext.request.contextPath}/deleteCollects?id=${i.id}">删除</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </nav>
                    </div>
                    <div class="col-sm-9" style="height: auto">
                        <div id="collectionsBox" style="width:100%;height: 100px;background: white">

                        </div>
                    </div>
            </div>

        </div>
    </div>

    <script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
    })
$("#addCollectsDialog").click(function () {
    var srcs="${pageContext.request.contextPath}/Collects?page=addColldialogPlay";
   var addColldialog=$("#addColldialogPlay");
   addColldialog.load(srcs)
})
function getMyCollects() {
    $("#collectsNav").empty();
    $.ajax({
        url:"${pageContext.request.contextPath}/Collects?json=getCollects",
    type:"GET",
        success:function (result) {
            $.each(result.myCollets,function () {
                var id= this.id;
                var CollectsButtom=$("<buttom></buttom>")
                    .attr("class","btn btn-secondary dropdown-toggle layui-icon layui-icon-file")
                    .attr("type","buttom")
                    .attr("id","dropdownMenuButton")
                    .attr("data-toggle","dropdown")
                    .attr("aria-haspopup","true")
                    .attr("aria-expanded","true")
                    .attr("style","width:100%")
                    .append(this.name);
                var a1=$("<a></a>")
                    .attr("class","nav-link dropdown-item layui-icon layui-icon-edit")
                    .attr("data-toggle","modal")
                    .attr("data-target","#updateModal")
                    .attr("id","updateCollectsDialog")
                    .append("修改");
                var a2=$("<a></a>")
                    .attr("class","dropdown-item layui-icon layui-icon-delete")
                    .attr("id","")
                var toolsMenu=$("<div></div>")
                    .attr("class","dropdown-menu")
                    .append(a1).append(a2);
                var fromdiv=$("<div></div>").attr("class","dropdown")
                    .append(CollectsButtom)
                    .append(toolsMenu);
                $("#collectsNav").append(fromdiv);
            })
        }
    })

}
</script>
</body>
</html>