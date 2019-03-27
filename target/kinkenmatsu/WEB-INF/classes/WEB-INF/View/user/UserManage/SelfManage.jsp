<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/23
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@include file="../UserUp.jsp"%>
<div id="addColldialogPlay">
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Metube 個人管理</title>
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
<div  class="container-fluid" id="fullbody" style="width: 100%;height: auto;background: #f0f0f0;">
    <div class="container" style="width: 100%;height: auto">
        <div class="row" style="height: auto">
            <div class="col-sm-2" style="height: auto"></div>
            <div class="col-sm-8">
                <input id="userid" hidden value="${normalUser.id}">
                <div class="col-sm-12" style="height: auto;margin-bottom: 5px">
                    <div  style="height: 250px;background: #f0f0f0;width: 100%">
                        <img id="headpic" src="" alt="" height="100%" width="100%" >
                    </div>
                    <div class="col-sm-12" style="height: auto;background: #f0f0f0">
                <ul class="layui-nav layui-layout-right" style="background-color: white;color:black;width: 100%">
                         <li class="layui-nav-item">
                           <a id="MyMainPageLink" class="layui-icon layui-icon-home" href="javascript:;" onclick="goMainPage()" style="text-decoration-line: none;background-color: white;color:black;">主页</a>
                        </li>
                         <li class="layui-nav-item">
                           <a id="UploadPageLink" class="layui-icon layui-icon-upload" href="javascript:;" onclick="ToUpLoadPage()" style="text-decoration-line: none;background-color: white;color:black;">投稿</a>
                         </li>
                         <li class="layui-nav-item">
                            <a id="CollectsPageLink" class="layui-icon layui-icon-rate-solid" href="javascript:;" onclick="goCollects()" style="text-decoration-line: none;background-color: white;color:black;">收藏夹</a>
                          </li>
                         <li class="layui-nav-item">
                            <a id="MyFirendsLink" class="layui-icon layui-icon-group" href="javascript:;" onclick="goFriends()" style="text-decoration-line: none;background-color: white;color:black;">关注</a>
                         </li>
                </ul>
                    </div>
                </div><br><br><br><br>
                <div class="col-sm-12" style="height: 60%;">
                    <div id="renderBox" class="col-sm-12" style="height: 100%;background: white"></div>
                </div>
            </div>
        <div class="col-sm-2" style="height: auto"></div>
        </div>
    </div>
