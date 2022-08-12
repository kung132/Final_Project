<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	.content{
		width: 1700px;
	}
	
</style>
<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
			
			<br><br>
			<div align="center">
	                <div class="content" style="font-size: large; color: gray;">
	                		
			                        <span style=" float:right; text-align:right;"> ${notice.noticeType }<br>${notice.noticeEnrolldate} </span> 
			                        <h3 style="text-align:left;">${ notice.noticeTitle }</h3>
			                        <hr>
			                        <br><br>
			                        <div style="width:100%;height:600px; text-align:left;"> ${ notice.noticeContent }</div>
	                </div>	
	                <button class="btn" onclick="history.back();" type="button" style="border-radius:20px; color:white; width:80px; height:40px; background: rgba(170, 143, 211,0.3666);">뒤로</button>
	        <br><br></div>
	   		
            		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>