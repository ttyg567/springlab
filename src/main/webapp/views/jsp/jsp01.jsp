<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    $(function(){
        jsp01.init(${num});
    })

    <%--let jsp01 = {--%>
    <%--    data:0,--%>
    <%--    init:function(){--%>
    <%--        //this.data = ${num};//자바에서 정의했던 변수들을 js에서도 쓸수 있다.--%>
    <%--        this.data = '<c:out value="${num}"/>'--%>
    <%--        this.display();--%>
    <%--    },--%>
    <%--    display:function(){--%>
    <%--        $('#jsp01').text(this.data+'');--%>
    <%--    }--%>
    <%--};--%>
    <%--$(function(){--%>
    <%--    jsp01.init();--%>
    <%--});--%>
</script>
<%--jstl을 쓰겠습니다. 그런데 c 로 쓰겠습니다.--%>
<div class="col-sm-8 text-left">
    <div class="container">
        <h3 id="jsp01">jsp01 add page</h3>
        <h3><fmt:parseNumber integerOnly="true" type="number" value="${num}" /></h3>
        <h3><fmt:formatNumber value="${num}" type="currency" /></h3>
        <h3><fmt:formatNumber value="${num}" type="number" pattern="###.###$" /></h3>
        <h3>${cust}</h3>
        <h3>${cust.id}</h3>
        <h3>${cust.name}</h3>
        <h3><c:out value="${cust.id}"/></h3>
        <h3><c:out value="${cust.name}"/></h3>
        <h3><fmt:formatDate  value="${cdate}" pattern="yyyy-MM-dd:hh:mm:ss"/></h3>
        <h3>${num * 2 + 1230897}</h3>
        <c:set var="mynum" value="${num*3}"/>
        <h3><c:out value="${mynum}"/></h3>
<%--        cust클래스에 getter가 있어야 .으로 사용이 가능
        c:out 으로 출력을 하는 이유는 사용자가 입력한 부분을 보안적으로 막기 위해서--%>
    </div>
</div>