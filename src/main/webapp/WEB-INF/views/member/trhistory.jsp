<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#Thistory {
        width: 50%;
        margin-top: 30px;
        margin-left: 30px;
    }
</style>
</head>
<body>
<div id="header"></div>
<div id="content">
       	<%@ include file="../include/myPageSidebar.jsp" %>
       	<c:set var="today" value="<%= new Date() %>"></c:set>
    	<div style="height:500px; overflow: auto;" id="Thistory">
            <table class="table">
                <tbody>
                <c:choose>
                <c:when test="${ empty trList }">
                  <tr>
                	<td colspan="3">
                		거래내역이 없습니다.
                	</td>
                  </tr>
                </c:when>
                <c:otherwise>
                <c:forEach var="tr" items="${ trList }">
                	<tr>
                        <td style="height: 150px;"><img src="${pageContext.request.contextPath}/${ tr.titleImg }" class="img-thumbnail" alt="Cinque Terre" style="width: 100%; height: 100%;"></td>
                        <td style="width:50%">
		                            강의 : ${ tr.boardTitle } <br>
		                            선생님 : ${ tr.memberNick } <br>
		                            거래 일자 : ${ tr.fnDate }<br>
		                </td>
		                <td style="width:25%" >
		                <c:choose>
		                <c:when test="${ today < tr.fnDate }">
		                	<span style="color: red; font-size: 30px; font-weight: 600;">강의중</span>    
		                </c:when>
		                <c:otherwise>
		                	<span style="color: greenyellow; font-size: 30px; font-weight: 600;">강의완료</span>
		                </c:otherwise>  
		                </c:choose>
                        </td>
                    </tr>
                </c:forEach>
				</c:otherwise>
                </c:choose>
                </tbody>
                </table>
                 <div align="center">		
					<c:if test="${ pi.startPage != 1 }">
						<a href="${pageContext.request.contextPath}/member/thistory.do?currentPage=${ pi.currentPage  - 1 }">&lt;</a>
					</c:if>
					<c:forEach  var="z" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${z == pi.currentPage }">
								<b>${z }</b>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/member/thistory.do?currentPage=${ z }">${ z }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pi.endPage != pi.maxPage}">
						<a href="${pageContext.request.contextPath}/member/thistory.do?currentPage=${ pi.currentPage + 1 }">&gt;</a>
					</c:if>
					</div>
            </div>
        </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>