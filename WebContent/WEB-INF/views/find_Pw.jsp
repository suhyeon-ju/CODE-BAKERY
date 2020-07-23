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
<link href="resources/csss/loginstyle.css" rel="stylesheet" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">


   $(function() {
      
      $("#searchform").submit(function() {
               
               var userId = $("#userId").val();
               var usermail = $("#usermail").val();
               var userphone = $("#userphone").val();
               var phchk = $("#noChk").val();
               
               
               if(userId == null || userId == ""){
                   alert("아이디를 입력해주세요.");
                   $("#userId").focus();
                   return false;
                }
               
               if(usermail == null || usermail == ""){
                   alert("이메일을 입력해주세요.");
                   $("#usermail").focus();
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
               
               if($("#phCheck").val()=='n'){
					alert("인증번호를 다시 한번 확인해주세요.");
					$("#noChk").focus();
					return false;
				} 
				
               
                var userVal = {
                     'user_Id' : userId,
                     'user_Mail' : usermail,
                     'user_Phone' : userphone
                  };
                
                
               $.ajax({
                  type : "POST",
                  async: false,
                  url : "searchPw.do",
                  data : JSON.stringify(userVal),
                  contentType : "application/json",
                  dataType : "json",
                  success : function(msg) {
                     if (msg.search != null) {
                        alert(msg.search.user_Name + "님의 비밀번호는 '" + msg.search.user_Pw+"' 입니다.");
                     } else {
                        alert("입력하신 정보와 일치하는 계정이 없습니다.");
                        return false;
                     }
                  },
                  error : function() {
                     alert("통신 실패");
                  }
               }); 
                  
               return true;
            });
         });
   
   
   /* 휴대폰 본인인증 */   
    function sendSMS(){
      
         var phoneNumber = $("#userphone").val();
         
         if(phoneNumber == null || phoneNumber == ""){
            alert("전화번호를 입력해주세요.");
            return false;
         }

         $("#getPhoneBtn").css('display', 'none');
         $("#verCode").css('display', 'block');
         $("#checkBtn").css('display', 'block');
         $("#height").css('height' , '580px');
      
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
                         alert("인증번호가 올바르지 않습니다!");
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
   
	   #verCode, #checkBtn{
	      display: none;
	   }
	   
	   #cancelbtn{
		  width: 100%;
		  height: 50px;
		  border: 1px solid;
		  background: #3F3F3F;
		  border-radius: 25px;
		  font-size:  18px;
		  color: #e9f4fb;
		  font-weight:  700;
		  cursor: pointer;
		  outline: none;
		}
</style>
</head>
<body>

   <%@ include file="header.jsp"%>
   <div class="center" style="height: 520px; margin-top: 50px;" id="height">
      <h1 style="padding: 20px;">비밀번호 찾기</h1>
      <form:form method="post" id="searchform" action="login.do">
      <input type="hidden" value="n" id="phCheck" />
         <div class="txt_field">
            <input type="text" name="user_Id" id="userId"/><span></span> 
            <label>아이디</label>
         </div>
         <div class="txt_field">
            <input type="text" name="user_Mail" id="usermail"/><span></span> 
            <label>이메일</label>
         </div>
         <div class="txt_field">
            <input type="text" name="user_Phone" id="userphone" style="width: 200px;"/> <span></span>
            <label>핸드폰 번호</label>
         </div>
         <span style="text-align: right;">
         <input type="button" value="인증번호받기" onclick="sendSMS();" id="getPhoneBtn"/></span>
         <div class="txt_field" id="verCode">
            <input type="text" style="width: 200px;" id="noChk"/> <span></span> <label>verification code</label>
         </div>
            <input type="button" id="checkBtn" value="인증번호 확인"/>
         <input type="submit" value="search" style="margin-top: 20px" />
         <input type="button" value="cancel" id="cancelbtn" onclick="location.href='login.do'" style="margin-top: 20px" />
      </form:form>
   </div>
   <div style="height: 100px;"></div>
</body>
</html>