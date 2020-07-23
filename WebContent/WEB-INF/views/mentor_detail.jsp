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
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
   href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
   rel="stylesheet" />
<link href="resources/csss/default.css" rel="stylesheet" type="text/css"
   media="all" />
<link href="resources/csss/fonts.css" rel="stylesheet" type="text/css"
   media="all" />
<style type="text/css">
/* table.type03 {
   width: 90%;
   border-collapse: collapse;
   text-align: center;
   line-height: 1.5;
   border-top: 1px solid #ccc;
   border-left: 3px solid #369;
   margin: 20px 50px;
   border-collapse: collapse;
} */
.button {
   background-color: #f8585b;
   border: none;
   color: #fff;
   padding: 15px 0;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   margin: 4px;
   cursor: pointer;
   border-radius: 10px;
}

.button:hover {
   background-color: orange;
}
</style>
<script type="text/javascript">
   function noPoint(mentor_No){
      
      var point = '<c:out value="${User.user_Point}" />' 
      
      if(point < 1000){
         alert("최소 1000point가 있어야 입장이 가능합니다. 포인트 페이지로 이동합니다.");
         location.href="mypoint.do";
      } else{
         location.href="chat.do?mentor_No="+mentor_No;
      }
      
   }
</script>

</head>
<body>
   <%@ include file="header.jsp"%>
   <div id="logo" class="container">
      <h1>
         <span>멘토 게시판</span>
      </h1>
   </div>
   <c:forEach items="${mentor }" var="dto" begin="0" end="4" varStatus="i"
      step="1">
      <div id="page" class="container">
         <div id="content">
            <div class="title">
               <h2>${dto.user_Name}</h2>
               &nbsp;&nbsp;
               <c:choose>
                  <c:when test="${User.user_Grade eq '멘토'}" >
                     <input id= "chatbutton" type="button" onclick="location.href='chat.do?mentor_No=${dto.mentor_No}'" class="button" style="float: right;" value="1:1채팅" />
                  </c:when>
                  <c:when test="${User.user_Grade eq '일반회원'}">
                     <input id= "chatbutton" type="button" onclick="noPoint(${dto.mentor_No});" class="button" style="float: right;" value="1:1채팅" />
                  </c:when>
               </c:choose>
               
               <c:if test="${empty User }">
                  <input type="button" onclick="apply();" class="button" style="float: right;" value="1:1채팅" />
                    </c:if>
                    <script type="text/javascript">
                       function apply(){
                          alert('로그인 후 이용할 수 있습니다.');
                          location.href='login.do';
                       }
                    </script>
                    
               <span class="byline">${dto.mentor_Career}</span>
            </div>
            <p>${dto.mentor_Content}</p>
         </div>
         <div id="sidebar">
            <a href="#" class="image image-full"><img
               src="${pageContext.request.contextPath}/upload${dto.user_Pic}"
               alt="" /></a>
         </div>
      </div>
   </c:forEach>
   <div class="container">
      <c:forEach items="${review }" var="dto2" begin="0" end="3"
         varStatus="i" step="1">
         <table class='table'>
            <tr>
               <span style="font-size: 18px;">${dto2.user_Id }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <span style="color: grey; font-size: 14px;">${dto2.review_Date }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <hr></hr>
            </tr>
            <tr>
               <td>${dto2.review_Content }</td>
            </tr>
         </table>
      </c:forEach>
   </div>
   <!--    <table class="type03">
      <tr>
         <th scope="row">항목명</th>
         <td>내용이 들어갑니다.</td>
      </tr>
      <tr>
         <th scope="row">항목명</th>
         <td>내용이 들어갑니다.</td>
      </tr>
      <tr>
         <th scope="row">항목명</th>
         <td>내용이 들어갑니다.</td>
      </tr>
   </table> -->
   <%@ include file="footer.jsp"%>
</body>
</html>