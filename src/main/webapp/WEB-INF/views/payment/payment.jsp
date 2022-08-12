<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제페이지</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!--   Google Fonts -->
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
 
 
 <link rel="stylesheet" href="../resources/har/har.css">
 <link rel="stylesheet" href="../resources/har/bootstrap.min.css">
</head>

<body id="bootstrap-overrides">


<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>


  <div class="container row" > 
   
    <div class="col-md-6" style="float: none; margin-left:400px" >
		
    <div class="panda" style="width:130%;" >
    <div align="right">
      <a class="payment_close_btn" onclick="history.back();"><img src="../resources/har/x.png" width="30px" height="30px"></a>
      </div>
      <div class="py-1 text-center">

       <h1 class = "title" style="font-weight: bold;">재능판다 안전결제<img src="../resources/har/panda.PNG" width="35px" height="35px"></h1>
         
    </div> <br><br>																		
    
    <form class="needs-validation"  action="/payment/payment.do" method="post">

      <div id="p1">
      <table class="j-n">
       <tr>
         <th rowspan="2"> <img src="../resources/har/panda.PNG" width="100" height="100"> </th>
         <td class="g-name" style="font-weight:bold;">&nbsp;&nbsp;판매자 : &nbsp;&nbsp;&nbsp;${ board.boardWriter }</td>
         <input type="hidden" name="payno" value="${payno}">
       </tr>
       <tr>
         <td class="l-name" style="font-weight:bold;">&nbsp;&nbsp;강의제목 : &nbsp;&nbsp;&nbsp;${ board.boardTitle }</td>
       
      </table>
    </div>

    <div class="p2"  style="padding: 10px; width:480px">
      
     <span class = "p2_1">${ board.cost }원</span>
                                                                    
  	</div>
    
    <hr class="my-5">


  

    

  <div class="info" style="padding: 10px; width:480px">

    <img src="../resources/har/money.png" width="20" style="margin-left: 10px;"> <span style="font-family: 'Noto Sans KR';  size: 15px; "> 안심하고 결제하세요!</span> <br>
                                                                          <span style="font-size: 10px; color: gray; margin-left: 30px;">걸제한 금액은 거래를 확정하기 전까지 고수님께 지급되지 않습니다. </span>

  </div>
  <br>
	<br><br><br>
  <div class="service">
  <h3 class="my-0" style="font-weight: bold;">서비스 진행일</h3> <br>

  <input id="credit" type="radio" class="form-check-input" name="sysdate" required> 
  <label class="form-check-label" style="font-size:15px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정해진 날짜가 없어요 </label> <br><br>
  <input id="credit" type="radio" class="form-check-input"  name="sysdate" checked="" required>
  <label class="form-check-label" style="font-size:15px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 협의한 날짜가 있어요 </label>

  <div class="p2"  style="padding: 10px; width:480px">
    <fmt:parseDate value="${ board.stDate}" var="stdate" pattern="yyyy-MM-dd"/>
    <fmt:parseDate value="${ board.fnDate}" var="fndate" pattern="yyyy-MM-dd"/>
      
    <span class = "p2_1 " >수업시작 : <fmt:formatDate value="${ stdate }" />~수업종료 : <fmt:formatDate value="${ fndate }" /></span> 
                                                                   
 </div>

</div>

