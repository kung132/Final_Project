<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>채팅함</title>

<style>

    
    .wrap {width: 1400px; height: auto;}
	*:not(i) {
			font-family: 'Karla', sans-serif;
		}

		#navbar-logo>img {
			padding-top: 0px;
			padding-bottom: 18px;
			width: 110px;
			height: 100px;
		}

		#ftco-navbar {
			height: 100px;
		}
		
		
		
		/* 헤더 안읽은 메세지 */ 
 	
		.headercount:empty {
		 display:none !important;
		}
 		
		
	   /*채팅*/	
		
	  .chat_wrap { width: 57%; float:left; margin-left: 20px; border: 1px solid #888; border-radius: 5px;}
		
      .chat_wrap .header { width:100%; height: 55px; font-size: 14px; padding: 15px 0; background: rgb(170, 143, 211); color: white; text-align: center; border-radius: 5px; }
      
      .chat_wrap .icon{ vertical-align : center !important; color: black; position: absolute; cursor: pointer; opacity: 0.6; text-align: center; font-size: 16px; background-color: transparent; border: none;}
   	  .chat_wrap .header-name{margin-left: 8px;  float:left; width:92%;}
   	  .chat_wrap .icon .arrow {float:left; width:3%;}
      .chat_wrap .etc {float: right; width:5%;}
      
      .etc-content{
		display: none;
		position: absolute;
		color:black;
		background-color: #f1f1f1;
		min-width: 140px;
		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		z-index: 1;
	  }
	   
	  .etc-content a{
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
	  }
	   
	  .etc-content a:hover {background-color: #ddd; color:black;}
	   
	  .etc:hover .etc-content {display: block; color:black;}
	   
	 .etc:hover .icon .dots {background-color: purple;} 
  
    
    
     
     
    .chat_wrap .chat { padding-bottom: 80px; width: 100%; background-color: rgb(247, 247, 247);}
    .chat_wrap .chat ul { width: 100%; list-style: none; }
    .chat_wrap .chat ul li { width: 100%; }
    .chat_wrap .chat ul li.left { text-align: left; }
    .chat_wrap .chat ul li.right { text-align: right; }
     
    .chat_wrap .chat ul li > div { font-size: 13px;  }
    .chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 0; font-weight: bold; }
    .chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
    .chat_wrap .chat ul li > div.chattime { display: inline-block;  word-break:break-all;  margin: 0px 10px; max-width: 75%; padding: 10px; background-color: #FCFCFC; color: #555; text-align: left;}
     
    .chat_wrap .input-div {bottom: 0; width: 100% !important; background-color: #FFF; text-align: center; border-top: 1px solid rgb(170, 143, 211); }
    .chat_wrap .input-div > #chatContent {width: 85%; height: 70px; border: none; padding: 10px; resize:none; float:left;}
    
    .ctbt {height: 70px; width:15%;  border: 1px solid #888; border-radius: 5px; background-color: rgb(206, 186, 239);}
    
    
    .chattime { background-color: transparent !important;}
	.img-pro {
    border-radius: 70%;
    overflow: hidden;
	}


	#content {
        width: 40%;
        float: right;
       /*  margin: auto; */
    }

    #content li {
        list-style-type: none;
        width:100%;
    }
    
    
    #top{
    
    height: 1000px;
    }
    
    #topContent2{
    height:20%;
    }
     #topContent3{
    height:35%;
    
    
    }
     #topContent4{
    
    height:35%;}
   
    #topContent1>ul>li>.teacher-nick{
        font-size: 20px;
        font-weight: bold;
        text-align:center;
        height:30px;
        width: 70%;
        float:left;
        margin-top: 20px;
        
       
        
    }
    

 	#topContent1>ul>li>.teacher-career {
       font-size: 13px;
       font-weight: bold;
       height:30px;
       width: 70%;
       float:left;
       text-align:center;
       
    }
    
    #naviContent>a {
        margin-left: 50px;
        text-decoration: none;
        color: black;
        font-size: 15px;
        font-weight: bold;
    }

    #naviContent>a:hover {
        color: purple;
    }

    .chatLink {
        background-color: rgb(170, 143, 211);
        font-size: 20px;
        float: right;
        width: 120px;
        height: 42px;
        color: white;
    }

    #topContent4 a {
        text-decoration: none;
        color: black;
    }

   	 #topContent4 a:hover {
        color: black;
        font-weight: bold;
    }
		    .star{
		    margin-left: 50px;
		    
		    height:60px;
		    
		    }
	    
		
		.review-title:hover {
			  cursor:pointer;
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
            color:  #ffd700;
            padding: 0;
            position: absolute;
            z-index: 1;
            display: flex;
            top: 0;
            left: 0;
            overflow: hidden;
            -webkit-text-fill-color:  #ffd700;
           
          }
          
        .star-ratings-base {
            z-index: 0;
            padding: 0;
           
          }
          
           .review-content{
        	display:none;
        }
        
        #pageBtns1 {
        
        margin-top:25%;
        
        }
        
        #pageBtns2 {
        
        margin-top:15%;
        
        }
        
      .paging-area1>button{
        background-color: rgb(170, 143, 211);
        width: 40px;
        height: 25px;
        line-height: 7px;
        color: white;
        text-align: center;
        border:none;
		border-radius: 12px
    }
    
    .paging-area1>button:hover {
     	background-color: wheat;
        color: lightsalmon;
    }
    
    .paging-area2>button{
        background-color: rgb(170, 143, 211);
        width: 40px;
        height: 25px;
        line-height: 7px;
        color: white;
        text-align: center;
        border:none;
		border-radius: 12px
    }
    
    .paging-area2>button:hover {
     	background-color: wheat;
        color: lightsalmon;
    }
        

