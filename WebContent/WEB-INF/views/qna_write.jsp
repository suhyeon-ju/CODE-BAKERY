<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : TwoColours 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130811

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--bootstrap css  -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/csss/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/csss/boardstyle.css" rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

<style type="text/css">
	#btnSave, #btnList{
		  background-color: #e7e7e7; 
		  border: none;
		  color: balck;
		  padding: 10px 24px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">

	var list = [];
	function addTag(){
		var tag = $("#tag").val();
		
		
		if(tag.trim() == "#"){
			alert("태그를 추가해 주세요.");
			return false;
		}
		
		// 글쓰기 내에 태그 추가해주기
		var a = '<span>'+tag+'</span>&nbsp;&nbsp;';
		$(".one_tag").append(a);
		
		list.push(tag);

		document.getElementById("taglist").innerHTML = list;
		
		form.question_Tag.value = list; 		
		
	} 
	
	// 글쓰기 유효성 검사
	$(function(){
		$("#form").submit(function(){
			var titleChk = document.getElementsByName("question_Title")[0].value;
			var ContentChk = document.getElementsByName("question_Content")[0].value;
			var Tag = document.getElementById("tag").value;
			
			
			if(titleChk == "" || titleChk == null){
				alert("제목을 입력해 주세요.");
				return false;
			}
			
			if(ContentChk == "" || ContentChk == null){
				alert("내용을 입력해 주세요.");
				return false;
			}
			
			if(Tag == "#"){
				alert("태그를 한 개 이상 추가해주세요.");
				return false;
			}
			
			alert("질문글이 등록되었습니다.");
		});
	});

</script>

</head>
<body>
	<%@ include file="header.jsp"%>
	
	<div id="logo" class="container">
		<h1>질문 글쓰기</h1>
	</div>
	
	<article>
		<div class="container" role="main">
			<form name="form" id="form" role="form" method="post" action="insert_question.do">
				<input type="hidden" name="question_Tag" id="taglist"/>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="question_Title" placeholder="제목을 입력해 주세요." />
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="user_Id" readonly="readonly" value="${User.user_Id }" />
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="9" name="question_Content" placeholder="내용을 입력해 주세요." style="width:100%; resize:none;"></textarea>
				</div>
				<div class="mb-3">
					<label for="tag">TAG : </label>&nbsp;&nbsp;
					<input type="text" id="tag" value="#" style="width:40%; height:30px;" />&nbsp;&nbsp;
					<input type="button" value="추가" onclick="addTag();"/>
					<br></br>
					<div class="one_tag" id="tags" style="margin-left: 50px;"></div>
				</div>
				<br></br>
				<div style="text-align: right; margin-bottom: 20px;">
					<input type="submit" id="btnSave" value="저장" />
					<input type="button" id="btnList" value="목록" onclick="location.href='qna.do'" />
				</div>
			</form>
		</div>
	</article>

	<%@ include file="footer.jsp"%>
</body>
</html>
