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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />

<link href="./css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="./fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style type="text/css">
   h1{
      text-align: center;
      padding: 40px;
      text-decoration: underline;
      text-underline-position: under;
      text-decoration-color: green;
   }

   .form{
      background-color: white;
      width: 70%;
      height: 40%;
      margin: auto;
      margin-top: 10%;
      margin-botton: 10%;
      box-shadow: 5px 5px 5px 5px gray;
   }
   
   .introduce{
      background-color: whitesmoke;
      width: 60%;
      margin: auto;
      height: 120px;
      text-align: center;
   }
   
   button{
      width: 120px;
      height: 44px;
      background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
   }
   
   #content{
       background-color: lightgrey;
       height: 40%;
       width: 70%;
       margin: auto;
       text-align: center;
       margin-left: 15%;
   }
   #apply_button{
       width: 120px;
    height: 44px;
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    }
   #textcounter{
      text-align: right;
      margin-right: 21%;
   }
</style>
<script type="text/javascript">
</script>
</head>
<body>
<%@ include file="header.jsp"%>

   <div class="form">
      <h1 style="padding: 30px;">멘토 신청 완료!</h1>
         
      <div class="introduce">
         <br>
         ${User.user_Id}님의 멘토 지원에 감사드립니다.<br>
         빠른 시일 내에 심사 후 통보해 드리겠습니다.<br>
         <br>
         감사합니다.<br>
      </div>
   
   </div>
   <br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>