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
               
               var username = $("#username").val();
               var usermail = $("#usermail").val();
               
               if(username == null || username == ""){
                  alert("이름을 입력해주세요.");
                  $("#username").focus();
                  return false;
               }
               
               if(usermail == null || usermail == ""){
            	   alert("메일을 입력해주세요.");
            	   $("#usermail").focus();
            	   return false;
               }
               
               var userVal = {
            		   "user_Name":username,
            		   "user_Mail":usermail
               };
               
               
               
               $.ajax({
                  type : "POST",
                  async: false,
                  url : "searchId.do",
                  data : JSON.stringify(userVal),
                  contentType : "application/json",
                  dataType : "json",
                  success : function(msg) {
                     if (msg.search != null) {
                         alert(msg.search.user_Name + "님의 아이디는 '" + msg.search.user_Id + "' 입니다.");
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
   <div class="center" style="height: 450px;">
      <h1 style="padding: 20px;">아이디 찾기</h1>
      <form:form method="post" id="searchform" action="login.do">
      <input type="hidden" value="n" id="phCheck" />
         <div class="txt_field">
            <input type="text" name="user_Name" id="username"/><span></span> 
            <label>이름</label>
         </div>
         <div class="txt_field">
            <input type="text" name="user_Mail" id="usermail" style="width: 200px;"/> <span></span>
            <label>이메일</label>
         </div>
         <input type="submit" value="search" style="margin-top: 20px" />
         <input type="button" value="cancel" id="cancelbtn" onclick="location.href='login.do'" style="margin-top: 20px" />
      </form:form>
   </div>
   <div style="height: 100px;"></div>
</body>
</html>