<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 상세 게시글</title>
    
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
        width: 850px;
        height: auto;
        background-color:white;
    }

   #content>h6>a {
      color: black;
   }
   
   #content>h6>a:hover {
      color: black;
      font-weight: bold;
   }
   

    #category {
        width: 20%;
        height: 100%;
    }

    #sellingContent {
        width: 80%;
        height: 100%;
    }

    #topContent1 {
        width: 100%;
        height: 20%;
    }

    #topContent1>table {
        text-align: center;
        border-collapse: separate;
        border-spacing: 20px 2px;
    }

    #topContent1>table a {
        text-decoration: none;
    }

    #heart{
        border: 1px solid rgb(170, 143, 211);
        width: 150px;
    }

    #heart:hover{
        color: white;
        background-color: rgb(170, 143, 211);
    }

    .zzim {
        color: red;
    }

    #nameOfTeacher {
        color: rgb(170, 143, 211);
        font-weight: bold;
    }

    #contentTable {
        width: 250px;
    }

    #topContent2{
        margin-top: 40px;
        position: sticky;
        top: 137px;
        width: 100%;
        background-color:transparent;
        height: 50px;
        z-index: 500;
    }

    #topContent2>a {
        width: 150px;
        background-color: rgb(170, 143, 211);
        height: 35px;
        color: white;
    }

    #topContent3>table>tr {
        width: 100%;
        text-align: left;
        border-spacing: 0px 10px;
    }
    
    #topContent3>hr {
        width: 100%;
        background-color: lightslategray;;
    }
    
    #updateBtn, #deleteBtn {
       width: 100px;
        background-color: rgb(170, 143, 211);
        height: 35px;
        color: white;
    }
 .star-ratings {
            color: #aaa9a9; 
            position: relative;
            unicode-bidi: bidi-override;
            width: max-content;
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 1.3px;
            -webkit-text-stroke-color: #2b2a29;
          }
   .star-ratings2 {
            color: #aaa9a9; 
            position: relative;
            unicode-bidi: bidi-override;
            width: max-content;
            font-size: 3.25rem;
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 1.3px;
            -webkit-text-stroke-color: #2b2a29;
          }
          
        .star-ratings-fill {
            color: #fff58c;
            padding: 0;
            position: absolute;
            z-index: 1;
            display: flex;
            top: 0;
            left: 0;
            overflow: hidden;
            -webkit-text-fill-color: RGB(170, 143, 211);
          }
          
        .star-ratings-base {
            z-index: 0;
            padding: 0;
          }
          .content-tr{
           display:none;
        }
        .list-area>tbody>.title-tr:hover{
           background: RGB(170, 143, 211);
           cursor:pointer;
          }
           .btnForPaging{
           padding: 3px 5px;
            font: menu;
            font-size:15px;
             color: white;
           background: RGB(170, 143, 211);
        }
.modal {
    display: none;
    z-index: 500;
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.8);
}
.modalBox {
     position: relative;
    text-align: center;
    top : 20%;
    left : 20%;
    position : sticky;
    
   
}
#chatLink:hover, #buyLink:hover {
        background-color: wheat;
        color: lightsalmon;
    }
#btn-hover1:hover, #btn-hover2:hover, #btn-hover3:hover, #btn-hover4:hover, #updateBtn:hover, #deleteBtn:hover{
		background-color: wheat;
        color: lightsalmon;
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
    
    font-size:13px;

}
#chatLink, #buyLink ,#detailchat, #buyLink2 {
        background-color: rgb(170, 143, 211);
        width: 100px;
        height: 35px;
        color: white;
    }
</style>
</head>
<body>



<div class="modal">
    <div class="modalBox">
    </div>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="resource/js/bootstrap.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b929b75e3c935f950ac1a6695d1ab5d9&libraries=services""></script>
   <jsp:include page="/WEB-INF/views/include/topbar.jsp"/>

