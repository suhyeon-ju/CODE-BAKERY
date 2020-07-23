<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/csss/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/csss/fonts/fonts.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="resources/csss/loginstyle.css" rel="stylesheet" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="121669463740-pd7j72id6sifhlpku0rie93puk61f33d.apps.googleusercontent.com" />
<link href="resources/csss/bootstrap.min.css" rel="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript">
	$(function() {

		$("#log").click(function() {

			var id = $('#userId').val();
			var pw = $("#userPwS").val();

			$.ajax({
				type : "POST",
				url : "chkIdPw.do",
				data : {
					"user_Id" : id,
					"user_Pw" : pw
				},
				success : function(data) {
					if (data == 0 || data == null) {
						alert("아이디 및 비밀번호를 확인해주세요");
					} else {
						alert(id + "님 환영합니다");
						$("#loginform").submit();
					}
				},
				error : function() {
					alert("ajax 통신 실패!");
				}

			});

		});

	});

	function onSignIn(googleUser) {

		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail());
		var user_Id = profile.getId();
		var user_Name = profile.getName();
		var user_Pic = profile.getImageUrl();
		$.ajax({
			url : "googleLogin.do",
			data : {
				"user_Id" : user_Id,
				"user_Name" : user_Name,
				"user_Pic" : user_Pic
			},
			type : "POST",
			success : function(data) {
				alert("구글 로그인 성공")
				window.location.href = "main.do";
			},
			error : function() {
				alert("에러");
			}
		});

	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="center" style="margin-top: 60px;">
		<h1 style="padding: 20px; font-weight: 700;">Login</h1>
		<form method="post" action="loginchk.do" id="loginform">
			<div class="txt_field">
				<input type="text" name="user_Id" id="userId" /> <span></span> <label>id</label>
			</div>
			<div class="txt_field">
				<input type="password" name="user_Pw" id="userPwS" /> <span></span>
				<label>password</label>
			</div>
			<br />
			<input type="button" value="Login" id="log"
				class="btn btn-secondary btn-lg btn-block" style="margin-top: 15px;" />
			<br></br>
			<div class="g-signin2 btn" data-onsuccess="onSignIn"
				style="margin-left: 80px; padding: 0px;"></div>
			<div class="signup_link">
				<a href="findId.do">아이디 찾기</a> &nbsp;/&nbsp; <a href="findPw.do">비밀번호
					찾기</a>
			</div>
			<div class="signup_link">
				회원이 아니세요? <a href="sign.do">회원가입하기</a>
			</div>
		</form>
	</div>

</body>
</html>
