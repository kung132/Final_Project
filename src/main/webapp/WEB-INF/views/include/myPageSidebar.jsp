<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	
    #content {
    	height:1000px;
    }
    #content>div {
        float: left;
    }

    #menu {
        width: 15%;
        height: 420px;
        background-color: rgb(170, 143, 211);
        margin-left: 30px;
        margin-top: 30px;
    }

    #menu>ul {
        list-style-type: none;
    }

    #menu li {
        margin: 10px;
    }

    #menu li:hover {
        background-color: hotpink;
        cursor : pointer;
    }

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
	<div id="menu">
                <ul class="list-group">
                    <li class="list-group-item" onclick="myPage();">개인정보수정</li>
                    <li class="list-group-item" onclick="tHistory();">거래내역</li>
                    <li class="list-group-item" onclick="zzimList();">관심목록</li>
                    <li class="list-group-item" onclick="teacherAdd();">선생신청</li>
                    <li class="list-group-item" onclick="myProfile();">내 프로필</li>
                    <li class="list-group-item" data-toggle="modal" data-target="#myModal">계정탈퇴</li>
                </ul>
            </div>
            
    <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">정말로 탈퇴 하시겠습니까?</h4>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
         	계정 탈퇴 시 모든 개인정보가 삭제되며
		구매하신 캐시는 환불되지 않아요
        </div>
  
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-danger" onclick="exit()">탈퇴</button>
        </div>
  
      </div>
    </div>
  </div>
</body>
<script>
	function myPage() {
		location.href = "<%= contextPath %>/member/mypage.do";
	}
	function tHistory() {
		location.href = "<%= contextPath %>/member/thistory.do?currentPage=1";
	}
	function zzimList() {
		location.href = "<%= contextPath %>/member/zzimlist.do?currentPage=1";
	}
	function teacherAdd() {
		location.href = "<%= contextPath %>/member/teacherAdd.do";
	}
	function myProfile() {
		location.href = "<%= contextPath %>/member/myProfile.do";
	}
	function exit() {
		location.href = "<%= contextPath %>/member/exit.do";
	}
</script>
</html>