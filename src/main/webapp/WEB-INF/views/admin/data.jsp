<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.wrap{
    		width: 1700px;
    	}
        .body{
        	
            height: 100%; 
            float : left;
            width : 85%;	
            box-sizing : border-box;
            padding: 30px;
        }
       
        

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
    .profile {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
	
	table tr{
			height:60px;
			}
		
  	#table-board2 tr th{
		font-size:12px;
  	}
  	#table-board2 tr td{
		overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
  	}
  	

		
</style>
<body>

	<div class="wrap">
    <%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
        <div class="body">
           
                <div style="width: 88%; height: 300px; float: left;  box-shadow: 1px 1px 2px 2px rgb(219, 218, 218); padding: 20px; ">
                    <div class="zt-span6 last">
                       
                        <h4>거래현황</h4><hr>
                        이번달 신규회원<div class="zt-skill-bar"><div data-width="${ newMember }" style="background-color: rgb(107, 185, 237)">&nbsp;<span>${ newMember }명</span></div></div>
                        이번달 신규거래<div class="zt-skill-bar"><div data-width="${ tradeMonth }" style="background-color: rgb(46, 204, 113)">&nbsp;<span>${ tradeMonth }건</span></div></div>
                        이번달 신규 게시물<div class="zt-skill-bar"><div data-width="${ newBoard }" style="background-color: rgb(231, 76, 60)">&nbsp;<span>${ newBoard }개</span></div></div>
                    </div>
                </div>
            <div style="width: 25%;  height: 350px; margin-top:20px; margin-right:20px; padding: 20px; float: left;  box-shadow: 1px 1px 2px 2px rgb(219, 218, 218); ">
                        
                <h5><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16" style="color:red">
				  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg>&nbsp;랭킹</h5>
                <div style="overflow: auto; height: 90%;">
                    <table class="table table-hover" style="text-align: center;" id="table-seller">
                            <tbody>
                            <c:choose>
                                <c:when test="">
                                    <tr>
                                        <td colspan="3">랭킹이 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="b" items="${ sellerRankB }" varStatus="status">
                                        <tr>
                                        	<td style="display:none">${b.memberNo }</td>
                                            <td>${status.count}등</td>
                                            <td style="padding-top:3px;">
                                               <img class="profile" src="${pageContext.request.contextPath}/${b.filePath }" style="width:50px; height:50px">
                                            </td>
                                            <td>${b.memberId }</td>
                                            <td>${b.memberNick } </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                    </table>
                </div>
            </div>
            <div style="width: 38%;  height: 350px; margin-top:20px; margin-right:20px; padding: 20px; float: left;  box-shadow: 1px 1px 2px 2px rgb(219, 218, 218); ">
                        
                <h5><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16" style="color:red">
				  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg>&nbsp;찜많은 게시물</h5>
                <div style="overflow: auto; height: 90%;">
                    <table class="table table-hover" style="text-align: center;" id="table-board2">
                        
                            <c:choose>
                                <c:when test="">
                                    <tr>
                                        <td colspan="3">랭킹이 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="b" items="${ boardRankB }" varStatus="status">
                                        <tr>
                                        	<td style="display:none">${ b.boardNo }</td>
                                            <td>${status.count}등</td>
                                            <td>${ b.boardTitle }</td>
                                            <td>${ b.boardWriter }</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            
                           
                            </tbody>
                    
                    </table>
                </div>
            </div>
            <div style="width: 22%;  height: 350px; margin-top:20px; padding: 20px; float: left;  box-shadow: 1px 1px 2px 2px rgb(219, 218, 218); ">
                        
                <h5>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16" style="color:red">
				  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg>&nbsp;인기 카테고리</h5>
                <div style=" height: 90%;">
                    <table class="table table-hover" style="text-align: center;">
                        <div>
                            <tbody>
                            <c:choose>
                                <c:when test="">
                                    <tr>
                                        <td colspan="3">랭킹이 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                     <c:forEach var="b" items="${ categoryRankB }" varStatus="status">
                                        <tr>
                                            <td>${ status.count}등</td>
                                            <td>${ b.mainCategoryName }</td>
                                            <td>${ b.categoryName }</td>
                                            
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            
                           
                            </tbody>
                    </div>
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
    	$("#table-seller tr").click(function() {
    		
    		var mno = $(this).children().eq(0).text();
    		
    		location.href="${ pageContext.request.contextPath }/admin/customer.de?memberNo=" + mno;
    		
    	});
    });
    </script>
    <script>
    $(function() {
    	$("#table-board2 tr").click(function() {
    		
    		var bno = $(this).children().eq(0).text();
    		
    		location.href="${ pageContext.request.contextPath }/board/detailView.do?boardNo=" + bno;
    		
    	});
    });
    </script>
    <script>
    	
    </script>
    
	

</body>
</html>