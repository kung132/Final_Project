<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <style>
       .wrap{
    		width: 1700px;
    	}
        .body{
            height: 100%; 
            float : left;
            width : 74%;
            box-sizing : border-box;
            margin-top:20px;
            
        }
        .content{
            width: 65%; 
            height: 100%;
            float: left;
        }
       
        #teacher-card{
            height: 260px;
            width: 230px;
            float: left;
            margin: 15px;
            box-shadow: 1px 1px 2px 3px rgb(219, 218, 218);
            
            text-align: center;
        }
        #student-card{
            height: 260px;
            width: 230px;
            float: left;
            margin: 15px;
            
             margin-left: 30px;
            box-shadow: 1px 1px 2px 3px rgb(219, 218, 218);
            text-align: center;
        }
        #trade-card{
            height: 260px;
            width: 230px;
            float: left;
            margin: 15px;
            box-shadow: 1px 1px 2px 3px rgb(219, 218, 218);
            
            text-align: center;
        }
/*-------------------------------------------------------------------------*/
/*  Skill bar style
/*-------------------------------------------------------------------------*/
 
    .zt-skill-bar {
        color: #fff;
        font-size: 11px;
        line-height: 25px;
        height: 35px;
        width: 50px;
        margin-bottom: 5px;
 
        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;
 
    }
 
    .zt-skill-bar * {
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }
 
    .zt-skill-bar div {
       height: 30px;
        position: relative;
        padding-left: 25px;
        width: 0;
 
        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms-border-radius: 2px;
                border-radius: 2px;
    }
 
    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #1a1a1a;
 
        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }
 
    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;
 
        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }
    .approval{
        border: none;
        width: 30px;
        height: 30px;
        background: none;
        color: blue;
        
    }
    .approval:hover{
        color: gray;
    }
   .Refusal{
        border: none;
        width: 30px;
        height: 30px;
        background: none;
        color: red;
    }
    .Refusal:hover{
        color: gray;
    }
  	

        
    </style>

</head>
<body>

	<div class="wrap">
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
        <div class="body">
           
            <div class="content" >
                <div class="card-area">
                    <div id="student-card">
                        <div style="background: #d3c8e2; height: 53%; color: white; padding: 30px;" >
                            <svg xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                            </svg>
                        </div>
                        <div style="background: white; height: 47%; padding: 25px;">
                            <p style="font-weight: bold; font-size: larger;">학생</p>
                            	${ countMember }명
                        </div>
                    </div>
                    <div id="teacher-card">
                        <div style="background: #d3c8e2; height: 53%; color: white; padding: 30px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <svg xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                                <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                              </svg>
                        </div>
                        <div style="background: white; height: 47%; padding: 25px;">
                            <p style="font-weight: bold; font-size: larger;">선생님</p>
                            ${ countSeller }명
                        </div>
                    </div>
                    <div id="trade-card">
                        <div style="background: #d3c8e2; height: 53%; color: white; padding: 30px;" >
                            <svg xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                              </svg>
                        </div>
                        <div style="background: white; height: 47%; padding: 25px;">
                            <p style="font-weight: bold; font-size: larger;">재능거래</p>
                            ${ countTrade }번
                        </div>
                    </div>
                </div>
                <div style="margin: 30px;">
                    <div style="width: 750px; height: 350px; float: left;  box-shadow: 1px 1px 2px 2px rgb(219, 218, 218); margin-top:15px; margin-right: 20px; padding: 20px; ">
                        <div class="zt-span6 last">
                           
                            <h4>거래현황</h4><hr>
				                            오늘<div class="zt-skill-bar"><div data-width="${ tradeToday }" style="background-color: rgb(107, 185, 237)">&nbsp;<span>${ tradeToday }건</span></div></div>
				                            이번주<div class="zt-skill-bar"><div data-width="${ tradeWeek }" style="background-color: rgb(46, 204, 113)">&nbsp;<span>${ tradeWeek }건</span></div></div>
				                            지난주<div class="zt-skill-bar"><div data-width="${ tradeLastWeek }" style="background-color: rgb(231, 76, 60)">&nbsp;<span>${ tradeLastWeek }건</span></div></div>
				                            지난달<div class="zt-skill-bar"><div data-width="${ tradeMonth }" style="background-color: rgb(0, 206, 192)">&nbsp;<span>${ tradeMonth }건</span></div></div>
				        </div>
                    </div>
                    
                </div>
        </div>
        <div style="width: 35%; font-size:13px; height: 620px; margin-top:20px; padding: 20px; float: left;  box-shadow: 1px 1px 2px 2px rgb(219, 218, 218); ">
                        
                        <h4>승인</h4>
                        <div style="overflow: auto; height: 90%;">
                            <table class="table table-hover" style="text-align: center;">
                                
                                    <tbody>
                                    <tr>
                                    	<th>번호</th>
                                    	<th>닉네임</th>
                                    	<th>ID</th>
                                    	<th>이름</th>
                                    	<th>승인</th>
                                    	<th>거절</th>
                                    </tr>
                                    <c:choose>
                                    	<c:when test="${ empty list }">
                                    		<tr>
                                    			<td colspan="6">신청자가 없습니다.</td>
                                    		</tr>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="b" items="${ list }">
	                                    		<tr>
	                                    			<th >${b.memberNo }</th>
	                                    			<td scope="row">${ b.memberNick }</td>
			                                        <td>${ b.memberId }</td>
			                                        <td>${ b.memberName	 }</td>
			                                        <td> 
				                                        <button class="approval" id="approval">
				                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
				                                                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
				                                            </svg>
				                                        </button>
			                                        </td>
			                                        <td> 
				                                        <button class="Refusal" id="Refusal">
				                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
															  <path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
															  <path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
															</svg>
				                                        </button>
			                                        </td>
		                                        </tr>
                                    		</c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                    
                                   
                                    </tbody>
                            
                            </table>
                        </div>
                    </div>
    </div>
    </div>
    
    <script>
        (function( $ ) {
		    "use strict";
		    $(function() {
		        function animated_contents() {
		            $(".zt-skill-bar > div ").each(function (i) {
		            	var $this  = $(this),
		                    skills = $this.data('width');
		            	if(skills>200){
		            		skills = 190;
		            	}
		                $this.css({'width' : skills*10 + '%'});
		 
		            });
		        }
		        
		        if(jQuery().appear) {
		            $('.zt-skill-bar').appear().on('appear', function() {
		                animated_contents();
		            });
		        } else {
		            animated_contents();
		        }
		    });
		}(jQuery));
    </script>
    <script>
    $(function() {
		$("table tr #approval").click(function() {
			
		
			var mno = $(this).parents().parents().children().eq(0).text();
			
			location.href="${ pageContext.request.contextPath }/admin/approval.do?memberNo=" + mno;
			
		});
	});
    $(function() {
		$("table tr #Refusal").click(function() {
			
		
			var mno = $(this).parents().parents().children().eq(0).text();
			
			location.href="${ pageContext.request.contextPath }/admin/refusal.do?memberNo=" + mno;
			
		});
	});
    </script>
    
	

</body>
</html>