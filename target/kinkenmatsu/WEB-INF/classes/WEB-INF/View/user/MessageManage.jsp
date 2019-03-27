<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/3/14
  Time: 22:26
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
<title>私信</title>
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
<div class="layui-body" style="overflow-y: scroll;width: auto;height: auto;left: 0px;">
<div  class="container-fluid"  style="height: auto">
    <div class="container" style="width: auto;height: auto">
        <div class="row"style="height: auto">
            <div class="col-sm-2" style="height: auto">

            </div>
            <div class="col-sm-8" style="height: auto;width: 100%;top: 100px;">
                <div id="accordion" >
                </div>
            </div>
            <div class="col-sm-2" style="height: auto">

            </div>
        </div>
    </div>
</div>
</div>
<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    function getMessage(){
        $("#accordion").empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/getMyMassage.do",
            type:"GET",
            success:function (data) {
                var num=0;
                $.each(data.MyMessages,function (index,item) {
                    var card=$('<div class="card"></div>');
                    var card_div=$('<div class="card-header"></div>');
                    card_div.attr("id","heading"+num);
                    var h5=$('<h5 class="mb-0"></h5>');
                    var button=$('<button class="btn btn-link" data-toggle="collapse" aria-expanded="true" aria-controls="collapseOne"></button>');
                    $.each(data.SendUsers,function (i,it) {
                        if (item.userid==it.id) {
                            button.text(null);
                            button.text(it.name);
                        }
                    })
                    button.attr("data-target","#collapse"+num);
                    button.appendTo(h5);
                    var h5_span=$('<span></span>');
                    var thisDate = new Date(parseInt(item.date,10));
                    date_value=thisDate.getFullYear() + '-' + (thisDate.getMonth() + 1) + '-' + thisDate.getDate() + ' ' + thisDate.getHours() + ':' + thisDate.getMinutes() + ':' + thisDate.getSeconds();
                    h5_span.text(date_value);
                    h5_span.appendTo(h5);
                    h5.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
                    var req_a=$('<a class="Arhover" href="#" data-toggle="modal" data-target="#sendMessageModal" style="text-decoration-line: none;line-height: 30px" >@回复</a>');
                    req_a.click(function () {
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
                            MessageData.append("userid",item.friendid);
                            MessageData.append("friendid",item.userid);
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
                                        getMessage();
                                        alert(result.MESSAGE);
                                    }
                                })
                            }
                        })
                    })
                    req_a.appendTo(h5);
                    var card_collapse=$('<div class="collapse show" aria-labelledby="headingOne" data-parent="#accordion"></div>');
                    card_collapse.attr("id","collapse"+num);
                    var card_body=$('<div class="card-body"></div>');
                    card_body.text(item.context);
                    card_body.appendTo(card_collapse);
                    h5.appendTo(card_div);
                    card.append(card_div);
                    card.append(card_collapse);
                    $("#accordion").append(card);
                    num++;
                })

            },error:function () {
                alert("获取失败！");
            }
        })
    }
$(document).ready(function () {
    getMessage()
})
</script>
<script src="/assets/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>