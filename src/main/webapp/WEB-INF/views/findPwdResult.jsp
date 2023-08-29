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
    <h2>Find Password Result</h2>
    <c:if test="${notFound}">
        <p>Password not found for the provided ID and email.</p>
    </c:if>
    <c:if test="${notFound != true}">
        <p>Your password is: ${foundPwd}</p>
    </c:if>
    <a href="/spam/member/i_login">로그인 하러 가기</a>
</body>

</html>