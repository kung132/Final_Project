<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 등록 페이지</title>
    
    
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    
	    #content {
	        height: auto;
	        padding-top : 150px;
	    }
	
	    #content form>table {
	        border-collapse: separate;
	        border-spacing: 20px 5px;
	    }
	
	    #btnofEnroll {
	        position: sticky;
	        bottom: 0px;
	        width: 1000px;
	        background-color: white;
	    }
	    
	    #resetBtn  {
	        background-color: rgb(170, 143, 211);
	        width: 120px;
	        height: 40px;
	        color: white; 
	        margin-left: 700px;
	    }
	
	    #updateBtn {
	        background-color: rgb(94, 47, 65);
	        width: 120px;
	        height: 40px;
	        color: white;
	        float: right;
	        margin-right: 40px;
	        margin-bottom: 10px;
	    }
	
	    #enrollTable {
	        border-collapse: separate;
	        border-spacing: 0 20px;
	    }
    </style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>

	<br>
    <div id="content">
        <div id="titleOfPage" style="margin-left: 400px;">
            <span style="font-size: 25px; color: rgb(170, 143, 211); font-weight: bold;">레슨 게시글 작성</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;">* 필수항목</span>
        <div>
            <br>
            <form action="enrollBoard.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="currentPage" value="1">
                <table id="enrollTable">
                    <tr>
                        <td>
                            <select name="mainCategoryJsp" id="mainCategoryJsp">
                                <option value="none">카테고리 선택</option>
                                <option value="외국어">외국어</option>
                                <option value="악기">악기</option>
                                <option value="스포츠">스포츠</option>
                                <option value="취미">취미</option>
                                <option value="시험/자격증">시험/자격증</option>
                                <option value="컨설팅">컨설팅</option>
                            </select>
                        </td>
                        <td colspan="2">
                            <select name="categoryName" id="cateogoryDeatilSel">
                            </select>
                        </td>
                    </tr>
                    
                    <script>
                    	
                    		$("#mainCategoryJsp").change(function() {
								
                    			var mainCategoryStr = $(this).val();
                        		$.ajax({
                        			url : "${ pageContext.request.contextPath }/boardRest/enrollrestCategoryJsp.do",
                        			type : "get",
                        			data : {mainCategory : mainCategoryStr},
                        			success : function(result) {
                        				
                        				console.log("ajax 성공");
                        				
                        				var str ="";
                        				for(var i = 0; i < result.length; i++) {
                        					str += "<option "
                        								+ "value='" + result[i].categoryName + "'>" + result[i].categoryName 
                        							+ "</option>"
          
                        				}
                        				$("#cateogoryDeatilSel").html(str);
                        			},
                        			error : function() {
                        				console.log("ajax 통신 실패!");
                        			}
                        			
                        		});
                    			
                    		});
               	
                    		
                    </script>
                    
                    <tr style="padding-top: 10px;">
                        <td colspan="3" align="center">
                            <span style="margin-right: 20px; margin-top: 20px;">* 제목 : </span> 
                            <input type="text" name="boardTitle" style="width: 650px;" placeholder="제목을 입력하세요." required>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <hr>
                            <span style="margin-right: 80px;">대표 이미지 등록하기 :</span>
                            <img id="titleImg" width="350" height="300"><br><br>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="margin-right: 146px;">* 가격 : </span>
                        </td>
                        <td colspan="2">
                            <input type="text" name="cost" id="cost" placeholder="숫자만 입력하세요." required> 원    
                            <hr> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="margin-right: 40px; margin-bottom: 100px;">* 해당 가격 레슨 내용 : 
                        </td>
                        <td colspan="2">
                            </span>
                            <textarea type="text" name="lessonContent" placeholder="해당 가격의 레슨 내용을 입력하세요." style="resize: none;" rows="10" cols="90" onKeyUp="javascript:fnChkByte(this,'3000')" required></textarea>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="margin-right: 103px;">* 경력 / 이력 : </span>
                        </td>
                        <td colspan="2">
                        	<textarea placeholder="경력/이력을 작성하세요." name="career" style="resize: none;" rows="10" cols="90" onKeyUp="javascript:fnChkByte(this,'3000')" required></textarea>
	                        
                        <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="margin-right: 62px;">* 서비스 상세 내용 : </span>
                        </td>
                        <td colspan="2" name="boardContent">
	                        <c:if test="${ seller.contents ne null }">
	                        	<textarea placeholder="서비스 상세 내용을 입력하세요." name="boardContent" style="resize: none;" rows="30" cols="90" onKeyUp="javascript:fnChkByte(this,'3000')" required>${ seller.contents }</textarea>
	                        </c:if>
                            <textarea placeholder="서비스 상세 내용을 입력하세요." name="boardContent" style="resize: none;" rows="30" cols="90" onKeyUp="javascript:fnChkByte(this,'3000')" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="margin-right: 62px;">* 서비스 날짜 : </span>
                        </td>
                        <td>
                        	<input type="date" name="stDate" id="currentDate" required>
                            <input type="date" name="fnDate" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="margin-right: 62px;">* 위치 상세 내용 : </span>
                        </td>
                        <td>
                        	<textarea placeholder="위치에 관한 상세 내용을 입력하세요." name="placeContent" style="resize: none;" rows="15" cols="90" onKeyUp="javascript:fnChkByte(this,'3000')" required></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                    	<td>
                    		<span style="margin-right: 62px;">상세이미지 등록하기</span>
                    	</td>
                    	<tr>
		                    <td colspan="3">
			                 	<img id="contentImg1" width="450" height="320">
			                 </td>
			            </tr>
			            <tr>
		                    <td colspan="3">
			                     <img id="contentImg2" width="450" height="320">
			                 </td>
			            </tr>
			            <tr>
		                    <td colspan="3">
			                     <img id="contentImg3" width="450" height="320">
			                 </td>
               			</tr>

                </table>
                
               	<div id="file-area">
	                <input type="file" id="file1" name="upfiles" onchange="loadImg(this, 1)" value="1" accept=".jpg, .png, .gif" required> <!-- 대표이미지 : 필수 -->
	                <input type="file" id="file2" name="upfiles" onchange="loadImg(this, 2)" accept=".jpg, .png, .gif"> 
	                <input type="file" id="file3" name="upfiles" onchange="loadImg(this, 3)" accept=".jpg, .png, .gif">
	                <input type="file" id="file4" name="upfiles" onchange="loadImg(this, 4)" accept=".jpg, .png, .gif">
                    </div>
                <br><br><br><br>
                <div id="btnofEnroll">
                    <hr>
                    <button onclick="confirmModal();" type="button" class="btn" id="resetBtn">취소하기</a>
                    <button type="submit" class="btn" id="updateBtn" onclick="return checkForm();">등록하기</button>
                </div>
                <br><br>
            </form>
        </div>
    </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    
    <script>
    
    	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
    	
    	var today = new Date();
		var yyyy = today.getFullYear();
		var mm = today.getMonth()+1 > 9 ? today.getMonth()+1 : '0' + (today.getMonth()+1);
		var dd = today.getDate() > 9 ? today.getDate() : '0' + today.getDate();
    	 
    	today = yyyy+'-'+mm+'-'+dd;
    	$("input[name=stDate]").attr("min", today);
    	$("input[name=fnDate]").attr("min", today);
    	
        $(function() {
        	$("#file-area").hide();
        	
        	$("#titleImg").click(function() {
        		$("#file1").click();
        	});
	        $("#contentImg1").click(function() {
        		$("#file2").click();
        	});
    		$("#contentImg2").click(function() {
        		$("#file3").click();
        	});
     		$("#contentImg3").click(function() {
        		$("#file4").click();
        	});
        })
        
        function loadImg(inputFile, num) {
                    

                    if(inputFile.files.length == 1) { 
                    	
                        var reader = new FileReader();

                        reader.readAsDataURL(inputFile.files[0]);
                        
                        reader.onload = function (e) {
                            
                            switch(num) {
                                case 1 : $("#titleImg").attr("src", e.target.result); break;
                                case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                case 4 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        };
                    } else { 
                        switch(num) {
                            case 1 : $("#titleImg").attr("src", null); break;
                            case 2 : $("#contentImg1").attr("src", null); break;
                            case 3 : $("#contentImg2").attr("src", null); break;
                            case 4 : $("#contentImg3").attr("src", null); break;
                        }
                    }
                }
        
        function confirmModal() {
        	var result = confirm("작성을 취소하시겠습니까?");
    		if(result) {
    			history.back();
    		}
        }
        
		function checkForm() {
			var cost = document.getElementById('cost').value;
			var regExp = /^[0-9]/g;
			if(!regExp.test(cost)) {
				alert('가격은 숫자만 입력가능합니다.');
				document.getElementById('cost').value = '';;
				document.getElementById('cost').focus();
				return false;
			}
			return true;
		}
		
    </script>
   
    
</body>
</html>