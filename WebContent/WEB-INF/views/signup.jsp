<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link href="resources/csss/signstyle.css" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">


	// 아이디 정규식
	function idcheckz() {
		
		var idCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		if (!idCheck.test($("#userid").val())) {
			alert("아이디는 4~12자리의 영문 대소문자와 숫자로만 입력해주세요");
			$("#userid").val("");
			$("#userid").focus();
			return false;
		}
	}

	
	// 비밀번호 정규식
	function pwcheckz() {
		var passwdCheck = RegExp(/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/);
		if (!passwdCheck.test($("#userpw").val())) {
			alert("비밀번호는 8~16자리의 영문 소문자, 숫자, 특수문자를 하나 이상 포함하여 입력해주세요");
			$("#userpw").val("");
			$("#userpw").focus();
			return false;
		}
	}
	
	// 비밀번호 일치여부
	function samePw(){

		var pw = $("#userpw").val();
		var pwchk = $("#userpwcheck").val()
		
		if(pw != pwchk){
			alert("비밀번호가 일치하지 않습니다.");
			$("#userpwcheck").focus();
			return false;
		}
		
	}


	// 아이디 중복체크
	function idchk() {
		var user_Id = $('#userid').val();
		var idchk = {
			"user_Id" : user_Id
		};
		$.ajax({
			type : "POST",
			url : "idcheck.do",
			data : JSON.stringify(idchk),
			contentType : "application/json",
			dataType : "json",
			success : function(msg) {
				console.log(msg);
				if (msg.check == false) {
					confirm("사용 가능한 아이디입니다.");
					$("#idCheck").val("y");
				} else {
					alert("사용할 수 없는 아이디입니다.");
					$("#userid").focus();
					return false;
				}
			},
			error : function() {
				alert("ajax 통신 실패!");
			}

		});
	}
	

	// 비밀번호 일치여부 보여주는 곳
	$(function() {
		
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#userpw").val();
			var pwd2 = $("#userpwcheck").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
				}
			}
		});
		
		
		// 회원가입 전 유효성 검사
		$("#signupform").submit(
				
				function() {
					
					var id = $("#userid").val();
					var pw = $("#userpw").val();
					var pwchk = $("#userpwcheck").val()
					var username = $("#username").val();
					var userphone = $("#userphone").val();
					var phchk = $("#noChk").val();
					var usermail = $("#usermail").val();
					var pic = $("#photo").val();
					var lang = $("input[name=user_Lang]:checked").val();
					
					if(id == null || id == ""){
						alert("아이디를 입력해주세요.");
						$("#userid").focus();
						return false;
					}
					
					if(pw == null || pw == ""){
						alert("비밀번호를 입력해주세요.");
						$("#userpw").focus();
						return false;
					}
					
					
					if(pwchk == null || pwchk == ""){
						alert("비밀번호 확인창을 입력해주세요.");
						$("#userpwcheck").focus();
						return false;
					}
					
					if(username == null || username == ""){
						alert("이름을 입력해주세요.")
						$("#username").focus();
						return false;
					}
					
					var phoneChk = /(\d{3}).*(\d{3}).*(\d{4})/;
					if(userphone == null || userphone == ""){
						alert("핸드폰번호를 입력해주세요.")
						$("#userphone").focus();
						return false;
						
					} else if(phoneChk.test(userphone) == false){
						alert("핸드폰 형식이 올바르지 않습니다.\n예시) 010-0000-0000");
						$("#userphone").val();
						$("#userphone").focus();
						return false;
					}
					
					if(phchk == null || phchk == ""){
						alert("핸드폰번호 인증을 해주세요.")
						$("#noChk").focus();
						return false;
					} 

					var emailChk = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
					if(usermail == null || usermail == ""){
						alert("이메일을 입력해주세요.");
						$("#usermail").focus();
						return false;
						
					} else if(emailChk.test(usermail) == false){
						alert("이메일 형식이 올바르지 않습니다.\n예시) kh01@gmail.com");
						$("#user_Mail").val();
						$("#user_Mail").focus();
						return false;
					}
					
					if(pic == null || pic == ""){
						alert("사진을 첨부해주세요.");
						$("#photo").focus();
						return false;
					}
					
					if($("#idCheck").val()=='n'){
						alert("중복된 아이디 입니다.");
						$("#userid").focus();
						return false;
					}
					
					if($("#phCheck").val()=='n'){
						alert("인증번호를 다시 한번 확인해주세요.");
						$("#noChk").focus();
						return false;
					}
					
					if(lang == null || lang == ""){
						alert("선호하는 언어를 한개 이상 체크해주세요.");
						return false;
					} 
					
					alert(username+"님 회원가입을 축하드립니다.");
					return true;
					
				});
			});
	
	
	// 휴대폰 본인인증 	
	function sendSMS(){
		
         var phoneNumber = $("#userphone").val();
         
         if(phoneNumber == null || phoneNumber == ""){
        	 alert("전화번호를 입력해주세요!");
        	 return false;
         }

         $("#getPhoneBtn").css('display', 'none');
         $("#getPhoneAgain").css('display', 'block');
         $("#verCode").css('display', 'block');
         $("#checkBtn").css('display', 'block');
		
         $.ajax({
             type: "GET",
             url: "sendSms.do",
             data: {
                 "phoneNumber" : phoneNumber
             },
             success: function(res){
            	 
                 $('#checkBtn').click(function(){
                	 var noChk = $("#noChk").val();
                	 
                     if(res == noChk){
                    	 alert("휴대폰 인증이 정상적으로 완료되었습니다.");
                    	 $("#phCheck").val("y")
                    	 $("#checkBtn").prop('disabled', true);
                    	 
                     }else{
                         alert("인증번호가 올바르지 않습니다.");
                         $("#noChk").focus();
                         return false;
                     }
                 })

             },
				error: function(request, status, error){
					alert("ajax 통신 실패!");
				}
	         });
		 }
		
		
