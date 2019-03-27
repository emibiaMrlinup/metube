<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/2/19
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<title>Title</title>
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>
<script	src="/assets/layui/layui.js"></script>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
<div class="col-sm-12" style="height: 100%;background: #f0f0f0;padding-top: 10px;padding-left: 0px;padding-right: 0px">
    <div class="row" style="background: #f0f0f0">
        <div class="col-md-8" style="height: auto;background: white;padding-right: 15px;border-radius: 6px">
            <br>
            <span style="font-size: 20px;font-family: Calibri">资料修改</span><br>
            <form id="updateForm" >
                <div class="form-group">
                    <div class="form-group">
                        <label>请选择专栏头图，最好为96*96大小的图片</label>
                        <input name="userPicture" type="file" class="form-control-file" id="UserPicture"><br>
                        <input id="uploadUserPicbtn"  type="submit" class="btn btn-primary" value="提交">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-3" style="background: white;padding-right: 15px;border-radius: 6px"></div>
    </div>
</div>