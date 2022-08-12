<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<html>
<head>
    <title>알림창</title>
</head>
<body>
		<script>
		alert('가입이 완료되었습니다')
		location.href = "${root}member/login.do"
		</script>
</body>
</html>