<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
        .sidebar{
            width: 15%;  
            height: 100vh; 
            background: rgb(170, 143, 211);
            color:rgba(255, 255, 255, 0.733);
            float : left;
        }
       
        .side-title:hover{
            background: rgb(139, 111, 184);
            cursor: pointer;
            border-radius: 5px;
             padding-left: 18px;
            padding-right: 18px;
        }
        .side-title{
            font-size: 20px;
            height: 70px;
            padding-top: 18px;
            
        }
        .side-body{
            padding-left: 18px;
            padding-right: 18px;
        }
        .side-profile{
        	width: 150px;
		    height: 150px; 
		    border-radius: 70%;
		    overflow: hidden;
		    margin-bottom: 10px;
		    margin-top: 10px;
		    margin-left: 30px;
		    
        }
        .profile {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
		.side-profile:hover {
        	cursor:pointer;
            color:rgb(170, 143, 211);
        }
</style>
<body>

<%@ include file="/WEB-INF/views/admin/FAQ.jsp" %>
 			
 			<c:if test="${ !empty alertMsg }">
				<script>
					var msg = "${ alertMsg }";
					alert(msg);
				</script>
				<c:remove var="alertMsg" scope="session" />
			</c:if>
            <div class="sidebar">
                
                <div class="side-body">
               
                    <div class="side-profile"  >
                    	<img class="profile" src="../resources/images/loginLogo.jpg">
                    </div>
                    
                	
                    <hr color="white">
                    <div class="side-title" id="Home">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                            <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                          </svg>
                        Home</div> 
                    <div class="side-title" id="Customers">
                         <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                            <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                          </svg>
                         Customers</div>
                    <div class="side-title" id="Notice">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-megaphone-fill" viewBox="0 0 16 16">
                            <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z"/>
                          </svg>
                        Notice</div>
                        <div class="side-title" id="Data">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bar-chart-fill" viewBox="0 0 16 16">
						  <path d="M1 11a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3zm5-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2z"/>
						</svg>
                        Data</div> 
                        <div class="side-title" id="Message">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
						  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
						</svg>
                        Message  </div> 
                        
                    <div>
                    </div>
                </div>
            </div>
           

    <script>
        $(function (){
            $(".profile").click(function(){
                location.href="../${pageContext.request.contextPath}";
            });
            $("#Home").click(function(){
                location.href="admin.do";
            });
            $("#Customers").click(function(){
                location.href="customer.do";
            });
            $("#Notice").click(function(){
                location.href="notice.do";
            });
            $("#Message").click(function(){
                location.href="message.do";
            });
            $("#Data").click(function(){
                location.href="data.do";
            });
        });
        
    </script>
    <script>
    function fnChkByte(obj, maxByte)
    {
        var str = obj.value;
        var str_len = str.length;


        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";


        for(var i=0; i<str_len; i++)
        {
            one_char = str.charAt(i);
            if(escape(one_char).length > 4) {
                rbyte += 2;                                         //한글2Byte
            }else{
                rbyte++;                                            //영문 등 나머지 1Byte
            }
            if(rbyte <= maxByte){
                rlen = i+1;                                          //return할 문자열 갯수
            }
         }
         if(rbyte > maxByte)
         {
            // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
            alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
            str2 = str.substr(0,rlen);                                  //문자열 자르기
            obj.value = str2;
            fnChkByte(obj, maxByte);
         }
         else
         {
            document.getElementById('byteInfo').innerText = rbyte;
         }
    }
    </script>
</body>
</html>