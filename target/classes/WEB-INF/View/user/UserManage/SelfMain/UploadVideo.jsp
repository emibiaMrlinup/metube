<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/2/14
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/View/user/UserUp.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Metube 视频分享</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script	src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>
<script	src="/assets/layui/layui.js"></script>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
<style type="text/css">
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
</style>
<div  class="container-fluid"  style="width: 100%;height: auto;background: white">
    <div class="container" style="width: 100%;height: auto">
        <div class="row"style="height: auto">
            <div class="col-sm-2" style="height: auto"></div>
            <div class="col-sm-8">
                <div class="col-md-12">
                    <div class="col-md-12" style="background: white">
                        <form method="post" action="${pageContext.request.contextPath}/UploadVideo.do" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">不得高于20字符</label>
                                <input name="name" type="text" class="form-control inputar" id="exampleFormControlInput1" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">请选择专栏头图，最好为160*96大小的图片</label>
                                <input name="VideoPicture" type="file" class="form-control-file inputar" id="exampleFormControlFile2">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">请选择要上传的视频，不高于10M的MP4格式</label>
                                <input name="Video" type="file" class="form-control-file inputar" id="exampleFormControlFile1">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">请输入该视频的介绍</label>
                                <textarea name="detail" class="form-control inputar" id="exampleFormControlTextarea1" rows="20" ></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">请选择对该视频的定位</label>
                                <select name="childclass" class="form-control inputar" id="exampleFormControlSelect1">
                                    <c:forEach items="${typelist}" var="i">
                                        <c:if test="${i.parentid!=0}">
                                            <option value="${i.id}">${i.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <br>
                                <input id="uploadvideobtn"  type="submit" class="btn btn-primary" value="提交">
                                <span style="color: red">${massage}</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-2" style="height: auto"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#uploadvideobtn").attr("disabled",true);
        $('.inputar').bind('input propertychange', function() {
                            if ($('#exampleFormControlInput1').val()==''||$('#exampleFormControlInput1').val()==null||$('#exampleFormControlFile2').val()==''||$('#exampleFormControlFile2').val()==null
                                ||$('#exampleFormControlFile1').val()==''||$('#exampleFormControlFile1').val()==null||$('#exampleFormControlTextarea1').val()==''||$('#exampleFormControlTextarea1').val()==null
                            ) {
                                // $("#uploadvideobtn").attr("disabled",true);
                                $("#uploadvideobtn").attr("disabled",true);
                            }else {
                                $("#uploadvideobtn").attr("disabled",false);
                            }

        });

    })
</script>
<script src="/assets/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>