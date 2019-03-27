<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/2/7
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
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
               <span class="layui-icon layui-icon-user">昵称</span> <input id="update_name" class="form-control" type="text" name="name"><br>
                <span class="layui-icon layui-icon-edit">个性签名</span><textarea name="penpal" id="update_penpal" cols="102" rows="10"></textarea><br>
                <span class="layui-icon layui-icon-username">用户名</span><input id="update_username" class="form-control" type="text" name="username"><br>
                <span class="layui-icon layui-icon-face-smile-fine">性别</span> <select id="update_sex" class="form-control" name="sex">
                    <option value="1">男</option>
                    <option value="2">女</option>
                    <option value="3">保密</option>
                </select>
            </div>
        </form>
    </div>
        <div class="col-md-1"></div>
        <div class="col-md-3" style="background: white;padding-right: 15px;border-radius: 6px"></div>
    </div>
</div>