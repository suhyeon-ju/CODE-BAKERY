<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<form method="post" action="reviewinsert.do" id="reviewform">
		<center>
			<h2>리뷰 작성하기</h2>
		</center>
		<div>
			<center>
				<div>
					<textarea rows="10" cols="30" name="review_Content" id="review"
						placeholder="내용을 입력해 주세요" style="resize: none;"></textarea>
				</div>
				<br> 현재 보유중인 포인트 : ${User.user_Point } point<br> <br>
				<input type="hidden" name="mentor_No" value="${mentor_No }" id="mentor" /> 
				<input type="submit" value="확인" />
			</center>
		</div>
	</form>
</body>
</html>