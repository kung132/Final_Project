<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>재능판다</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	<!-- 웹 폰트-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Karla&display=swap" rel="stylesheet">

	<style>
		*:not(i) {
			font-family: 'Karla', sans-serif;
		}

		#navbar-logo>img {
			padding-top: 0px;
			padding-bottom: 18px;
			width: 110px;
			height: 100px;
		}

		#ftco-navbar {
			height: 100px;
		}
	</style>
</head>

<body>
	<!-- 탑바 인클루드 예정-->
	<!-- <%@ include file="../common/topbar.jsp" %>  -->
	<nav class="navbar navbar-expand-lg  ftco_navbar ftco-navbar-light" id="ftco-navbar" style="top: 0">
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
					<!-- !! JSP 파일로 변환 시 주석 해제 
					<c:if test="${ member == null }">
					<li class="nav-item cta" id="sign"><a class="nav-link" onclick="joinForm();"><span><i
									class="fas fa-sign-in-alt"></i>회원가입</span></a></li>
					<li class="nav-item cta" id="sign"><a class="nav-link" onclick="loginForm();"
							style="background-color:rgb(170, 143, 211);"><span><i
									class="fas fa-sign-in-alt"></i>로그인</span></a></li>
					</c:if>
					
					<c:if test="${ member != null }">
						<li class="nav-item cta" id="sign"><a class="nav-link" onclick="mypageForm();"><span><i
								class="fas fa-sign-in-alt"></i>마이페이지</span></a></li>
						<li class="nav-item cta" id="sign"><a class="nav-link" onclick="logoutForm();"
							style="background-color:rgb(170, 143, 211);"><span><i
								class="fas fa-sign-in-alt"></i>로그아웃</span></a></li>
					</c:if>
					-->
				</ul>
			</div>
		</div>
	</nav>
	<div id="includedContent"></div>
	<div class="hero-wrap js-fullheight" style="background-image: url('images/main.jpg'); margin-bottom: 50px;">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
				data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>재능 판다
							<br></strong>숨어있는 당신의 재능</h1>

					<p>찾으시는 서비스를 클릭하세요</p>
					<p class="browse d-md-flex">
						<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i
									class="fas fa-language" style="color:rgb(170, 143, 211);"></i>외국어</a></span>
						<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i
									class="fas fa-guitar" style="color:rgb(170, 143, 211);"></i>악기</a></span>
						<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i
									class="fas fa-running" style="color:rgb(170, 143, 211);"></i>스포츠</a></span>

					</p>
					<p class="browse d-md-flex">
						<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i
									class="fas fa-gamepad" style="color:rgb(170, 143, 211);"></i>취미</a></span>
						<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i
									class="fas fa-envelope-open-text"
									style="color:rgb(170, 143, 211);"></i>시험</a></span>
						<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i
									class="far fa-id-badge" style="color:rgb(170, 143, 211);"></i>자격증/컨설팅</a></span>
					</p>

				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">인기 서비스</span>
					<h2 class="mb-4"><strong>많이 찾으시는</strong> 서비스에요!</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/english.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">영어 레슨</a></h3>
							<hr>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/piano.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">피아노 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/PT.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">퍼스널 트레이닝(PT)</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/vocal.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">보컬 레슨</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">외국어</span>
					<h2 class="mb-4"><strong>실력 Up</strong> 외국어배우기</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/china.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">중국어 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/english.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">영어 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/japan.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">일본어 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/russia.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">러시아어 레슨</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">악기 서비스</span>
					<h2 class="mb-4"><strong>악기 하나 쯤은</strong> 배우고싶어</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/guitar.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">기타 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/piano.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">피아노 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/drum.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">드럼 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/violin.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">바이올린 레슨</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">스포츠 서비스</span>
					<h2 class="mb-4"><strong>운동습관</strong> 만들기</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/PT.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">퍼스널 트레이닝(PT)</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/pilates.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">필라테스 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/swim.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">수영 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/yoga.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">요가 레슨</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">취미 서비스</span>
					<h2 class="mb-4"><strong>취미,</strong> 더 깊게 즐겨요</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/cook.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">요리 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/vocal.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">보컬 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/game.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">게임 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/art.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">미술 레슨</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">시험 서비스</span>
					<h2 class="mb-4"><strong>시험,</strong> 전문가가 도와드려요</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/public.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">공무원 시험</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/tax.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">세무사 시험</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/realtor.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">공인중개사 시험</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/social.png);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">사회복지사 시험</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">자격증/컨설팅 서비스</span>
					<h2 class="mb-4"><strong>컨설팅,</strong> 함께 하면 어렵지 않아요</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/university.png);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">대학 입시 컨설팅</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/meeting.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">면접 레슨</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/portpolio.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">포트폴리오 컨설팅</a></h3>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="destination">
						<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
							style="background-image: url(images/graduate.jpg);">
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<h3><a href="#">대학원 컨설팅</a></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 푸터바 인클루드 예정 -->
	<footer class="footer-07" style="background-color: rgb(170, 143, 211);">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 text-center">
					<h2 class="footer-heading" style="margin-top:50px;"><a href="#"
							class="logo">TalentsellerPanda.com</a></h2>
					<p class="menu">
						<a href="#">재능판다</a>&nbsp;&nbsp;
						<a href="#">1대1문의</a>&nbsp;&nbsp;
						<a href="#">FAQ</a>&nbsp;&nbsp;
						<a href="#">공지사항</a>&nbsp;&nbsp;
					</p>
					<ul class="ftco-footer-social p-0">
						<li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top"
								title="Twitter"><span class="ion-logo-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top"
								title="Facebook"><span class="ion-logo-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top"
								title="Instagram"><span class="ion-logo-instagram"></span></a></li>
					</ul>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-md-12 text-center">
					<p class="copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script> All rights reserved | This template
						is made with <i class="ion-ios-heart" aria-hidden="true"></i> by <a href="https://colorlib.com"
							target="_blank" style="color: transparent;">Colorlib.com</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
				stroke="#F96D00" />
		</svg></div>


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
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
		function mypageForm() {
			location.href = "<%= contextPath %>/mypageForm.me";
		}
		function logoutForm() {
			location.href = "<%= contextPath %>/logout.me"
		}
	</script>
</body>

</html>