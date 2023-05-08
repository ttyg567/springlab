<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>jsp02 add page</h3>
<%--        JSTL if       --%>
        <c:if test="${rcust!=null}">
            <h4>${rcust.id}</h4>
            <c:if test="${rcust.id=='id01'}">
                <h4>콜센터 직원</h4>
            </c:if>
        </c:if>
<%--        JSTL if else      --%>
        <c:choose>
            <c:when test="${num==3}"><h3>num 333</h3></c:when>
            <c:when test="${num==2}"><h3>num 222</h3></c:when>
            <c:otherwise><h3>num 111</h3></c:otherwise>
        </c:choose>
        <h3>end page</h3>
    </div>
</div>