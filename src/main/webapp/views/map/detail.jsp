<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3> Map Center </h3>
        <img src="/uimg/${gmarker.img}">
        <h3>${gmarker.id}</h3>
        <h3><a href="${gmarker.target}"> ${gmarker.title} </a> </h3>
        <div class="row content">
            <div class="col-sm-6 test-left">
                <h3> Marker Desc </h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ITEM</th>
                        <th>PRICE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${mlist}">
                        <tr>
                            <td><img src="/uimg/${m.imgname}"></td>
                            <td>${m.item}</td>
                            <td>${m.price}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>