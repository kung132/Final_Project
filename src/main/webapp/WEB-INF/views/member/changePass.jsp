<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
    #content {
        height: 1000px;
    }

    #update {
        width: 70%;
        margin-left: 50px;
        margin-top: 30px;
    }
    
    #update li {
    	cursor : pointer;
    }
    
    .input {
	  position: relative;
	}

	.eyes {
	  position: relative;
	  left: 50%;
	  bottom:40px;
	  font-size: 22px;
	  cursor: pointer;
	}
</style>
</head>
<body>
	<div id="header"></div>
	<div id="includedContent"></div>
	<div id="content">
            <%@ include file="../include/myPageSidebar.jsp" %>
            
            <div id="update">
            <h2>비밀번호 수정</h2>
            <hr>
            <form action="changePass.do" method="post" enctype="multipart/form-data" id="changePass">
            <h4 style="color:gray">현재 비밀번호</h4>
            <div class= "input">
            	<input id="prePass" type="password" name="memberPwd" class="form-control" style="width:50%;" >
            	<div class="eyes">
			  		<i class="fas fa-eye"></i>
			  	</div>
            </div>
            <br>
            <h4 style="color:gray">새로운 비밀번호</h4>
            <div><input type="password" name="memberNewPwd" id="memberNewPwd" class="form-control" style="width:50%"></div>
            <br>
            <h4 style="color:gray">새로운 비밀번호 확인</h4>
            <div><input type="password" name="memberNewPwdComfirm" id="memberNewPwdConfirm" class="form-control" style="width:50%"></div>
            <div><span id="checkPwd" style="font-size: 15px"></span></div>
            <br><br>
            <div align="center">
                <button class="btn btn-secondary">취소</button>
                <button class="btn btn-primary" type="button" style="background-color:rgb(170, 143, 211); border: 1px soild rgb(170, 143, 211);" onclick="return validate();">수정 완료</button>
            </div>
            </form>
       </div>
       
    </div>
	<%@ include file="../include/footer.jsp" %>
</body>

<script>
	$('#memberNewPwdConfirm').keyup(function() {
		
		var memberNewPwd = $('#memberNewPwd').val();
		var memberNewPwdConfirm = $('#memberNewPwdConfirm').val();
		
		console.log(memberNewPwd);
		console.log(memberNewPwdConfirm);
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/member/checkPass.do",
			type : "POST",
			data : { memberNewPwd : memberNewPwd, memberNewPwdConfirm : memberNewPwdConfirm },
			success : function(result) {

				if(result > 0) {
					$('#checkPwd').html('비밀번호가 일치합니다.');
					$('#checkPwd').css('color', 'greenyellow');
				}
				else {
					$('#checkPwd').html('비밀번호가 일치하지 않습니다.');
					$('#checkPwd').css('color', 'red');
				}
				
			}
		})
	});
	
	function validate() {

		var memberNewPwd = $('#memberNewPwd').val();
		var memberNewPwdConfirm = $('#memberNewPwdConfirm').val();
		
		var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/i;
		if(!regExp.test(memberNewPwd)) {
			alert('유효한 비밀번호를 입력해주세요.');
			
			$('#memberNewPwd').val() = '';
			$('#memberNewPwd').focus();
			
			return false;
		}
		
		if(memberNewPwd != memberNewPwdConfirm) {
			alert('동일한 비밀번호를 입력하시오.');
			$('#memberNewPwdConfirm').val() = '';
			$('#memberNewPwdConfirm').focus();
			
			return false;
		}
		
		else {
			$('#changePass').submit();
			
			return true;
		}
	}
	
	$('.eyes').mousedown(function() {
		
		$('#prePass').prop("type", "text");
		console.log('클');
	});
	
	$('.eyes').mouseup(function() {
		
		$('#prePass').prop("type", "password");
		console.log('릭');
	});
	
</script>

</html>