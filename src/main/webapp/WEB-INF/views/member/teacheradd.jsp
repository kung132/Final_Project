<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content {
        height: 1000px;
    }
    #exit {
        width: 70%;
        margin-left: 50px;
        margin-top: 30px;
    }
</style>
</head>
<body>
	<div id="header"></div>
	<div id="content">
        <%@ include file="../include/myPageSidebar.jsp" %>
        <div id="exit">
        <c:choose>
        <c:when test="${ empty sellerList }">
        <form action="teacherAdd.do" method="post" enctype="multipart/form-data">
            <h2>선생님 신청</h2>
            <hr>
            <div class="form-group">
                <label for="usr">닉네임 :</label>
                <input type="text" class="form-control" id="usr" style="width: 40%;" value="${ loginUser.memberNick }" readonly>
            </div>
            <div>
                <label for="usr">카테고리(대분류) : </label>
            <div class="form-check-inline">
				<label class="form-check-label">
				   <input type="radio" class="form-check-input" name="optradio" value="외국어">외국어
				</label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="optradio" value="악기">악기
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="optradio" value="스포츠">스포츠
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="optradio" value="취미">취미
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="optradio" value="시험/자격증">시험/자격증
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="optradio" value="컨설팅">컨설팅
				  </label>
				</div>
            </div>
            
            <div class="form-group">
                <label for="sel1">카테고리(소분류) :</label>
                <select class="form-control" id="sel1" name="categoryName" style="width: 20%;">
                	
				</select>
              </div>
            <div>
                <label for="comment">경력(년) :</label>
                <input type="number" class="form-control" id="usr" name="career" style="width: 20%;">
            </div>
            <div class="form-group">
                <label for="comment">소개 :</label>
                <textarea class="form-control" rows="5" id="comment" name="content" style="resize: none;"></textarea>
            </div>
            <div class="form-group">
                <label for="comment">첨부파일 :</label>
                <input type="file" name="upfile" multiple accept=".jpg, .png">
            </div>
            <div align="center">
                <button class="btn btn-secondary">취소</button>
                <button class="btn btn-primary" type="submit">신청</button>
            </div>
       </form>
       </c:when>
       <c:when test="${ !empty sellerList && sellerList.get(0).get('ACCEPT_DATE') == null }">
       		<div style="background-image: url(../resources/images/teacher.jpg); background-repeat:no-repeat; height:600px;">
       			<div style="padding-left:40px; padding-top:120px; font-size: 25px; font-weight: 600">선생님 신청 대기중입니다.</div>
       		</div>
       </c:when>
       <c:otherwise>
       		<div style="background-image: url(../resources/images/teacher.jpg); background-repeat:no-repeat; height:600px;">
       			<div style="padding-left:90px; padding-top:120px; font-size: 25px; font-weight: 600">이미 선생님 입니다.</div>
       		</div>
       </c:otherwise>
       </c:choose>
       </div>
    </div>
    
    <jsp:include page="../include/footer.jsp"></jsp:include>
    
    
</body>

<script>

	$('input:radio[name=optradio]').change(function() {
		
		$('#sel1').children().remove();

		var categoryOption = $(this).val();
		console.log(categoryOption);

		$.ajax({
			url : "${ pageContext.request.contextPath }/category/category.do",
			type : "GET",
			data : { categoryOption : categoryOption },
			success : function(catResult) {
				
				console.log(catResult);
				if(catResult == null) {
					$('#sel1').append('<option>카테고리를 선택해주세요</option>');
				}
				else {
					for(var i in catResult) {
						$('#sel1').append('<option>' + catResult[i].categoryName + '</option>');
					}
				}
				
			}
		})
	});
</script>
</html>