<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>수강후기 등록</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="resource/css/bootstrap.css">
    <style>
    	.con{
    	  width: 550px;
        height: auto;
       margin-top: 150px;
        margin-bottom: 50px;
       margin-left: 600px;
    	}
        .star-rating {
            display: flex;
            flex-direction: row-reverse;
            font-size: 3.25rem;
            line-height: 2.5rem;
            justify-content: space-around;
            padding: 0 0.2em;
            text-align: center;
            width: 5em;
            }
            
        .star-rating input {
            display: none;
            }
            
        .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 2.3px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
            }
            
        .star-rating :checked ~ label {
            -webkit-text-fill-color: RGB(170, 143, 211);
            }
            
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            -webkit-text-fill-color: RGB(170, 143, 211);
            }
    </style>
  </head>
  
  <body>
  <jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
  
  <!--  부트스트랩 js 사용 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="resource/js/bootstrap.js"></script>
  
  <!--start-->
  <div class="con">
      <!--enroll_reveiw-->
      <div id="enroll_review">
        <h3>후기 등록</h3><hr>
        <form action="enroll.do" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="boardNo" value="${boardNo}">
        	<input type="hidden" name="memberNo" value="${memberNo}">
            <table >
                <th style="width: 200px;"></th>
           
                 <!-- 레슨명-->
                <tr style="height: 20px;">
                    <td><h3>수강 레슨명  :  </h3></td>
                    <td><h3>${boardTitle}</h3></td>
               
                </tr>
                 <!-- 별점-->
                <tr>
                    <td><h3>별점 : </h3></td>
                    <td>
                        <div style="float: left;"class="star-rating space-x-4 mx-auto">
                            <input type="radio" id="5-stars" name="reviewStar" value="5" v-model="ratings"/>
                            <label for="5-stars" class="star pr-4">★</label>
                            <input type="radio" id="4-stars" name="reviewStar" value="4" v-model="ratings"/>
                            <label for="4-stars" class="star">★</label>
                            <input type="radio" id="3-stars" name="reviewStar" value="3" v-model="ratings"/>
                            <label for="3-stars" class="star">★</label>
                            <input type="radio" id="2-stars" name="reviewStar" value="2" v-model="ratings"/>
                            <label for="2-stars" class="star">★</label>
                            <input type="radio" id="1-star" name="reviewStar" value="1" v-model="ratings" />
                            <label for="1-star" class="star">★</label>
                        </div>
                    </td>
                </tr>
                 <!-- 제목-->
                <tr style="height: 50px;">
                    <td><h3>제목 : </h3></td>
                    <td>
                        <input style="width: 367px; height: 30px;" type="text" name="reviewTitle" 
                         placeholder ="간단한 후기를 남겨주세요.">
                    </td>
                </tr>
                <!-- 내용-->
                <tr >
                    <td><h3>내용 : </h3></td>
                    <td>
                        <textarea name="reviewContent" style="resize: none;"" rows="20" cols="49" placeholder ="상세 후기를 작성해주세요.

※ 허위사실 입력 시 불이익이 있을수도 있습니다."></textarea>
                    </td>
                </tr>
                <!-- 이미지1-->
                <tr col style="height: 50px;">
                    <td colspan='2'>상세이미지 : <input type="file" name="upfile1" accept=".jpg, .png, .gif" 
                    style="padding-left: 15px; padding-right: 15px;"> </td>
                </tr>
                <!-- 이미지2-->
                <tr col style="height: 50px;">
                    <td colspan='2'>상세이미지 : <input  type="file" name="upfile2" accept=".jpg, .png, .gif" 
                    style="padding-left: 15px; padding-right: 15px;"> </td>
                </tr>
               
            </table>
            <button name="submit" type="submit" style="width: 100px; height: 30px;  margin-right:10px; color: white; 
                           background-color: RGB(170, 143, 211);  font-size: 15pt;
                           border: none; float: left" >등록</button>
        </form>
      </div>
  </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	
  </body>
</html>