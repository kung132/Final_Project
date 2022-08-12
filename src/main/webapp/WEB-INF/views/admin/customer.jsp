<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
       .wrap{
    		width: 1700px;
    		height:800px;
    		float : left;
    	}
        .body{
            float : left;
            width : 85%;
        }
        .content{
            width: 1100px; 
            height: 100%;
            float: left;
            padding-left: 50px;
            margin-bottom:20px;
        }
       
        .customer-area{
            margin-left: 30px;
            width: 1030px;
            
        }
        #customer-list{
            width: 100%;
            height: 330px;
            border: 1px solid lightgray;
        }
        #table td{
            border: 1px lightgray solid;
            height: 70px;
            
            padding: 10px;
        }
        #table td:first-child{
            background-color: rgba(170, 143, 211, 0.273);
            width: 100px;
        }
        #table td:nth-child(2){
            width: 600px;
           
        }
        #table td:nth-child(3){
            width: 100px;
            background-color:rgba(170, 143, 211, 0.273);
        }
        #table td:nth-child(4){
            width: 400px;
        }
        #search{
            background: rgba(170, 143, 211, 0.673); 
            color: white; 
            width: 80px; 
            height: 40px; 
            border: 0ch;
        }
        #add{
            background: red; 
            color: white; 
            width: 80px; 
            height: 40px; 
            border: 0ch;
        }
        #table2{text-align: center;}
        #table2 td{
            border: 1px lightgray solid;
            height: 50px;
            padding: 5px;
            color: gray;
        }
        #table2 th{
            border: 1px lightgray solid;
            width: 150px;
            height: 50px;
            background:rgba(170, 143, 211, 0.273);
            position: sticky;
            top: 0px;
        }
        
    .btn{
      text-decoration: none;
      font-size:2rem;
      color:white;
      padding:10px 20px 10px 20px;
     
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      
      
    }
    
    .btn.blue{
      background:rgba(170, 143, 211, 0.673); 
      color : white;
    }
        
    </style>
</head>
<body>
    <div class="wrap">
    <%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
        <div class="body">
        <br><br>
            <form action="customer.do" method="get">
            <div class="content" >
                <span style="font-size: 25px;">회원검색</span><br><br>
                <table id="table" style="color:gray;">
                    <tr>
                        <td>검색어</td>
                        <td><input type="text" style="width: 300px; height: 35px; border: 1px lightgray solid;" name="keyword" ></td>
                        <td>전체</td>
                        <td>
                            <select name="type" style="width: 100px; height: 40px; border: 1px lightgray solid;">
                                <option value="MEMBER_NAME">이름</option>
                                <option value="MEMBER_ID">아이디</option>
                                <option value="MEMBER_NICK">닉네임</option>
                                <option value="MEMBER_PHONE">전화번호</option>
                                <option value="MEMBER_EMAIL">아이디</option>
                                <option value="ADDRESS">주소</option>
                                
                            </select>
                        </td>
                    </tr>
                    
                </table>
               
                <br>
                <div align="center">
                    <button type="submit" id="search">검색</button>
               </div>
             </form>
         </div>
                <div style="overflow: auto; height: 550px; float:left;  margin-left:50px; width:1100px;">
                    <table id="table2" >
                        <tr>
                            <th style="width: 80px">번호</th>
                            <th>판매자등급</th>
                            <th>아이디</th>
                            <th>성명</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <th>가입일</th>
                            <th>관리</th>
                        </tr>
                        <c:choose>
                           <c:when test="${ empty pageList }">
								<tr>
                                    <td colspan="8">회원이 없습니다.</td>
                               	</tr>
                           </c:when>
                           <c:otherwise>
                               	<c:forEach var="b" items="${ pageList }">
	                            	<tr>
	                                	<td>${ b.memberNo }</td>
			                            <td>${ b.gradeName }</td>
			                            <td>${ b.memberId }</td>
			                            <td>${ b.memberName }</td>
			                            <td>${ b.memberEmail }</td>
			                            <td>${ b.memberPhone }</td>
			                            <td>${ b.memberDate.substring(0,11) }</td>
			                            <td>
			                                <button id="detail" type="button" style="border: 1px lightgray solid; border-radius:3px;">상세</button>
			                                <c:if test="${ b.memberNo != 1}">
			                                	<button id="delete" type="button" style="border: 1px lightgray solid; border-radius:3px;">삭제</button>
			                                </c:if>
			                            </td>
		                            </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>
                  <!-- 페이징 -->
        
                    <div style=" margin-top:10px; " align="center" id="pageBar">   
                    
                    <c:if test="${currentPage != 1 }">
                        <a  class="btn blue" href="${pageContext.request.contextPath}/admin/customer.do?currentPage=${currentPage - 1 }&type=${type }&keyword=${keyword}">&lt;</a>
                    </c:if>
                    <c:forEach begin="${startPage }" end="${endPage }" var="p">
                        <c:choose>
                            <c:when test="${p == currentPage}">
                                <b><a class="btn blue">${p }</a></b>
                            </c:when>
                            <c:when test="${p != currentPage }">
                                <a  class="btn blue" href="${pageContext.request.contextPath}/admin/customer.do?currentPage=${p }&type=${type }&keyword=${keyword}">${p }</a>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage != maxPage}">
                        <a class="btn blue" href="${pageContext.request.contextPath}/admin/customer.do?currentPage=${currentPage +1 }&type=${type }&keyword=${keyword}">&gt;</a>
                    </c:if>
                    </div>
                </div>
                
        	</div>
        
    
    
    

    <script>
    $(function() {
		$("#table2 tr #detail").click(function() {
			
			var mno = $(this).parents().parents().children().eq(0).text();
			
			location.href="${ pageContext.request.contextPath }/admin/customer.de?memberNo=" + mno;
			
		});
	});
    $(function() {
		$("#table2 tr #delete").click(function() {
			
			 if (!confirm("회원을 삭제하시겠습니까?")) {
				 	alert("취소");
			    } else {
			    	var mno = $(this).parents().parents().children().eq(0).text();
					
					location.href="${ pageContext.request.contextPath }/admin/delete.cu?memberNo=" + mno;
			    }
		});
	});
    </script>
</body>
</html>