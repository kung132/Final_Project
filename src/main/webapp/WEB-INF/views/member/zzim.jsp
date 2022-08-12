<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content {
		height:1000px;
	}
	
	#zzim {
        width:50%;
        margin-top: 30px;
        margin-left: 30px;
    }
</style>
</head>
<body>
	<div id="header"></div>
	
	<div id="content">
       	<%@ include file="../include/myPageSidebar.jsp" %>
    	<div style="height:600px; overflow: auto;" id="zzim">
            <table class="table">
                <tbody>
                <c:choose>
                <c:when test="${ empty zList }">
                  <tr>
                	<td colspan="3">
                		등록된 관심 목록이 없습니다.
                	</td>
                  </tr>
                </c:when>
                <c:otherwise>
                <c:forEach var="zzim" items="${ zList }">
                	<tr>
                        <td style="height: 150px;"><img src="${pageContext.request.contextPath}/${ zzim.titleImg }" class="img-thumbnail" alt="Cinque Terre" style="width: 100%; height: 100%;"></td>
                        <td style="width:50%">
		                            강의 : ${ zzim.boardTitle } <br>
		                            선생님 : ${ zzim.memberNick } <br>
		                            기간 : ${ zzim.stDate } ~ ${ zzim.fnDate } <br>
		                </td>
		                <td>
		                            가격 : ${ zzim.cost }원 <br><br>
                        <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/payment/payment.do?payno=${ zzim.boardNo }'">거래하기</button><br><br>
                        <form action="deleteZzim.do" method="get">
                        <input type="hidden" name="zzimNo" value="${ zzim.zzimNo }">
                        <button class="btn btn-primary" type="submit">관심 제거</button>
                        </form>
                        </td>
                    </tr>
                </c:forEach>
				</c:otherwise>
                </c:choose>
                </tbody>
                </table>
                 <div align="center">		
					<c:if test="${ pi.startPage != 1 }">
						<a href="${pageContext.request.contextPath}/member/zzimlist.do?currentPage=${ pi.currentPage  - 1 }">&lt;</a>
					</c:if>
					<c:forEach  var="z" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${z == pi.currentPage }">
								<b>${ z }</b>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/member/zzimlist.do?currentPage=${ z }">${z }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pi.endPage != pi.maxPage}">
						<a href="${pageContext.request.contextPath}/member/zzimlist.do?currentPage=${ pi.currentPage + 1 }">&gt;</a>
					</c:if>
					</div>
            </div>
        </div>
            
     <%@ include file="../include/footer.jsp" %> 
</body>
</html>