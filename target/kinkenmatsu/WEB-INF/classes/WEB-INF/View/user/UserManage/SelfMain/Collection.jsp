<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2019/2/11
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script  src="/assets/bootstrap/js/scripts.js"></script>
<script	src="/assets/layui/layui.js"></script>
<link rel="stylesheet" href="/assets/layui/css/layui.css">
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
</style>
<div class="col-sm-12" style="height: auto;background: #f0f0f0;padding-top: 10px;padding-left: 0px;padding-right: 0px;margin-left:0px;margin-right: 0px;border-radius: 3px">
    <div class="row" style="background: white;border-radius: 6px">

      <div class="col-md-2" style="height: auto;">

      <div class="col-md-12" style="height: auto;">


          <div class="row col-md-12" style="background: white;padding-right: 0px;padding-left: 0px">
             <div><span class="layui-icon layui-icon-video">视频收藏</span></div>
              <div class="col-md-1"></div>
             <div><buttom id="AddCollectsBtn" class="layui-icon layui-icon-add-1 Arhover" style="border-radius: 50%;"></buttom></div>
          </div><br>


             <div id="CollectsBox" class="col-md-12" style="background: white;height: auto;padding-right: 0px;padding-left: 0px">
               <ul>
              <c:forEach begin="1" end="6">
                  <li class="showcold" style="width: 100%;height: 50px;background: white;padding-right: 0px;padding-left: 0px">
                      <div class="row col-md-12 showcold" style="background: white;height: 50px;padding-right: 0px;padding-left: 0px">
                     <div><span class="layui-icon layui-icon-file" style="font-size: 15px;line-height: 50px;color: black;background: white"></span></div>
                          <div><a class="showcold" href="#" style="text-decoration-line: none;font-size: 15px;font-family: Calibri;color: black;line-height: 50px">默认收藏夹</a></div>
                          <div class="col-md-1"></div>
                          <div class="row">
                              <div><a class="layui-icon layui-icon-edit Arhover" id="updateCollectsDialog" href="#" style="font-size:15px;text-decoration-line: none;line-height: 50px;position: relative;left: 5px"></a></div>
                              <div><a class="layui-icon layui-icon-delete Arhover" id="deleteCollects" href="#" style="font-size:15px;text-decoration-line: none;line-height: 50px;position: relative;left: 9px"></a></div>
                          </div>
                      </div>
                  </li>
              </c:forEach>
               </ul>
                              </div>
      </div>

      </div>
<div id="ShowCollections" class="col-md-10" style="background: white;border: 1px white solid;border-left-color: gray;border-top-right-radius:6px;border-bottom-right-radius: 6px ">
    <div class="col-md-12" style="height: 80px;background: white">
        <div id="this_Cname" class="col-md-12" style="height: 50px"><span style="font-size: 20px;line-height: 50px">默认收藏夹</span></div>
        <div id="this_Cnum" class="col-md-12" style="height: 30px"><span style="font-size: 20px;line-height: 30px">39</span>个视频</div>
    </div>
    <div class="col-md-12">
        <div class="col-md-12" style="height: 1px;background: grey"></div>
    </div><br>
    <div class="col-md-12" style="height: auto;background: white">
        <div class="col-md-12">
            <div class="col-md-12">
     <div id="ShowCollectionsDiv" class="row" style="">

         <c:forEach begin="1" end="7" >

             <div class="card" style="width: 160px;height: 160px;margin: 10px;border: 0px solid">
                 <a class="VSmallBox" href="#" target="_blank" style="text-decoration: none;" >
                     <div style="height: 96px"><img style="border-radius: 6px;height:100%" class="card-img-top w-100 h-100 img-fluid" src="/assets/bgres/viewFF/lunbo3.png" alt="Card image cap"></div>
                     <div id="CvideoDetail" class="card-body" style="height: 34px">
                         <p>大热天的一天有大幅度头发</p>
                     </div>
                 </a>
                 <div class="row" style="position: relative;left: 20px">
                     <div style="line-height:30px;font-size: 10px">2018-12-12</div>&nbsp&nbsp
                     <div><a href="#" class="layui-icon layui-icon-delete Arhover" style="text-decoration-line: none;line-height: 30px">取消收藏</a></div>
                 </div>
             </div>

         </c:forEach>

     </div>
            </div>
        </div>
    </div>


</div>

    </div>
      </div>