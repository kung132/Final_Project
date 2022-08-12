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

@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);


h4 {
	font-family: 'Noto Sans KR' !important;
	color: white !important;
	font-size: 20px !important;
}	

h5 {
	font-family: 'Noto Sans KR' !important;
	font-size: 15px !important;
}
		



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
		
		
	/* 테이블 관련 디자인 처리 */
	
#table-test th{
	position: sticky;
    top: 0px;
}	
	
thead th {
	background-color: rgb(170, 143, 211); ;
	color: white;
	text-align: center;
	
}
tr td:first-child,
tr th:first-child {
	border-top-left-radius: 6px;
	border-bottom-left-radius: 6px;
}
tr td:last-child,
tr th:last-child {
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
}	


 /* 안읽은 메세지 */ 
 	.count {
		  display: inline;
		  padding: .2em .6em .3em;
		  font-size: 75%;
		  font-weight: bold;
		  line-height: 1;
		  color: #fff;
		  text-align: center;
		  white-space: nowrap;
		  vertical-align: baseline;
		  border-radius: .20em;
		  position: relative;
 		  top: -1px;
}
		
		 .count-info {
		  background-color: rgb(170, 143, 211);
		}
		
		
		.count:empty {
		 display:none !important;
		}
 		
		/* 헤더 안읽은 메세지 */ 
 	
		.headercount:empty {
		 display:none !important;
		}
 		
		
		
	/* 채팅박스단 */
		
.img-circle {
  border-radius: 50%;
}

.media-object {
  display: block !important; 
  max-width: none !important;
}

.pull-right {
  float: right !important;
}
		

	</style>





</head>
<body>

	<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>

    <br><br><br><br><br>
    
    <div class="container" style="margin: 0 auto; width:800px; height:800px; overflow:auto;">
        <table class="table" id="table-test">
            <thead>
                <tr>
                    <th><h4>채팅</h4></th>
                </tr>
            </thead>
            <div style="overflow-y: auto; width: 100%; max-height: 450px;">
                <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; margin: 0 auto;">
                    <tbody id="boxTable">

    
                    </tbody>
                </table>
            </div>
        </table>
    </div>
    <br><br>
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    
   

    


<script>

$(function() {
	boxListFunction();
	getUnread();})


function boxListFunction() {

	$.ajax({
		type: "POST",
		url: "${ pageContext.request.contextPath }/test/test3.do",
		
		
		success: function(result) {
			console.log(result);
			console.log("ajax 성공");
			
			var str = "";  
			for(var i=0; i<result.length; i++) {
				
				
				
				if(result[i].fromNick == '${ loginUser.memberNick }' ) {
					
					 str += '<tr onclick="location.href=\'chat.me?currentPage=1&toNick='+result[i].toNick + '\'">' +
		    			'<td style="width: 150px;">' + 
		    			'<img class="media-object img-circle" style="margin: 0 auto; max-width: 40px; max-height: 40px;" src="../resources/images/icon.png">' +                       
		    			'<h5>' + result[i].toNick +'</h5></td>' +
		    			'<td>' +
		    			'<h5>' + result[i].chatContent +
		    			'<span class="count count-info">' + result[i].chatCount +'</span></h5>' + 
		    			'<div class="pull-right">' + result[i].chatTime + '</div>' + 
		    			'</td>' + 
		    			'</tr>'
				} else {
					 str += '<tr onclick="location.href=\'chat.me?currentPage=1&toNick=' + result[i].fromNick + '\'">' +
		    			'<td style="width: 150px;">' + 
		    			'<img class="media-object img-circle" style="margin: 0 auto; max-width: 40px; max-height: 40px;" src="../resources/images/icon.png">' +                       
		    			'<h5>' + result[i].fromNick +'</h5></td>' + 
		    			'<td>' +
		    			'<h5>' + result[i].chatContent +
		    			'<span class="count count-info">' + result[i].chatCount +  '</span></h5>' + 
		    			'<div class="pull-right">' + result[i].chatTime + '</div>' + 
		    			'</td>' + 
		    			'</tr>'
				} 
			}	
			$('#boxTable').html(str);
			 
			},
			
		error : function() {
  				console.log("ajax 실패");
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
				console.log("ajax 실패");
			}
	});
}


 </script>




</body>
</html>