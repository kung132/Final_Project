<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #content {
        height: 600px;
    }
    #content>div {
        float: left;
    }
    #exit {
        width: 70%;
        margin-left: 50px;
        margin-top: 30px;
    }
</style>
</head>
<body>
<div id="header"></div>
<div id="content">
       <%@ include file="../include/myPageSidebar.jsp" %>
        <div id="exit">
            <h2>계정 탈퇴</h2>
            <hr>
            <h4 style="font-color:gray">탈퇴전 확인해 주세요</h4>
            <div style="width:750px; height:200px; background-color: gray; padding-left:20px; padding-top:10px;">
            <span style="font-size: 20px; font-weight: 500">1. 탈퇴시 모든 개인정보가 삭제되며, 구매하신 캐시는 소멸되며 환불되지 않습니다.</span><br>
            <span style="font-size: 20px; font-weight: 500">2. 재능판다 이용에 불편이 있어 탈퇴를 고민하신다면, support@panda.com 또는 1588-5678로 문의 바랍니다.</span><br>
            <span style="font-size: 20px; font-weight: 500">3. 위 내용을 모두 확인하였고, 탈퇴 완료 시 내용에 동의합니다.</span><br>
            </div>
            <br>
            <h4>비밀번호</h4>
            <form action="exit.do" method="post">
                <input type="password" class="form-control" id="memberPwdExit" name="memberPwdExit" style="width: 40%;">
                <br><br>
                <div align="center">
                    <button class="btn btn-secondary" onclick="back()">취소</button>
                    <button class="btn btn-danger" type="submit">탈퇴 완료</button>
                </div>
            </form>
        </div>
       
    </div>
    

<%@ include file="../include/footer.jsp" %>
</body>

<script>
	function back() {
		location.href = history.back();
	}
</script>
</html>