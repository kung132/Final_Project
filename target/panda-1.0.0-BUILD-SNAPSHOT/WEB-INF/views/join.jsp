<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

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
                height: 110px;
            }

            .divider-text {
                position: relative;
                text-align: center;
                margin-top: 15px;
                margin-bottom: 15px;
            }

            .divider-text span {
                padding: 7px;
                font-size: 12px;
                position: relative;
                z-index: 2;
            }

            .divider-text:after {
                content: "";
                position: absolute;
                width: 100%;
                border-bottom: 1px solid #ddd;
                top: 55%;
                left: 0;
                z-index: 1;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    </head>

    <body>
        <%@ include file="../views/common/footer.jsp" %>

            <div class="container" style="margin: auto; margin-top: 200px; margin-bottom: 100px;">
                <div class="card bg-light">
                    <article class="card-body mx-auto" style="max-width: 400px;">
                        <h4 class="card-title mt-3 text-center">회원가입</h4>
                        <p class="text-center">재능판다에 오신걸 환영합니다.</p>
                        <form method="post" name="joinform" id="join_form">
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                </div>
                                <input name="memberName" id="memberName" class="form-control" placeholder="이름(실명)"
                                    type="text" required>
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                </div>
                                <input name="memberNick" id="memberNick" class="form-control" placeholder="닉네임(별칭)"
                                    type="text" required>
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                </div>
                                <input name="memberId" id="memberId" class="form-control" placeholder="아이디 입력"
                                    type="text" required>
                                <input type="button" value="중복확인" onclick="idCheck()">
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                </div>
                                <input name="memberEmail" id="memberEmail" class="form-control" placeholder="이메일주소"
                                    type="email" required>
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                                </div>
                                <select class="custom-select" style="max-width: 80px; height: 52px;">
                                    <option selected="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                </select>
                                <input name="memberPhone" class="form-control" placeholder="휴대폰 번호" type="text"
                                    required>
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                </div>
                                <input class="form-control" id="memberPwd" name="memberPwd" placeholder="비밀번호 입력"
                                    type="password" required>
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                </div>
                                <input class="form-control" id="pwdcheck" name="pwdcheck" placeholder="비밀번호 확인"
                                    type="password" required>
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <input type="text" id="memberPostcode" placeholder="우편번호">
                                <input type="button" onclick="memberDaumPostcode()" value="우편번호 찾기"><br>
                                <input type="text" id="memberRoadAddress" placeholder="도로명주소">
                                <span id="guide" style="color:#999;display:none"></span>
                                <input type="text" id="memberDetailAddress" placeholder="상세주소">
                            </div>
                            <div class="form-group">
                                <button type="button" id="join_button" class="btn btn-primary btn-block"
                                    style="color:white; background-color: rgb(170, 143, 211); border: 1px solid transparent;">
                                    회원가입 </button>
                            </div> <!-- form-group// -->
                            <p class="text-center" style="color: rgb(170, 143, 211);"><strong>이미 가입하셨나요?</strong> <a
                                    href="" style="color: black;">로그인 하기</a> </p>
                        </form>
                    </article>
                </div> <!-- card.// -->

            </div>
            <!--container end.//-->

            <%@ include file="../views/common/footer.jsp" %>


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
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>

                    $(document).ready(function () {
                        //회원가입 버튼(회원가입 기능 작동)
                        $("#join_button").click(function () {
                            $("#join_form").attr("action", "/member/join");
                            $("#join_form").submit();
                        });
                    });

                    function go_save() {

                        if (document.joinform.memberName.value == "") {
                            alert("이름을 입력해주세요.");
                            document.joinform.name.focus();
                        } else if (document.joinform.memberNick.value == "") {
                            alert("닉네임을 입력해주세요.");
                            document.joinform.memberNick.focus();
                        } else if (document.joinform.memberId.value == "") {
                            alert("아이디를 입력해주세요.");
                            console.log(document.joinform.id.value);
                            document.joinform.memberId.focus();
                        } else if (document.joinform.memberEmail.value == "") {
                            alert("이메일을 입력해주세요.");
                            document.joinform.memberEmail.focus();
                        } else if (document.joinform.phone.value == "") {
                            alert("전화번호를 입력해주세요.");
                            document.joinform.phone.focus();
                        } else if (document.joinform.memberPwd.value == "") {
                            alert("비밀번호를 입력해주세요.");
                            document.joinform.memberPwd.focus();
                        } else if (document.joinform.memberPwd.value != document.joinform.pwdcheck.value) {
                            alert("비밀번호가 일치하지 않습니다.");
                            document.joinform.pwdcheck.focus();
                        } else if (document.joinform.zip_code.value == "") {
                            alert("주소를 입력해주세요.");
                            document.joinform.zip_code.focus();

                        } else {
                            document.joinform.action = "join";
                            document.joinform.submit();
                        }
                    }

                    function idCheck() {
                        if (document.joinform.memberId.value == "") {
                            alert("아이디를 입력해주세요.");
                            document.joinform.memberId.focus();
                            return false;
                        }

                        var url = "id_check_form?id=" + document.joinform.id.value;

                        window.open(url, "_blank_1",
                            "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=300");
                    }

                    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                    function memberDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function (data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var roadAddr = data.roadAddress; // 도로명 주소 변수
                                var extraRoadAddr = ''; // 참고 항목 변수

                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                    extraRoadAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if (data.buildingName !== '' && data.apartment === 'Y') {
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if (extraRoadAddr !== '') {
                                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                                }

                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('memberPostcode').value = data.zonecode;
                                document.getElementById("memberRoadAddress").value = roadAddr;

                                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                if (roadAddr !== '') {
                                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                                } else {
                                    document.getElementById("sample4_extraAddress").value = '';
                                }

                                var guideTextBox = document.getElementById("guide");
                                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                if (data.autoRoadAddress) {
                                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                    guideTextBox.style.display = 'block';

                                } else if (data.autoJibunAddress) {
                                    var expJibunAddr = data.autoJibunAddress;
                                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                                    guideTextBox.style.display = 'block';
                                } else {
                                    guideTextBox.innerHTML = '';
                                    guideTextBox.style.display = 'none';
                                }
                            }
                        }).open();
                    }
                </script>
    </body>

    </html>