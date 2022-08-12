<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/resources/css/open-iconic-bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/animate.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.default.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/magnific-popup.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/aos.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/ionicons.min.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/flaticon.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/icomoon.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/ngpStyle.css' />">
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
	<%@ include file="/WEB-INF/views/admin/FAQ.jsp" %>
	<c:if test="${ !empty alertMsg }"> <!-- 띄울 메세지가 있다면 -->
		<script>
			var msg = "${ alertMsg }"; // "메세지 내용"
			alert(msg);
		</script>
		
		<!-- 일회성 알람이므로 지우기 -->
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
  <nav class="navbar navbar-expand-lg  ftco_navbar ftco-navbar-light" id="ftco-navbar" style="top: 0; background-color:rgb(206, 186, 239) !important;" >
		<div class="container">
			<div class="collapse navbar-collapse" id="ftco-nav">
				<div id="navbar-logo" onclick="mainPage();">
					<img src="../resources/images/logo.png" class="logo">
				</div>
				<div class="block-17 my-4" style="width: 30%; margin-left: 10px;">
					<form action="${ pageContext.request.contextPath }/board/categoryBoard.do" method="get" class="d-block d-flex" style="width: 100%;">
					<input type="hidden" name="currentPage" value="1">					
					<div class="fields d-block d-flex">
							<div class="select-wrap one-third" style="width: 100%;">
								<div class="icon"><span class="ion-ios-arrow-down"></span></div>
								<select name="mainCategory" id="mainCategory" class="form-control">
									<option value="none">카테고리 검색</option>
									<option value="외국어">외국어</option>
									<option value="악기">악기</option>
									<option value="스포츠">스포츠</option>
									<option value="취미">취미</option>
									<option value="시험/자격증">시험/자격증</option>
									<option value="컨설팅">컨설팅</option>
								</select>
							</div>
						</div>
						<button type="submit" onclick="return checkNone();" class="search-submit btn btn-primary">검색</button>
					</form>
				</div>
				
				<ul class="navbar-nav ml-auto" style="margin-left : 150px;">
					<c:choose>
					<c:when test="${loginUser != null}">
					
					<li class="nav-item cta" id="chat"><a href="${ pageContext.request.contextPath }/chat/box.me" class="nav-link" style="background-color:rgb(170, 143, 211);"><i
											class="fas fa-comment"></i>채팅<span id="unread" class ="headercount" style = "color: white;"></span></a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item cta" id="chat"><a class="nav-link" style="background-color:rgb(170, 143, 211);"><span><i
											class="fas fa-comment"></i>채팅</span></a></li>
		                    	 
		                           <script>
							          $("#chat").click(function() {
							              alert("로그인 후 이용해주세요."); //제이쿼리 선언 필수
							          })
							       </script>
					</c:otherwise>
					</c:choose>
				
								
					<c:choose>
					<c:when test="${ !empty loginUser }"> <!-- 로그인이 되었다면 -->
							<c:choose>
								<c:when test="${loginUser.memberNo == 1  }">
									<li class="nav-item cta" id="sign"><a class="nav-link" href="${ pageContext.request.contextPath }/member/mypage.do"><span><i
											class="fas fa-sign-in-alt"></i>마이페이지</span></a></li>
									<li class="nav-item cta" id="sign"><a class="nav-link" href="${ pageContext.request.contextPath }/admin/admin.do"
										style="background-color:rgb(170, 143, 211);"><span><i
										class="fas fa-sign-in-alt"></i>관리</span></a></li>	
									<li class="nav-item cta" id="sign"><a class="nav-link" href="${ pageContext.request.contextPath }/member/logout.do"
										style="background-color:transparent;"><span><i
											class="fas fa-sign-in-alt"></i>로그아웃</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item cta" id="sign"><a class="nav-link" href="${ pageContext.request.contextPath }/member/mypage.do"><span><i
														class="fas fa-sign-in-alt"></i>마이페이지</span></a></li>
									<li class="nav-item cta" id="sign"><a class="nav-link" href="${ pageContext.request.contextPath }/member/logout.do"
										style="background-color:rgb(170, 143, 211);"><span><i
										class="fas fa-sign-in-alt"></i>로그아웃</span></a></li>
							</c:otherwise>
							</c:choose>
									
										
											
					</c:when>
					
					<c:otherwise>
						<li class="nav-item cta" id="sign"><a class="nav-link" onclick="joinForm();"><span><i
												class="fas fa-sign-in-alt"></i>회원가입</span></a></li>
								<li class="nav-item cta" id="sign"><a class="nav-link" onclick="loginForm();"
										style="background-color:rgb(170, 143, 211);"><span><i
												class="fas fa-sign-in-alt"></i>로그인</span></a></li>
					</c:otherwise>
				</c:choose>				
				</ul>
			</div>
		</div>
	</nav>

  <script src="../resources/js/jquery.min.js"></script>
  <script src="../resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../resources/js/popper.min.js"></script>
  <script src="../resources/js/bootstrap.min.js"></script>
  <script src="../resources/js/jquery.easing.1.3.js"></script>
  <script src="../resources/js/jquery.waypoints.min.js"></script>
  <script src="../resources/js/jquery.stellar.min.js"></script>
  <script src="../resources/js/owl.carousel.min.js"></script>
  <script src="../resources/js/jquery.magnific-popup.min.js"></script>
  <script src="../resources/js/aos.js"></script>
  <script src="../resources/js/jquery.animateNumber.min.js"></script>
  <script src="../resources/js/scrollax.min.js"></script>
  <script src="../resources/js/main.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
  <script>
  	function mainPage() { // 로고 이미지 클릭 시 메인화면으로 이동
  		location.href = "<%= contextPath %>/";
  	}
    function loginForm() { // 로그인 버튼 클릭 시, 로그인 화면으로 이동
  		location.href = "<%= contextPath %>/member/login.do";
  	} 
    function joinForm() { // 회원가입 버튼 클릭 시, 회원가입 화면으로 이동
  		location.href = "<%= contextPath %>/member/join.do";
  	}
    function logoutForm() { // 로그아웃 버튼 클릭 시 , 세션 종료
    	location.href = "/member/logout.do";
    }
    function mypageForm() { // 마이페이지 버튼 클릭 시 마이페이지 폼으로 이동
    	location.href = "/member/mypageForm.do";
    }
   
    // 채팅 제이쿼리
    $(function() {
    	getUnread();})

    function getUnread() {
    	$.ajax({
    		type: "post",
    		url: "${ pageContext.request.contextPath }/test/test4.do",
    		
    		success: function(result) {
    			if(result >= 1) {
    				$('#unread').html(result);
    			} else {
    				$('#unread').html('');
    			}
    		},
    		
    		error : function() {
    				console.log("ajax 실패");
    			}
    	});
    }
     </script>
     <script>
     function checkNone() {
         if($("#mainCategory").val() == 'none') {
            alert("올바른 카테고리를 선택하세요.");
            return false;
         } else {
            return true;
         }
      }
     </script>
</body>
</html>