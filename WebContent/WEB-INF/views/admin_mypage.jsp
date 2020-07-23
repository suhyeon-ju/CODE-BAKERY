<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/csss/bootstrap.min.css" rel="stylesheet"  type="text/css" media="all"/>
<script type="text/javascript">
function adjust(user_Id){
		var url = "adjust_rating.do?user_Id=" + user_Id;
    	window.open(url,"","width=500,height=400,left=400,top=200");
	}
</script>
<style type="text/css">

  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
	}
	
	tr, td {
    border: 1px solid #444444;
  	}
  	
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="title" style="margin-bottom: 20px; margin-top: 20px; padding:30px;">
			<h1 style="font-size: 2.5em;">회원관리</h1>
	</div>
	 
	<table class="tableForm" style="margin: auto; width: 60%; height: 800px; text-align: center; font-size: 22px; margin-bottom:100px;">
		<tr class="line">
			<th>회원아이디</th>
			<th>회원이름</th>
			<th>회원등급</th>
			<th>등급조정</th>
		</tr>
		<c:forEach items="${userlist }" var="list">
		<tr>
			<c:if test="${list.user_Grade ne '관리자'}">
			<td>${list.user_Id }</td>
			<td>${list.user_Name }</td>
			<td>${list.user_Grade }</td>
			<td><input type="button" value="조정하기" class="btn btn-dark" onclick="adjust('${list.user_Id}');" style="width:80%;"></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>