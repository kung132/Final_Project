<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(function () {
            $("#findBtn").click(function () {
                $.ajax({
                    url: "../member/find_pw.do",
                    type: "POST",
                    data: {
                        id: $("#id").val(),
                        email: $("#email").val()
                    },
                    success: function (result) {
                        alert(result);
                    },
                })
            });
        })
    </script>
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
				<div id="navbar-logo" onclick="">
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
    <div class="w3-content w3-container" style="margin-top: 300px; width: 30%;">
        <div class="w3-container w3-card-4">
            <div class="w3-center w3-large w3-margin-top">
                <h3>비밀번호 찾기</h3>
            </div>
            <div>
                <p>
                    <label>ID</label>
                    <input class="w3-input" type="text" id="id" name="id" required>
                </p>
                <p>
                    <label>Email</label>
                    <input class="w3-input" type="text" id="email" name="email" required>
                </p>
                <p class="w3-center">
                    <button type="button" id=findBtn class="w3-button w3-block w3-ripple w3-margin-top w3-round"
                        style="background-color: rgb(170, 143, 211); color: white;" >비밀번호 찾기</button>
                    <button type="button" onclick="history.go(-1);"
                        class="w3-button w3-block w3-margin-top w3-margin-bottom w3-round"
                        style="background-color: rgb(170, 143, 211); color: white">닫기</button>
                </p>
            </div>
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
</body>

</html>