<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let item_get = {
        init: function(){
            $('#cart_btn').click(function(){
                let cust_id = '${logincust.id}';
                let item_id = ${gitem.id};
                let cnt = $('#cnt').val();
                $.ajax({
                    url:'/addcart',
                    data:{cust_id:cust_id, item_id:item_id, cnt:cnt},
                    success:function(){
                        $('#myModal').modal();
                    }
                });

                // $('#cart_form').attr({
                //     method:'get',
                //     action:'/item/addcart'
                // });
                // $('#cart_form').submit();
            })
        }
    }
    $(function(){
        item_get.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>item Info</h3>
        <img src = "/img/${gitem.imgname}" style = "width : 300px; height : 300px">
        <h4>${gitem.id}</h4>
        <h4>${gitem.name}</h4>
        <h4>${gitem.price}</h4>
        <c:if test="${logincust != null}">
            <form id = "cart_form" class="form-horizontal">
                <input type = "hidden" name = "cust_id" value = "${logincust.id}">
                <input type = "hidden" name = "item_id" value = "${gitem.id}">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="cnt">Count:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="cnt" placeholder="Enter count" name="cnt">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button type = "button" id = "cart_btn" class="btn btn-warning">Cart</button>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
            </div>
            <div class="modal-body">
                <a href="/item/allcart?id=${logincust.id}" class="btn btn-info" role="button">장바구니로 이동</a>
                <a href="/item/all" class="btn btn-info" role="button">계속 쇼핑하기</a>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
