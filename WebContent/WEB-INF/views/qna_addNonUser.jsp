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
	}
	
	h2{
		text-align: center;
	    padding: 8px;
       	font-size: 28px;
       	margin-top: 20px;
	}
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">


	var idCheck = /^[a-zA-Z0-9]{4,12}$/;

	function chkId(){
		
		var id = $("#nuser_Id").val().trim();
		
		if(id == "" || id == null){
			alert("아이디를 입력해주세요.");
			$("#nuser_Id").focus();
			return false;
			
		}else if(!idCheck.test($("#nuser_Id").val())) {
				alert("아이디는 4~12자리의 영문 대소문자와 숫자로만 입력해주세요");
				$("#nuser_Id").val("");
				$("#nuser_Id").focus();
				return false;
			} else {

			$.ajax({
				url: "chkNonUser.do",
				type: 'POST',
				data: {"nuser_Id":id},
				success: function(data){
					if(data == false){
						alert("등록 가능한 아이디 입니다.");
						$("#temId").val("y");
					} else{
						alert("다른 아이디로 등록해주세요.");
						$("#temId").val("n");
						$("#nuser_Id").focus();
						return false;
					}
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
				}
				
			}); 
		
		}
		
	}


	function nonUserForm(){
		
			if($("#temId").val()=='n'){
				alert("존재하는 아이디 입니다. 다른 아이디를 입력해주세요.");
				$("#temId").focus();
				return false;
			} else{
			
			var id = $("#nuser_Id").val();
			var qno = $("#question_No").val();
			var title = $("#answer_Title").val();
			var content = $("#answer_Content").val();
			
			
			$.ajax({
				url: "nonUser.do",
				type: 'POST',
				data: {"nuser_Id":id, "question_No":qno, "answer_Title":title, "answer_Content":content},
				success: function(data){
					alert("답변이 등록되었습니다.")
					window.close();
					window.opener.location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
				} 
			}); 
				
				
		}
		
	}
	
	function doSignUp(){
		window.close();
		window.opener.location.href="sign.do";
	}

	
</script>
</head>
<body>
	<h2>비회원 답변 작성</h2>
		<input type="hidden" id="question_No" value="${answer.question_No }" />
		<input type="hidden" id="answer_Title" value="${answer.answer_Title }"/>
		<input type="hidden" id="answer_Content" value="${answer.answer_Content }"/>
		<input type="hidden" id="temId" value="n" />
				<br>
				<div style="text-align: center;">답변 작성시 사용하실 아이디를 입력해주세요.</div><br>
				<div style="text-align: center; font-family: monospace; font-size: 15px;">
					<input type="text" name="nuser_Id" id="nuser_Id"/>
					<input type="button" class="btn btn-outline-dark btn-sm" value="아이디확인" onclick="chkId();"/>
				</div><br><br>
				<div style="text-align: right; margin-right: 20px;">
					<input type="button" class="btn btn-secondary btn-sm" value="등록하기" onclick="nonUserForm();"/>
					<input type="button" class="btn btn-secondary btn-sm" value="취소" onclick="javascript:window.history.back()"/>
				</div>
				<br><br>
				<div style="text-align: center;">
					<p style="color:red;">** 답변 수정/삭제는 등록하신 아이디로 
					<br>회원가입 후 가능합니다 **</p>
					<p onclick="doSignUp();" style="color: blue; text-decoration: underline; cursor: pointer;">회원가입 하러가기</p>
				</div>
</body>
</html>