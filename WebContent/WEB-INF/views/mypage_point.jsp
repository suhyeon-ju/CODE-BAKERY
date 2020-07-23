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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="./css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="./css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />

<style type="text/css">

	.form{
		background-color: white;
		width: 70%;
		margin: auto;
		margin-top: 10%;
		margin-botton: 10%;
		box-shadow: 5px 5px 5px 5px gray;
	}
	.form2{
		background-color: white;
		width: 70%;
		margin: auto;
		margin-top: 5%;
		margin-botton: 10%;
		box-shadow: 5px 5px 5px 5px gray;
	}
	.up{
		background:black;
		margin: auto;
	}
	.charge{
	    background:#3F3F3F;
	    font-size: 25px;
	    color:white;
	}
	.pointtable{
		margin-left:auto;
		margin-right:auto;
	}
	.pointtable tr td{
		margin-left:auto;
		margin-right:auto;
		font-size:30px;
	}
	.title{
	
	}
	.holdingpoint{
		font-size: 30px;
		color:#2691d9; 
		font-weight:bold
	}
	.sub_title{
		margin-top:10px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		window.reload();
	});
</script>

</head>
<body>
<%@ include file="header.jsp"%>

	<div class="form">
		<div class="title"
			style="margin-bottom: 20px; margin-top: 50px; height: 250px;">
			<div class="sub_title">
				<h2>마이 포인트</h2>
			</div>
			<hr>
			<br>

			<table class="pointtable">
				<tr>
					<td colspan="2" class="holdingpoint">보유 포인트</td>
				</tr>
				<tr>
					<td colspan="2">${User.user_Point}</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" class="charge"
						value="포인트 충전하기" onclick="location.href='payment.do'"></input></td>
				</tr>
			</table>
		</div>
	</div>
	
	<!-- 추가 내용 -->
	<div class="form2">
		<div class="title" style="margin-bottom: 20px; margin-top: 50px; height:auto;">
			<div class="sub_title">
				<h2>포인트 내역서</h2>
			</div>
			<hr>
			<br>

			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">날짜</th>
						<th scope="col">충전</th>
						<th scope="col">사용</th>
						<th scope="col">내용</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="7" align="center">--- 사용 내역이 없습니다. ----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ list }" var="list">
								<tbody class="tbody">
									<tr>
										<td>${ list.rownum }</td>
										<td>${ list.point_Date }</td>
										<td>${ list.point_Charge }</td>
										<td>${ list.point_Use }</td>
										<td>${ list.point_History }</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>



	<br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>