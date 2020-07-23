<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/csss/bootstrap.min.css" rel="stylesheet"
	type="text/css" media="all" />
<style type="text/css">
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#confirm").click(
				function() {
					var user_Id = $("#user_Id").val();
					var user_Grade = $("#user_Grade").val();
					console.log('user_Id : ' + user_Id + '\nuser_Grade : '
							+ user_Grade);

					var userVal = {
						'user_Id' : user_Id,
						'user_Grade' : user_Grade
					};

					$.ajax({
						type : "POST",
						url : "adjustres.do",
						data : JSON.stringify(userVal),
						contentType : "application/json",
						dataType : "json",
						success : function(msg) {
							if (msg.adjust > 0) {
								alert("회원 등급이 변경되었습니다.")
								window.close();
								opener.location.reload();
							} else {
								alert("회원 등급 수정 실패");
							}
						},
						error : function() {
							alert("통신 실패");
						}
					})
				});
		$("#mentorconfirm").click(function() {
			var user_Id = $("#user_Id").val();
			var mentor_Career = $("#mentor_Career").val();
			var mentor_Content = $("#mentor_Content").val();

			var userVal = {
				'user_Id' : user_Id,
				'mentor_Career' : mentor_Career,
				'mentor_Content' : mentor_Content
			};

			$.ajax({
				type : "POST",
				url : "mentorapply.do",
				data : JSON.stringify(userVal),
				contentType : "application/json",
				dataType : "json",
				success : function(msg) {
					if (msg.adjust > 0) {
						alert("멘토내용 INSERT 완료")
					} else {
						alert("멘토 내용 INSERT 실패");
					}
				},
				error : function() {
					alert("통신 실패");
				}
			})
		});

		$("#mentortable").hide();
		var user_grade = $("#user_Grade option:selected").val();
		if (user_grade == "일반회원") {
			$("#mentortable").show();
		}
	});
</script>
<style type="text/css">
body {
	background: #F2EFEF;
}
</style>
</head>
<body>
	<div class="title"
		style="margin-bottom: 20px; margin-top: 20px; padding: 30px;">
		<h1 style="text-align: center;">등급조정</h1>
	</div>

	<!-- <form action="adjustres.do"> -->
	<table style="margin-left: 80px;">
		<tr>
			<td><input type="hidden" id="user_Id" name="user_Id"
				value="${userone.user_Id}" /> <select class="grade form-control"
				id="user_Grade" name="user_Grade"
				style="display: inline-block; width: 200px; height: 35px; margin-left: 60px;">
					<option value="일반회원"
						<c:if test="${userone.user_Grade eq '일반회원' }">selected</c:if>>user</option>
					<option value="멘토"
						<c:if test="${userone.user_Grade eq '멘토' }">selected</c:if>>mentor</option>
			</select></td>
			<td>&nbsp;&nbsp;<input type="button" id="confirm"
				class="confirm btn btn-link" value="확인">
			</td>
		</tr>
	</table>
	<table style="margin-left: 140px;" id="mentortable">
		<input type="hidden" id="user_Id" name="user_Id"
			value="${userone.user_Id}" />
		<tr>
			<td>멘토 경럭</td>
			<td>멘토 소개</td>
		</tr>
		<tr>
			<td><textarea rows="5" cols="10" id=mentor_Career></textarea></td>
			<td><textarea rows="5" cols="10" id=mentor_Content></textarea></td>
			<td><input type="button" id="mentorconfirm" value="확인"></td>
		</tr>
	</table>

	<!-- </form> -->
</body>
</html>