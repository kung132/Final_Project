<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
        #navbar-logo:hover {
            cursor: pointer;
        }

        #navbar-logo>img {
            padding-top: 0px;
            padding-bottom: 18px;
            width: 110px;
            height: 100px;
        }
    </style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
	
	<div class="w3-content w3-container" style="margin-top: 300px; margin-bottom: 230px; width: 30%;">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large">
				<h3>아이디 찾기 검색결과</h3> <br>
			</div>
			<ul>	
  				<c:forEach items="${member}" var="member">
		  		  	<h3>&nbsp;&nbsp;  "${member.memberName}" 회원님의  <br>
		  		  	&nbsp;&nbsp; 아이디는 <strong> ${member.memberId} </strong>입니다.</h3>
  				</c:forEach>
  			</ul>
  			<br>
				<p class="w3-center">
					<button type="button" onclick="loginform();" id=loginBtn class="w3-button w3-block w3-ripple w3-margin-top w3-round" style="background-color:rgb(170, 143, 211); color: white;">로그인</button>
				</p>
			</div>
		</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	
	<script>
	function loginform() { // 로그인 버튼 클릭 시, 로그인 화면으로 이동
  		location.href = "<%= contextPath %>/member/login.do";
  	} 
	</script>
</body>
</html>