<div align="center" style=" background-color: #f6f6f6;">  
    <div id="content"style=" border-left:1px solid lightgray; border-right:1px solid lightgray;" > 
    <br><br>
    <div align="left">   
    <h6 style="margin-left:10px;"><a href="${pageContext.request.contextPath}/board/categoryBoard.do?currentPage=1&mainCategory=${category.mainCategoryName}">${category.mainCategoryName}</a>
    &nbsp;&nbsp;>&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/board/categoryBoard.do?currentPage=1&mainCategory=${category.mainCategoryName}&categoryName=${category.categoryName}">${category.categoryName}</a></h6><br><br>
    </div>   
        <div id=sellingContent align="center">
             <div id="topContent1">
                <table>
                    <tr style="text-align: left;">
                        <th colspan="3" style="font-size: 30px;">${ board.boardTitle } 
                        <div class = "card-header-is_closed" align="right"> 
			                <div class = "card-header-text" > ${ sellerLoc.GRADE } </div > 
			            </div ><hr> 
                        </th>
                    </tr>
                        
                    <tr>
                        <td style="text-align: center;" rowspan="2">
                           <c:forEach var="i" items="${ attachment }">
                           
                              <c:if test="${ i.fileLevel eq 1 }">
                                  <img width="450px" height="350px" src="${ pageContext.request.contextPath }/${ i.filePath }${ i.changeName }"></img>
                              </c:if>
                           </c:forEach>
                        </td>
                       
                        <td style="text-align: center; font-szie:23px; font-weight:bold;">
                            
                        </td>
                          <td style="text-align: center;" rowspan="2">
                            <a href="${pageContext.request.contextPath}/board/sellerDetail.do?currentPage=1&boardWriter=${board.boardWriter}"> 
                                <img width="80" height="100" src="${ pageContext.request.contextPath }/${ seller.filePath }">
                                <p id="nameOfTeacher" style="color:black;">${ board.boardWriter }</p>
                                
                         <c:choose>
               <c:when test="${loginUser.memberNick ne board.boardWriter && !empty loginUser}">
               
                <a type="button" class="btn" id="chatLink" data-value = "${ board.boardWriter }">채팅하기</a>
               </c:when>
               <c:otherwise>
                   <a type="button" class="btn" id="detailchat" >채팅하기</a>
                   
                   <script>
                               $("#detailchat").click(function() {
                                   alert("잘못된 접근입니다."); //제이쿼리 선언 필수
                               })
                  </script>
                   
               </c:otherwise>
               </c:choose>  
                            </a><br><br>
                               가격:  ${ board.cost }
                            <hr>   
                            <c:choose>
                            	<c:when test="${loginUser.memberNick ne board.boardWriter && !empty loginUser}">
	                            	<a type="button" class="btn" id="buyLink" data-value = "${ board.boardNo }">구매하기</a>
	                            </c:when>
	                            <c:otherwise>
				                   <a type="button" class="btn" id="buyLink2" data-value = "${ board.boardNo }">구매하기</a>
				                   
				                   <script>
				                               $("#buyLink2").click(function() {
				                                   alert("잘못된 접근입니다."); //제이쿼리 선언 필수
				                               })
				                  </script>
				                   
				               </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="topContent2" style="margin-right:150px;">
                <a href="#aboutService" type="button" class="btn" id="btn-hover1">서비스 설명</a>
                <a href="#aboutService" type="button" class="btn btn-hover" id="btn-hover2">취소/환불규정</a>
                <a href="#aboutRefund" type="button" class="btn btn-hover" id="btn-hover3">선생님 위치</a>
                <a href="#aboutReview" type="button" class="btn btn-hover" id="btn-hover4">서비스 평가</a>
            </div>
            <div id="topContent3" >
                <table>
                <br>
                    <tr>
                        <td colspan="3">
                        <div align="right">
                             <a type="button" class="btn" id ="heart" onclick = "updatezzim();">
                                <span id="heartSpan" style="font-size: 20px;">♥<span id="heart_count"></span></span>
                            </a>
                          </div>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h6 style="font-weight: bold;  border-collapse: separate; border-spacing: 0px;" id="aboutService">전문가 이력</h6>
                        </td>  
                    </tr>
                    <tr>
                        <td colspan="3">${ board.career }<hr></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h6 style="font-weight: bold;  border-collapse: separate; border-spacing: 0px;">서비스 설명</h6>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">${ board.boardContent }<hr></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h6 style="font-weight: bold;  border-collapse: separate; border-spacing: 0px;">서비스 날짜</h6>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                        <fmt:parseDate value="${ board.stDate}" var="stdate" pattern="yyyy-MM-dd"/>
                        <fmt:parseDate value="${ board.fnDate}" var="fndate" pattern="yyyy-MM-dd"/>
                            <h6 style="font-weight: bold;" id="aboutDate">수업시작 : <fmt:formatDate value="${ stdate }" /></span> </h6>
                            <br>
                            <h6 style="font-weight: bold;" id="aboutDate">수업종료 : <fmt:formatDate value="${ fndate }" /></span></h6>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h6 style="font-weight: bold;  border-collapse: separate; border-spacing: 0px;" id="aboutRefund">취소 및 환불 규정</h6>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">가. 레슨 환불기준 원칙
