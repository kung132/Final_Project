<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    	.wrap{
    		width: 100vw;
    		height:600px;
    	}
        .body{
            height: 80%; 
            float : left;
            width : 85%;
            box-sizing : border-box;
        }
        .content{
            width: 80%; 
            height: 80%;
            float: left;
            padding: 50px;
        }
        
      
        .notice-area{
            margin-left: 30px;
           
        }
        #notice-list{
            width: 100%;
            height: 400px;
            overflow: auto  ;
        }
       
      
       
</style>
</head>

<body>
    <div class="wrap">
    	<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
        <div class="body">
        <input type="hidden" value="${ notice.noticeNo }" id="noticeNo">
                
	                <div class="content" style="font-size: large; color: gray;"  >
	                		
	                        <span style=" float:right; text-align:right;"> ${notice.noticeType }<br>${notice.noticeEnrolldate} </span> 
	                        <h3>${ notice.noticeTitle }</h3>
	                        <hr>
	                        
	                        <br><br>
	                        <div style="height:500px"> ${ notice.noticeContent }</div>
	                <div align="center">
	                	<button type="button" class="btn btn-AAA" style="border-bottom-left-radius:20px; border-top-left-radius:20px; color:white; width:80px; height:40px;background: rgba(170, 143, 211,0.3666);" id="delete-btn">삭제</button>
	                	<button type="button" class="btn btn-AAA" style="border-bottom-right-radius:20px;border-top-right-radius:20px; color:white; width:80px; height:40px; background: rgba(170, 143, 211,0.3666);" onclick="history.back();">뒤로</button>       
	                </div>
	                </div>	
	                
	                </div>
            		
	                       
        </div>
    
<script>
$(function(){
	
    $("#delete-btn").click(function(){
    	
    	 if (!confirm("공지사항을 삭제하시겠습니까?")) {
			 	alert("취소");
		    } else {
		    	var nno = $('#noticeNo').val();
		        location.href="noticeDelete.de?noticeNo=" + nno;
		    }
    	
    	
    });
});
   
</script>
   
</body>
</html>