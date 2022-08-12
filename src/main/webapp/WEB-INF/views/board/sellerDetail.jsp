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
    <title>판매자프로필페이지</title>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
    #content {
        width: 1000px;
        height: auto;
        margin: auto;
        padding-top : 20px
    }

    #content li {
        list-style-type: none;
    }

    #topContent1>ul>li>span {
        font-size: 20px;
        font-weight: bold;
    }

    #naviContent>a {
        margin-left: 50px;
        text-decoration: none;
        color: black;
    }

    #naviContent>a:hover {
        font-size: 17px;
        color: rgb(170, 143, 211);;
    }

    

    #topContent4 a:hover {
        color: rgb(170, 143, 211);
        font-size: 17px;
    }
    
    #chatLink:hover {
        background-color: wheat;
        color: lightsalmon;
    } 
    
    .paging-area>button{
        background-color: rgb(170, 143, 211);
        width: 40px;
        height: 25px;
        line-height: 7px;
        color: white;
        text-align: center;
        border:none;
		border-radius: 12px
    }
    
    .paging-area>button:hover {
     	background-color: wheat;
        color: lightsalmon;
    }

	#input>li a {
		text-decoration:none;
	}
	
	#chatLink, #detailchat {
        background-color: rgb(170, 143, 211);
        font-size: 20px;
        float: right;
        width: 120px;
        height: 42px;
        color: white;
    }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
    <div id="content" style="border-left:1px solid lightgray; border-right:1px solid lightgray; padding-right:50px;">
             <div id="topContent1">
                <ul>
                    <li>
                        <img width="150" height="150" src="${ pageContext.request.contextPath }/${ seller.filePath }">&nbsp&nbsp&nbsp&nbsp
                        <span>${boardWriter}</span>
                    </li>
                </ul>
            </div>
            
            
             <c:choose>
               <c:when test="${loginUser.memberNick ne boardWriter && !empty loginUser}">
               
               <a href = "${pageContext.request.contextPath}/chat/chat.me?currentPage=1&toNick=${boardWriter}" type="button" class="btn" id="chatLink">채팅하기</a>
               </c:when>
               <c:otherwise>
                  <a href = "" type="button" class="btn" id="detailchat">채팅하기</a>
                   
                   <script>
                               $("#detailchat").click(function() {
                                   alert("잘못된 접근입니다."); //제이쿼리 선언 필수
                               })
                  </script>
                   
               </c:otherwise>
            </c:choose>  
            
        <div id="naviContent">
            <a href="#aboutTeacher">소개</a>
            <a href="#aboutReview">경력</a>
            <a href="#aboutService">서비스</a>
        </div>
        <br>
        <div id="topContent2">
            <ul><h5 id="aboutTeacher" style="font-weight: bold;">소개</h5>
                <li style="white-space:pre;">${ seller.contents }</li>
            </ul>
            <hr>
        </div>
        <div id="topContent3">
            <ul>
                <h5 style="font-weight: bold;" id="aboutReview">경력</h5>
                <li>${seller.career}년</li>
                
            </ul>
            <hr>
        </div>
        <div id="topContent4">
            <ul><h5 id="aboutService" style="font-weight: bold;">서비스</h5><br></ul>
	          	<c:choose>
		          	<c:when test="${ empty list }">
		          		<ul>
		          			<span><br><h5>등록된 글이 없습니다.<br></h5></span>
	          			</ul>
	          		</c:when>
	          		<c:otherwise>
	          			<c:forEach var="i" items="${ list }">
	          					<ul id="input">
	          						<li>
	          							
					                </li> 
	          					</ul>
	          			</c:forEach>
	          		</c:otherwise>
	          	</c:choose>
	   </div>
	        <div id="pageBtns" > 
            <br>     
	        	<div align="center" class="paging-area">
		            <c:forEach var = "i" begin = "${ pi.startPage }" end = "${ pi.endPage }" step="1" >
			            	<!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
			        	<c:choose>
			            	<c:when test= "${ i ne pi.currentPage }" >
			            			<button type="button" class="btn pagingBtn" align="center" value="${ i }" >${ i }</button>
			            	</c:when>
				            <c:otherwise>
				            		<button type="button" class="btn pagingBtn" value="${ i }">${ i }</button>
				            </c:otherwise>
				        </c:choose>
		            </c:forEach>
	        	</div>
        	</div>
	   		<br>
        </div>
    
    	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>

	<script>
		
	$(function() {
		
		var boardWriter = "${boardWriter}";
		var currentPage = ${currentPage};
		
		$.ajax({
    		url : "${ pageContext.request.contextPath }/boardRest/restDetailSeller.do",
  			type : "get",
  			data : {"boardWriter" : boardWriter, "currentPage" : currentPage},
  			success : function(result) {
  				
				var listText = "";
				
  				for(var i in result) {
  					
	  				listText = "<li style='margin-bottom:10px; padding-left: 10px;'>";
	  				listText += "<a href='${ pageContext.request.contextPath }/board/detailView.do?boardNo=" + result[i].boardNo + "'>";
	  				listText += "<span>No." + result[i].boardNo + "</span>";
	  			 	listText += "<img width='100px' height='100px' src='${ pageContext.request.contextPath }/" + result[i].titleImg + "'>&nbsp&nbsp&nbsp&nbsp";
	  			 	listText += "<span>"+ result[i].boardTitle + "</span></a></li>";
	  			 	
	  			 	$("#input").append(listText);
	  			 	$("#input span").css("margin-right", "10px");
  				}
  			},
  				
  			error : function() {
  				console.log("ajax 통신 실패!");
  			}
    	});
		
		$('.pagingBtn').on('click', function() {
			console.log("클릭");
			
			$('#input>li').children().remove();
			
			var boardWriter = "${boardWriter}";
			console.log(boardWriter);
			var currentPage =  $(this).val();
			console.log(currentPage);
			
			$.ajax({
	    		url : "${ pageContext.request.contextPath }/boardRest/restDetailSeller.do",
	  			type : "get",
	  			data : {"boardWriter" : boardWriter,  "currentPage" : currentPage},
	  			success : function(result) {
	  				
					var listText = "";
					var btnText = "";
					
	  				for(var i in result) {
	  					
		  				listText = "<li style='margin-bottom:10px; padding-left: 10px;'>";
		  				listText += "<a style='text-decoration:none;' href='${ pageContext.request.contextPath }/board/detailView.do?boardNo=" + result[i].boardNo + "'>";
		  				listText += "<p>No."+ result[i].boardNo + "&nbsp;&nbsp;&nbsp;</p>";
		  			 	listText += "<img width='100px' height='100px' src='${ pageContext.request.contextPath }/" + result[i].titleImg + "'>&nbsp&nbsp&nbsp&nbsp";
		  			 	listText += "<span>"+ result[i].boardTitle + "</span></a></li>";
		  			 	
		  			 	$("#input").append(listText);
		
		  			 	$("#input span").css("margin-right", "10px");
	  				}
	  			},
	  				
	  			error : function() {
	  				console.log("ajax 통신 실패!");
	  			}
	    	});
		});
	});

	</script>
</html>