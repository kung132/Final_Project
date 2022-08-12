<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>재능판다</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- 웹 폰트-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Karla&display=swap" rel="stylesheet">

	<style>
		*:not(i) {
			font-family: 'Karla', sans-serif;
		}
		
		
		
    </style>
</head>

<body>
	<footer class="footer-07" style="background-color: rgb(170, 143, 211);">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 text-center">
					<h2 class="footer-heading" style="margin-top:50px;"><a href="${ pageContext.request.contextPath }" class="logo">TalentsellerPanda.com</a></h2>
		               <p class="menu">
		                <a href="${ pageContext.request.contextPath }">재능판다</a>&nbsp;&nbsp;
						<a href="${ pageContext.request.contextPath }/admin/footerNotice.do">공지사항</a>&nbsp;&nbsp;
					</p>
					<ul class="ftco-footer-social p-0">
		  <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><span class="ion-logo-twitter"></span></a></li>
		  <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><span class="ion-logo-facebook"></span></a></li>
		  <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><span class="ion-logo-instagram"></span></a></li>
		</ul>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-md-12 text-center">
					<p class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ion-ios-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank"  style="color: transparent;">Colorlib.com</a>
				  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
  <script src="../resources/js/bootstrap-datepicker.js"></script>
  <script src="../resources/js/jquery.timepicker.min.js"></script>
  <script src="../resources/js/scrollax.min.js"></script>
  <script src="../resources/js/main.js"></script>
  <script src="https://kit.fontawesome.com/c8ea39d107.js" crossorigin="anonymous"></script>
  
   <script>
    function fnChkByte(obj, maxByte)
    {
        var str = obj.value;
        var str_len = str.length;


        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";


        for(var i=0; i<str_len; i++)
        {
            one_char = str.charAt(i);
            if(escape(one_char).length > 4) {
                rbyte += 2;                                         //한글2Byte
            }else{
                rbyte++;                                            //영문 등 나머지 1Byte
            }
            if(rbyte <= maxByte){
                rlen = i+1;                                          //return할 문자열 갯수
            }
         }
         if(rbyte > maxByte)
         {
            // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
            alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
            str2 = str.substr(0,rlen);                                  //문자열 자르기
            obj.value = str2;
            fnChkByte(obj, maxByte);
         }
         else
         {
            document.getElementById('byteInfo').innerText = rbyte;
         }
    }
    </script>
  
</body>
</html>