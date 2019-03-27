<%--
  Created by IntelliJ IDEA.
  User: emibia
  Date: 2018/12/17
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 150%">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">添加收藏夹</h5>
                <button id="close1" type="button" class="close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <form id="addCollectsForm">
                    <div class="form-group" id="userIdHidden">
                    </div>
                    <div class="form-group">
                        <label for="exampleInput">命名</label>
                        <input type="text" name="name" class="form-control" id="exampleInput" >
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id="close2" class="btn btn-secondary" type="submit" data-dismiss="modal">提交</button>
                <button id="close3" close1type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script src="/assets/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
       getNormalUser();
    })
    function getNormalUser() {
      $.ajax({
          url:"${pageContext.request.contextPath}/getNormalUser.do",
          type:"GET",
          success:function (result) {
                  var userid = result.NUser.id;
                  var hiddenEle=$("<input />").attr("type","input").attr("value",userid).attr("class","form-control").attr("name","userid");
              hiddenEle.appendTo("#userIdHidden");
          }
      })
    }
    $("#close2").click(function () {
        alert("qdqdqdq");
        console.log("dwadwdad");
            $.ajax({
                url:"${pageContext.request.contextPath}/addCollects.do",
                type:"POST",
                data:$('#addCollectsForm').serialize(),
                success:function (result) {
                    $("#exampleModal").modal('hide');
                    alert("添加成功");
                },
                error:function () {
                    alert("操作失败")
                }
            })


    })
</script> 