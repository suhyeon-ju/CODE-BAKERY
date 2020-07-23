<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
	#form{
		text-align: center;
		padding: 30px;
	}
	
	#done{
		width: 130px;
		height: 35px;
		background-color: grey;
		color: white;
		font-size: 20px;
		cursor: pointer;
		border: none;
	}
	
	#title{
		text-align: center;
		margin-top: 55px;
	}
	
	fieldset{
		padding: 20px;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	
	
	$(document).ready(function(){

		$("#done").click(function(){
			
			var prePw = '<c:out value="${User.user_Pw}"></c:out>';
			var chkPw = $("#PassWord").val();
				 
			 if(prePw == chkPw){
					location.href="mypage_modify.do";
				} else{
					alert("비밀번호가 올바르지 않습니다.");
					return false;
				}  
		});
		
	});
	
</script>
</head>
<body>
<%@ include file="header.jsp"%>
	
    <h1 id="title">회원 정보 수정</h1>
    <br><br>
	<div id="form">
    <div class="confirm">
        <fieldset>
            <h3>비밀번호 확인</h3>
            <p class="info"><strong style="color: blue;">${User.user_Name }</strong> 님의 회원정보를 안전하게 보호하기 위해<br />비밀번호를 한번 더 확인해 주세요.</p>
            <p class="password"><span><strong>> 비밀번호</strong>&nbsp;&nbsp;&nbsp;</span><input type=password id="PassWord"/></p>
            <br>
             <input class="btn btn-dark" type="button" value="확인" id="done" onclick="samePw();"/>
        </fieldset>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>