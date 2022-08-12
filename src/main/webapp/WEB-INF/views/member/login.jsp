<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
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
            background-color: lightsalmon;
            border-color: lightsalmon;
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
            color: rgb(170, 143, 211);
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
        
        .loginLogo {
        	width: 200px;
            height: 180px;
        }
    </style>
</head>

<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>

<body class="main-bg">

    <div class="login-container text-c  flipInX" style="margin-bottom: 170px; margin-top: 100px;">
        <div>
        	<img src="../resources/images/loginLogo.jpg" class="loginLogo">
        </div>
        <h3 class="text-whitesmoke">재능판다에 오신걸 환영해요!</h3>
        <p class="text-whitesmoke">로그인하기</p>
        <div class="container-content">
            <form class="margin-t" action="login.do" method="post" name="loginForm">
                <div class="form-group">
                    <input type="text" name="memberId" class="form-control" onkeyup="enterkey();" placeholder="ID 입력">
                </div>
                <div class="form-group">
                    <input type="password" name="memberPwd" class="form-control" onkeyup="enterkey();" placeholder="*****">
                </div>
                <button type="button" class="form-button button-l margin-b" onclick="checklogin();">로그인</button>

                <a class="text-darkyellow" href="/member/findId.do">아이디 찾기</a>
                <a class="text-darkyellow" href="/member/findPwdForm.do">비밀번호 찾기</a>
                <a class="text-darkyellow" href="/member/join.do">회원가입</a>
            </form>
        </div>
    </div>
    
    <script>
          
       function checklogin() {
          var form = document.loginForm;
          
             if(form.memberId.value == "") {
                alert('아이디를 입력해주세요.');
                form.memberId.focus();
                return false;
             } else if(form.memberPwd.value == "") {
                alert('비밀번호를 입력해주세요.');
                form.memberPwd.focus();
                return false;
             }
             form.submit();
       }
       
       function enterkey() {
          if (window.event.keyCode == 13) {
              // 엔터키가 눌렸을 때
              checklogin();
           }
       }
    </script>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	
</body>


</html>