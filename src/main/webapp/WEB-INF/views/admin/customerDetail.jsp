<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
    	.wrap{
    		width: 1700px;
    		height: 100vh;
    		float:left;
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
        
        .text{
            height: 40px;
            border: 1px solid lightgray;
           
        }
        .text:hover{
            box-shadow: 1px 1px 2px 3px rgb(237, 232, 247);
        }
        .table{
            
        }
        .table td{
            border-bottom: 1px lightgray solid;
            border-top: 1px lightgray solid;
            
            
        }
        .table :first-child{
            width: 300px;
        }
        .table td:first-child{
            background-color: rgba(170, 143, 211, 0.273);
            width: 150px;
            text-align: center;
        }
        .table td:nth-child(2){
            padding: 11px;
        }
      
       
</style>
<body>
    <div class="wrap">
    
    <%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
        <div class="body">
            <form action="grade.up"  method="get">
                <div class="content" style="font-size: large; color: gray;"  >
                <input type="hidden" name="memberNo" value="${ member.memberNo }" >
                        <span style="font-weight: bold;">회원 정보</span> 
                        <hr>
                            <table class="table" style="border:1px solid lightgray;">
                                <tr>
                                    <td>회원번호</td>
                                    <td>${ member.memberNo }</td>
                                    <td rowspan="5" style="width: 300px; height:100%; border: 1px solid lightgray;">
                                        <div>
                                        	<c:choose>
                                        		<c:when test="${ seller == null}">
                                        			<img src="../resources/admin/admin.png" style="width:100%; height:100%">
                                        		</c:when>
                                        		<c:otherwise>
                                        			<img src="${ pageContext.request.contextPath }/${ seller.filePath }" style="width:100%; height:100%">
                                        		</c:otherwise>
                                        	</c:choose>
                                        	
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>회원등급</td>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${ member.gradeName eq '하수'}">
		                                        <select name="grade" class="text" style="width: 150px;">
		                                        	<option value="1"> 하수 </option> 
		                                            <option value="2"> 중수 </option> 
		                                            <option value="3"> 고수 </option>
		                                        </select>
		                                    
                                    	</c:when>
                                    	<c:when test="${ member.gradeName eq '중수'}">
		                                        <select name="grade" class="text" style="width: 150px;">
		                                        	<option value="2"> 중수 </option> 
		                                           	<option value="1"> 하수 </option> 
		                                            <option value="3"> 고수 </option>
		                                        </select>
                                    	</c:when>
                                    	<c:when test="${ member.gradeName eq '고수'}">
		                                        <select name="grade" class="text" style="width: 150px;">
		                                        	<option value="3"> 고수 </option>
		                                           	<option value="1"> 하수 </option> 
		                                            <option value="2"> 중수 </option>
		                                        </select>
                                    	</c:when>
                                    	<c:otherwise>
                                    			${ member.gradeName}
                                    	</c:otherwise>
                                    </c:choose>
                                    </td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td>${ member.memberName }</td>
                                </tr>
                                <tr>
                                    <td>아이디</td>
                                    <td>${ member.memberId }</td>
                                </tr>
                                <tr>
                                    <td>닉네임</td>
                                    <td>${ member.memberNick }</td>
                                </tr>
                                <tr>
                                    <td>전화번호</td>
                                    <td>${ member.memberPhone }</td>
                                </tr>
                                <tr>
                                    <td>주소</td>
                                    <td colspan="2" > ${ member.address } ${ member.detailAddress } </td>
                                </tr>
                               
                                <tr>
                                    <td>이메일</td>
                                    <td colspan="2"> ${member.memberEmail } </td>
                                </tr>
                                <tr>
                                    <td>가입일</td>
                                    <td colspan="2">2021-01-03</td>
                                </tr>
                            </table>
                            <br>
                            <div align="center">
                            	<c:choose>
                            		<c:when test="${ member.gradeName eq '일반회원'}">
                            			<button type="button" style="color: white; border: 1px lightgray solid; width: 90px; height: 40px; background-color: red;">삭제</button> 
                                		<button onclick="history.back();" type="button" style="color: white; border: 1px lightgray solid; width: 90px; height: 40px; background-color: gray;">뒤로</button>
                            			 
                            		</c:when>
                            		<c:otherwise>
                            		<button type="submit" class="btn"style="border-bottom-left-radius:20px;border-top-left-radius:20px; color:white; width:80px; height:40px; background: rgba(170, 143, 211,0.3666);">수정</button> 
                            			<button type="button" class="btn" style="color:white; width:80px; height:40px; background: rgba(170, 143, 211,0.3666);">삭제</button> 
                                		<button class="btn" onclick="history.back();" type="button" style="border-bottom-right-radius:20px;border-top-right-radius:20px; color:white; width:80px; height:40px; background: rgba(170, 143, 211,0.3666);">뒤로</button>
                            		</c:otherwise>
                            	</c:choose>
                               
                               
                            </div>	
                </div>
            </form>
        </div>
       
    </div>

    <script>
        

        $('#selectEmail').change(function(){ $("#selectEmail option:selected").each(function () { 
            if($(this).val()== '1'){
                 //직접입력일 경우 
                 $("#str_email02").val(''); 
                 //값 초기화 
                 $("#str_email02").attr("disabled",false); 
                 //활성화 
                 }else{ 
                 //직접입력이 아닐경우 
                 $("#str_email02").val($(this).text()); 
                 //선택값 입력 
                 $("#str_email02").attr("disabled",true); 
                 //비활성화 
                 } 
                 }); 
                 });


        
    </script>
    <br><br>    
</body>
</html>