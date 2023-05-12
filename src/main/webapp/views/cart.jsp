<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .small_img{
        width : 50px;
        height : 50px;
    }
</style>
<div class="col-sm-8 text-left">
    <div class="container">
        <div class = "row-content">
            <div class="col-sm-8 text-left">
                <h3>CART page</h3>
                <c:set var="total" value="0"/>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>img</th>
                        <th>Item_id</th>
                        <th>name</th>
                        <th>price</th>
                        <th>count</th>
                        <th>total_price</th>
                        <th>regdate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${allcart}">
                        <tr>
                            <td><img src = "/img/${obj.item_imgname}" class = "small_img"></td>
                            <td>${obj.item_id}</td>
                            <td>${obj.item_name}</td>
                            <td><fmt:formatNumber value="${obj.item_price}" pattern = "###,###원" /></td>
                            <td>${obj.cnt}</td>
                            <td><fmt:formatNumber value= "${obj.cnt * obj.item_price}" pattern = "###,###원"/></td>
                            <td><fmt:formatDate  value="${obj.rdate}" pattern="yyyy-MM-dd:HH:mm:ss"/></td>
                            <td><a href="/delcart?id=${obj.id}" class="btn btn-info" role="button">DELETE</a></td>
                        </tr>
                        <c:set var="total" value="${total + (obj.cnt * obj.item_price)}"/>
                    </c:forEach>
                    </tbody>
                </table>
                <h4><fmt:formatNumber value="${total}" pattern="###,###원" /></h4>
            </div>
        </div><!-- row content end-->
    </div>
</div>