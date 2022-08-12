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
    	}
        .body{
        	height: 100%; 
            float : left;
            width : 85%;
            box-sizing : border-box;
        }
       
        .content{
            width: 80%; 
            height: 100%;
            float: left;
            padding: 50px;
        }
       
        .btn-success{
            background: rgba(214, 11, 11, 0.521);
            border-color: rgba(214, 11, 11, 0.521);
            border-radius: 10px;
        }
        #textBox{
        	width: 100%; 
        	height: 40px; 
        	
        	border-color:rgba(170, 143, 211, 0.473); 
        	border-radius: 5px; font-size: 18px; 
        	padding: 5px;
        }
         #textBox:focus{
         	outline:rgba(170, 143, 211, 0.473);
         	border-color:rgba(170, 143, 211, 0.8); 
         }
        #textArea{
        	width: 100%; 
        	
        	border-color:rgba(170, 143, 211, 0.473); 
        	resize: none; 
        	border-radius: 5px; 
        	padding: 10px;
        }
         #textArea:focus{
         	outline:rgba(170, 143, 211, 0.473);
         	border-color:rgba(170, 143, 211, 0.8); 
         }
       
</style>
</head>
<body>

    <div class="wrap">
    	<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
        <div class="body">
            
            <form action="notice.ad" method="post">
                <div class="content">
                        <span style="font-size: 35px; font-weight: bold;">Add Notice</span>
	                        <div style="float:right;">
		                        <select style="width:95px; height:30px;" name="noticeType">
		                        	<option>공지사항</option>
		                        	<option>FAQ</option>
		                        </select>
		                        
		                    </div>
                        <input type="text" id="textBox" placeholder="제목" name="noticeTitle"><br><br>
                        <textarea cols="147" rows="20" id="textArea"  placeholder="내용" name="noticeContent"></textarea>
                   <br><br>
                   <div align="center">
                   <button type="submit" class="btn" style="border-bottom-left-radius:20px;border-top-left-radius:20px; color:white; width:100px; height:40px; background: rgba(170, 143, 211,0.3666);">등록하기</button>
                   <button type="button" class="btn" style="border-bottom-right-radius:20px;border-top-right-radius:20px; color:white; width:100px; height:40px; background: rgba(170, 143, 211,0.3666);" onclick="history.back();">뒤로가기</button>
                   
                   </div>
                </div>
                
            </form>
        </div>
    </div>

   
</body>
</html>