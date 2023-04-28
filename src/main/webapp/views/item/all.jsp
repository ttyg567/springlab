<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #item_img{
        width:80px;
    }
</style>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6 test-left">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>PRICE</th>
                        <th>NAME</th>
                        <th>REGDATE</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="obj" items="${allitem}">
                            <tr>
                                <td><img id="item_img" src="/img/${obj.imgname}"></td>
                                <td>${obj.id}</td>
                                <td>${obj.name}</td>
                                <td><fmt:formatNumber value="${obj.price}" type="currency" /></td>
                                <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd:hhmmss" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>