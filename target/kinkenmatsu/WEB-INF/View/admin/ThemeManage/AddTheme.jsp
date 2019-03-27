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
        <div class="col-sm-12" style="background: white;width:auto;height: 300px;">
            <form id="uploadform">
            <div class="form-group">
                <label for="exampleFormControlInput1">不得高于20字符</label>
                <input name="name" type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
            </div>
            <div class="form-group">
                <label for="exampleFormControlFile1">请选择专栏头图，最好为160*96大小的图片</label>
                <input name="VideoPicture" type="file" class="form-control-file" id="exampleFormControlFile1">
            </div>
                 <select id="pictype" class="form-control" name="sex">
                                    <option selected="selected" disabled hidden></option>
                                    <option value="1">背景图</option>
                                    <option value="2">轮播图</option>
                                    <option value="3">导航图</option>
                        </select>
            <input id="uploadvideobtn"  type="button" class="btn btn-primary" value="提交">
            </form>
        </div>
    </div>
</div><br>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#uploadform").attr("enctype","multipart/form-data");
        $("#uploadvideobtn").click(function () {
            if ($("#exampleFormControlInput1").val()==null||$("#exampleFormControlInput1").val()==""||$("#exampleFormControlFile1").val()==null||$("#exampleFormControlFile1").val()==""||
                $("#pictype").val()==null||$("#pictype").val()==""){
                alert("不能为空");
            }else{
                var picdata = new FormData();
                picdata.append("name",$("#exampleFormControlInput1").val());
                picdata.append("url",$("#exampleFormControlFile1").get(0).files[0]);
                picdata.append("type",$("#pictype").val());
                $.ajax({
                    url:"${pageContext.request.contextPath}/addTheme.do",
                    type:"POST",
                    data:picdata,
                    cache: false,
                    async:false,
                    contentType:false,
                    processData: false,
                    success:function (result) {
                        alert(result.MESSAGE);
                      window.location.href="${pageContext.request.contextPath}/ToAddTheme.do";
                }
                })

            }
        })
    })
</script>
<%@ include file="../AdminDown.jsp"%>