</script>
<style type="text/css">

	.alert alert-success {
		color: red;
	}
	
	.alert-danger {
		color: red;
	}

	#verCode, #checkBtn{
		display: none;
	}
	
	#getPhoneAgain{
		display: none;
	}
	
	.buttons{
		margin-left: auto;
		text-align: right;
	}
	
</style>
</head>
<body>

	<%@ include file="header.jsp"%>
	<div class="center" style="margin-top: 23%;">
		<h1 style="padding: 13px;">Signup</h1>
		<form:form method="post" enctype="multipart/form-data"
			modelAttribute="uploadFile" id="signupform" action="signup.do">
			<input type="hidden" value="n" id="idCheck"/>
			<input type="hidden" value="n" id="phCheck" />
			<input type="hidden" name="user_Point" value="0" />
			<div class="txt_field">
				<input type="text" name="user_Id" id="userid" /> <span></span> 
				<label>id</label>
			</div>
			<div class="buttons" >
				<input type="button" onclick="idchk();" value="아이디 체크" />
			</div>
			<div id="id_chk"></div>
			<div class="txt_field">
				<input type="password" name="user_Pw" id="userpw" onfocus="idcheckz();" /> <span></span> 
				<label>password</label>
			</div>
			<div class="txt_field">
				<input type="password" id="userpwcheck" onfocus="pwcheckz();" /> <span></span>
				<label>password check</label>
			</div>
			<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>

			<div class="txt_field">
				<input type="text" name="user_Name" id="username" onfocus="samePw();"/><span></span> 
				<label>user name</label>
			</div>

			<div class="txt_field">
				<input type="text" name="user_Phone" id="userphone" style="width: 200px;"/> <span></span>
				<label>phone</label>
			</div>
			<div class="buttons" >
				<input type="button" value="인증번호받기" onclick="sendSMS();" id="getPhoneBtn" style="margin-left: auto; text-align: right;"/>
				<input type="button" value="인증번호 다시 받기" onclick="sendSMS();" id="getPhoneAgain"  style="margin-left: auto; text-align: right;"/>
			</div>
			<div class="txt_field" id="verCode">
				<input type="text" style="width: 200px;" id="noChk"/> <span></span> <label>verification code</label>
			</div>
			<div class="buttons">
				<input type="button" id="checkBtn" value="인증번호 확인" style="margin-left: auto; text-align: right;"/>
			</div>
			<div class="txt_field">
				<input type="text" name="user_Mail" id="usermail" /> <span></span>
				<label>email</label>
			</div>
			<div class="txt_field">
				<input type="file" id="photo" name="pic" /><span></span>
			</div>
			<div class="language">
				<div style="color: #2691d9; font-size:18px">Preferred language</div><br />
				<input type="checkbox" name="user_Lang" value="1" />c 
				<input type="checkbox" name="user_Lang" value="2" />c++ 
				<input type="checkbox" name="user_Lang" value="3" />c#
				<input type="checkbox" name="user_Lang" value="4" />Java
				<input type="checkbox" name="user_Lang" value="5" />Python<br />
				<input type="checkbox" name="user_Lang" value="6" />Javascript 
				<input type="checkbox" name="user_Lang" value="7" />PHP
				<input type="checkbox" name="user_Lang" value="8" />Scala
				<input type="checkbox" name="user_Lang" value="9" />Perl 
				<input type="checkbox" name="user_Lang" value="10" />Ruby 
			</div><br></br>
			<input type="submit" value="회원가입" style="margin-top: 20px" />
				<div class="signup_link">
					회원이세요? &nbsp;<a href="login.do">로그인</a>
				</div>
		</form:form>
	</div>
	<div style="height: 100px;"></div>
</body>
</html>