</style>

</head>
<body>

<div id = wrap>

 <jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
  
   
    <br><br>
    
     <div class="chat_wrap">
        <div class="header">
        <div class = "icon arrow"><a href="box.me" style= "color:black;"><i class = "fas fa-arrow-left"></i></a></div>
        <div class="header-name">
            	${toNick}
        </div>
        <div class="etc">
		<button class="icon dots"><i class = "fas fa-ellipsis-v"></i> </button>
		<div class="etc-content">
		 <a href="box.me" onclick = "deleteFunction();" id ="chatdelete" >채팅방 삭제</a>
		<a href="">신고하기</a>
		</div>
		</div>	
        </div>
        <div class="chat" id = "chatList" style="overflow-y: auto; height: 500px;">
          <!-- 채팅내용입력 -->
        </div>
        <form method="POST" enctype="multipart/form-data" id="uploadForm">
        <div class="input-div">
            <textarea id="chatContent" placeholder="메시지를 입력해주세요" onKeyUp="javascript:fnChkByte(this,'2000')"></textarea> 
            <button type="button" class = "ctbt" onclick = "submitFunction();">전송</button>
        </div>
         </form>
    </div>
  
    
  
  <!--     <div class="alert alert-success" id="successMessage" style="display: none;">
        <strong>메시지 전송에 성공했습니다.</strong>
    </div>
        <div class="alert alert-danger" id="dangerMessage" style="display: none;">
        <strong>이름과 내용을 모두 입력해주세요.</strong>
    </div>
        <div class="alert alert-warning" id="warningMessage" style="display: none;">
        <strong>데이터베이스 오류가 발생했습니다.</strong>
    </div> -->
    
	
	
	
	<div id="content" style="overflow-y: auto; height: 650px;">
        <div>
            <div id="topContent1">
                <ul>
                    <li>
                        <img width="120px" height="120px" style="float:left; margin-top:20px;" src="../${ member.filePath}">
                       
                        <div class ="teacher-nick">${toNick}&nbsp<span class="teacher-grade" style="font-size: 13px;"><i class="fas fa-award" style="color:#ffd700;"></i>${ member.gradeName }</span></div>
                        <br><br><br>
                        <div class="teacher-career"><i class="fas fa-book" style="color: #C0C0C0;"></i>${ member.categoryName}전문</div>
                        <div class="teacher-career"><i class="fas fa-award" style="color: #C0C0C0;"></i>경력:${ member.career}년</div>
                        	
                        
                    </li>
                </ul>
            </div>
        </div>
        <br><br>
        <hr>
       
	   <div id="naviContent">
            <a href="#aboutTeacher">소개</a> 
            <a href="#aboutReview">리뷰<span>(${ rcount })</span></a> 
            <a href="#aboutService">서비스</a> 
        </div>
        <hr>
        
        <div id ="top">
				
        <div id="topContent2">
            <ul><h5 id="aboutTeacher" style="font-weight: bold; background-color: transparent !important;">선생님 소개</h5>
                <li>
                  ${ member.contents}
                </li>
            </ul>
        </div>
        <div id="topContent3">
        <hr>
         <h5 style="font-weight: bold; margin-left:40px;" id="aboutReview">리뷰</h5>
         <div class ="star">
         <div class = "star-score" style="font-weight: bold; width:10%; height:100%; font-size:30px; float:left;" >${ selleravg }</div>
         <div id = "review">
            <div class="star-ratings" style = "float:left;" >
             <div class="star-ratings-fill space-x-2 text-lg"  style="width:${selleravg*20}%;" >
             <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
             </div>
             <div class="star-ratings-base space-x-2 text-lg" >
            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
             </div>
            </div>
           </div>
           <br>
         <div class="review-count" style= " width:25%;">${ rcount }개 리뷰</div>
         </div>
         <hr>
         <div class= "detail-review" style = " text-align :center;">
          <c:choose>
	            	<c:when test="${ empty rlist }">
	            		<h5>등록된 글이 없습니다.</h5>
	            	</c:when>
	            	<c:otherwise>
	            		<c:forEach var="r" items="${ rlist }">
	            	<div id = "review-content">
              			<!-- 	 <div class = "review-title" style = "width:50%; float:left;">${ r.reviewTitle } </div>
              			 <div class="star-ratings" style = "float:left;">
                          <div class="star-ratings-fill space-x-2 text-lg"  style="width:${r.reviewStar*20}%;" >
                                       <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                          </div>
                           <div class="star-ratings-base space-x-2 text-lg" >
                           <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                           </div>
                         </div>  
              			 <br> -->
                		 </div>
	            		</c:forEach>
	            	</c:otherwise>
	            </c:choose>
         	</div>
         	
         	<div id="pageBtns1" > 
            <br>     
	        	<div align="center" class="paging-area1">
		            <c:forEach var = "i" begin = "${ pi1.startPage }" end = "${ pi1.endPage }" step="1" >
			            	<!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
			        	<c:choose>
			            	<c:when test= "${ i ne pi1.currentPage }" >
			            			<button type="button" class="btn pagingBtn1" align="center" value="${ i }" >${ i }</button>
			            	</c:when>
				            <c:otherwise>
				            		<button type="button" class="btn pagingBtn1" value="${ i }">${ i }</button>
				            </c:otherwise>
				        </c:choose>
		            </c:forEach>
	        	</div>
        	</div>
         	
          </div>
         
       
        <div id="topContent4">
        <hr>
        <h5 id="aboutService" style= "font-weight: bold; margin-left:40px;">서비스</h5>
        <div>
        <c:choose>
	            	<c:when test="${ empty list }">
	            		<h5>등록된 글이 없습니다.</h5>
	            	</c:when>
	            	<c:otherwise>
	            		<c:forEach var="i" items="${ list }">
		            	<!--  <ul>
			                <li>
			                    <a href="${ pageContext.request.contextPath }/board/detailView.do?boardNo=${ i.boardNo }">	
			                        <img width="100px" height="100px" src="../${i.titleImg}">&nbsp&nbsp&nbsp&nbsp
			                        <span> ${ i.boardTitle }</span>
			                    </a>
			                </li> 
			            </ul>  -->
			            
			            
			            <ul id="input">
	          						<li>
	          							
					                </li> 
	          					</ul>
			         
	            		</c:forEach>
	            	</c:otherwise>
	            </c:choose>
	         
        </div>
         <div id="pageBtns2" > 
            <br>     
	        	<div align="center" class="paging-area2">
		            <c:forEach var = "i" begin = "${ pi2.startPage }" end = "${ pi2.endPage }" step="1" >
			            	<!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
			        	<c:choose>
			            	<c:when test= "${ i ne pi2.currentPage }" >
			            			<button type="button" class="btn pagingBtn2" align="center" value="${ i }" >${ i }</button>
			            	</c:when>
				            <c:otherwise>
				            		<button type="button" class="btn pagingBtn2" value="${ i }">${ i }</button>
				            </c:otherwise>
				        </c:choose>
		            </c:forEach>
	        	</div>
        	</div>
	   		<br>
        </div>
	           
    </div>
    
	</div>
	</div>
	

