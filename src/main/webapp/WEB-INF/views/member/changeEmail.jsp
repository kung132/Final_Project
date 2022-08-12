<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div id="includedContent"></div>
	<div id="content">
            <%@ include file="../include/myPageSidebar.jsp" %>
            <div id="update">
            <h2>이메일 수정</h2>
            <hr>
            <h3 style="color:gray">이메일</h3>
            <br>
            <form action="changeEmail.do" method="post">
            <div><input type="text" name="memberEmail" class="form-control" style="width:50%" required value="${ loginUser.memberEmail }"></div>
            <br><br>
            <div align="center">
                <button class="btn btn-secondary">취소</button>
                <button class="btn btn-primary" type="submit" style="background-color:rgb(170, 143, 211); border: 1px soild rgb(170, 143, 211);">수정 완료</button>
            </div>
            </form>
       </div>
    </div>
	<%@ include file="../include/footer.jsp" %>
</body>

</html>