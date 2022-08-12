<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제완료</title>

     <!--   Google Fonts -->
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
 

    <link rel="stylesheet" href="../resource/images/har.css">
    <link rel="stylesheet" href="../resource/images/bootstrap.min.css">
    
     <style>

   
        h1{
            text-align: center;

        }

     
        .pysucess{
            text-align: center;
            font-family: 'Noto Sans KR';
            font-style: normal;
            font-weight: 400;
            font-size: 40px;
        }
        .pysucess1{
            text-align: center;
            font-family: 'Noto Sans KR';
            font-style: normal;
            color: rgb(193, 136, 236);
            margin-bottom:400px;
        }
        

    </style>
    
</head>

<body>

<jsp:include page="/WEB-INF/views/include/topbar.jsp"/>
        <h1 class = "title" style="font-weight: bold; margin-top: 200px;">재능판다 결제완료<img src="../resources/images/IMG_9389.PNG" width="35px" height="35px"></h1>
    
        <p class="pysucess">
            결제가 완료되었습니다. 
        </p>
        <p class="pysucess1">
           수강 결제 내역은 마이페이지를 통해 확인이 가능합니다!
        </p>
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>