</body>


<script>



   
	$(".review-title").click(function(){
		
		if($(".review-content").css("display")=="none"){
			$(".review-content").show();
		}else{
			$(".review-content").hide();
		}

    });




$(function() {
	chatListFunction();
	getUnread();}) 
	

function submitFunction() {
	
	var toNick = '${toNick}';
	var chatContent = $('#chatContent').val();
	
	//console.log(chatContent);
	//console.log(toId);
	$.ajax({
		type: "post",
		url: "${ pageContext.request.contextPath }/test/test1.do",
		data: {
			
			toNick: toNick,
			chatContent: chatContent
		},
		success: function(result) {
			if(result > 0) { 
							
       					$("#chatContent").val(""); // textarea 초기화
       					chatListFunction();
       					//console.log(" ajax 성공");
        			}
      				
  			},
  			error : function() {
  				//console.log(" ajax 실패");
  			}
			
		});
	
}


function chatListFunction() {
	
	var toNick = '${toNick}';
	
	$.ajax({
		type: "post",
		url: "${ pageContext.request.contextPath }/test/test2.do",
		data: {
			toNick: toNick
		},
		success: function(result) {
			//console.log(result);
			//console.log("ajax 성공");
			
			var str = "";  
			for(var i=0; i<result.length; i++) {
				
				
				if(result[i].fromNick == '${ loginUser.memberNick }' ) {
					
					 str += '<ul>'+' <li class = "right">' +
		    			'<div class="sender">' + 
		    			'<a class="pro" href="#">' + 
		    			'<img class="img-pro" style="width: 30px; height: 30px;" src="../resources/images/icon.png" alt="">' + '</a>' +                     
		    			'<span>' + result[i].fromNick +'</span></div>' +
		    			'<div class="message">' +
		    			'<span>' + result[i].chatContent + '</span></div>' + '<br>'+
		    			'<div class="chattime">'+
		    			'<span>' + result[i].chatTime + '</span></div>' + 
		    			' </li>' + 
		    			'</ul>'
						
					
					
					
				} else {
					
					 str +=  '<ul>'+' <li class = "left">' +
		    			'<div class="sender">' + 
		    			'<a class="pro" href="#">' + 
		    			'<img class="img-pro" style="width: 30px; height: 30px;" src="../resources/images/icon.png" alt="">' + '</a>' +                     
		    			'<span>' + result[i].fromNick +'</span></div>' +
		    			'<div class="message">' +
		    			'<span>' + result[i].chatContent + '</span></div>' + '<br>'+
		    			'<div class="chattime">'+
		    			'<span>' + result[i].chatTime + '</span></div>' + 
		    			' </li>' + 
		    			'</ul>'
						
					
					
					
				} 
				
				
			}	
			$('#chatList').html(str);
			$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
			
			},
			
		error : function() {
  				//console.log("ajax 실패");
  			}
			
			
		
	});
}