학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)
- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소
폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하 기 위하여 
필요한 조치를 하여야 한다.
                          
1. 레슨을 제공할 수 없거나, 레슨 장소를 제공할 수 없게 된 날 : 이미 납부한 레슨비 등을 일한 계산한 금액 환불

2. 레슨기간이 1개월 이내의 경우
- 레슨 시작전 : 이미 납부한 레슨비 전액 환불
- 총 레슨 시간의 1/3 경과전 : 이미 납부한 레슨비의 2/3에 해당액 환불
- 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액 환불
- 총 레슨시간의 1/2 경과후 : 반환하지 않음

3.레슨 기간이 1개월을 초과하는 경우
- 레슨 시작전 : 이미 납부한 레슨비 전액 환불
- 레슨 시작후 : 반환사유가 발생한 당해 월의 반환 대상 레슨비(레슨비 징수기간이 1개월 이내인 경우에 따라 산출된 
수강료를 말한다)와 나머지 월의 레슨비 전액을 합산한 금액 환불

* 총 레슨 시간의 레슨비 징수기간 중의 총레슨시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 
레슨시간을 기준으로 함 <hr></td>
                    </tr>
                    <tr>                            
                        <td colspan="3">
                            <h6 id="aboutLocation" style="font-weight: bold;">선생님 위치</h6><br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div id="map" style="width:100%;height:400px; border: 1px solid black;  float:left; "></div>
                           
                          
                        </td>
                    </tr>
                    <tr>                            
                        <td colspan="3">  <hr><h6 id="aboutLocation" style="font-weight: bold;">부가 설명</h6></td>
                    </tr>
                     <tr>
                         <td colspan="3" style="">${board.placeContent}<hr></td>
                    </tr>
                    <tr>                            
                        <td colspan="3"><h6 id="aboutLocation" style="font-weight: bold;">서비스 상세 내용</h6></td>
                    </tr>
                    <tr>
                        <td colspan="3">${ board.boardContent }<hr></td>
                   </tr>
                       <c:forEach var="i" items="${ attachment }" varStatus="status">
                          <c:if test="${ ! status.first and i.originName ne null}">
		                    	<tr>
			                        <td id="contentImg${ i }" colspan="3" align="center">
			                            <img  style="max-width: 100%; max-height: 100%;" src="${ pageContext.request.contextPath }/${ i.filePath }${ i.changeName }"><br><br>
			                        <hr></td>
			                    </tr>
		                    </c:if>
                       </c:forEach>
                     <tr>
                        <td colspan="3">
                            <h6 style="font-weight: bold;">리뷰</h6><br>
                        </td>
                    </tr>
                    <tr>
                        <td id="aboutReview" colspan="3">
                            <div id="btn">
                            <c:if test="${listCount > 0}">
                                <button class="bntForAjax" style="margin-right:10px; color: white; background-color: RGB(170, 143, 211); 
                                          border: none; float: left ;" value=11 >최신순</button>
                              <button  class="bntForAjax" style="margin-right:10px; color: white; background-color: RGB(170, 143, 211); 
                                          border: none; float: left ;" value=12 >오래된순</button>
                             <button class="bntForAjax" style="margin-right:10px; color: white; background-color: RGB(170, 143, 211); 
                                          border: none; float: left ;" value=13 >별점높은순</button>
                              <button class="bntForAjax" style="margin-right:10px; color: white; background-color: RGB(170, 143, 211); 
                                          border: none; float: left ;"value=14 >별점낮은순</button>
                              </c:if>
                             <c:if test="${ 0 < tradeCom }">
                                   <form action="enroll.do" method="get" enctype="multipart/form-data">
                                   <input type="hidden" name="memberNo" value='${loginUser.memberNo}'>
                             <input type="hidden" name="boardNo" value='${board.boardNo}'>
                             <input type="hidden" name="boardTitle" value='${board.boardTitle}'>
                                         <button style="margin-right:10px; color: white; background-color: rgb(7, 150, 245); 
                                          border: none; float: right ;" onclick="location.href='${pageContext.request.contextPath}enroll.do'">후기등록</button>
                                    </form>
                            </c:if>
                             <br><br>
                          </div>
                       </td>
                   </tr>
                    <tr><td>
                       <div style="height:100px;" id="totalInfo">
                           <div style="float: left; font-size: 25px; margin-top: 30px; margin-bottom:25px"></b>${listCount}개의 수강후기</b></div>
                          
                          <!--평균별점-->
                          <div style="float: right;">
                            <div style="float: left; font-size: 25px; margin-top: 25px;"><b>평균 별점 :</b></div>
                            <div  style="float: left; margin-left: 20px; margin-right: 20px; " class="star-ratings2">
                              <div 
                                class="star-ratings-fill space-x-2 text-lg" style="width:${avg*20}%;"  >
                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                              </div>
                              <div  class="star-ratings-base space-x-2 text-lg"  >
                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                              </div>
                            </div>
                            <div style="float: left; font-size: 20px; margin-top: 30px; "></b>(${avg})</b></div>
                          </div>
                               <hr style="float:left;">
                      </div> 
                   </td></td>
               <tr><td>
                       <div id ="list"  style=" margin-left:80px;" >
              
                           <table style="display:inline;" class="list-area" > 
                           <thead style=" text-align: center;">
                             <th style="width: 80px;">닉네임</th>
                             <th  style="width: 400px;">제목</th>
                             <th style="width: 50px;" >별점</th>
                           </thead>                     
                           <tbody>
                              <c:if test="${listCount eq 0}">
                             <tr>
                                   <td colspan="3" style="text-align: center;"><h5 style="font-weight: bold;"><br><br>등록된 리뷰가 없습니다.</h5></td>
                                </tr>
                          </c:if>
                          <!-- ajax -->

     
                           </tbody>
                          </table>
                      </div>   
                   <hr></td></tr>    
                   <tr><td>
                        <!-- 페이징 -->
       
                <div style=" margin-top:20px; text-align: center;" >   
                
                 
                   <c:forEach begin="${startPage }" end="${endPage }" var="p">
                       <c:choose>
                           <c:when test="${p == currentPage}">
                               <button id="one" class="btnForPaging">${p }</button>
                           </c:when>
                           <c:when test="${p != currentPage }">
                               <button  class="btnForPaging" >${p }</button>
                           </c:when>
                       </c:choose>
                   </c:forEach>
                
               </div>   

                   <hr></td></tr>
               </table>
             </div>
                <div id="btnsForSeller" style="float: right;" >
              <c:if test="${ loginUser.memberNick eq board.boardWriter}">
                <button onclick="location.href='updateBoard.do?boardNo=${board.boardNo}'" type="button" class="btn" id="updateBtn">수정하기</button>
                <button onclick="deleteModal();" type="button" class="btn" id="deleteBtn">삭제하기</button>
              </c:if>
           </div>
            </div>
             <br>
            
           <br>
        </div>
        </div>
    </div>
  
    <br>
    <input type="hidden" id="currentPage" value=1>
   <input type="hidden" id="sort" value=1>
    
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
  <script>
    $(document).ready(function(){
        $(document).on("click",".list-area>tbody>.title-tr",function(){
                var detail = $(this).next("tr");
                if(detail.css("display") == "none") {  
                    detail.parent().children(".content-tr").slideUp(1);
                    detail.slideDown(1);
                 }
                 else {
                     detail.slideUp(1);
                 }
    
            });
        });
       </script>
      <script type="text/javascript">
    
             function fnImgPop(url){
              var img=new Image();
              img.src=url;
              var img_width=img.width;
              var win_width=img.width+25;
              var img_height=img.height;
              var win=img.height+30;
              var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
              OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
             }
    
    </script>
       
   <script>
   
   document.getElementById('aboutDate').value = new Date().toISOString().substring(0, 10);
   
      function deleteModal() {
         var result = confirm("해당 게시글을 삭제하시겠습니까?");
         if(result == true ) {
            location.href="${ pageContext.request.contextPath }/board/deleteBoard.do?currentPage=1&boardNo=${board.boardNo}&mainCategory=${category.mainCategoryName}&categoryName=${category.categoryName}"
         } 
         
      };
      
      $(function() {
         $("#heart").click(function() {
            $("#heartSpan").toggleClass("zzim");
         })
      });
   </script>

