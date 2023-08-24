<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <h2>아이디 찾기 결과</h2>
    <c:if test="${notFound}">
        <p>일치하는 아이디가 없습니다.</p>
    </c:if>
    <c:if test="${!notFound}">
        <p>일치하는 아이디 목록:</p>
        <ul>
            <c:forEach items="${foundId}" var="id">
                <li>${id}</li>
            </c:forEach>
        </ul>
    </c:if>
</body>

</html>