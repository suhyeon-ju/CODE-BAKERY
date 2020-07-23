<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text:html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKER</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/css/defaultQuestion.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
		
	<form action="insertQuiz.do" method="post">
	<input type="hidden" name="user_Id" value="${User.user_Id }">
	<div id="contact" class="container">
		<section id="description">
			<div class="headline">
				<h2>제목</h2>
			</div>
			<div>
				<p>
					<input type="text" name="quiz_Title">	
				</p>
			</div>
		</section>
	</div>
	
	<div id="contact" class="container">
		<section id="description">
			<div class="headline">
				<h2>문제</h2>
			</div>
			<div>
				<p>
					<textarea rows="10" cols="40" name="quiz_Content"></textarea>
				</p>
			</div>
		</section>
	</div>
	
	<div id="contact" class="container">
		<section id="input">
			<div class="headline">
				<h2>입력</h2>
			</div>
			<p>
				<input type="text" name="input_Explanation"/>
			</p>
		</section>
	</div>
	
	<div id="contact" class="container">
		<section id="output">
			<div class="headline">
				<h2>출력</h2>
			</div>
			<p>
				<input type="text" name="output_Explanation"/>
			</p>
		</section>
	</div>
	
	<div id="contact" class="container">
		<div class="samplediv">
			<section id="sampleinput1" style="margin-right: 25px;">
				<div class="headline">
					<h2>예제 입력 1</h2>
				</div>
				<pre class="sampledata"><textarea rows="10" cols="40" name="input_Sample"></textarea> 
				</pre>
				
			</section>
		</div>
		<div class="samplediv">
			<section id="sampleoutput1" style="margin-left: 25px;">
				<div class="headline">
					<h2>예제 출력 1</h2>
				</div>
				<pre class="sampledata"><textarea rows="10" cols="40" name="output_Sample"></textarea>
				</pre>
			</section>
		</div>
		
		<div class="container" style = "text-align:center;">
			<input type="submit" class = "button" value="submit">
			<input type="button" class = "button"  value="cancel" onclick="location.href='list.do'">
		</div>
		
	</div>		
	</form>
	
	<footer style="clear: both; margin-top: 40px;">
		<%@ include file="footer.jsp"%>
	</footer>
	
</body>
</html>