<script>
   
    $(function(){
       $("#chatLink").click(function(){
           
           // 클릭될때마다 채팅 url 요청
           // /javajo/chat.me?toNick=X
                   
           // X 먼저 구하기
           var toNick = document.getElementById("chatLink").getAttribute('data-value');
                   
           window.open("${ pageContext.request.contextPath }/chat/chat.me?currentPage=1&toNick="+toNick);
       });
    });
  
   
    </script>
    
    <script>
   
    $(function(){
       $("#buyLink").click(function(){
           
           // 클릭될때마다 채팅 url 요청
           // /payment.do?payno=X
                   
           // X 먼저 구하기
          var payno = document.getElementById("buyLink").getAttribute('data-value');
           
          location.href="${ pageContext.request.contextPath }/payment/payment.do?payno="+payno;
       });
    });
  
   
    </script>
    
     <script>
   
   $(function() {
      countFunction();
      }) 
   
   
  function updatezzim(){
      
      var boardNo = "${board.boardNo}";
      
      $.ajax({
         type: "post",
         url: "${ pageContext.request.contextPath }/zzim/zzim1.do",
         data: {
            
            boardNo:boardNo
         },
         success: function(result) {
            
             
              if(result > 0){//찜 되어 있을 때
                    
                    countFunction();
                     alert("찜 삭제");
                     $("#heartSpan").removeClass("zzim");
                      
                  }
                  
                  else{//찜 안되어 있을 때
                     
                     countFunction();
                       alert("찜 추가");
                      $("#heartSpan").addClass("zzim");
                  }
                     
              },
              error : function() {
                 console.log(" ajax 실패");
              }
            
         })};
      
      

   
   
   function countFunction(){
            
             var boardNo = "${board.boardNo}";
               
               $.ajax({
                  type: "post",
                  url: "${ pageContext.request.contextPath }/zzim/zzim2.do",
                  data: {
                     
                     boardNo:boardNo
                  },
                  success: function(count) {
                              $("#heart_count").html(count);
                                  console.log(" ajax 성공");
                              
                       },
                       error : function() {
                          console.log(" ajax 실패");
                       }
                     
               })      
         };
            
      
   
   </script>
    
 <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var points =[];
