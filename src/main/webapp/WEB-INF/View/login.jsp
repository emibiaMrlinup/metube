<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/11/11
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Metube 后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script	src="${pageContext.request.contextPath}/assets/layui/layui.js"></script>
    <link rel="stylesheet" href="/assets/layui/css/layui.css">
    <script type="text/JavaScript">
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Metube登陆页面</div>
    </div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>Metube登陆选项</legend>
</fieldset>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">Metube主站</li>
        <li>后台管理</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form action="${pageContext.request.contextPath}/Userlogin.do" method="post">
                <div class="layui-inline">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username"  class="layui-input">
                    </div>
                    <p style="color: red;font-size: 14px;width: 100px;height: 20px">${error2.toString()}</p>
                </div>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password"  class="layui-input">
                    </div>
                    <p style="color: red ;font-size: 14px;width: 100px;height: 20px">${error2.toString()}</p>
                </div>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <input class="layui-btn layui-btn-fluid" type="submit" value="登陆">
                    </div>
                    <div class="layui-input-inline">
                        <a href="${pageContext.request.contextPath}/toReg.do">注册</a>
                    </div><br>
                    <p style="position:relative;color: red;font-size: 14px;left: 100px;width: 100%;height: 20px" >${error1.toString()}</p>
                </div>
            </form>
        </div>
        <div class="layui-tab-item">
            <form action="${pageContext.request.contextPath}/Adminlogin.do" method="post">
                <div class="layui-inline">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username"  class="layui-input">
                    </div>
                    <p style="color: red;font-size: 14px;width: auto;height: 20px">${error2.toString()}</p>
                </div>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password"  class="layui-input">
                    </div>
                    <p style="color: red ;font-size: 14px;width: auto;height: 20px">${error2.toString()}</p>
                </div>
                <br>
                <div class="layui-inline">
                    <label class="layui-form-label"></label>
                    <div class="layui-input-inline">
                        <input class="layui-btn layui-btn-fluid" type="submit" value="登陆">
                    </div><br>
                    <p style="position:relative;color: red;font-size: 14px;left: 100px;width:100%;height: 20px" >${error1.toString()}</p>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/assets/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        //var active = {
        //     tabAdd: function(){
        //         //新增一个Tab项
        //         element.tabAdd('demo', {
        //             title: '新选项'+ (Math.random()*1000|0) //用于演示
        //             ,content: '内容'+ (Math.random()*1000|0)
        //             ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
        //         })
        //     }
        //     ,tabDelete: function(othis){
        //         //删除指定Tab项
        //         element.tabDelete('demo', '44');
        //
        //
        //         othis.addClass('layui-btn-disabled');
        //     }
        //     ,tabChange: function(){
        //         //切换到指定Tab项
        //         element.tabChange('demo', '22'); //切换到：用户管理
        //     }
        // };
        //
        // $('.site-demo-active').on('click', function(){
        //     var othis = $(this), type = othis.data('type');
        //     active[type] ? active[type].call(this, othis) : '';
        // });
        //
        // //Hash地址的定位
        // var layid = location.hash.replace(/^#test=/, '');
        // element.tabChange('test', layid);
        //
        // element.on('tab(test)', function(elem){
        //     location.hash = 'test='+ $(this).attr('lay-id');
        // });

    });
</script>
</div>
</body>
</html>
