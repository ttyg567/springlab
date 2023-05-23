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
            <div class="col-sm-6 text-left">
                <h3>Item All page</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>img</th>
                        <th>id</th>
                        <th>name</th>
                        <th>price</th>
                        <th>regdate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${allitem}">
                        <tr>
                            <td><img src = "/img/${obj.imgname}" class = "small_img"></td>
                            <td>${obj.id}</td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" pattern = "###,###원" /></td>
                            <td><fmt:formatDate  value="${obj.rdate}" pattern="yyyy-MM-dd:HH:mm:ss"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div><!-- row content end-->
    </div>
</div>