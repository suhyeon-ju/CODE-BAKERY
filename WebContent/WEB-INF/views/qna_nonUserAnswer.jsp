<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="resources/csss/bootstrap.min.css" rel="stylesheet"  type="text/css" media="all"/>
<style type="text/css">
	body{
		background: #F2EFEF;
		text-align: center;
		padding: 30px;
		margin-top: 100px;
	}
	
	.button{
		margin-bottom: 25px;
	    border: none;
	    padding: 25px;
	    width: 200px;
	}
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	
	function doLogin(){
		window.close();
		window.opener.location.href="login.do";
	}
</script>
</head>
<body>
	<form method="post" action="addNonUser.do">
		<input type="hidden" name="question_No" value="${answer.question_No }" />
		<input type="hidden" name="answer_Title" value="${answer.answer_Title }"/>
		<input type="hidden" name="answer_Content" value="${answer.answer_Content }"/>
		<input type="submit" class="btn btn-outline-dark btn-lg btn-block" value="비회원으로 작성하기"/><br>
		<input type="button" class="btn btn-outline-dark btn-lg btn-block" value="로그인하기" onclick="doLogin();"/>
	</form>
</body>
</html>