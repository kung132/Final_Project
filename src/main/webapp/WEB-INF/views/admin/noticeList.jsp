<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width : 85%;
            box-sizing : border-box;
        }
        .content{
            width: 1300px; 
            height: 100%;
            float: left;
            padding: 50px;
        }
        
      
        .notice-area{
            margin-left: 30px;
           
        }
        #notice-list{
            width: 1100px;
            height: 80vh;
            overflow: auto;
        }
        #table2{text-align: center; width:100%; }
       
        #table2 th{
            border: 1px lightgray solid;
            height: 50px;
            background-color: rgb(222, 212, 238);
            position: sticky;
            top: 0px;
        }
         #table2 td{
            border: 1px lightgray solid;
            height: 60px;
            padding: 10px;
            color: gray;
        }
        #table2 tr:hover{
        	cursor:pointer;
        }
        #table2 tr:first-child {
         pointer-events: none; 
         }

      
       
</style>
</head>

<body>

	
    <div class="wrap">
    	<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
        <div class="body">
                <div class="content">
                    <div class="notice-area" style="float: left;">
                        <div style="width: 100%; float: left;" >
                            <span style="font-size: 24px;">Notice</span>
							<button type="button" class="btn" style="background:rgba(170, 143, 211, 0.273); float: right; color:white; margin-right:10px;" id="add-btn">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
								  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
								</svg>
							</button>
                        </div>
                        <br><br>
                       
                          <div id="notice-list" style="overflow:auto;">
    
                            <table id="table2">
                              <tr>
                                  <th style="width: 5%">번호</th>
                                  <th style="width: 65%;">제목</th>
                                  <th style="width: 10%;">작성자</th>
                                  <th style="width: 10%;">구분</th>
                                  <th style="width: 10%;">작성일</th>
                                  
                              </tr>
                              <c:choose>
                              	<c:when test="${ empty list }">
                              		<tr>
                              			<td colspan="5">공지사항이 없습니다.</td>
                              		</tr>
                              	</c:when>
                              	<c:otherwise>
                              		<c:forEach var="n" items="${ list }">
	                              		<tr>
		                                	<td>${ n.noticeNo }</td>
		                                	<td>${ n.noticeTitle }</td>
		                                	<td>${ n.noticeWriter }</td>
		                                	<td>${ n.noticeType }</td>
		                                	<td>${ n.noticeEnrolldate }</td>
		                            	</tr>
		                            </c:forEach>
                              	</c:otherwise>
                              </c:choose>
                          </table>
                          </div>
                    </div>
                </div>
        </div>
    </div>
    
    <script>
   
    </script>
<script>
$(function(){
    $("#add-btn").click(function(){
        location.href="notice.ad";
    });
});
   
$(function() {
	$("#table2 tr").click(function() {
		
		var nno = $(this).children().eq(0).text();
		
		location.href="${ pageContext.request.contextPath }/admin/noticeDetail.do?noticeNo=" + nno;
		
	});
});
</script>
   
</body>
</html>