//주소로 좌표를 검색합니다
geocoder.addressSearch('${sellerLoc.ADDRESS}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {
   
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    points.push(result[0].y);
    points.push(result[0].x);
    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });
   
    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">판매자 위치</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    

function locBtn_click() {

if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            points.push(lat);
            points.push(lon);
            // console.log(lat);
            // console.log(lon);
         
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="width:150px;text-align:center;padding:6px 0;">현재위치</div>'; 
          
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요...'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition); 
    
    getDistance(points[0],points[1],points[2],points[3]);
    var forRerange=[]
    forRerange.push(new kakao.maps.LatLng(points[0],points[1]) );
    forRerange.push(new kakao.maps.LatLng(points[2],points[3]) );
    var bounds = new kakao.maps.LatLngBounds();    
    bounds.extend(forRerange[0]);
    bounds.extend(forRerange[1]);
    setBounds(bounds);
    
}    
function setBounds(bounds) {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
function getDistance(lat1, lon1, lat2, lon2) {
   
    if ((lat1 == lat2) && (lon1 == lon2))
        return 0;

    var radLat1 = Math.PI * lat1 / 180;
    var radLat2 = Math.PI * lat2 / 180;
    var theta = lon1 - lon2;
    var radTheta = Math.PI * theta / 180;
    var dist = Math.sin(radLat1) * Math.sin(radLat2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radTheta);
    if (dist > 1)
        dist = 1;

    dist = Math.acos(dist);
    dist = dist * 180 / Math.PI;
    dist = dist * 60 * 1.1515 * 1.609344 * 1000;
    if (dist < 100) dist = Math.round(dist / 10) * 10;
    else dist = Math.round(dist / 100) * 100;
 
    $('#dis').text("약 "+dist*1/1000+"Km");
}
}
</script>

   <script>
   $(document).ready(function(){
      $(document).on("click",".imgForReview",function(){
           let img = new Image();
           img.src = $(this).attr("src");
            img.width = "800"
           $('.modalBox').html(img);
           $(".modal").show();
       });
   // 모달 클릭할때 이미지 닫음
       $(".modal").click(function (e) {
       $(".modal").toggle();
     });
   });
   </script>
   
      <script>

      $(function() {
           $("#one").css({"background-color" : "black"});
         var boardNo = "${board.boardNo}";
         var currentPage = document.getElementById('currentPage').value;
         var sort = document.getElementById('sort').value;
         var list = "${listCount}";
         if(list >0){
            $.ajax({
               url : "${ pageContext.request.contextPath }/boardRest/reviewRest.do",
               type : "get",
               data : {boardNo : boardNo,
                     currentPage : currentPage,
                     sort :sort},
               success : function(result) {//0이 커런트 넘 1 솔트방법 2 리뷰 리스트 3 파일 리스트 
                  var str="";
                  for(var i =0; i< result[2].length; i++){
                     str+="<tr class='title-tr' style='text-align: center;'>"
                          +"<td font-size: '15px;'>"+ result[2][i].MEMBER_NICK +"</td>"
                          + "<td >"+ result[2][i].REVIEW_TITLE +"</td>"
                          +"<td>"
                                 +"<div class='star-ratings'>"
                                 +"<div class='star-ratings-fill space-x-2 text-lg'  style='width:"+result[2][i].REVIEW_STAR * 20 +"%'>"
                                 +"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
                                 +"</div>"
                                 +"<div class='star-ratings-base space-x-2 text-lg'>"
                                 +"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
                                 +"</div>"
                                 +"</div>"
                                 +"</td>"
                                 +"</tr>"
                                 
                                 //상세
                                 +"<tr class='content-tr'>"
                                +"<td colspan='2'>"
                                +"<div>"
                                +"<hr>"
                                +"<h6  style='font-weight: bold;'>이미지 (클릭시 확대)</h6>"
                                +"<br>";
                                for(var j=0; j< result[3].length; j++){
                                   if(result[2][i].REVIEW_NO == result[3][j].reviewNo){
                                        str+="<img class='imgForReview' src='${ pageContext.request.contextPath }/"+ result[3][j].filePath + result[3][j].changeName +"' width='150' height='100'>"
                                   }
                                }
                                str+="<hr>"
                                +"<h6  style='font-weight: bold;'>상세후기</h6>"
                                +"<br>"
                                +"<textarea  style='resize: none;' cols='55' rows='10'>"+ result[2][i].REVIEW_CONTENT +"</textarea>"
                                +"</div>"
                                +"</td>"
                                +"</tr>";  
                 
                              
                  }
                  
                   $(".list-area>tbody").html(str);
                  
               },
               error : function() {
                  
               }
            });
         }
      });
         
      
      </script>
   
