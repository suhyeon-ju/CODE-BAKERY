<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
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
	
	<div id="contact" class="container" style=" border-bottom: solid 1px #eee">
		<div class="page-header" style="margin: 40px 0 20px">
			<h2 style="padding-top: 20px;">${list.quiz_Title }</h2>
		</div>
	</div>
	
	<div id="contact" class="container">
		<table style="width: 100%; max-width: 100%; margin-top: 20px; margin-bottom: 20px;">
			<thead id="table-bottom-border">
				<tr>
					<th width="10%" style="text-align: left;">제출</th>
					<th width="10%" style="text-align: left;">정답자</th>
					<th width="10%" style="text-align: left;">정답 비율</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${list.try_User }</td>
					<td>${list.correct_User }</td>
					<td>${list.correct_Rate }</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="contact" class="container">
		<section id="description">
			<div class="headline">
				<h2>문제</h2>
			</div>
			<div>
				<p>
					${list.quiz_Content }
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
				${list.input_Explanation }
			</p>
		</section>
	</div>
	
	<div id="contact" class="container">
		<section id="output">
			<div class="headline">
				<h2>출력</h2>
			</div>
			<p>
				${list.output_Explanation }
			</p>
		</section>
	</div>
	
	<div id="contact" class="container">
		<div class="samplediv">
			<section id="sampleinput1" style="margin-right: 25px;">
				<div class="headline">
					<h2>예제 입력 1</h2>
				</div>
				<pre class="sampledata">${list.input_Sample }
				</pre>
			</section>
		</div>
		<div class="samplediv">
			<section id="sampleoutput1" style="margin-left: 25px;">
				<div class="headline">
					<h2>예제 출력 1</h2>
				</div>
				<pre class="sampledata">${list.output_Sample }
				</pre>
			</section>
		</div>
	</div>		
	
	<div id="contact" class="container" style="text-align: center;">
		<input type="button" value="문제 풀기" class="button" style="border-radius: 12px; margin-top: 30px;" onclick="location.href='quiz_submit.do?quiz_No=${list.quiz_No}'"/>
	</div>
	
	<footer style="clear: both; margin-top: 40px;">
		<%@ include file="footer.jsp"%>
	</footer>
	
</body>
</html>