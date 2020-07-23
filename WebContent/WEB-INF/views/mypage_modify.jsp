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

	th{
		text-align: right;
	}
	
	#user_Pw, #user_Pwchk, #user_Name, #user_Phone, #user_Mail{
		height: 30px;
		margin-top: 10px; 
		width: 40%;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">

	
	function deactivate(){
		var url="deactivatepopup.do";
		window.open(url,"","width=400,height=300,left=400,top=100");
	}

 
	
	// 선호언어 값 비교후 체크처리 해주기
	$(function(){
		//회원가입 시 저장된 체크박스
		var langs = '<c:out value="${User.user_Lang}"></c:out>';
		langs = langs.split(",");
		
		$("input:checkbox").each(function(){
			for(var i =0; i<langs.length; i++){
				if($(this).val()==langs[i]){
					this.checked = true;
					break;
				}
			}
			
		});
		
	});
	
		 
		 
		 $(function(){
				
			$("#modified").click(function(){
							
				var pw = $("#user_Pw").val();
			 	var chkPw = $("#user_Pwchk").val();
			 	var name = $("#user_Name").val();
			 	var phone = $("#user_Phone").val();
			 	var mail = $("#user_Mail").val();
			 	var lang = $("input[name=user_Lang]:checked").val();
			 	
				var passwdChk = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
				if(pw == null || pw == ""){
					alert("비밀번호를 입력해주세요.");
					$("#user_Pw").focus();
					return false;
					
				} else if (passwdChk.test(pw) == false) {
					alert("비밀번호는 8~16자리의 영문 소문자, 숫자, 특수문자를 하나 이상 포함하여 입력해주세요.");
					$("#user_Pw").val("");
					$("#user_Pwchk").val("");
					$("#user_Pw").focus();
					return false;
				} 
				
				if(chkPw == null || chkPw == ""){
					alert("비밀번호를 한번 더 입력해주세요.");
					$("#user_Pwchk").focus();
					return false;
				} 
				
				if(name == null || name == ""){
					alert("이름을 입력해주세요.");
					$("#user_Name").focus();
					return false;
				}
				
				var phoneChk = /(\d{3}).*(\d{3}).*(\d{4})/;
				if(phone == null || phone == ""){
					alert("번호를 입력해주세요.");
					$("#user_Phone").focus();
					return false;
					
				} else if(phoneChk.test(phone) == false){
					alert("핸드폰 형식이 올바르지 않습니다.\n예시) 010-0000-0000");
					$("#user_Phone").val("");
					$("#user_Phone").focus();
					return false;
				}
				
				var emailChk = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
				if(mail == null || mail == ""){
					alert("메일을 입력해주세요.");
					$("#user_Mail").focus();
					return false;
					
				} else if(emailChk.test(mail) == false){
					alert("이메일 형식이 올바르지 않습니다.\n예시) kh01@gmail.com");
					$("#user_Mail").val("");
					$("#user_Mail").focus();
					return false;
				}
				
				if(lang == null || lang == ""){
					alert("선호하는 언어를 한개 이상 체크해주세요.")
					return false;
				} 
				
				
				if(pw != chkPw){
					alert("비밀번호가 일치하지 않습니다.");
					$("#user_Pwchk").focus();
					return false;
				}
				
				$("#mypageModify").submit();
			
				
			});
		
		
		});	
  

</script>
</head>
<body>
<%@ include file="header.jsp"%>
	
		<div class="title" style="margin-bottom: 20px; margin-top: 20px; padding:30px; font-size:20px;">
			<h1>내 정보 수정</h1>
		</div>
		<form action="modify.do" method="post" id="mypageModify">
		<table class="tableForm" style="margin: auto; width: 60%; height: 800px; text-align: center; font-size: 22px">
			<tr>
				<td colspan="2">
					<img src="${pageContext.request.contextPath}/upload${User.user_Pic }" height="100" alt="img" />
					<input type="hidden" id="user_Pic" name="user_Pic" value="${User.user_Pic}"/>
				</td>
			</tr>
			<tr>
				<th>ID : </th>
				<td>
				<label style="height: 22px; margin-top: 10px; width: 40%;">${User.user_Id}</label>
				<input type="hidden" id="user_Id" name="user_Id" value="${User.user_Id}"/>
				</td>
			</tr>
			<tr>
				<th>PASSWORD : </th>
				<td><input type="password" name="user_Pw" id="user_Pw" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<th>PASSWORD CHECK : </th>
				<td><input type="password" id="user_Pwchk" placeholder="비밀번호를 다시 입력해주세요."></td>
			</tr>
			<tr>
				<th>NAME : </th>
				<td><input type="text" name="user_Name" id="user_Name" value="${User.user_Name}" placeholder="${User.user_Name}"></td>
			</tr>
			<tr>
				<th>PHONE : </th>
				<td><input type="text" name="user_Phone" id="user_Phone" value="${User.user_Phone}" placeholder="${User.user_Phone}"></td>
			</tr>
			<tr>
				<th>EMAIL : </th>
				<td><input type="text" name="user_Mail" id="user_Mail" value="${User.user_Mail}" placeholder="${User.user_Mail}"></td>
			</tr>
			<tr>
				<th>PREFERRED LANGUAGE : </th>
				<td>
					<input type="checkbox" name="user_Lang" value="1" /><label for="c">&nbsp;c</label>&nbsp;&nbsp;
					<input type="checkbox" name="user_Lang" value="2" /><label for="c++">&nbsp;c++</label>&nbsp;&nbsp; 
					<input type="checkbox" name="user_Lang" value="3" /><label for="c#">&nbsp;c#</label><br>
					<input type="checkbox" name="user_Lang" value="4" /><label for="Java">&nbsp;Java</label>&nbsp;&nbsp;
					<input type="checkbox" name="user_Lang" value="5" /><label for="Python">&nbsp;Python</label>&nbsp;&nbsp;
					<input type="checkbox" name="user_Lang" value="6" /><label for="Javascript">&nbsp;Javascript</label>&nbsp;&nbsp; 
					<input type="checkbox" name="user_Lang" value="7" /><label for="PHP">&nbsp;PHP</label><br>
					<input type="checkbox" name="user_Lang" value="8" /><label for="Scala">&nbsp;Scala</label>&nbsp;&nbsp;
					<input type="checkbox" name="user_Lang" value="9" /><label for="Perl">&nbsp;Perl</label>&nbsp;&nbsp; 
					<input type="checkbox" name="user_Lang" value="10" /><label for="Ruby">&nbsp;Ruby</label> 
				</td>
			</tr>
			
			
			<tr>
				<td colspan="2" style="padding: 30px; margin-bottom: 100px; margin-top: 50px; ">
				
		<!-- ajax -->
					<input type="button" class="button" value="수정" id="modified"/>
					<input type="button" class="button" value="탈퇴" onclick="deactivate();" />
				</td>
			</tr>
		</table>
		</form>
<%@ include file="footer.jsp"%>
</body>
</html>