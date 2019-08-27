<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
   <h1 align="center">Spring에서의 ajax 사용 테스트 페이지</h1>
   <!-- <button onclick="location.href='testtest.do'">테스트 버튼</button>   -->
   
   
   <ol>
   	<li>
		서버 쪽 컨트롤러로 값 보내기
		<button id="test1"> 테스트</button>
		
		<script>
			$(function(){
				$("#test1").on("click",function(){
					$.ajax({
						url: "test1",
						data: {name:"신사임당", age : 47}, //이것을 그대로 controller 로 보낸다. url
						type: "post",
						success: function(data){
							// 컨트롤에서 확인후 data 이름으로 넘어 온다
							if(data == "ok"){
								alert("전송 성공");
							}else{
								alert("전송 실패");
							}

						},
						error: function(request, status, errorData){
							alert("error cod : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + errorData);
						} 
							
					});
				});
			});
		</script>
   	</li>
 <!-- ======================================================================================================= -->  	  	
   	<li>
   		컨트롤러에서 리턴하는 JSON객체 받아서 출력하기
   		<button id="test2">테스트</button>
   		<div id="d2"></div>
   		<script>
   			$(function(){
   				$("#test2").on("click", function(){
   					$.ajax({
   							url: "test2",
   							dataType:"json", // json 으로 받기 위해서 데이터 타입을 선언해줘야 한다. 미리 이렇게 선언하든가 success 에서 선언 2가지 방법
   							success: function(data){
   								// data = JSON.parse(data);

   								$("#d2").html("번호 : " + data.no + "<br>제목 : " + data.title + "<br>작성자 : " + decodeURIComponent(data.writer) +
   										 "<br>내용 : " + decodeURIComponent(data.content.replace(/\+/g, " ")))
   								
   							},
   							error: function(request, status, errorData){
   								alert("error cod : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + errorData);
   							} 
   							
   					});
   				});
   			});
   		</script>
   		
   		
   	</li>
 <!-- ======================================================================================================= -->  	
   		<li>
   		데이터 타입 json 컨트롤러 선언
   		<button id="test3">테스트</button>
   		<div id="d3"></div>
   		<script>
   			$(function(){
   				$("#test3").on("click", function(){
   					$.ajax({
   							url: "test3",
   						//	dataType:"json",  컨트롤러에서 선언을 해줫기 대문에 더이상 타입을 선언을 해줄 필요가 없다.
   						// 원래 dataType 할 필요가 없다. ex 로 왜한거는 json 을 String 로 변경후 다시 json 받아오기 위해서
   							success: function(data){
   								// data = JSON.parse(data);

   								$("#d3").html("번호 : " + data.no + "<br>제목 : " + data.title + "<br>작성자 : " + decodeURIComponent(data.writer) +
   										 "<br>내용 : " + decodeURIComponent(data.content.replace(/\+/g, " ")))
   								
   							},
   							error: function(request, status, errorData){
   								alert("error cod : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + errorData);
   							} 
   							
   					});
   				});
   			});
   		</script>
   		
   		
   	</li>
 <!-- ======================================================================================================= -->  	
 	<li>
 		컨트롤러에서 리턴하는 JSON 배열 받아 출력하기
 		<button id="test4">테스트</button>
 		<div id ="d4"></div>
 		
 		<script>
 			$(function(){
 				$("#test4").on("click", function(){
 					$.ajax({
 						url: "test4",
 						success: function(data){
 							var values = $("#d4").html();
 							
 							for(var i in data.list){
 								values += data.list[i].userId + "," 
 										+ data.list[i].userPwd + ","
 										+ data.list[i].userName + ","
 										+ data.list[i].age + ","
 										+ data.list[i].email + ","
 										+ data.list[i].phone + "<br>";
 							}
 							$("#d4").html(values);
 						},
 						error: function(request, status, errorData){
								alert("error cod : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + errorData);
 						}
 					});
 				});
 			});
 		</script>
 	</li>   	
 <!-- ======================================================================================================= -->  	
   	<li>
   		컨트롤러에서 리턴하는 Map객체를 받아서 출력하기
   		<button id="test5">테스트</button>
   		<div id="d5"></div>
   		
   		<script>
   			$(function(){
   				$("#test5").on("click",function(){
   					$.ajax({
   						url: "test5",
   					});
   				});
   			});
   		</script>
   		
   		
   	</li>
   	
   	
   	
   </ol>
   
</body>
</html>