function deleteFunction() {
	
	var toNick = '${toNick}';
	
	//console.log(chatContent);
	//console.log(toId);
	$.ajax({
		type: "post",
		url: "${ pageContext.request.contextPath }/test/test5.do",
		data: {
			
			toNick: toNick
		},
		success: function(result) {
			if(result > 0) { 
				
       			//console.log(" ajax 성공");
       			//alert("삭제되었습니다");
			 	//location.href= "box.me";
        			}
      				
  			},
  			error : function() {
  				//console.log(" ajax 실패");
  			}
			
		});
	
}

function getUnread() {
	$.ajax({
		type: "post",
		url: "${ pageContext.request.contextPath }/test/test4.do",
		
		success: function(result) {
			if(result >= 1) {
				$('#unread').html(result);
			} else {
				$('#unread').html('');
			}
		},
		
		error : function() {
				//console.log("ajax 실패");
			}
	});
}



$(function() {
	
	var toNick = "${toNick}";
	var currentPage = ${currentPage};
	
	$.ajax({
		url : "${ pageContext.request.contextPath }/test/test6.do",
			type : "get",
			data : {"toNick" : toNick, "currentPage" : currentPage},
			success : function(result) {
				
			var listText = "";
			
				for(var i in result) {
					
  				listText = "<li style='margin-bottom:10px; padding-left: 10px;'>";
  				listText += "<a href='${ pageContext.request.contextPath }/board/detailView.do?boardNo=" + result[i].boardNo + "'>";
  				listText += "<span>No." + result[i].boardNo + "</span>";
  			 	listText += "<img width='100px' height='100px' src='${ pageContext.request.contextPath }/" + result[i].titleImg + "'>&nbsp&nbsp&nbsp&nbsp";
  			 	listText += "<span>"+ result[i].boardTitle + "</span></a></li>";
  			 	
  			 	$("#input").append(listText);

				}
			},
				
			error : function() {
				console.log("ajax 통신 실패!");
			}
	});
	
	$('.pagingBtn2').on('click', function() {
		console.log("클릭");
		
		$('#input>li').children().remove();
		
		var toNick = "${toNick}";
		console.log(toNick);
		var currentPage =  $(this).val();
		console.log(currentPage);
		
		$.ajax({
    		url : "${ pageContext.request.contextPath }/test/test6.do",
  			type : "get",
  			data : {"toNick" : toNick,  "currentPage" : currentPage},
  			success : function(result) {
  				
				var listText = "";
				var btnText = "";
				
  				for(var i in result) {
  					
	  				listText = "<li style='margin-bottom:10px; padding-left: 10px;'>";
	  				listText += "<a href='${ pageContext.request.contextPath }/board/detailView.do?boardNo=" + result[i].boardNo + "'>";
	  				listText += "<span>No." + result[i].boardNo + "</span>";
	  			 	listText += "<img width='100px' height='100px' src='${ pageContext.request.contextPath }/" + result[i].titleImg + "'>&nbsp&nbsp&nbsp&nbsp";
	  			 	listText += "<span>"+ result[i].boardTitle + "</span></a></li>";
	  			 	
	  			 	$("#input").append(listText);

  				}
  				
  				console.log("ajax 통신 성공!");
  			},
  				
  			error : function() {
  				console.log("ajax 통신 실패!");
  			}
    	});
	});
});



