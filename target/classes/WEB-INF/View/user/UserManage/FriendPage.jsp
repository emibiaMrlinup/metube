<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/3/10
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../UserUp.jsp"%>
<div id="addColldialogPlay">
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Ta的页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script	src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/bootstrap/js/scripts.js"></script>
<script	src="/assets/layui/layui.js"></script>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
<script type="text/JavaScript">
    // var t = ${pageContext.request.contextPath};
</script>
<style type="text/css">
    .showcold:hover{
        background-color: #f0f0f0;
    }
    .Arhover:hover{
        color: #00bbee;
    }
    .VSmallBox:hover{
        color: deeppink;
    }
    .btn-outline-success{
        color: black;
    }
    .active{
        background-color: #f0f0f0;
        color: #fff;
    }
    html { box-sizing: border-box; min-height: 100% }
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
<div  class="container-fluid"  style="width: 100%;height: auto;background: #f0f0f0">
    <div class="container" style="width: 100%;height: auto">
        <div class="row"style="height: auto">
            <div class="col-sm-2" style="height: auto"></div>
            <div class="col-sm-8">
                <div class="col-sm-12" style="height: auto;margin-bottom: 5px">
                    <input id="thisUserid" hidden value="${thisUser.id}">
                    <div  style="height: 250px;background: #f0f0f0;width: 100%">
                        <img src="/assets/bgres/bg/daohang1.png" alt="" height="100%" width="100%" >
                    </div>
                    <div class="col-sm-12" style="height: auto;background: #f0f0f0">
                        <ul class="layui-nav layui-layout-right" style="background-color: white;color:black;width: 100%">
                            <li class="layui-nav-item">
                                <a id="MyMainPageLink" class="layui-icon layui-icon-home" href="javascript:;" onclick="goTaMainPage()" style="text-decoration-line: none;background-color: white;color:black;">主页</a>
                            </li>
                            <li class="layui-nav-item">
                                <a id="UploadPageLink" class="layui-icon layui-icon-upload" href="javascript:;" onclick="ToTaUpLoadPage()" style="text-decoration-line: none;background-color: white;color:black;">投稿</a>
                            </li>
                        </ul>
                    </div>
                </div><br><br><br><br>
                <div class="col-sm-12" style="height: 60%;">
                    <div id="renderBox" class="col-sm-12" style="height: 100%;background: #f0f0f0"></div>
                </div>
            </div>
            <div class="col-sm-2" style="height: auto"></div>
        </div>
    </div>
