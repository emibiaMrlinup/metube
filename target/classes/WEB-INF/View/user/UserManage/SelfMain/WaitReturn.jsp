<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/2/17
  Time: 12:29
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
                      <div class="col-md-12" style="background: white;font-size: 30px;font-family: Calibri">
                          <span id="span1ctx">${massage1}</span>
                          <span id="spancontext">${massage}</span>
                          <p>页面将于<span id="countime" style="color: deeppink">3</span>秒钟后跳转</p>
                      </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2" style="height: auto"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
     $(document).ready(function () {
         setInterval("count()",2000);
     })
     function count()
     {
         var countime=$("#countime");
         var number=countime.innerHTML;
         number--;
         $("#countime").innerHTML=number;
         if(number==0&&$("#span1ctx").childNodes!=null)
         {
             window.location.href="${pageContext.request.contextPath}/toselfManage.do";
         }else {
             history.back();
         }
     }
</script>
<script src="/assets/layui/layui.js"></script>
<script type="text/javascript">
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>