$(function() {
	
	var toNick = "${toNick}";
	var currentPage = ${currentPage};
	
	$.ajax({
		url : "${ pageContext.request.contextPath }/test/test7.do",
			type : "get",
			data : {"toNick" : toNick, "currentPage" : currentPage},
			success : function(result) {
				
			var str = "";
			
				for(var i in result) {
					
				
  			 	 str =  '<div class = "review-title" style = "width:50%; float:left;">' + result[i].reviewTitle 
  			 	 str += '</div><div class="star-ratings" style = "float:left;">'
  			 	 str +=  '<div class="star-ratings-fill space-x-2 text-lg"  style="width:' + result[i].reviewStar*20 +'%;">'
  			 	 str +=  '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>'
  			 	 str += '<div class="star-ratings-base space-x-2 text-lg" >'
  			 	 str += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div> </div>' 
                  
  			 	
  				$('#review-content').append(str);

				}
			},
				
			error : function() {
				console.log("ajax 통신 실패!");
			}
	});
	
	$('.pagingBtn1').on('click', function() {
		console.log("클릭");
		$('#review-content').children().remove();
		
		var toNick = "${toNick}";
		//console.log(toNick);
		var currentPage =  $(this).val();
		console.log(currentPage);
		
		$.ajax({
    		url : "${ pageContext.request.contextPath }/test/test7.do",
  			type : "get",
  			data : {"toNick" : toNick,  "currentPage" : currentPage},
  			success : function(result) {
  				
				var listText = "";
				var btnText = "";
				
  				for(var i in result) {
  					
  					 str =  '<div class = "review-title" style = "width:50%; float:left;">' + result[i].reviewTitle 
  	  			 	 str += '</div><div class="star-ratings" style = "float:left;">'
  	  			 	 str +=  '<div class="star-ratings-fill space-x-2 text-lg"  style="width:' + result[i].reviewStar*20 +'%;">'
  	  			 	 str +=  '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>'
  	  			 	 str += '<div class="star-ratings-base space-x-2 text-lg" >'
  	  			 	 str += '<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div> </div>' 
                  
  			 	
  				$('#review-content').append(str);


  				}
  			},
  				
  			error : function() {
  				console.log("ajax 통신 실패!");
  			}
    	});
	});
})


function getInfiniteChat() {
          setInterval(function() {
             chatListFunction();
          }, 1000);
       }

 </script>
 
 <script>
       $(document).ready(function() {
           chatListFunction();
           getInfiniteChat();
       });
    </script>
 
 

 
</html>