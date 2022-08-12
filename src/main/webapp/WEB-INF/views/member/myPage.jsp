<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#content {
        height: 1000px;
    }
    
    #update {
        width: 70%;
        margin-left: 50px;
        margin-top: 30px;
    }
    
    #update li {
    	cursor : pointer;
    }
</style>
</head>

<body>
	
	<div id="header"></div>
	<div id="content">
            <%@ include file="../include/myPageSidebar.jsp" %>
            
            <div id="update">
                <h2>계정 설정</h2>
                <ul class="list-group list-group-flush">
				  <li class="list-group-item">
				  	<div style="color:gray">닉네임</div>
				  	<div>${ loginUser.memberNick }</div>
				  </li>
				  <li class="list-group-item" onclick="changeEmail();">
				  	<div style="color:gray">이메일</div>
				  	<div>${ loginUser.memberEmail }</div>
				  </li>
				  <li class="list-group-item" onclick="changePass();">
				  	<div style="color:gray">비밀번호</div>
				  	<div>******</div>
				  </li>
				  <li class="list-group-item" onclick="changePhone();">
				  	<div style="color:gray">휴대폰번호</div>
				  	<div>${ loginUser.memberPhone }</div>
				  </li>
				</ul>
        </div>
    </div>
	<%@ include file="../include/footer.jsp" %>
</body>

<script>
	function changeEmail() {
		location.href = "<%= contextPath %>/member/changeEmail.do";
	}
	function changePass() {
		location.href = "<%= contextPath %>/member/changePass.do";
	}
	function changePhone() {
		location.href = "<%= contextPath %>/member/changePhone.do";
	}
</script>
</html>