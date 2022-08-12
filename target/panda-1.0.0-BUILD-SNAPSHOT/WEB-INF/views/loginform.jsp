<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        html {
            height: 100%;
        }

        body {
            height: 100%;
            margin: 0;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        /* Text Align */
        .text-c {
            text-align: center;
        }

        .text-l {
            text-align: left;
        }

        .text-r {
            text-align: right
        }

        .text-j {
            text-align: justify;
        }

        /* Text Color */
        .text-whitesmoke {
            color: black
        }

        .text-darkyellow {
            color: rgb(170, 143, 211);
        }

        /* Lines */

        .line-b {
            border-bottom: 1px solid rgb(170, 143, 211) !important;
        }

        /* Buttons */
        .button {
            border-radius: 3px;
        }

        .form-button {
            background-color: rgb(170, 143, 211);
            border-color: rgb(170, 143, 211);
            color: #e6e6e6;
        }

        .form-button:hover,
        .form-button:focus,
        .form-button:active,
        .form-button.active,
        .form-button:active:focus,
        .form-button:active:hover,
        .form-button.active:hover,
        .form-button.active:focus {
            background-color: wheat;
            border-color: wheat;
            color: black;
        }

        .button-l {
            width: 100% !important;
        }

        /* Margins g(global) - l(left) - r(right) - t(top) - b(bottom) */

        .margin-g {
            margin: 15px;
        }

        .margin-g-sm {
            margin: 10px;
        }

        .margin-g-md {
            margin: 20px;
        }

        .margin-g-lg {
            margin: 30px;
        }

        .margin-l {
            margin-left: 15px;
        }

        .margin-l-sm {
            margin-left: 10px;
        }

        .margin-l-md {
            margin-left: 20px;
        }

        .margin-l-lg {
            margin-left: 30px;
        }

        .margin-r {
            margin-right: 15px;
        }

        .margin-r-sm {
            margin-right: 10px;
        }

        .margin-r-md {
            margin-right: 20px;
        }

        .margin-r-lg {
            margin-right: 30px;
        }

        .margin-t {
            margin-top: 15px;
        }

        .margin-t-sm {
            margin-top: 10px;
        }

        .margin-t-md {
            margin-top: 20px;
        }

        .margin-t-lg {
            margin-top: 30px;
        }

        .margin-b {
            margin-bottom: 15px;
        }

        .margin-b-sm {
            margin-bottom: 10px;
        }

        .margin-b-md {
            margin-bottom: 20px;
        }

        .margin-b-lg {
            margin-bottom: 30px;
        }

        /* Bootstrap Form Control Extension */

        .form-control,
        .border-line {
            background-color: white;
            background-image: none;
            border: 1px solid rgb(170, 143, 211);
            border-radius: 1px;
            color: inherit;
            display: block;
            padding: 6px 12px;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            width: 100%;
        }

        .form-control:focus,
        .border-line:focus {
            border-color: rgb(170, 143, 211);
            background-color: white;
            color: #e6e6e6;
        }

        .form-control,
        .form-control:focus {
            box-shadow: none;
        }

        .form-control::-webkit-input-placeholder {
            color: #BDBDBD;
        }

        /* Container */

        .container-content {
            background-color: white;
            color: inherit;
            padding: 15px 20px 20px 20px;
            border-color: rgb(170, 143, 211);
            border-image: none;
            border-style: solid solid none;
            border-width: 1px 0;
        }

        /* Backgrounds */

        .main-bg {

            background: white;
        }

        /* Login & Register Pages*/

        .login-container {
            max-width: 400px;
            z-index: 100;
            margin: 0 auto;
            padding-top: 100px;
        }

        .login.login-container {
            width: 300px;
        }

        .wrapper.login-container {
            margin-top: 140px;
        }

        .logo-badge {
            color: #e6e6e6;
            font-size: 80px;
            font-weight: 800;
            letter-spacing: -10px;
            margin-bottom: 0;
        }

        *:not(i) {
            font-family: 'Karla', sans-serif;
        }

        #navbar-logo>img {
            padding-top: 0px;
            padding-bottom: 18px;
            width: 110px;
            height: 100px;
        }
    </style>
</head>
<!-- 탑바 인클루드 예정-->
<%@ include file="../views/common/topbar.jsp" %>  
<body class="main-bg">
    <nav class="navbar navbar-expand-lg  ftco_navbar ftco-navbar-light" id="ftco-navbar"
		style="top: 0">
		<div class="container">
			<div class="collapse navbar-collapse" id="ftco-nav">
				<div id="navbar-logo" onclick="">
					<img src="images/logo.png" class="logo">
				</div>
				<div class="block-17 my-4" style="width: 30%; margin-left: 10px; ">
					<form action="" method="post" class="d-block d-flex" style="width: 100%;">
						<div class="fields d-block d-flex">
							<div class="select-wrap one-third" style="width: 100%;">
								<div class="icon"><span class="ion-ios-arrow-down"></span></div>
								<select name="" id="" class="form-control">
									<option value="">카테고리 검색</option>
									<option value="">외국어</option>
									<option value="">악기</option>
									<option value="">스포츠</option>
									<option value="">취미</option>
									<option value="">시험</option>
									<option value="">자격증/컨설팅</option>
								</select>
							</div>
						</div>
						<input type="submit" class="search-submit btn btn-primary" value="검색">
					</form>
				</div>
				<ul class="navbar-nav ml-auto" style="margin-left : 150px;">
					<li class="nav-item cta" id="sign"><a class="nav-link" onclick=""><span><i
									class="fas fa-sign-in-alt"></i>회원가입</span></a></li>
					<li class="nav-item cta" id="sign"><a class="nav-link" onclick=""
							style="background-color:rgb(170, 143, 211);"><span><i
									class="fas fa-sign-in-alt"></i>로그인</span></a></li>
				</ul>
			</div>
		</div>
	</nav>
    <div class="login-container text-c  flipInX" style="margin-bottom: 150px;">
        <div>
            <h1 class="logo-badge text-whitesmoke"><span class="fa fa-user-circle"></span></h1>
        </div>
        <h3 class="text-whitesmoke">재능판다에 오신걸 환영해요!</h3>
        <p class="text-whitesmoke">로그인하기</p>
        <div class="container-content">
            <form class="margin-t" action="member/login.do" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="ID 입력" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="*****" required>
                </div>
                <button type="submit" class="form-button button-l margin-b">로그인</button>

                <a class="text-darkyellow" href="#"><small>아이디 찾기</small></a>
                <a class="text-darkyellow" href="#"><small>비밀번호 찾기</small></a>
                <a class="text-darkyellow" href="#"><small>회원가입</small></a>
            </form>
        </div>
    </div>

    <footer class="footer-07" style="background-color: rgb(170, 143, 211); margin-top: 200px;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <h2 class="footer-heading" style="margin-top:50px;"><a href="#"
                            class="logo">TalentsellerPanda.com</a></h2>
                    <p class="menu">
                        <a href="#">재능판다</a>
                        <a href="#">1대1문의</a>
                        <a href="#">FAQ</a>
                        <a href="#"></a>
                        <a href="#">Blog</a>
                        <a href="#">Contact</a>
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
</body>

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


</html>