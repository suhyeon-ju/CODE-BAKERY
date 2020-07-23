<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<style type="text/css">
	body{
		background: #F2EFEF;
	}
	
	h2{
		text-align: center;
	    padding: 8px;
       	font-size: 28px;
	}
	
	#button{
		text-align: right; 
		margin-right: 70px;"
	}
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	
	
	// 수정된 답변을 ajax를 이용해 컨트롤러로 넘김
	function updateAnswer(){
		
		var answer_No = $("#answer_No").val();
		var question_No = $("#question_No").val();
		var answer_Title = $("#answer_Title").val();
		var answer_Content = $("#answer_Content").val();
			
		
		$.ajax({
			url: "changeAnswer.do",
			type: "POST",
			data: {"answer_No":answer_No, "question_No":question_No, "answer_Title":answer_Title, "answer_Content":answer_Content},
			success:function(data){
					alert("답변이 수정되었습니다")
					window.close();
					window.opener.location.reload();
			},
			error: function(request, status, error){
				alert("ajax 통신 실패!");
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});
		
	}

</script>
</head>
<body>
	<h2>답변 수정하기</h2>
	<form method="post">
	<input type="hidden" name="answer_No" id="answer_No" value="${ans.answer_No }" />
	<input type="hidden" name="question_No" id="question_No" value="${ans.question_No }" />
		<table>
			<tr>
				<th>TITLE</th>
				<td><input type="text" style="width: 253px; height: 20px;" name="answer_Title" id="answer_Title" value="${ans.answer_Title }" /></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea rows="17" cols="30" style="resize:none" name="answer_Content" id="answer_Content">${ans.answer_Content }</textarea></td>
			</tr>
			<tr id="button">
				<td colspan="2"><input type="button" value="저장" onclick="updateAnswer();"/></td>
				<td><input type="button" value="취소" onclick="window.close()"/></td>
			</tr>
		</table>
	</form>
</body>
</html>