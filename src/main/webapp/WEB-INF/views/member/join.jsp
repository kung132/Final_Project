<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>재능판다</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 웹 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Karla&display=swap"
	rel="stylesheet">
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

.form-button {
	color: rgb(170, 143, 211);
}

.form-button:hover, .form-button:focus, .form-button:active,
	.form-button.active, .form-button:active:focus, .form-button:active:hover,
	.form-button.active:hover, .form-button.active:focus {
	border-color: lightsalmon;
	color: black;
}
</style>

</head>

<body>
	<jsp:include page="/WEB-INF/views/include/topbar.jsp" />

	<div class="container"
		style="margin: auto; margin-top: 200px; margin-bottom: 100px;">
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">회원가입</h4>
				<p class="text-center">재능판다에 오신걸 환영합니다.</p>
				<form method="post" action="join.do" id="joinForm" name="joinForm"
					onsubmit="return checkInput();">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="memberId" id="memberId" class="form-control"
							placeholder="아이디" type="text">
							<button id="idCheck" type="button" onclick="fn_idCheck();" value="N">중복체크</button>
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input class="form-control" id="memberPwd" name="memberPwd"
							placeholder="비밀번호 입력" type="password">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input class="form-control" id="pwdCheck" name="pwdCheck"
							placeholder="비밀번호 확인" type="password">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="memberName" id="memberName" class="form-control"
							placeholder="이름(실명) 입력" type="text"> <br>
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="memberNick" id="memberNick" class="form-control"
							placeholder="닉네임(별칭)" type="text">
						<button id="nickCheck" type="button" onclick="fn_nickCheck();" value="N">중복체크</button>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-phone"></i>
							</span>
						</div>
						<input id="memberPhone" name="memberPhone" class="form-control"
							placeholder="휴대폰 번호('-' 제외)" type="text">
						<button id="phoneCheck" type="button" onclick="fn_phoneCheck();" value="N">중복체크</button>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input name="memberEmail" id="memberEmail" class="form-control"
							placeholder="이메일주소" type="email">
						<button id="emailCheck" type="button" onclick="fn_emailCheck();"
							value="N">중복체크</button>
					</div>
					<!-- form-group// -->
					<!-- form-group// -->
					<div class="form-group">
						<input type="text" id="sample2_postcode" placeholder="우편번호">
						<input type="text" id="address" name="address" placeholder="주소"><br>
						<input type="text" id="detailAddress" name="detailAddress" required
							placeholder="상세주소"> <input type="button" id="postnumBnt"
							onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<div class="form-group">
						<button type="submit" id="submit"
							class="btn btn-primary btn-block"
							style="color: white; background-color: rgb(170, 143, 211); border: 1px solid transparent;">
							회원가입</button>
					</div>
					<!-- form-group// -->
					<p class="text-center" style="color: black;">
						<strong>이미 가입하셨나요?</strong> <a
							href="<%=contextPath%>/member/login.do" class="form-button">로그인
							하기</a>
					</p>
				</form>
			</article>
		</div>
		<!-- card.// -->

	</div>
	<!--container end.//-->

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />


	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function sample2_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								addr += extraAddr;
							} else {
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample2_postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
							console.log("detailAddress : " + detailAddress);
							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
					}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>



	<script>
		function checkInput() {
			
			if (document.joinForm.memberId.value == ""){
				alert("아이디를 입력해 주세요.");
				document.joinForm.memberId.focus();
				return false;
			}
			if (document.joinForm.memberPwd.value == ""){
				alert("비밀번호를 입력해주세요.");
				document.joinForm.memberPwd.focus();
				return false;
			}
			if (document.joinForm.pwdCheck.value == ""){
				alert("비밀번호확인을 입력해주세요.");
				document.joinForm.pwdCheck.focus();
				return false;	
			}
			if (document.joinForm.memberName.value == "") {
				alert("이름을 입력해주세요");
				document.joinForm.memberName.focus();
				return false;
			}
			if (document.joinForm.memberNick.value == "") {
				alert("닉네임을 입력해 주세요");
				document.joinForm.memberNick.focus();
				return false;
			}
			if (document.joinForm.memberPhone.value == "") {
				alert("휴대폰번호를 입력해 주세요");
				document.joinForm.memberPhone.focus();
				return false;
			}
			if (document.joinForm.memberEmail.value == "") {
				alert("이메일을 입력해 주세요");
				document.joinForm.memberEmail.focus();
				return false;
			}
			if (document.joinForm.address.value == "") {
				alert("우편번호 찾기를 진행 해주세요");
				document.joinForm.address.focus();
				return false;
			}
			if (document.joinForm.nickCheck.value == "N") {
				alert("닉네임 중복체크를 해주세요");
				document.joinForm.nickCheck.focus();
				return false;
			}
			if (document.joinForm.phoneCheck.value == "N") {
				alert("휴대폰 번호 중복체크를 해주세요");
				document.joinForm.phoneCheck.focus();
				return false;
			}
			if (document.joinForm.emailCheck.value == "N") {
				alert("이메일 중복체크를 해주세요");
				document.joinForm.emailCheck.focus();
				return false;
			}
			
			
			
			var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
			var pw = document.getElementById('memberPwd').value;
			if (!regExp.test(pw)) {
				alert("비밀번호 형식을 확인해주세요 (영 대소문자 숫자 8~15자리)");
				document.getElementById('memberPwd').focus();
				return false;
			}
			var pw_check = document.getElementById('pwdCheck').value;
			if (!regExp.test(pw_check)) {
				alert("비밀번호 확인 형식을 확인해주세요 (영 대소문자 숫자 8~15자리)");
				document.getElementById('pwdCheck').focus();
				return false;
			}
			if (!(pw == pw_check)) {
				alert("비밀번호와 확인이 일치하지 않습니다.");
				document.getElementById('pwdCheck').focus();
				return false;
			}
			regExp = /^[가-힣]{2,}$/;
			var name = document.getElementById('memberName').value;
			if (!regExp.test(name)) {
				alert("이름을 확인해주세요");
				document.getElementById('memberName').focus();
				return false;
			}
			regExp = /^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$/;
			var phone = document.getElementById('memberPhone').value;
			if (!regExp.test(phone)) {
				alert("전화번호 형식을 확인해주세요(-제외)");
				document.getElementById('memberPhone').focus();
				return false;
			}
			
		}
	</script>

	<!-- 중복 체크 버튼 -->
	<script>
		function fn_emailCheck() {
			$.ajax({
				url : "/member/emailCheck.do",
				type : "POST",
				dataType : "JSON",
				data : {
					"memberEmail" : $("#memberEmail").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 이메일입니다.");
					} else if (data == 0) {
						$("#emailCheck").attr("value", "Y");
						alert("사용 가능한 이메일입니다.")
					}
				}
			})
		}
		function fn_idCheck() {
			$.ajax({
				url : "/member/idCheck.do",
				type : "POST",
				dataType : "JSON",
				data : {
					"memberId" : $("#memberId").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 아이디입니다.");
					} else if (data == 0) {
						$("#idCheck").attr("value", "Y");
						alert("사용 가능한 아이디입니다.")
					}
				}
			})
		}

		function fn_nickCheck() {
			$.ajax({
				url : "/member/nickCheck.do",
				type : "POST",
				dataType : "JSON",
				data : {
					"memberNick" : $("#memberNick").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 닉네임입니다.");
					} else if (data == 0) {
						$("#nickCheck").attr("value", "Y");
						alert("사용 가능한 닉네임입니다.")
					}
				}
			})
		}

		function fn_phoneCheck() {
			$.ajax({
				url : "/member/phoneCheck.do",
				type : "POST",
				dataType : "JSON",
				data : {
					"memberPhone" : $("#memberPhone").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 휴대폰 번호입니다.");
					} else if (data == 0) {
						$("#phoneCheck").attr("value", "Y");
						alert("사용 가능한 휴대폰 번호입니다.")
					}
				}
			})
		}
	</script>

</body>

</html>