<script>//정렬일때만 
$(document).ready(function(){
      $(document).on("click",".bntForAjax",function(){
         var temp = $(this).val() -10;
         $(".btnForPaging").css({"background-color" : "RGB(170, 143, 211)"});
         $("#one").css({"background-color" : "black"});
         document.getElementById('sort').value = temp;
         document.getElementById('currentPage').value = 1;
         var boardNo = "${board.boardNo}";
         var currentPage = document.getElementById('currentPage').value;
         var sort = document.getElementById('sort').value;
         $.ajax({
            url : "${ pageContext.request.contextPath }/boardRest/reviewRest.do",
            type : "get",
            data : {boardNo : boardNo,
                  currentPage : currentPage,
                  sort :sort},
            success : function(result) {//0이 커런트 넘 1 솔트방법 2 리뷰 리스트 3 파일 리스트 
               var str="";
               for(var i =0; i< result[2].length; i++){
                  str+="<tr class='title-tr' style='text-align: center;'>"
                       +"<td font-size: '15px;'>"+ result[2][i].MEMBER_NICK +"</td>"
                       + "<td >"+ result[2][i].REVIEW_TITLE +"</td>"
                       +"<td>"
                             +"<div class='star-ratings'>"
                             +"<div class='star-ratings-fill space-x-2 text-lg'  style='width:"+result[2][i].REVIEW_STAR * 20 +"%'>"
                             +"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
                             +"</div>"
                             +"<div class='star-ratings-base space-x-2 text-lg'>"
                             +"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
                             +"</div>"
                             +"</div>"
                             +"</td>"
                             +"</tr>"
                             
                             //상세
                             +"<tr class='content-tr'>"
                            +"<td colspan='2'>"
                            +"<div>"
                            +"<hr>"
                            +"<h6  style='font-weight: bold;'>이미지 (클릭시 확대)</h6>"
                            +"<br>";
                            for(var j=0; j< result[3].length; j++){
                               if(result[2][i].REVIEW_NO == result[3][j].reviewNo){
                                    str+="<img class='imgForReview' src='${ pageContext.request.contextPath }/"+ result[3][j].filePath + result[3][j].changeName +"' width='150' height='100'>"
                               }
                            }
                            str+="<hr>"
                            +"<h6  style='font-weight: bold;'>상세후기</h6>"
                            +"<br>"
                            +"<textarea  style='resize: none;' cols='55' rows='10'>"+ result[2][i].REVIEW_CONTENT +"</textarea>"
                            +"</div>"
                            +"</td>"
                            +"</tr>";
                        
               }
            
               
                $(".list-area>tbody").html(str);
               
            },
            error : function() {
               
            }
         });
        
      });
      
   
});

