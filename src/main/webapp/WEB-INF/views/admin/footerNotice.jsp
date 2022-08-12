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
	.notice-area{
		width: 1700px;
		
		
	}
	#notice-list{
            
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
<body>

	<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
	<div align="center">
	<div class="notice-area" >
                       
                        <br><br>
                       
                          <div id="notice-list" style="overflow:auto;" >
    
                            <table id="table2">
                              <tr>
                                  <th style="width: 5%">번호</th>
                                  <th style="width: 65%;">제목</th>
                              </tr>
                              <c:choose>
                              	<c:when test="${ empty list }">
                              		<tr>
                              			<td colspan="2">공지사항이 없습니다.</th>
                              		</tr>
                              	</c:when>
                              	<c:otherwise>
                              		<c:forEach var="n" items="${ list }">
	                              		<tr>
		                                	<td>${ n.noticeNo }</td>
		                                	<td>${ n.noticeTitle }</td>
		                            	</tr>
		                            </c:forEach>
                              	</c:otherwise>
                              </c:choose>
                          </table>
                          </div>
                    </div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	
	<script>
	$(function() {
		$("#table2 tr").click(function() {
			
			var nno = $(this).children().eq(0).text();
			
			location.href="${ pageContext.request.contextPath }/admin/footerNoticeDetail.do?noticeNo=" + nno;
			
		});
	});
	</script>
</body>
</html>