<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/ngpStyle.css">

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
  <nav class="navbar navbar-expand-lg  ftco_navbar ftco-navbar-light" id="ftco-navbar"
		style="top: 0">
		<div class="container">
			<div class="collapse navbar-collapse" id="ftco-nav">
				<div id="navbar-logo" onclick="mainPage();">
					<img src="images/logo.png" class="logo">
				</div>
				<div class="block-17 my-4" style="width: 30%; margin-left: 10px; ">
					<form action="" method="post" class="d-block d-flex" style="width: 100%;">
						<div class="fields d-block d-flex">
							<div class="select-wrap one-third" style="width: 100%;">
								<div class="icon"><span class="ion-ios-arrow-down"></span></div>
								<select name="" id="" class="form-control">
									<option value="1">카테고리 검색</option>
									<option value="2">외국어</option>
									<option value="3">악기</option>
									<option value="4">스포츠</option>
									<option value="5">취미</option>
									<option value="6">시험</option>
									<option value="7">자격증/컨설팅</option>
								</select>
							</div>
						</div>
						<input type="submit" class="search-submit btn btn-primary" value="검색">
					</form>
				</div>
				<ul class="navbar-nav ml-auto" style="margin-left : 150px;">
					<li class="nav-item cta" id="sign"><a class="nav-link" onclick="joinForm();"><span><i
									class="fas fa-sign-in-alt"></i>회원가입</span></a></li>
					<li class="nav-item cta" id="sign"><a class="nav-link" onclick="loginForm();"
							style="background-color:rgb(170, 143, 211);"><span><i
									class="fas fa-sign-in-alt"></i>로그인</span></a></li>
				</ul>
			</div>
		</div>
	</nav>

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
  <script>
  	function mainPage() {
  		location.href = "<%= contextPath %>";
  	}
    function loginForm() { // 로그인 버튼 클릭 시, 로그인 화면으로 이동
  		location.href = "<%= contextPath %>/loginForm.me";
  	} 
    function joinForm() { // 회원가입 버튼 클릭 시, 회원가입 화면으로 이동
  		location.href = "<%= contextPath %>/joinForm.me";
  	}
  </script>
</body>
</html>