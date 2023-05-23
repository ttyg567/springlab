<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>Map center</h3>
        <img src ="/img/${gmarker.img}">
        <h3>${gmarker.id}</h3>
        <h3>${gmarker.title}</h3>
        <h3><a href = "${gmarker.target}">${gmarker.title}</a></h3>
        <div class = "row-content">
            <div class="col-sm-6 text-left">
                <h3>markerdesc page</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>img</th>
                        <th>item</th>
                        <th>price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${mlist}">
                        <tr>
                            <td><img src = "/img/${m.imgname}"></td>
                            <td>${m.item}</td>
                            <td>${m.price}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div><!-- row content end-->
    </div>
</div>