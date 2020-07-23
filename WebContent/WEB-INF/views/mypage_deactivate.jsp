
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css" media="all" />

<style type="text/css">
   body{
      margin:0;
   }
   html{
      heigth:100%;
      background: #F6F4F3;
   }
   textarea{
      width: 300px;
      resize:none;
      border:0;
      text-align: center;
   
   }
   #goodbye{
      text-align: center;
   }
   .title{
      height:100%;
      text-align: center;
      background: #3F3F3F;
      color:white;
      margin:0;
   }
   h2{
      height:60px;
       vertical-align:middle;
       margin-bottom:20px;
       margin-top:0;
       padding:20px;
       padding-bottom: 0;
   }

</style>
<script type="text/javascript">
function deactClose(){
   
   window.close();
}

function deactClosing(){
   
   window.opener.name = "modify_finish"; // 부모창의 이름 설정
    document.popupForm.target = "modify_finish"; // 타켓을 부모창으로 설정
    document.popupForm.action = "deactivate.do";  //부모창에 호출될 url 
    document.popupForm.submit();

    self.close();

}
   
</script>
</head>
<body>
   <div class="title" style="margin-bottom: 20px; margin-top: 20px; margin:0; ">
         <h2>비밀번호 입력</h2>
   </div>
   
   <form action="deactivate.do" name="popupForm" method="post">
      <table style="margin:auto; padding:20px">
         <input type="hidden" id="user_Id" name="user_Id" value="${User.user_Id}"/>
         <div id="goodbye">
            <textarea id="ment" readonly style="width:350px; height: 40px; font-size: 15px;"> 탈퇴를 원하시면 비밀번호를 입력해주세요. &#10;잔여 포인트 :${User.user_Point}
            </textarea>
           
         </div>
         <input type="password" id="user_Pw" name="user_Pw" placeholder="Enter Password" 
         style="display : block; margin: auto; height: 35px; width: 70%; margin-top: 35px; text-align:center;" />
         <tr>
            <td>
            <div id="first">
            <input type="submit" value="탈퇴" id="deact" class="button" style="display: block; margin: auto;"
                  onclick="deactClosing();">
            </div>
            </td>
            <td>
            <div id="second">
            <input type="button" value="취소" class="button" style="display: block; margin: auto;"
                  onclick="deactClose();">
            </div>
            </td>
         </tr>
      </table>
   </form>
   
</body>
</html>