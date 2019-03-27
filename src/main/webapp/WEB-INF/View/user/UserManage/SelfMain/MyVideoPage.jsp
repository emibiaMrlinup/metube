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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="col-sm-12" style="height: auto;background: #f0f0f0;padding-top: 10px;padding-left: 0px;padding-right: 0px;margin-left:0px;margin-right: 0px;border-radius: 3px">
    <div class="row" style="background: white;border-radius: 6px">
        <div class="layui-tab  col-md-12" style="border-radius: 6px;">
            <ul class="layui-tab-title">
                <li class="layui-this">我的投稿</li>
                <li>上传视频</li>
            </ul>
            <div class="layui-tab-content col-md-12" style="height: auto;">

                <div class=" layui-tab-item layui-show col-md-12" style="height: 500px;overflow-y:scroll">
                    <div id="MyVideoList" class="row col-md-12">

                        <c:forEach begin="1" end="27" >

                            <div class="card" style="width: 160px;height: 160px;margin: 10px;border: 0px solid">
                                <a class="VSmallBox" href="#" target="_blank" style="text-decoration: none;" >
                                    <div style="height: 96px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="/assets/bgres/viewFF/lunbo3.png" alt="Card image cap"></div>
                                    <div id="CvideoDetail" class="card-body" style="height: 34px">
                                        <p>大热天的一天有大幅度头发</p>
                                    </div>
                                </a>
                                <div class="row" style="position: relative;left: 20px">
                                    <div><a href="#" class="layui-icon layui-icon-delete Arhover" style="text-decoration-line: none;line-height: 30px">删除该视频</a></div>
                                </div>
                            </div>

                        </c:forEach>

                    </div>
                </div>
                <div class="layui-tab-item layui-md-12" style="height: auto">
                    <div class="col-md-12" style="height: 500px;background-image: url('/assets/bgres/bg/UploadBg.jpg');">
                        <div class="center-in-center" style="width: 100px;height: 100px;background: url('/assets/bgres/bg/UploadIcon.png');background-size: contain">
                            <button id="ToUploadInfoPage" style="height: 100px;width: 100px;opacity: 0;filter: alpha(opacity=0)"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
