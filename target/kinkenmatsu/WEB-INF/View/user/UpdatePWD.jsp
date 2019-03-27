<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/3/15
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="UserUp.jsp"%>
<div id="addColldialogPlay">
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改密码</title>
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
<div  class="container-fluid"  style="width: 100%;height: auto">
    <div class="container" style="width: 100%;height: auto">
        <div class="row"style="height: auto">
            <div class="col-sm-2" style="height: auto">

            </div>
            <div class="col-sm-8" style="height: auto">
                    <form>
                        <div class="form-group">
                            <label for="exampleInputPassword1">原密码</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword2">新密码</label>
                            <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword3">确认密码</label>
                            <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password">
                        </div>
                        <button id="UpdatePWD" type="button" class="btn btn-primary">确认修改</button>
                    </form>
            </div>
            <div class="col-sm-2" style="height: auto">

            </div>
        </div>
    </div>
</div>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
$("#UpdatePWD").click(function () {
            if ($("#exampleInputPassword3").val()==""||$("#exampleInputPassword3").val()==null||$("#exampleInputPassword2").val()==""||$("#exampleInputPassword2").val()==null||$("#exampleInputPassword1").val()==""||$("#exampleInputPassword1").val()==null){
             alert("不能为空！");
            }else{
                var PWDdata = new FormData();
                PWDdata.append("oldpass",$("#exampleInputPassword1").val());
                PWDdata.append("newpass",$("#exampleInputPassword2").val());
                PWDdata.append("newpassRe",$("#exampleInputPassword3").val());
                $.ajax({
                    url:"${pageContext.request.contextPath}/UpdatePWD.do",
                    type:"POST",
                    data:PWDdata,
                    processData:false,
                    contentType:false,
                    success:function (result) {
                    alert(result.MESSAGE);
                },error:function (result) {
                        alert(result.MESSAGE);
                    }
            })
            }
})
</script>
<script src="/assets/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>