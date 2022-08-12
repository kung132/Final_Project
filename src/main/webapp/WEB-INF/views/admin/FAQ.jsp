<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

 <!-- jQuery library -->
 <script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 <!-- Popper JS -->
 <script
 src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

 <!-- Latest compiled JavaScript -->
 <script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
        #notice_btn{
        	background-color: rgb(180, 143, 211);
            border-radius: 30px;
            font-weight: bold;
            position:fixed; right:30px; bottom:30px;
            box-shadow: 1px 1px 2px 3px rgb(219, 218, 218);
            width:100px;
            height:50px;
          
        }

        #notice_post{
         	position: absolute;
         	z-index: 9999;
            border-radius: 10px;
            width: 400px;
            height: 600px;
            position:fixed; right:30px; bottom:30px;
            box-shadow: 1px 1px 2px 3px rgb(219, 218, 218);
            
            
        }
        #notice_header{
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            height: 25%;
            background-color:rgb(170, 143, 211);
            font-weight: bold;
           
            
        }
        #notice_body{
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            height: 80%;
            background-color: white;
            
        }

        #notice_search{
            background-color: rgb(170, 143, 211);
            height: 10px;
            padding-bottom: 10px;
        }
       
        a {text-decoration: none; color: black;}
        a:hover {color: rgb(121, 42, 115);}

        #search_btn{
            background-color: transparent;
            border-color: transparent;
            font-weight : bold;
            color: white;
            height : 30px;
            width: 30px;
        }
        #notice_tb tbody tr td{
            padding-bottom: 10px;
            font-size:15px;
        }
        #notice_tb tbody tr:hover {
        	cursor:pointer;
            color:rgb(170, 143, 211);
        }
        #notice_tb tbody tr td:first-child{
        	visibility: hidden;
        }
        ::-webkit-scrollbar {
	    width: 8px;
	    height: 8px;
	    background: #ffffff;
	  }
  	::-webkit-scrollbar-thumb {
	    border-radius: 3.5px;
	    background-color: #ced4da;
	
	    &:hover {
	      background-color: #adb5bd;
	    }
	 ::-webkit-scrollbar-track {
	    background: #ffffff;
	  }
       
        
    </style>
</head>
<body>
    <button type="button" class="btn" id="notice_btn" style="color: white; z-index:99999 ">
	        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-question-lg" viewBox="0 0 16 16">
	  <path fill-rule="evenodd" d="M4.475 5.458c-.284 0-.514-.237-.47-.517C4.28 3.24 5.576 2 7.825 2c2.25 0 3.767 1.36 3.767 3.215 0 1.344-.665 2.288-1.79 2.973-1.1.659-1.414 1.118-1.414 2.01v.03a.5.5 0 0 1-.5.5h-.77a.5.5 0 0 1-.5-.495l-.003-.2c-.043-1.221.477-2.001 1.645-2.712 1.03-.632 1.397-1.135 1.397-2.028 0-.979-.758-1.698-1.926-1.698-1.009 0-1.71.529-1.938 1.402-.066.254-.278.461-.54.461h-.777ZM7.496 14c.622 0 1.095-.474 1.095-1.09 0-.618-.473-1.092-1.095-1.092-.606 0-1.087.474-1.087 1.091S6.89 14 7.496 14Z"/>
	</svg>
    </button>

    <div id="notice_post">
        <div id="notice_header">
            <button id="close" style="float: right; margin-top: 20px; margin-right: 20px; background-color: transparent; border:transparent; color:white;">
            	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
				  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
				</svg>
            </button>
            <button id="back" style="float: left; margin-top: 20px; margin-left: 20px;  background-color: transparent; border:transparent; color:white;">
            	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
				</svg>
            </button>
            <p align="center" style="padding:15px 15px 15px 15px; color: white; font-size:23px;">FAQ</p>
            
            <form name="search-form">
	            <div id="notice_search" align="center">
	                    <input type="text" name="keyword" placeholder="검색" style="width: 80%; height:50px;">
	                    <button type="button" onclick="getSearchList()"  id="search_btn">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
	                    </svg></button>
	            </div>
	        </form>
        </div>
			
        
        <div id="notice_body" style="padding: 25px;  ">
            <div style="height: 90%; width: 100%; overflow:auto;">
	           
	                <table id="notice_tb" >
	                	<tbody>
	                		<tr></tr>
	                	</tbody>
	                </table>
                
                 
            </div>
            <div style="text-align: right; height: 10%; width: 100%; background-color:white; ">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
	                    <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
	                </svg> 02-1234-0000 &nbsp;&nbsp;
	              
	         </div>
            <hr>
           
        </div>
    </div>
    
    <script>
        $('#notice_post').hide();
        var box = $('#back');
        box.css('visibility', 'hidden'); 
		
        $('#notice_btn').click(function(){
            $('#notice_btn').hide();
            $('#notice_post').show();
            getSearchList();

        });
        $('#close').click(function(){
            $('#notice_post').hide();
            $('#notice_btn').show();
            
        });
        
        $('#back').click(function(){
        	getSearchList();
        	$("#notice_search").show();
        	
	        var search3 = $('#notice_header');
	        search3.css('height', '25%').trigger("create"); 
	        var search2 = $('#notice_body');
	        search2.css('height', '75%').trigger("create"); 
	        var search3 = $('#back');
	        search3.css('visibility', 'hidden').trigger("create"); 
        });
    </script>
    <script>
    function getSearchList(){
			$.ajax({
				url : "${ pageContext.request.contextPath }/faq/faq.do",
				type : "get",
				data : $("form[name=search-form]").serialize(),
				success : function(result) {
					
					var str = "";
					
					for(var i = 0; i < result.length; i++) {
						str += "<tr>"
							 		+ "<td>"+ result[i].noticeNo + "</td>" 
							 		+ "<td>" + parseInt(i+1) +".</td>"
							 		+ "<td>" + result[i].noticeTitle + "</td>"
							 + "</tr>";
					}
					
					$("#notice_tb > tbody").html(str);
					$(function() {
					    $("#notice_tb tbody tr").css("font-size", "10px").trigger("create"); 
					    });
				},
				error : function() {
					console.log("ajax 통신 실패!");
				}
			});
			
			
			
		
    };
		
		
		$(function(FAQ_ajax) {
			$(document).on('click','#notice_tb tbody tr',function() {
				
				var nno = $(this).children().eq(0).text();
				
				$.ajax({
					url : "${ pageContext.request.contextPath }/faq/faq.de",
					type : "get",
					data : { nno : nno },
					success : function(result) {
						
						
						var str = "";
							str = "<p>" +"["+ result.noticeType +"]" + result.noticeTitle + "</p>"+ "<br>"+
								
								  result.noticeContent;
						
						
						$("#notice_tb > tbody").html(str);
						
						$(function() {
						    $("#notice_tb tbody p").css("font-weight", "bold").trigger("create"); 
						    });
						$(function() {
					        $("#notice_tb tbody p").css("font-size", "12px").trigger("create"); 
					    });
						$(function() {
					        $("#notice_search").hide().trigger("create"); 
					        var search = $('#notice_header');
					        search.css('height', '10%').trigger("create"); 
					        var search2 = $('#notice_body');
					        search2.css('height', '90%').trigger("create"); 
					        
					    });
						
						$(function() {
							var box = $('#back');
					        box.css('visibility', 'visible').trigger("create"); 
					    });
					},
					error : function() {
						console.log("ㅜㅜ");
					}
				});
			});
		});
		 


	</script>

 
</body>
</html>