<br><br><br><br>

  
    <div id="paypal">
    

        <h3 class="title" style="font-weight: bold;">결제 수단</h3><br>

                <div class="form-check">

                    <input id="credit" type="radio" class="form-check-input" name="payemnt method" checked="" required>
                    <label class="form-check-label" for="credit">신용 / 체크카드</label>
                </div>

                 <div class="paypal">
                
                <div class="col-12">
                <img src="../resources/har/circle.png"alt="" width="10px" height="10px">
              <label for="../cc-number" class="form-label">카드 번호</label>
              
              <input style="font-size:18px;" type="text" class="form-control" id="cc-number" name="cardNo" placeholder="카드번호를 입력해주세요." required>
              <div class="invalid-feedback">
                     카드번호 입력해주세요.
              </div>
            </div>
            <br>
            <div class="col-12">
              <img src="../resources/har/circle.png" alt="" width="10px" height="10px">
              <label for="cc-d" class="form-label">카드 유효기간</label>
              
              <input style="font-size:18px;" type="text" class="form-control" id="cc-d" placeholder="MM(월) / YY(년)" name="cardValidate" required>
              <div class="invalid-feedback">
              카드 유효기간을 입력해주세요.
              </div>
            </div>
            <br>
            <div class="col-12">
              <img src="../resources/har/circle.png" alt="" width="10px" height="10px">
              <label for="cc-n" class="form-label">카드 비밀번호 (앞 두자리)</label>
             <br>
              <div class="pwd-1" >
              <input type="text" class="form-control_1" id="cc-p" name="cardPassword" placeholder="" required maxlength="2">
              </div>
              <div class="pwd">
              <img src="../resources/har/stars.png" width="70px">
              </div>
            </div>

             <div class="invalid-feedback">
                카드 비밀 번호를 입력해주세요
             </div>

             <br>
            
            <div class="col-12">
              <img src="../resources/har/circle.png" alt="" width="10px" height="10px">
                <label for="cvc" class="form-label">cvc번호(카드 뒷면의 CVC 번호 3자리)</label>
                <input type="text" class="form-control_1" id="cvc"  name="cvc" required maxlength="3">
               
                <div class="invalid-feedback">
                  cvc번호를 입력해주세요
                </div>
            </div>

          
          <br>
        </div>
        <br><br><br><br>
        <input id="credit" type="radio" class="form-check-input" name="payemnt method">
          <label class="form-check-label" for="credit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;만나서 결제</label> <br><br>


          <h3 class="my-0" style="font-weight: bold;">결제금액</h3>
			<br>
          <div class="row g-3">
            <div class="col-sm-5">
              
            <span class="my-3" style="color: gray; font-size:15px;" >서비스금액</span>
              
            </div>
            
              <div class="col-sm-5">
            <span class="text-muted" style="font-size:15px;"> ${ board.cost}원</span>
              </div>
          </div>
            
          <br> 
          
          <div class="row g-3">
              <div class="col-sm-5">
              <span class="my-3" style="color: gray; font-size:15px;">재능판다 수수료</span>
              </div>

              <div class="col-sm-5">
              <span class="text-muted" style="font-size:15px;">3000원</span>
              </div>      
          </div>

       <hr class="my-4">
		
          <div class="row g-3">
              <div class="col-sm-5">
              <span class="my-3" style="color: black;font-weight:bold; font-size:15px;">최종 결제금액</span>
              </div>

              <div class="col-sm-5">
              	<strong style="font-size:15px; font-weight:bold;">${ board.cost +3000 }원</strong>
              </div>
          </div>
          <br><br><br>
        </div>

        <br>

       <div class="agree" >

        <h3 class="my-0" style="font-weight: bold;">이용동의</h3> <br>

          <div class="form-check">
            <input id="agree" name="agree_all" type="checkbox" class="form-check-input" checked="" required>
            <label class="form-check-label" for="agree">전체 약관을 확인하고 결제에 동의합니다</label>
            
            <div class="col-12 ps-sm-4">
            <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="" required>
            <label class="form-check-label" for="agree">서비스 이용약관(필수) </label></div>
            
            <div class="col-12 ps-sm-4">
              <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="" required>
              <label class="form-check-label" for="argee">개인정보제3자제공동의(필수)</label></div>
              
              <div class="col-12 ps-sm-4">
                <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="" required>
                <label class="form-check-label" for="agree">개인정보처리방침(필수)</label></div>
              
                <div class="col-12 ps-sm-4">
                  <input id="agree" name="agree" type="checkbox" class="form-check-input" checked="동의하지 않았습니다.">
                  <label class="form-check-label" for="agree">광고성정보수신동의(선택)</label></div>

          </div>
        </div>

        <div class="col-md-9">
        	<hr class="my-4">
        
          <button type="submit" class="btn-submit"  value="${(sessionScope.loginUser).memberNo}">결제하기</button>
        </div>

      </main>
  </form>
  </div>
  </div>
  </div>
   <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  	
  	<script>
  	/*
  	fuction .btn-submit(payment){
  		
  		consol.log("문자를 전송합니다.";)
  		$("#smsForm").attr("action",paymnet+".do");
  		$("#smsForm").submit();
  		
  	}
  	*/
  	
  

	 //  카드 폼 유효성 검사 정규표현식
	/* var cardNoReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 숫자만
	var cardValidateReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 숫자만
	var cardPwdReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 숫자만
	var cvReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 숫자만 */
	
	/* 
	(function () {
	    'use strict'
	    var forms = document.querySelectorAll('.needs-validation')

	    Array.prototype.slice.call(forms)
	      .forEach(function (form) {
	        form.addEventListener('submit', function (event) {
	          if (!form.checkValidity()) {
	            event.preventDefault()
	            event.stopPropagation()
	          }
	  
	          form.classList.add('was-validated')
	        }, false)
	      })
	  })() */
  	
  	</script>
  	
</body>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="../resources/har/form-validation.js"></script>
<script src="../resources/js/jquery.min.js"></script>
<script src="../resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="../resources/js/popper.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>


</html>