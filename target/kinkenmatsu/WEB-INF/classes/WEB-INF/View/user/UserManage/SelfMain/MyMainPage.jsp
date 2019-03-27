<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/2/7
  Time: 16:14
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
     <div class="col-sm-8" style="height: 60%;background: white;padding-right: 15px;border-radius: 6px">
       <div class="row">
           <div class="col-md-1" style="margin-top:10px ">
               <img class="rounded-circle" src="http://t.cn/RCzsdCq" alt="" height="100%" width="100%" style="height: 100px;width: 100px">
           </div>
           <div class="col-md-1">

           </div>
           <div class="col-md-6" style="height: auto;margin-top: 10px">
              <span class="layui-icon layui-icon-user" style="">${user.name}</span>
               <br>
               <br>
               <span class="layui-icon layui-icon-edit">个性签名 : ${user.penpal}</span>
           </div>
           <div class="col-md-4" style="margin-top: 10px">
               <div class="row">
                   <a class="layui-btn layui-btn-sm layui-btn-primary" style="text-decoration-line: none" id="ToUpdateUserInfo" href="#">
                   <i class="layui-icon layui-icon-edit">修改资料</i>
               </a>
                   <s class="layui-btn layui-btn-sm layui-btn-primary" style="text-decoration-line: none" href="#" >
                       <i class="layui-icon layui-icon-picture">换图片</i>
                   </s>
               </div>
           </div>
       </div>
        <br>
         <div style="margin-bottom: 5px">__________________________________________________________</div>
        <div class="col-md-12" style="height: auto">
            <div class="row col-md-12" style="height: auto">
                <div class="col-md-2"></div>
              <div>
                  <span class="layui-icon layui-icon-username" style="height: 100px;width: 100px">账号:</span>
              </div>
                <div style="margin-left: 10px">
                    <span style="height: 100px; font-size: 20px">${user.username}</span>
            </div>
            </div>
        </div>
     </div>
        <div class="col-md-1"></div>
     <div class="col-sm-3" style="height: auto;background: white;border-radius: 6px">

     </div>
    </div>
</div>
<script type="text/javascript">
</script>
