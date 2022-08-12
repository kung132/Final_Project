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
        #findBtn:hover {
            background-color: black;
        }
    </style>
    
    <script type="text/javascript">

		var msg = "${msg}";
		 
			if (msg != "") {
				alert(msg);
			}
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
	
	<div class="w3-content w3-container" style="margin-top: 300px; margin-bottom: 170px; width: 30%;">
		<div class="w3-container w3-card-4">
			<form action="/member/findId.do" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
					<p>가입시 입력한 이메일을 입력해주세요</p>
				</div>
				<div>
					<p>
						<label>Email</label>
						<input class="w3-input" type="email" id="memberEmail" name="memberEmail" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요." required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn class="w3-button w3-block w3-ripple w3-margin-top w3-round" style="background-color: rgb(170, 143, 211); color: white;">아이디 찾기</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-ripple w3-margin-top w3-margin-bottom w3-round" style="background-color: rgb(170, 143, 211); color: white;">창 닫기</button>
					</p>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	
	 <script src="http://code.jquery.com/jquery-latest.js"></script>
</body>
</html>