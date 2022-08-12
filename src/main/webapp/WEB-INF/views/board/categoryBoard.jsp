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
    <title>카테고리 페이지</title>
    
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
      height: 1000px;
      margin: 30px 200px 75px 200px;
      
    }

    #category {
        width: 20%;
        height: 100%;
        float:left;
        text-align:center;
    }

    #imgContent {
        width: 80%;
        height: 80%;
        float:left;
    }

    .linkContent {
        width: 80%;
        height: 80%;
    }

    #mainCategory1 {
        font-weight: bold;
        color: rgb(170, 143, 211);
        font-size: 23px;
    }

   #category hr {
       	width: 80%;
        height: 1.5px;
        border: none;
        background-color: rgb(170, 143, 211);}


    #categoryName>a {
        display: block;
        font-size: 17px;'
        font-weight: bold;
        color: rgb(170, 143, 211);
        margin-top: 20px;
        text-decoration: none;
    }
    
    .linkContent{
    
     margin-left:3%;
     margin-top:5%;
     width:95%;
     
    }

    .linkContent .thumbnail img {
    	cursor: pointer; 
        width: 110px;
        height: 110px;
        float:left;
    }
    
    .linkContent .thumbnail img:hover {
        width: 120px;
        height: 120px;
    }

    .linkContent>div {
       	width:25%;
        height: 170px;
        margin-left: 70px;
        margin-top: 60px;
        float:left;
    }

	#categoryName>a:hover {
		font-weight: bold;
		cursor: pointer;
	}

   #seq{
   		float:right;
   }
  
    #seq>a{
        color: rgb(170, 143, 211);
    }
    #writeLink{
    height:5%;
    width:12%;
    float:right;
    }
    
    #writeLink>a {
        background-color: rgb(170, 143, 211);
        width: 90px;
        height: 35px;
        color: white;
    }

    #pageBtns {
        width: 80%;
        height:20%;
        text-align: center;
        float:left;
        border:none;
    }
    .paging-area>button{
        background-color: rgb(170, 143, 211);
        width: 40px;
        height: 25px;
        line-height: 7px;
        color: white;
        text-align: center;
        border:none;
		border-radius: 12px;
    }
    #searchForm>form>select {
    	width:50px;
	    border:1px solid #999;
	    font-family:'Nanumgothic';
	    border-radius:3px;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance : none;
    }
    
    #searchForm>form>input {
    	  width: 200px;
		  height: 30px;
		  font-size: 15px;
		  border: 0;
	      border-radius:3px;
		  outline: none;
		  padding-left: 10px;
		  background-color: rgb(233, 233, 233);
    }
    
    #searchForm>form>button {
    	background-color: rgb(170, 143, 211);
	    border-radius:3px;
		color: white;
		border:none;
    }
    
    .thum {
		width:110px;
		height:110px;
		background-size: 100% 100%;

		background-repeat: no-repeat;
		    
    }
    .card-header-is_closed{

    background-color: #EF5A31 ;

    color: #FFF ;

    font-weight: bold ;

    text-align: center ;

    float: right;

    margin: 15px 15px 0 0;

    border-radius: 50%;

    font-weight: bold;

    padding: 10px 10px;

    line-height: 20px;
    
    font-size:7px;
    
    width:40px;
    
    height:40px;

}
.thumbnail:hover{
	cursor:pointer;
}

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>

    <div id=content>
        <div id=category>
            <p id="mainCategory1" name="mainCategory">${ mainCategory }</p>
            <hr>
            <div id="categoryName" >
            </div>
		      <script>
		      	$(function() {
		      		
		      		var mainCategoryStr = "${ mainCategory }";
		      		
		      		$.ajax({
		      			url : "${ pageContext.request.contextPath }/boardRest/enrollrestCategory.do",
		      			type : "get",
		      			data : {mainCategory : mainCategoryStr},
		      			success : function(result) {
		      				
		      				var str ="";
		      				
		      				for(var i = 0; i < result.length; i++) {
		      					str += "<a href='${ pageContext.request.contextPath }/board/categoryBoard.do?currentPage=1&mainCategory="+ mainCategoryStr +"&categoryName=" + result[i].categoryName + "'>"
		      								+ result[i].categoryName 
		      						+ "</a>"
		      				}  
		      				$("#categoryName").html(str);
		      			},
		      			error : function() {
		      				console.log("ajax 통신 실패!");
		      			}
		      		});
		      	});
		      </script>
        </div>
        <div id=imgContent align="center">
            <div id="seq">
                <a href="${ pageContext.request.contextPath }/board/categoryBoard.do?currentPage=1&mainCategory=${ mainCategory }&col=COST&order=DESC">높은가격순</a> |
                <a href="${ pageContext.request.contextPath }/board/categoryBoard.do?currentPage=1&mainCategory=${ mainCategory }&col=COST&order=ASC">낮은가격순</a> |
                <a href="${ pageContext.request.contextPath }/board/categoryBoard.do?currentPage=1&mainCategory=${ mainCategory }&col=B.ENROLL_DATE&order=DESC">최신등록순</a>
            </div>
       		
       		 <div class="linkContent">
	            <c:choose>
	            	<c:when test="${ empty list }">
	            		<h5>등록된 글이 없습니다.</h5>
	            	</c:when>
	            	<c:otherwise>
	            		<c:forEach var="i" items="${ list }">
		            		<div class="thumbnail">
		            			<div class = "card-header-is_closed" align="right"> 
					                	<div class = "card-header-text" > ${ i.gradeName } </div > 
					            	</div>
		            			<a>
		            				No.<span>${ i.boardNo }</span>
		            				<div class="thum" style="background-image:url(${ pageContext.request.contextPath }/${ i.titleImg });">
		            				</div>
		            				<span style="font-size:13px;"> ${ i.boardTitle }</span><br>
		            				<span style="font-size:13px; font-weight:bold;"> ${ i.cost }원</span>
		            			</a>
	            			</div>
	            		</c:forEach>
	            	</c:otherwise>
	            </c:choose>
	              <div id="pageBtns">      
	        	<div align="center" class="paging-area">
		        	<!-- 페이징바에서 < 를 담당 -->
		        	<c:if test="${ currentPage != 1 }"  >
		        		<button type="button" class="btn" align="center" onclick="location.href='${ pageContext.request.contextPath }/board/categoryBoard.do?currentPage=${ currentPage  - 1 }&mainCategory=${ mainCategory }<c:if test='${categoryName ne null}'>&categoryName=${categoryName}</c:if>'">&lt;</button>
		        	</c:if>
		        
		            <c:forEach var = "i" begin = "${ pi.startPage }" end = "${ pi.endPage }" step="1" >
			            	<!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
			        	<c:choose>
			            	<c:when test= "${ i ne currentPage }" >
			            			<button type="button" class="btn" align="center" onclick="location.href='${ pageContext.request.contextPath }/board/categoryBoard.do?currentPage=${ i }&mainCategory=${ mainCategory }<c:if test='${categoryName ne null}'>&categoryName=${categoryName}</c:if>'">${ i }</button>
			            	 </c:when>
				            <c:otherwise>
				            		<button disabled>${ i }</button>
				            </c:otherwise>
				        </c:choose>
		            </c:forEach>
		           	<c:if test="${pi.maxPage > 0 and currentPage != pi.maxPage }">
		            	<button type="button" align="center" class="btn" onclick="location.href='${ pageContext.request.contextPath }/board/categoryBoard.do?currentPage=${ currentPage + 1 }&mainCategory=${ mainCategory }<c:if test='${categoryName ne null}'>&categoryName=${categoryName}</c:if>'">&gt;</button>
		            </c:if>
	        	</div>
	        	<br>
	        	<div id="searchForm" align="center">
				<form action="categoryBoard.do" method="get" align="center">
					<input type="hidden" name="currentPage" value="1">
					<input type="hidden" name="mainCategory" value="${mainCategory}">
					<select name="type">
						<option value="BOARD_TITLE">제목</option>
						<option value="BOARD_CONTENT">내용</option>
					</select>
					<input type="text" name="keyword" placeholder="검색어">
					<button type="submit">검색</button>
				</form>
			</div>
            </div>
				<script>
					$(function() {
						$(".thumbnail>a").click(function() {
							var bno = $(this).children().eq(0).text();
							location.href="${ pageContext.request.contextPath }/board/detailView.do?boardNo=" + bno;							
						});
					});
				</script>
				
			<br><br><br><br><br><br><br><br><br>
			
				<br><br><br>
				  <!-- seller 만 보여지게  -->
			      <c:if test="${ result gt 0 }">
			      	  <div id="writeLink" >
			  
			      		<a href="${ pageContext.request.contextPath }/board/enrollBoard.do" type="button" class="btn">작성하기</a>
			      		</div>
			      </c:if>
			      
			    
		      	</span>
        	</div>
            </div>
            
            
        	
        </div>
    </div>
    <br>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
        

</body>
</html> 