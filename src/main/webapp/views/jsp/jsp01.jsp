<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    $(function(){
        jsp01.init(${num});
    })
</script>

<div class="col-sm-8 text-left">
    <h3> JSP JSP01 Page</h3>
    <h3 id="jsp01"> JSP01 </h3>
    <!--숫자 출력-->

    <h3><fmt:parseNumber value="${num}" integerOnly="true" type="number"/></h3>
    <h3><fmt:formatNumber value="${num}" type="currency" /></h3>
    <h3><fmt:formatNumber value="${num}" type="number" pattern="###.###$"/></h3>
    <!--날짜 출력-->
    <h3>${cdate}</h3>
    <h3><fmt:formatDate  value="${cdate}" pattern="yyyy-MM-dd:hhmmss" /></h3>
    <!-- 가능하면 c:~ 방식으로 출력-->
    <!-- 보안 때문에 c:~ 이렇게 해서 쓰는게 낫다 -->
    <h3>${cust.id}</h3>
    <h3>${cust.name}</h3>
    <h3><c:out value="${cust.name}"/></h3>
    <h3><c:out value="${cust.id}"/></h3>
    <!--연산도 가능-->
    <h3>${num*2}</h3>
    <!-- 화면에 출력되진 않지만  html 파일에서 변수로 선언해서 사용 가능-->
    <c:set var="mynum" value="${num * 3}"/>
    <h5><c:out value="${mynum}"/></h5>
</div>