</div>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
               function goCollects() {
            $("#addColldialogPlay").empty();
            var CollectsBox=$("#ChangePage");
            var srcs="${pageContext.request.contextPath}/Collects?data=getCollects"
            CollectsBox.load(srcs);
        }
        <!--主页-->
        function goMainPage(){
            var renderbox=$("#renderBox");
            renderbox.empty();
            var MainPageContext ='<div class="col-sm-12" style="height: 100%;background: white;padding-top: 10px;padding-left: 0px;padding-right: 0px">\n' +
                '    <div class="row" style="background: white">\n' +
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
                '           <div class="col-md-4" style="margin-top: 10px">\n' +
                '               <div class="row">\n' +
                '                   <a class="layui-btn layui-btn-sm layui-btn-primary" style="text-decoration-line: none" id="ToUpdateUserInfo" >\n' +
                '                   <i class="layui-icon layui-icon-edit">修改资料</i>\n' +
                '               </a>\n' +
                '                   <s class="layui-btn layui-btn-sm layui-btn-primary" style="text-decoration-line: none" id="ToUpdateUserPic"  >\n' +
                '                       <i class="layui-icon layui-icon-picture">换图片</i>\n' +
                '                   </s>\n' +
                '               </div>\n' +
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
            <!--获取个人信息-->
           $.ajax({
               url:"${pageContext.request.contextPath}/toMyMainPage.do",
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
                   renderbox.find("#ToUpdateUserInfo").click(function () {
                       $("#renderBox").empty();
                       var ToUpdateUserContext='<div class="col-sm-12" style="height: 100%;background: white;padding-top: 10px;padding-left: 0px;padding-right: 0px">\n' +
                           '    <div class="row" style="background: white">\n' +
                           '    <div class="col-md-8" style="height: auto;background: white;padding-right: 15px;border-radius: 6px">\n' +
                           '        <br>\n' +
                           '        <span style="font-size: 20px;font-family: Calibri">资料修改</span><br>\n' +
                           '        <form id="updateForm" >\n' +
                           '            <div class="form-group">\n' +
                           '<input id="update_id" type="text" name="id" hidden>'+
                           '               <span class="layui-icon layui-icon-user">昵称</span> <input id="update_name" class="form-control" type="text" name="name"><br>\n' +
                           '                <span class="layui-icon layui-icon-edit">个性签名</span><textarea name="penpal" id="update_penpal" cols="102" rows="10"></textarea><br>\n' +
                           '                <span class="layui-icon layui-icon-username">用户名</span><input id="update_username" class="form-control" type="text" name="username"><br>\n' +
                           '                <span class="layui-icon layui-icon-face-smile-fine">性别</span>' +
                           ' <select id="update_sex" class="form-control" name="sex">\n' +
                           '                    <option selected="selected" disabled hidden></option>\n' +
                           '                    <option value="男">男</option>\n' +
                           '                    <option value="女">女</option>\n' +
                           '                    <option value="保密">保密</option>\n' +
                           '                </select>\n\n' +
                           '                <input type="button" id="update_InfoBtn" value="提交" class="btn btn-primary">\n'+
                           '            </div>\n' +
                           '        </form>\n' +
                           '    </div>\n' +
                           '        <div class="col-md-1"></div>\n' +
                           '        <div class="col-md-3" style="background: white;padding-right: 15px;border-radius: 6px"></div>\n' +
                           '    </div>\n' +
                           '</div>';
                       $("#renderBox").append(ToUpdateUserContext);
                       $.ajax({
                           url:"${pageContext.request.contextPath}/toMyMainPage.do",
                           type:"GET",
                           success:function (data){
                               $("#renderBox").find("#update_id").val(data.user.id)
                               $("#renderBox").find("#update_name").val(data.user.name);
                               $("#renderBox").find("#update_penpal").text(data.user.penpal);
                               $("#renderBox").find("#update_username").val(data.user.username);
                               $("#renderBox").find("#update_sex").find("option:selected").text(data.user.sex).attr("value",data.user.sex);
                               $("#renderBox").find("#update_InfoBtn").click(function () {
                                  $.ajax({
                                      url:"${pageContext.request.contextPath}/PostMyUpInfo.do",
                                      type:"POST",
                                      data:$("#updateForm").serializeArray(),
                                      success:function (result) {
                                         alert(result.successMassage);
                                          goMainPage();
                                      },
                                      error:function (result) {
                                          alert(result.errorMassage);
                                      }
                                  })
                               })
                           }
                       })
                   })
                   <!--换头像-->
                   renderbox.find("#ToUpdateUserPic").click(function () {
                            renderbox.empty();
                            var ToUpdatePicContext='<div class="col-sm-12" style="height: 100%;background: white;padding-top: 10px;padding-left: 0px;padding-right: 0px">\n' +
                                '    <div class="row" style="background: white">\n' +
                                '        <div class="col-md-8" style="height: auto;background: white;padding-right: 15px;border-radius: 6px">\n' +
                                '            <br>\n' +
                                '            <span style="font-size: 20px;font-family: Calibri">换头像</span><br>\n' +
                                '            <form id="updatePicForm">\n' +
                                '                <div class="form-group">\n' +
                                '                    <div class="form-group">\n' +
                                '<input id="thisUserId" name="id" type="text" hidden>\n'+
                                '                        <label>请选择专栏头图，最好为96*96大小的图片</label>\n' +
                                '<input name="userPicture" type="file" class="form-control-file" id="thisUserPicture"><br>' +
                                '<input id="uploadUserPicbtn"  type="button" class="btn btn-primary" value="提交">\n'+
                                '                    </div>\n' +
                                '                </div>\n' +
                                '            </form>\n' +
                                '        </div>\n' +
                                '        <div class="col-md-1"></div>\n' +
                                '        <div class="col-md-3" style="background: white;padding-right: 15px;border-radius: 6px"></div>\n' +
                                '    </div>\n' +
                                '</div>';
                            renderbox.append(ToUpdatePicContext);
                                $.ajax({
                                    url:"${pageContext.request.contextPath}/toMyMainPage.do",
                                    type:"GET",
                                    success:function (data){
                                        renderbox.find("#thisUserId").val(data.user.id);
                                        renderbox.find("#updatePicForm").attr("enctype","multipart/form-data");
                                        <%--renderbox.find("#updatePicForm").attr("action","${pageContext.request.contextPath}/ToUpdatePicInfo.do")--%>
                                        renderbox.find("#uploadUserPicbtn").click(function () {
                                            var Picdate=new FormData();
                                            Picdate.append("id",$("#thisUserId").val());
                                            Picdate.append("userPicture",$("#thisUserPicture").get(0).files[0]);
                                            $.ajax({
                                                url:"${pageContext.request.contextPath}/ToUpdatePicInfo.do",
                                                type:"POST",
                                                data:Picdate,
                                                cache: false,
                                                async:false,
                                                contentType:false,
                                                processData: false,
                                                success:function (result) {
                                                    alert(result.successMassage);
                                                    goMainPage();
                                                },
                                                error:function (result) {
                                                    alert("传失败！请检查规格！")
                                                }
                                            })

                                    })
                                    }
                                })
                   })
               }
           })
        }
        <!--收藏页-->
        function goCollects(){
            var renderbox=$("#renderBox");
            renderbox.empty();
            var CollectContext='<style type="text/css">\n' +
                '    .showcold:hover{\n' +
                '        background-color: #f0f0f0;\n' +
                '    }\n' +
                '    .Arhover:hover{\n' +
                '        color: #00bbee;\n' +
                '    }\n' +
                '    .VSmallBox:hover{\n' +
                '        color: deeppink;\n' +
                '    }\n' +
                '    .btn-outline-success{\n' +
                '        color: black;\n' +
                '    }\n' +
                '</style>\n' +
                '<div class="col-sm-12" style="height: auto;background: #f0f0f0;padding-top: 10px;padding-left: 0px;padding-right: 0px;margin-left:0px;margin-right: 0px;border-radius: 3px">\n' +
                '    <div class="row" style="background: white;border-radius: 6px">\n' +
                '\n' +
                '      <div class="col-md-2" style="height: auto;">\n' +
                '\n' +
                '      <div class="col-md-12" style="height: auto;">\n' +
                '\n' +
                '\n' +
                '          <div class="row col-md-12" style="background: white;padding-right: 0px;padding-left: 0px;margin-top:10px">\n' +
                '             <div><span class="layui-icon layui-icon-video">视频收藏</span></div>\n' +
                '              <div class="col-md-1"></div>\n' +
                '             <div><buttom id="AddCollectsBtn" data-toggle="modal" data-target="#AddCollectsModel" class="layui-icon layui-icon-add-1 Arhover" style="border-radius: 50%;"></buttom></div>\n' +
                '          </div><br>\n' +
                '\n' +
                '\n' +
                '             <div id="CollectsBox" class="col-md-12" style="background: white;height: auto;padding-right: 0px;padding-left: 0px">\n' +
                '               <ul id="CollectsUL">\n' +
                '               </ul>\n' +
                '                              </div>\n' +
                '      </div>\n' +
                '\n' +
                '      </div>\n' +
                '<div id="ShowCollections" class="col-md-10" style="background: white;border: 1px white solid;border-left-color: gray;border-top-right-radius:6px;border-bottom-right-radius: 6px ">'+
                ' <div class="col-md-12" style="height: 80px;background: white">\n' +
                '        <div id="this_Cname" class="col-md-12" style="height: 50px"><span style="font-size: 20px;line-height: 50px">我的收藏夹</span></div>\n' +
                '        <div id="this_Cnum" class="col-md-12" style="height: 30px"><span style="font-size: 20px;line-height: 30px"></span>个视频</div>\n' +
                '    </div>\n' +
                '    <div class="col-md-12">\n' +
                '        <div class="col-md-12" style="height: 1px;background: grey"></div>\n' +
                '    </div><br>\n' +
                '    <div class="col-md-12" style="height: auto;background: white">\n' +
                '        <div class="col-md-12">\n' +
                '            <div class="col-md-12">\n' +
                '     <div id="ShowCollectionsDiv" class="row" style="">'+
                    '</div>\n' +
                '            </div>\n' +
                '        </div>\n' +
                '    </div>'+
                '</div>\n'+
                '    </div>\n' +
                '      </div>';
          <!--视频布局-->
            var VideoCardContext='';
            renderbox.append(CollectContext);
            //添加收藏夾
            renderbox.find("#AddCollectsBtn").click(function () {
               var AddCollectsContext='<div class="modal fade" id="AddCollectsModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">\n' +
                   '    <div class="modal-dialog" role="document">\n' +
                   '        <div class="modal-content" style="width: 150%">\n' +
                   '            <div class="modal-header">\n' +
                   '                <h5 class="modal-title" id="exampleModalLabel">添加收藏夹</h5>\n' +
                   '                <button id="close1" type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
                   '\n' +
                   '                </button>\n' +
                   '            </div>\n' +
                   '            <div class="modal-body">\n' +
                   '                <form id="addCollectsForm">\n' +
                   '                    <div class="form-group" id="userIdHidden">\n' +
                   '                    </div>\n' +
                   '                    <div class="form-group">\n' +
                   '                        <label for="exampleInput">命名</label>\n' +
                   '                        <input type="text" name="name" class="form-control" id="exampleInput" >\n' +
                   '                    </div>\n' +
                   '                </form>\n' +
                   '            </div>\n' +
                   '            <div class="modal-footer">\n' +
                   '                <button id="AddCollectsBtn" class="btn btn-secondary" type="submit" data-dismiss="modal">提交</button>\n' +
                   '                <button id="close3" close1type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>\n' +
                   '            </div>\n' +
                   '        </div>\n' +
                   '    </div>\n' +
                   '</div>';
               $("#addColldialogPlay").empty();
               $("#addColldialogPlay").append(AddCollectsContext);
               if($("#addColldialogPlay").find("#exampleInput").val()!=null){
               $("#addColldialogPlay").find("#AddCollectsBtn").click(function () {
                   var CAdata = new FormData();
                   CAdata.append("name",$("#addColldialogPlay").find("#exampleInput").val())
                   $.ajax({
                       url:"${pageContext.request.contextPath}/AddCollects.do",
                       type:"POST",
                       data:CAdata,
                       processData:false,
                       contentType:false,
                       success:function (result) {
                       alert(result.MESSAGE);
                       goCollects();
                       },
                       error:function () {
                       alert("添加失败");
                       }
                   })
               })
               }else{
                   alert("内容不能为空!");
               }
            })
            <!--获取收藏夹-->
            $.ajax({
                url:"${pageContext.request.contextPath}/getColletsData.do",
                type:"GET",
                dataType:"json",
                success:function (data) {
                    var Collectsdata=data;
                    var cid=1;
                    $.each(Collectsdata.collect,function (index,item) {
                        console.log("1i--li")
                        //renderbox.find("#CollectsUL").append(collectsTags);
                        //renderbox.find("#CollectsUL li").attr("id","cid"+cid);
                        $.each(item,function (i,it) {
                            if (i==0) {
                                //console.log(item)
                                <!--收藏夹布局-->
                                var tag=$("<li class='showcold' style='width: auto;height: 50px;padding-right: 0px;padding-left: 0px;border-radius: 6px'></li>");
                                tag.attr("id","Cup_li"+cid);
                                var li_div=$("<div class='row col-md-12 showcold' style='height: 50px;padding-right: 0px;padding-left: 0px;border-radius: 6px'></div>");
                                var li_div_div1=$("<div><span class='layui-icon layui-icon-file' style='font-size: 15px;line-height: 50px;color: black;'></span></div>");
                                var li_div_div2=$("<div></div>");
                                var li_div_div2_a=$("<a class='showcold collectName' href='#' style='text-decoration-line: none;font-size: 15px;font-family: Calibri;color: black;line-height: 50px'></a>")
                                    .attr("id","cid"+cid).append(it.name).appendTo(li_div_div2);
                                var li_div_div3=$("<div class='col-md-1'></div>");
                                var li_div_div4=$("<div class='row'></div>");
                                var li_div_div4_ad1=$("<div></div>");
                                var li_div_div4_ad2=$("<div></div>");
                                var li_div_div4_a1=$("<a class='layui-icon layui-icon-edit Arhover' data-toggle='modal' data-target='#editCollectsModal' href='#' style='font-size:15px;text-decoration-line: none;line-height: 50px;position: relative;left: 5px'></a>")
                                    .attr("id","Cup"+cid);
                                //修改收藏夾信息
                                li_div_div4_a1.click(function () {
                                    var editCollectsContext='<div class="modal fade" id="editCollectsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">\n' +
                                        '    <div class="modal-dialog" role="document">\n' +
                                        '        <div class="modal-content" style="width: 150%">\n' +
                                        '            <div class="modal-header">\n' +
                                        '                <h5 class="modal-title" id="exampleModalLabel">添加收藏夹</h5>\n' +
                                        '                <button id="close1" type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
                                        '\n' +
                                        '                </button>\n' +
                                        '            </div>\n' +
                                        '            <div class="modal-body">\n' +
                                        '                <form id="addCollectsForm">\n' +
                                        '                    <div class="form-group" id="userIdHidden">\n' +
                                        '                    </div>\n' +
                                        '                    <div class="form-group">\n' +
                                        '                        <label for="exampleInput">命名</label>\n' +
                                        '                        <input type="text" name="name" class="form-control" id="exampleInput" >\n' +
                                        '                    </div>\n' +
                                        '                </form>\n' +
                                        '            </div>\n' +
                                        '            <div class="modal-footer">\n' +
                                        '                <button id="createCollect" class="btn btn-secondary" type="button"  data-dismiss="modal">提交</button>\n' +
                                        '                <button id="close3"  type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>\n' +
                                        '            </div>\n' +
                                        '        </div>\n' +
                                        '    </div>\n' +
                                        '</div>';
                                    $("#addColldialogPlay").empty();
                                    $("#addColldialogPlay").append(editCollectsContext);
                                    $("#addColldialogPlay").find("#exampleInput").val(it.name);
                                    //创建收藏夹
                                    $("#addColldialogPlay").find("#createCollect").click(function () {
                                         var CData= new FormData();
                                         CData.append("name",$("#addColldialogPlay").find("#exampleInput").val());
                                         CData.append("id",it.id);
                                         $.ajax({
                                             url:"${pageContext.request.contextPath}/updateCollects.do",
                                             type:"POST",
                                             data:CData,
                                             processData: false,
                                             contentType : false,
                                             success:function (result) {
                                             alert(result.MESSAGE);
                                                 goCollects();
                                             },
                                             error:function () {
                                             alert("修改失败，服务器问题");
                                             }
                                         })

                                    })


                                });
                                li_div_div4_a1.appendTo(li_div_div4_ad1);
                                var li_div_div4_a2=$("<a class='layui-icon layui-icon-delete Arhover' data-toggle='modal' data-target='#deleteCollectsModal' href='#' style='font-size:15px;text-decoration-line: none;line-height: 50px;position: relative;left: 9px'></a>")
                                    .attr("id","Cde"+cid);
                                //刪除收藏夾
                                li_div_div4_a2.click(function () {
                                var deteteCollectsContext='<div class="modal fade" id="deleteCollectsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">\n' +
                                    '  <div class="modal-dialog" role="document">\n' +
                                    '    <div class="modal-content">\n' +
                                    '      <div class="modal-header">\n' +
                                    '        <h5 class="modal-title" id="exampleModalLabel">请确认要删除的收藏夹</h5>\n' +
                                    '        <button type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
                                    '          <span aria-hidden="true">&times;</span>\n' +
                                    '        </button>\n' +
                                    '      </div>\n' +
                                    '      <div class="modal-body">\n' +
                                    '删除该收藏夹以及该收藏夹的视频' +
                                    '      </div>\n' +
                                    '      <div class="modal-footer">\n' +
                                    '        <button type="button" id="ToDeleteThisCollects" class="btn btn-secondary" data-dismiss="modal">确认</button>\n' +
                                    '        <button type="button" class="btn btn-primary">取消</button>\n' +
                                    '      </div>\n' +
                                    '    </div>\n' +
                                    '  </div>\n' +
                                    '</div>';
                                    $("#addColldialogPlay").empty();
                                    //$("#addColldialogPlay").removeAttr("hidden","");
                                    $("#addColldialogPlay").append(deteteCollectsContext);
                                    $("#addColldialogPlay").find("#ToDeleteThisCollects").click(function () {
                                        var  Cdate = new FormData();
                                        Cdate.append("id",it.id);
                                        $.ajax({
                                         url:"${pageContext.request.contextPath}/deleteCollects.do",
                                            type:"POST",
                                            data:Cdate,
                                            processData: false,
                                            contentType : false,
                                            success:function (result) {
                                                alert(result.Message);
                                                goCollects();
                                            },
                                            error:function () {
                                                alert("删除失败，服务器问题")
                                            }
                                        })
                                    })
                                });
                                li_div_div4_a2.appendTo(li_div_div4_ad2);
                                li_div_div4.append(li_div_div4_ad1).append(li_div_div4_ad2);
                                li_div
                                    .append(li_div_div1)
                                    .append(li_div_div2)
                                    .append(li_div_div3)
                                    .append(li_div_div4);
                                tag.append(li_div);
                                //添加收藏页视频列表布局
                                tag.on('click',function(){
                                 $("#CollectsUL li div").removeClass("active");
                                 $("#CollectsUL li").removeClass("active");
                                 li_div.addClass("active");
                                 tag.addClass("active");
                                 var VCbox=renderbox.find("#ShowCollectionsDiv");

                                 $.each(item,function (j,it_1) {
                                     if (j==1){
                                         var cnum=0;
                                         var cnum_index;
                                         for (cnum_index in it_1){
                                             cnum++;
                                         }
                                         console.log(item);
                                         VCbox.empty();
                                         if(cnum>0) {
                                             $.each(it_1, function (k, it_2) {
                                                 console.log(it_2);
                                                 // console.log(cnum);
                                                 renderbox.find("#this_Cname span").empty();
                                                 renderbox.find("#this_Cname span").append(it.name);
                                                 renderbox.find("#this_Cnum span").empty();
                                                 renderbox.find("#this_Cnum span").append(cnum);
                                                 var div_all = $("<div class='card' style='width: 160px;height: 160px;margin: 10px;border: 0px solid'></div>");
                                                 var all_a = $("<a class='VSmallBox' href='#' target='blank' style='text-decoration: none;' ></a>");
                                                 all_a.click(function () {
                                                     window.open("${pageContext.request.contextPath}/getthisVideo.do?id="+it_2.id);
                                                 })
                                                 var all_a_div1 = $("<div style='height: 96px'></div>");
                                                 var all_a_div1_img = $("<img style='border-radius: 6px;height:100%' class='card-img-top w-100 h-100 img-fluid'  alt='Card image cap'>")
                                                     .attr("src", it_2.vpic).appendTo(all_a_div1);
                                                 var all_a_div2 = $("<div id='CvideoDetail' class='card-body' style='height: 34px'></div>");
                                                 var all_a_div2_p = $("<p></p>").append(it_2.name).appendTo(all_a_div2);
                                                 all_a_div1.appendTo(all_a);
                                                 all_a_div2.appendTo(all_a);
                                                 var all_div1 = $("<div class='row' style='position: relative;left: 20px'></div>");
                                                 var all_div1_div1 = $("<div style='line-height:30px;font-size: 10px'></div>").append(2018 - 12 - 12).appendTo(all_div1)
                                                 var all_div1_div2 = $("<div></div>");
                                                 var all_div1_div2_a = $("<a href='#' class='layui-icon layui-icon-delete Arhover' data-toggle='modal' data-target='#deleteCollectionModal' style='text-decoration-line: none;line-height: 30px'>取消收藏</a>")
                                                 //取消收藏
                                                 all_div1_div2_a.click(function () {
                                                     var deteteCollectionsContext='<div class="modal fade" id="deleteCollectionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">\n' +
                                                         '  <div class="modal-dialog" role="document">\n' +
                                                         '    <div class="modal-content">\n' +
                                                         '      <div class="modal-header">\n' +
                                                         '        <h5 class="modal-title" id="exampleModalLabel">请确认要删除的收藏夹</h5>\n' +
                                                         '        <button type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
                                                         '          <span aria-hidden="true">&times;</span>\n' +
                                                         '        </button>\n' +
                                                         '      </div>\n' +
                                                         '      <div class="modal-body">\n' +
                                                         '是否删除该视频' +
                                                         '      </div>\n' +
                                                         '      <div class="modal-footer">\n' +
                                                         '        <button type="button" id="ToDeleteThisCollections" class="btn btn-secondary" data-dismiss="modal">是</button>\n' +
                                                         '        <button type="button" class="btn btn-primary">否</button>\n' +
                                                         '      </div>\n' +
                                                         '    </div>\n' +
                                                         '  </div>\n' +
                                                         '</div>';
                                                     $("#addColldialogPlay").empty();
                                                     $("#addColldialogPlay").append(deteteCollectionsContext);
                                                     //确认删除收藏的视频
                                                     $("#addColldialogPlay").find("#ToDeleteThisCollections").click(function () {
                                                         var collectionData=new FormData();
                                                         collectionData.append("vid",it_2.id);
                                                         collectionData.append("userid",$("#userid").val());
                                                         $.ajax({
                                                             url:"${pageContext.request.contextPath}/deleteThisCollections.do",
                                                             type:"POST",
                                                             data:collectionData,
                                                             processData:false,
                                                             contentType:false,
                                                             success:function (result) {
                                                             alert(result.MESSAGE);
                                                              var ccid=cid;
                                                             goCollects();
                                                             //$("#CollectsUL li").find("#Cup_li"+ccid).trigger("click");
                                                             },error:function () {
                                                             alert("删除失败");
                                                             }
                                                         })
                                                     })
                                                 })
                                                 all_div1_div2_a.appendTo(all_div1_div2);
                                                 all_div1_div2.appendTo(all_div1);
                                                 div_all.append(all_a);
                                                 div_all.append(all_div1);
                                                 VCbox.append(div_all);
                                             })
                                         }else{
                                             renderbox.find("#this_Cname span").empty();
                                             renderbox.find("#this_Cname span").append(it.name);
                                             renderbox.find("#this_Cnum span").empty();
                                             renderbox.find("#this_Cnum span").append(cnum);
                                         }
                                     }
                                 })
                                    // if(tag.find("#cid1")!=null) {
                                    //     tag.trigger("click");
                                    // }
                                })
                                //$("#CollectsUL li").eq(1).trigger("click");
                                // if(tag.find("#cid1")!=null) {
                                //     tag.trigger("click");
                                // }
                                renderbox.find("#CollectsUL").append(tag);
                            }
                        })
                        cid++;
                    })
                    $("#CollectsUL li").eq(0).trigger("click");
                }
            })
        }
        //我的视频
        function ToUpLoadPage(){
            var renderbox=$("#renderBox");
            renderbox.empty();
            var MyVideoPage='<div class="col-sm-12" style="height: auto;background: #f0f0f0;padding-top: 10px;padding-left: 0px;padding-right: 0px;margin-left:0px;margin-right: 0px;border-radius: 3px">\n' +
                '    <div class="row" style="background: white;border-radius: 6px">\n' +
                '        <div class="layui-tab  col-md-12" style="border-radius: 6px;">\n' +
                '            <ul class="layui-tab-title">\n' +
                '                <li class="layui-this">我的投稿</li>\n' +
                '                <li>上传视频</li>\n' +
                '            </ul>\n' +
                '            <div class="layui-tab-content col-md-12" style="height: auto;">\n' +
                '\n' +
                '                <div class=" layui-tab-item layui-show col-md-12" style="height: 500px;overflow-y:scroll">\n' +
                '                <div id="MyVideoList" class="row col-md-12">' +
                '</div>\n' +
                '                    </div>\n' +
                '                <div class="layui-tab-item layui-md-12" style="height: auto">\n' +
                '                    <div class="col-md-12" style="height: 500px;background-image: url(\'/assets/bgres/bg/UploadBg.jpg\');">\n' +
                '                        <div id="ToUploadDiv" class="center-in-center" style="width: 100px;height: 100px;background: url(\'/assets/bgres/bg/UploadIcon.png\');background-size: contain">\n' +
                '                        </div>\n' +
                '                    </div>\n' +
                '                    </div>\n' +
                '            </div>\n' +
                '        </div>\n' +
                '    </div>\n' +
                '</div>';
            renderbox.append(MyVideoPage);
            //我的视频列表
            $.ajax({
                url:"${pageContext.request.contextPath}/getMyVideos.do",
                type:"GET",
                success:function (data) {
                    $.each(data.MyVideoList,function (i,item) {
                        var v_div=$('<div class="card" style="width: 160px;height: 160px;margin: 10px;border: 0px solid"></div>');
                        var v_div_a=$('<a class="VSmallBox" href="#" style="text-decoration: none;" ></a>');
                        v_div_a.click(function () {
                            window.open("${pageContext.request.contextPath}/getthisVideo.do?id="+item.id);
                        <%--var formData= new FormData();--%>
                        <%--formData.append("id",item.id);--%>
                        <%--$.ajax({--%>
                            <%--url:"${pageContext.request.contextPath}/getthisVideo.do",--%>
                            <%--type:"POST",--%>
                            <%--data:formData,--%>
                            <%--processData:false,--%>
                            <%--contentType:false,--%>
                            <%--success:function (result) {--%>
                            <%--},error:function(){--%>
                            <%--}--%>
                        <%--})--%>
                        })
                        var v_div_a_div1=$('<div style="height: 96px"></div>');
                        var v_div_a_div1_img=$('<img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="" alt="Card image cap">');
                        v_div_a_div1_img.attr("src",item.vpic);
                        var v_div_a_div2=$('<div id="CvideoDetail" class="card-body" style="height: 34px"></div>');
                        var v_div_a_div2_p=$('<p></p>').append(item.name);
                        var v_div_div=$('<div class="row" style="position: relative;left: 20px"></div>');
                        var v_div_div_div=$('<div></div>');
                        var v_div_div_div_a=$('<a href="#" class="layui-icon layui-icon-delete Arhover" data-toggle="modal" data-target="#deleteMyVideoModal" style="text-decoration-line: none;line-height: 30px">删除该视频</a>');
                        v_div_div_div_a.click(function () {
                            var deteteVideoContext='<div class="modal fade" id="deleteMyVideoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">\n' +
                                '  <div class="modal-dialog" role="document">\n' +
                                '    <div class="modal-content">\n' +
                                '      <div class="modal-header">\n' +
                                '        <h5 class="modal-title" id="exampleModalLabel">请确认要删除的视频</h5>\n' +
                                '        <button type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
                                '          <span aria-hidden="true">&times;</span>\n' +
                                '        </button>\n' +
                                '      </div>\n' +
                                '      <div class="modal-body">\n' +
                                '是否删除该视频' +
                                '      </div>\n' +
                                '      <div class="modal-footer">\n' +
                                '        <button type="button" id="ToDeleteThisVideo" class="btn btn-secondary" data-dismiss="modal">是</button>\n' +
                                '        <button type="button" class="btn btn-primary">否</button>\n' +
                                '      </div>\n' +
                                '    </div>\n' +
                                '  </div>\n' +
                                '</div>';
                            $("#addColldialogPlay").empty();
                            $("#addColldialogPlay").append(deteteVideoContext);
                            $("#addColldialogPlay").find("#ToDeleteThisVideo").click(function () {
                             var Vdata=new FormData();
                             Vdata.append("id",item.id);
                             $.ajax({
                                 url:"${pageContext.request.contextPath}/deleteMyVideo.do",
                                 type:"POST",
                                 data:Vdata,
                                 processData:false,
                                 contentType:false,
                                 success:function (result) {
                                     alert(result.MESSAGE);
                                     ToUpLoadPage();
                                 },error:function () {
                                     alert("删除失败");
                                 }
                             })
                            })
                        })
                        v_div_a_div1.append(v_div_a_div1_img);
                        v_div_a_div2.append(v_div_a_div2_p);
                        v_div_div_div.append(v_div_div_div_a);
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
            //跳转上传页面
            var ToUploadInfoPageBtn=$('<input type="button" style="height: 100px;width: 100px;opacity: 0;filter: alpha(opacity=0)">')
            ToUploadInfoPageBtn.click(function () {
                window.location.href="${pageContext.request.contextPath}/ToUploadVideoPage.do";
            })
            renderbox.find("#ToUploadDiv").append(ToUploadInfoPageBtn);

        }
            function goFriends(){
                var renderbox=$("#renderBox");
                renderbox.empty();
                   var formdata = new FormData();
                   formdata.append("userid",$("#userid").val())
                   $.ajax({
                       url:"${pageContext.request.contextPath}/getFriends.do",
                       type:"POST",
                       data:formdata,
                       processData:false,
                       contentType:false,
                       success:function (result) {
                           var all_d_sc=$('<div class="col-md-12" style="background: white;height: 500px;overflow-y:scroll"></div>');
                          var all_d_s=$('<div class="row col-md-12" style="border-radius: 6px;background: white;height:auto;width: 100%;margin-right: 0px" ></div>');
                           var all_div1=$('<div class="row col-md-12" style="border-radius: 6px;background: white;height:auto" ></div>');
                           var all_span=$('<span id="friendsNum" class="layui-icon layui-icon-user" style="font-size:20px;font-family: Calibri"></span>');
                           var br=$('<br><br>');
                           all_span.text(result.count);
                           all_span.appendTo(all_div1);
                           all_div1.append(br);
                           all_d_s.append(all_div1);
                           var num = result.count;
                       $.each(result.MyFriends,function (index,item) {
                           var all_div2=$('<div class="row col-md-12" style="border-radius: 6px;background: white;height:auto" ></div>');
                           var all_div_d1=$('<div class="col-md-8"></div>');
                           var all_div_d1_img=$('<img src="" alt="" style="width: 100px;height: 100px" class="rounded-circle">');
                           var all_div_d1_span=$('<span class="layui-icon layui-icon-user" style="font-size:20px;font-family: Calibri"></span>');
                           $.each(result.MyFriendsInfo,function (i,t) {
                               if (t.id==item.friendid) {
                                   all_div_d1_img.attr("src",t.userpic);
                                   all_div_d1_span.text(t.name)
                                   if (t.name==''||t.name==null){
                                       all_div_d1_span.text(t.username);
                                   }
                               }
                           })
                           all_div_d1_img.click(function () {
                               window.open("${pageContext.request.contextPath}/goFriendPage.do"+item.friendid);
                           })
                           all_div_d1_img.appendTo(all_div_d1);
                           all_div_d1_span.appendTo(all_div_d1);
                           var all_div_d2=$('<div class="col-md-2"></div>');
                           var all_div_d2_button=$('<a href="#" class="layui-icon layui-icon-edit Arhover center-in-center" data-toggle="modal" data-target="#sendMessageModal" style="text-decoration-line: none;line-height: 30px">发私信</a>');
                           all_div_d2_button.click(function () {
                               var sendMessageModalContext='<div class="modal fade" id="sendMessageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">\n' +
                                   '  <div class="modal-dialog" role="document">\n' +
                                   '    <div class="modal-content">\n' +
                                   '      <div class="modal-header">\n' +
                                   '        <h5 class="modal-title" id="exampleModalLabel">发送信息</h5>\n' +
                                   '        <button type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
                                   '          <span aria-hidden="true">&times;</span>\n' +
                                   '        </button>\n' +
                                   '      </div>\n' +
                                   '      <div class="modal-body">\n' +
                                   '      <span class="layui-icon layui-icon-edit">私信</span><textarea name="penpal" id="MessageContext" cols="62" rows="10"></textarea><br>\n' +
                                   '      </div>\n' +
                                   '      <div class="modal-footer">\n' +
                                   '        <button type="button" id="ToSendMessage" class="btn btn-secondary" data-dismiss="modal">是</button>\n' +
                                   '        <button type="button" data-dismiss="modal" class="btn btn-primary">否</button>\n' +
                                   '      </div>\n' +
                                   '    </div>\n' +
                                   '  </div>\n' +
                                   '</div>';
                               $("#addColldialogPlay").empty();
                               $("#addColldialogPlay").append(sendMessageModalContext);
                               $("#addColldialogPlay").find("#ToSendMessage").click(function () {
                                   var MessageData = new FormData();
                                   MessageData.append("userid",item.userid);
                                   MessageData.append("friendid",item.friendid);
                                   MessageData.append("context",$("#addColldialogPlay").find("#MessageContext").val());
                                   if ($("#addColldialogPlay").find("#MessageContext").val()==''||$("#addColldialogPlay").find("#MessageContext").val()==null){
                                       alert("不能为空");
                                   } else {
                                       $.ajax({
                                           url:"${pageContext.request.contextPath}/SendMessage.do",
                                           type:"POST",
                                           data:MessageData,
                                           processData:false,
                                           contentType:false,
                                           success:function (result) {
                                               alert(result.MESSAGE);
                                           }
                                       })
                                   }
                               })
                           })
                           all_div_d2_button.appendTo(all_div_d2);
                           var all_div_d3=$('<div class="col-md-2"></div>');
                           var all_div_d3_button=$('<a href="#" class="layui-icon layui-icon-delete Arhover center-in-center" data-toggle="modal" data-target="#DeleteFriendModal" style="text-decoration-line: none;line-height: 30px">取消关注</a>');
                           all_div_d3_button.click(function () {
                               var DeleteFriendModal='<div class="modal fade" id="DeleteFriendModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">\n' +
                                   '  <div class="modal-dialog" role="document">\n' +
                                   '    <div class="modal-content">\n' +
                                   '      <div class="modal-header">\n' +
                                   '        <h5 class="modal-title" id="exampleModalLabel">取消关注</h5>\n' +
                                   '        <button type="button" class="close" data-dismiss="modal" aria-label="Close">\n' +
                                   '          <span aria-hidden="true">&times;</span>\n' +
                                   '        </button>\n' +
                                   '      </div>\n' +
                                   '      <div class="modal-body">\n' +
                                   ' <p>请确认要取消关注的用户</p><br>\n' +
                                   '      </div>\n' +
                                   '      <div class="modal-footer">\n' +
                                   '        <button type="button" id="ToDeleteFriend" class="btn btn-secondary" data-dismiss="modal">是</button>\n' +
                                   '        <button type="button" data-dismiss="modal" class="btn btn-primary">否</button>\n' +
                                   '      </div>\n' +
                                   '    </div>\n' +
                                   '  </div>\n' +
                                   '</div>';
                               $("#addColldialogPlay").empty();
                               $("#addColldialogPlay").append(DeleteFriendModal);
                               $("#addColldialogPlay").find("#ToDeleteFriend").click(function () {
                                   var FriendData = new FormData();
                                   FriendData.append("userid",item.userid);
                                   FriendData.append("friendid",item.friendid);
                                   $.ajax({
                                       url:"${pageContext.request.contextPath}/DeleteFriends.do",
                                       type:"POST",
                                       data:FriendData,
                                       processData:false,
                                       contentType:false,
                                       success:function (result) {
                                       alert(result.MESSAGE);
                                       num--;
                                       all_span.text(num);
                                       goFriends();
                                       },error:function () {
                                       alert("操作失败");
                                       }
                                   })
                               })

                           })
                           all_div_d3_button.appendTo(all_div_d3);
                           all_div2.append(all_div_d1)
                           .append(all_div_d2)
                           .append(all_div_d3)
                               .appendTo(all_d_sc)
                       })
                           all_d_sc.appendTo(all_d_s);
                           renderbox.append(all_d_s);
                       },error:function () {
                           alert("信息获取失败！");
                       }
                   })
               }

        $(document).ready(function () {
            goCollects();
            goMainPage();
            ToUpLoadPage();

            $.ajax({
                url:"${pageContext.request.contextPath}/getSelfHeadBg.do",
                type:"GET",
                success:function (data) {
                  $("#headpic").attr("src",data.theme.url);
                }
            })
            $.ajax({
                url:"${pageContext.request.contextPath}/getSelfBg.do",
                type:"GET",
                success:function (data) {
                    $("#fullbody").attr("style","background-image:url("+data.theme.url+");width: 100%;height: auto;background-repeat: no-repeat;background-size: 100% 100%; -moz-background-size: 100% 100%;");
                }
            })
        })
</script>
<script src="/assets/layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
var element = layui.element;

});
</script>