</script>
<script>//정렬일때만 
$(document).ready(function(){
      $(document).on("click",".btnForPaging",function(){
         var temp = $(this).text();
         $(".btnForPaging").css({"background-color" : "RGB(170, 143, 211)"});
        $(this).css({"background-color" : "black"});
         document.getElementById('currentPage').value = temp;
         
         var boardNo = "${board.boardNo}";
         var currentPage = document.getElementById('currentPage').value;
         var sort = document.getElementById('sort').value;
         $.ajax({
            url : "${ pageContext.request.contextPath }/boardRest/reviewRest.do",
            type : "get",
            data : {boardNo : boardNo,
                  currentPage : currentPage,
                  sort :sort},
            success : function(result) {//0이 커런트 넘 1 솔트방법 2 리뷰 리스트 3 파일 리스트 
               var str="";
               for(var i =0; i< result[2].length; i++){
                  str+="<tr class='title-tr' style='text-align: center;'>"
                       +"<td font-size: '15px;'>"+ result[2][i].MEMBER_NICK +"</td>"
                       + "<td >"+ result[2][i].REVIEW_TITLE +"</td>"
                       +"<td>"
                             +"<div class='star-ratings'>"
                             +"<div class='star-ratings-fill space-x-2 text-lg'  style='width:"+result[2][i].REVIEW_STAR * 20 +"%'>"
                             +"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
                             +"</div>"
                             +"<div class='star-ratings-base space-x-2 text-lg'>"
                             +"<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
                             +"</div>"
                             +"</div>"
                             +"</td>"
                             +"</tr>"
                             
                             //상세
                             +"<tr class='content-tr'>"
                            +"<td colspan='2'>"
                            +"<div>"
                            +"<hr>"
                            +"<h6  style='font-weight: bold;'>이미지 (클릭시 확대)</h6>"
                            +"<br>";
                            for(var j=0; j< result[3].length; j++){
                               if(result[2][i].REVIEW_NO == result[3][j].reviewNo){
                                    str+="<img class='imgForReview' src='${ pageContext.request.contextPath }/"+ result[3][j].filePath + result[3][j].changeName +"' width='150' height='100'>"
                               }
                            }
                            str+="<hr>"
                            +"<h6  style='font-weight: bold;'>상세후기</h6>"
                            +"<br>"
                            +"<textarea  style='resize: none;' cols='55' rows='10'>"+ result[2][i].REVIEW_CONTENT +"</textarea>"
                            +"</div>"
                            +"</td>"
                            +"</tr>";
                        
               }
            
               
                $(".list-area>tbody").html(str);
               
            },
            error : function() {
               
            }
         });
        
      });
      
   
});

</script>   
   
</body>
</html>