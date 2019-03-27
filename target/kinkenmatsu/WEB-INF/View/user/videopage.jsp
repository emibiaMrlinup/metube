<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/2/6
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@include file="UserUp.jsp"%>
<div id="addColldialogPlay">
    <div class="modal fade" id="addThisVideoToCollects" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 150%">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">添加收藏</h5>
                    <button id="close1" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addCollectsForm">
                        <div class="form-group" id="userIdHidden">
                        </div>
                        <div class="form-group">
                            <span class="layui-icon layui-icon-face-smile-fine">选择收藏夹</span>
                            <select id="ThisCollects" class="form-control" name="sex">
                                               <option selected="selected" disabled hidden></option>
                                <c:forEach items="${MyCollects}" var="i">
                                    <option value="${i.id}">${i.name}</option>
                                </c:forEach>
                                          </select>
                        </div>
                        <span id="tishi"></span>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="PostThisCollections" class="btn btn-secondary" type="button" data-dismiss="modal">提交</button>
                    <button id="close3" close1type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>视频播放页</title>
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
    .goodicon:hover{
        color: deeppink;
        text-decoration-line: none
    }
    .goodicon:active{
        color: hotpink;
        text-decoration-line: none;
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
</style>
<div class="layui-body" style="width: 100%;height: auto;overflow-y:scroll;left: 0px">
    <div style="width: 100%;height:150px;background-image: url(/assets/bgres/bg/pink.jpg)">
        <div style="width: 100%;height: 100px"></div>
        <nav class="navbar navbar-light bg-light justify-content-between push-8">
            <form class="form-inline">
                <input id="SearchName" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button id="searchVideoBtn" class="btn btn-outline-success my-2 my-sm-0 layui-icon layui-icon-search" style="background: fixed ;border-color: white" type="button">Search</button>
            </form>
        </nav>
    </div>
    <div  class="container-fluid"  style="width: 100%;height: auto">
        <div class="container" style="width: 100%;height: auto">
            <div class="row"style="height: auto">
                <div class="col-sm-2" style="height: auto">

                </div>
                <div class="col-sm-8" style="height: auto">
                <div class="col-sm-12" style="height: auto">
                    <div class="col-sm-12" style="height: 100px;background: white">
                        <div class="col-sm-12" style="height: 50px;background: white;font-family: Cambria;font-size: 25px;line-height: 50px;position:relative; left: -10px">${thisVideo.name}</div>
                        <div class="col-sm-12" style="height: 50px;background: white">
                            <div class="row" style="line-height: 50px">
                                <div> <p>${ParentType.name}</p></div>
                                <div><p> ></p> </div>
                                <div>  <p>${ChildType.name}</p></div>
                                <div class="col-sm-1">  <p>  </p></div>
                            <div > <p>上传时间 ${thisVideo.dateshow}</p></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12" style="padding: 10px;height: 70%;background: black">
                    <video class="col-sm-12" height="100%" controls>
                        <source src="${thisVideo.url}" type="video/mp4">
                    </video>
                    </div><br>
                    <div class="col-sm-12">_______________________________________________________________________________________________________________________________________________________</div><br>
                    <div class="col-sm-12">
                        <div class="row" style="height: auto">
                            <div class="col-sm-1" style=" width:100px;height: 50px" id="collectThisVideo">
                                <a class="goodicon layui-icon layui-icon-rate" data-toggle='modal' data-target='#addThisVideoToCollects' href="#" id="star" style="text-decoration-line: none;font-size: 20px;line-height:50px">${num}</a>
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-2">
                                <div class="row">
                                    <div class="col-sm-4"><a class="layui-icon Arhover" href="${pageContext.request.contextPath}/goFriendPage.do?id=${arctor.id}"><img src="${arctor.userpic}" style="width: 40px;height: 40px" class="rounded-circle"></a></div>
                                    <div class="col-sm-8" >
                                        <div><a class="layui-icon layui-icon-user Arhover" style="text-decoration-line: none" href="${pageContext.request.contextPath}/goFriendPage.do?id=${arctor.id}">作者:${arctor.name}</a></div>
                                        <button style="width: 100%;border: #00bbee" class="button layui-icon layui-icon-add-1 layui-bg-blue" id="addfriend">关注</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">_______________________________________________________________________________________________________________________________________________________</div><br>
                    <div class="col-sm-12">
                        <span class="layui-icon layui-icon-read">详情：<p>
                          ${thisVideo.detail}
                        </p>  </span>
                    </div>
                    <div class="col-sm-12">_______________________________________________________________________________________________________________________________________________________</div><br>
                    <div class="col-sm-12">
                        <span class="layui-icon layui-icon-edit">评论</span>
                    </div>
                        <div class="col-sm-12" style="padding: 30px">
                            <form>
                                <div class="form-group">
                                    <div class="row">
                                        <input id="userid" hidden value="${normalUser.id}">
                                        <input id="vid" hidden value="${thisVideo.id}">
                                        <input id="fid" hidden value="${arctor.id}">
                                    <textarea  style="border: 1px #00bbee solid" name="" id="MyDiscuss" cols="100" rows="10"></textarea>
                                        <div class="col-sm-1"></div>
                                        <img src="${arctor.userpic}" style="width: 100px;height: 100px" class="rounded-circle">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <button type="button" id="addDiscussBtn" class="btn btn-lg btn-primary left-button" >发布评论</button>
                                </div>
                            </form>
                        </div>
                    <div class="col-sm-12">_______________________________________________________________________________________________________________________________________________________</div><br>
                    <div class="col-sm-12" style="text-align: center">
                        <span class="layui-icon layui-icon-dialogue" style="font-size: 25px">所有评论</span>
                        <br>
                        <div id="thisVideoDiscuss" class="col-md-12"></div>
                    </div>

                </div>
                </div>
                <div class="col-sm-2" style="height: auto">
                    <div class="col-sm-12" style="height: 100px"></div>
                    <div class="col-sm-12">
                        <a href="https://game.bilibili.com/fgo/2019spf-pc/" target="_blank"><img src="/assets/bgres/viewFF/lunbo2.png" alt="" width="100%" height="200px"></a>
                    </div><br>
                    <div class="col-sm-12" style="height: auto ;margin-bottom: 5px">
                    <span style="" class="layui-icon layui-icon-video">相关视频</span>
                    </div>
                    <div class="col-sm-12">
                        <c:forEach items="${randomVideo}" var="i">
                       <a class="goodicon" style="text-decoration-line: none" href="${pageContext.request.contextPath}/getthisVideo.do?id=${i.id}"><div class="row" style="height: 100px ;margin-bottom: 3px">
                            <img src="${i.vpic}" alt="" width="50%" style="height: auto">
                            <div class="col-sm-6"><span style="">${i.name}</span></div>
                       </div></a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    //收藏
    function collectThisVideo() {
        $("#PostThisCollections").click(function () {
            if ($("#ThisCollects").val()==null||$("#ThisCollects").val()=="") {
                $("#tishi").text("");
                $("#tishi").text("不能为空");
            }else{
                var formData = new FormData();
                formData.append("cid",$("#ThisCollects").val());
                formData.append(("vid"),$("#vid").val());
                $.ajax({
                    url:"${pageContext.request.contextPath}/AddCollections.do",
                    type:"POST",
                    data:formData,
                    processData:false,
                    contentType:false,
                    success:function (result) {
                        $("#star").text(result.count);
                        $("#star").removeAttr("class");
                        $("#star").removeAttr("data-toggle");
                        $("#star").removeAttr("data-target");
                        $("#star").attr("class","goodicon layui-icon layui-icon-rate-solid layui-bg-gray");
                        $("#star").attr("id","solidstar");
                        deleteThisCollections();
                        alert(result.MESSAGE);
                    },error:function () {
                        alert("收藏失败")
                    }
                })
            }
        })
    }
    //取消收藏
    function deleteThisCollections() {
       $("#solidstar").click(function () {
           var formData = new FormData();
           formData.append(("vid"),$("#vid").val());
           formData.append("userid",$("#userid").val());
           $.ajax({
               url:"${pageContext.request.contextPath}/deleteThisCollections.do",
               type:"POST",
               data:formData,
               processData:false,
               contentType:false,
               success:function (result) {
                   $("#solidstar").text(result.count);
                   $("#solidstar").removeAttr("class");
                   $("#solidstar").attr("class","goodicon layui-icon layui-icon-rate");
                   $("#solidstar").attr("data-toggle","modal");
                   $("#solidstar").attr("data-target","#addThisVideoToCollects");
                   $("#solidstar").unbind("click");
                   $("#solidstar").attr("id","star");
                   alert(result.MESSAGE);
               },error:function () {
                   alert("取消失败");
               }
           })
       })
    }
//关注
    function AddFriends() {
        $("#addfriend").click(function () {
          var FriendInfo = new FormData();
          FriendInfo.append("userid",$("#userid").val());
            FriendInfo.append("friendid",$("#fid").val());
            $.ajax({
                url:"${pageContext.request.contextPath}/AddFriends.do",
                type:"POST",
                data:FriendInfo,
                processData:false,
                contentType:false,
                success:function (result) {
                    $("#addfriend").text('已关注');
                    $("#addfriend").removeAttr("class");
                    $("#addfriend").attr("class","button layui-icon layui-icon-add-1 layui-bg-gray");
                    $("#addfriend").unbind("click");
                    $("#addfriend").attr("id","deleteFriends");
                    deleteFriends();
                    alert(result.MESSAGE);
                },error:function () {
                    alert("关注失败！")
                }
            })
        })
    }
    //取消关注
    function deleteFriends() {
        $("#deleteFriends").click(function () {
            var FriendInfo = new FormData();
            FriendInfo.append("userid",$("#userid").val());
            FriendInfo.append("friendid",$("#fid").val());
            $.ajax({
                url:"${pageContext.request.contextPath}/DeleteFriends.do",
                type:"POST",
                data:FriendInfo,
                processData:false,
                contentType:false,
                success:function (result) {
                    $("#deleteFriends").text('关注');
                    $("#deleteFriends").removeAttr("class");
                    $("#deleteFriends").attr("class","button layui-icon layui-icon-add-1 layui-bg-blue");
                    $("#deleteFriends").unbind("click");
                    $("#deleteFriends").attr("id","addfriend");
                    AddFriends();
                    alert(result.MESSAGE)
                },error:function () {
                    alert("取消关注失败！");
                }
            })
        })
    }
    function searchVideo() {
            $("#searchVideoBtn").click(function () {
                if ($("#SearchName").val()==null||$("#SearchName").val()==""){
                    alert("不能为空");
                }else{
                window.open("${pageContext.request.contextPath}/searchVideo.do?name="+$("#SearchName").val());
                }
            })

    }
    function addDiscuss(){
        if ($("#MyDiscuss").val()!=null||$("#MyDiscuss")!="") {
            $("#addDiscussBtn").click(function () {
                var formData = new FormData();
                formData.append("context", $("#MyDiscuss").val());
                formData.append("userid",$("#userid").val());
                formData.append(("vid"),$("#vid").val());
                $.ajax({
                    url:"${pageContext.request.contextPath}/AddDiscuss.do",
                    type:"POST",
                    data:formData,
                    processData:false,
                    contentType:false,
                    success:function (result) {
                    $("#MyDiscuss").val(null);
                    alert(result.MESSAGE);
                        getDiscusses();
                    },error:function () {
                    alert("评论失败");
                    }
                })
            })
        }else {
            alert("评论框空的");
        }
    }
    function getDiscusses(){
        $("#thisVideoDiscuss").empty();
        var videoData = new FormData();
        videoData.append("vid",$("#vid").val());
        $.ajax({
            url:"${pageContext.request.contextPath}/getDiscussess.do",
            type:"POST",
            data:videoData,
            processData:false,
            contentType:false,
            success:function (result) {
                if(result==null){

                }else{
                    $.each(result.DiscussData,function (index,item) {

                        $.each(item,function (i,it) {
                            if (i==0){
                                $.each(item,function (j,i_t) {
                                    if(j==1){
                                        var D_div=$('<div class="row col-sm-12"></div>');
                                        var pname=$('<p></p>').append(i_t.name);
                                        var D_div_div1=$('<div class="col-sm-9" style="height: auto"></div>').append('<p></p>').append(it.context);
                                        var D_div_div2=$('<div class="col-sm-3"></div>');
                                        var D_div_div2_img=$('<img src="" alt="" style="width: 50px;height: 50px" class="rounded-circle">');
                                        var D_div_div3=$('<p>_______________________________________________________________________________________________________________________________________________________</p>');
                                        var re=$('<br>');
                                        //查看发布人信息
                                        D_div_div2_img.attr("src",i_t.userpic)
                                        D_div_div2_img.click(function () {

                                        })
                                        D_div_div2_img.appendTo(D_div_div2);
                                        D_div_div2.append(pname);
                                        D_div.append(D_div_div1);
                                        D_div.append(D_div_div2);
                                        D_div.append(D_div_div3);
                                        D_div.append(re);

                                        $("#thisVideoDiscuss").append(D_div);
                                    }
                                })

                            }
                        })

                    })
                }
            },error:function () {
                
            }

        })
    }
    $(document).ready(function () {
        //关注状态
        var FriendStatus = new FormData();
        FriendStatus.append("userid",$("#userid").val());
        FriendStatus.append("friendid",$("#fid").val());
        $.ajax({
            url:"${pageContext.request.contextPath}/FriendStatus.do",
            type:"POST",
            data:FriendStatus,
            processData:false,
            contentType:false,
            success:function (result) {
                if (result.status==1){
                    $("#addfriend").text('已关注');
                    $("#addfriend").removeAttr("class");
                    $("#addfriend").attr("class","button layui-icon layui-icon-add-1 layui-bg-gray");
                    $("#addfriend").unbind("click");
                    $("#addfriend").attr("id","deleteFriends");
                    deleteFriends();
                }
            }
        })
        //收藏状态
        var CollectionStatus = new FormData();
        CollectionStatus.append(("vid"),$("#vid").val());
        CollectionStatus.append("userid",$("#userid").val());
        $.ajax({
            url:"${pageContext.request.contextPath}/CollectionStatus.do",
            type:"POST",
            data:CollectionStatus,
            processData:false,
            contentType:false,
            success:function (result) {
                if (result.status==1){
                    $("#star").text(result.num)
                    $("#star").removeAttr("class");
                    $("#star").attr("class","goodicon layui-icon layui-icon-rate-solid layui-bg-gray");
                    $("#star").removeAttr("data-toggle");
                    $("#star").removeAttr("data-target");
                    $("#star").attr("id","solidstar");
                }
            }
        })
        addDiscuss();
        getDiscusses();
        searchVideo();
        AddFriends();
        deleteFriends();
        collectThisVideo();
        deleteThisCollections();
    })
</script>
<script src="/assets/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>