</div>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    <!--主页-->
    function goTaMainPage(){
        var renderbox=$("#renderBox");
        renderbox.empty();
        var MainPageContext ='<div class="col-sm-12" style="height: 100%;background: #f0f0f0;padding-top: 10px;padding-left: 0px;padding-right: 0px">\n' +
            '    <div class="row" style="background: #f0f0f0">\n' +
            '     <div class="col-sm-8" style="height: 60%;background: white;padding-right: 15px;border-radius: 6px">\n' +
            '       <div class="row">\n' +
            '           <div class="col-md-1" style="margin-top:10px ">\n' +
            '               <img id="pic_info" class="rounded-circle" src="" alt="" height="%" width="100%" style="height: 64px;width: 64px">\n' +
            '           </div>\n' +
            '           <div class="col-md-1">\n' +
            '\n' +
            '           </div>\n' +
            '           <div class="col-md-6" style="height: auto;margin-top: 10px">\n' +
            '              <span id="name_info" class="layui-icon layui-icon-user" style=""></span>\n' +
            '               <br>\n' +
            '               <br>\n' +
            '               <span id="penpal_info" class="layui-icon layui-icon-edit"></span>\n' +
            '           </div>\n' +
            '       </div>\n' +
            '        <br>\n' +
            '         <div style="margin-bottom: 5px">__________________________________________________________</div>\n' +
            '        <div class="col-md-12" style="height: auto">\n' +
            '            <div class="row col-md-12" style="height: auto">\n' +
            '                <div class="col-md-2"></div>\n' +
            '              <div>\n' +
            '                  <span class="layui-icon layui-icon-username" style="height: 100px;width: 100px"></span>\n' +
            '              </div>\n' +
            '                <div style="margin-left: 10px">\n' +
            '                    <span id="username_info" style="height: 100px; font-size: 20px"></span>\n' +
            '            </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '     </div>\n' +
            '        <div class="col-md-1"></div>\n' +
            '     <div class="col-sm-3" style="height: auto;background: white;border-radius: 6px">\n' +
            '\n' +
            '     </div>\n' +
            '    </div>\n' +
            '</div>'
        renderbox.append(MainPageContext);
        <!--获取ta人信息-->
        $.ajax({
            url:"${pageContext.request.contextPath}/toOtherMainPage.do?id="+$("#thisUserid").val(),
            type:"GET",
            success:function (data) {
                if(data.user.userpic==null||data.user.userpic==""){
                    renderbox.find("#pic_info").attr("src","http://t.cn/RCzsdCq");
                }else {
                    renderbox.find("#pic_info").attr("src",data.user.userpic)
                }
                renderbox.find("#name_info").append(data.user.name);
                renderbox.find("#penpal_info").append("个性签名:").append(data.user.penpal);
                renderbox.find("#username_info").append("账号:").append(data.user.username);
            }
        })
    }

    //他的视频
    function ToTaUpLoadPage(){
        var renderbox=$("#renderBox");
        renderbox.empty();
        var MyVideoPage='<div class="col-sm-12" style="height: auto;background: #f0f0f0;padding-top: 10px;padding-left: 0px;padding-right: 0px;margin-left:0px;margin-right: 0px;border-radius: 3px">\n' +
            '    <div class="row" style="background: white;border-radius: 6px">\n' +
            '        <div class="layui-tab  col-md-12" style="border-radius: 6px;">\n' +
            '            <ul class="layui-tab-title">\n' +
            '                <li class="layui-this">Ta的投稿</li>\n' +
            '            </ul>\n' +
            '            <div class="layui-tab-content col-md-12" style="height: auto;">\n' +
            '\n' +
            '                <div class=" layui-tab-item layui-show col-md-12" style="height: 500px;overflow-y:scroll">\n' +
            '                <div id="MyVideoList" class="row col-md-12">' +
            '</div>\n' +
            '                    </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>\n' +
            '</div>';
        renderbox.append(MyVideoPage);
        //我的视频列表
        $.ajax({
            url:"${pageContext.request.contextPath}/getTaVideos.do?id="+$("#thisUserid").val(),
            type:"GET",
            success:function (data) {
                $.each(data.TaVideoList,function (i,item) {
                    var v_div=$('<div class="card" style="width: 160px;height: 160px;margin: 10px;border: 0px solid"></div>');
                    var v_div_a=$('<a class="VSmallBox" href="#" style="text-decoration: none;" ></a>');
                    v_div_a.click(function () {
                        window.open("${pageContext.request.contextPath}/getthisVideo.do?id="+item.id);
                    })
                    var v_div_a_div1=$('<div style="height: 96px"></div>');
                    var v_div_a_div1_img=$('<img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="" alt="Card image cap">');
                    v_div_a_div1_img.attr("src",item.vpic);
                    var v_div_a_div2=$('<div id="CvideoDetail" class="card-body" style="height: 34px"></div>');
                    var v_div_a_div2_p=$('<p></p>').append(item.name);
                    var v_div_div=$('<div class="row" style="position: relative;left: 20px"></div>');
                    var v_div_div_div=$('<div></div>');
                    v_div_a_div1.append(v_div_a_div1_img);
                    v_div_a_div2.append(v_div_a_div2_p);
                    v_div_div.append(v_div_div_div);
                    v_div_a.append(v_div_a_div1);
                    v_div_a.append(v_div_a_div2);
                    v_div.append(v_div_a);
                    v_div.append(v_div_div);
                    renderbox.find("#MyVideoList").append(v_div);

                })
            },
            error:function () {
                alert("获取不到");
            }
        })
    }

    $(document).ready(function () {
        goTaMainPage();
        ToTaUpLoadPage();
    })
</script>
<script src="/assets/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>