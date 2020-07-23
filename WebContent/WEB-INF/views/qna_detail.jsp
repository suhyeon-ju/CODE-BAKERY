<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.lang.String.*"%>
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
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />

<!--waterboat css-->

<link
	href="https://fonts.googleapis.com/css?family=Oswald:400,700|Dancing+Script:400,700|Muli:300,400"
	rel="stylesheet" type="text/css" media="all" />
<link href="fonts/icomoon/style.css" rel="stylesheet" type="text/css"
	media="all" />

<link href="resources/csss/bootstrap.min.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="resources/csss/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/csss/owl.carousel.min.css" />
<link rel="stylesheet" href="resources/csss/owl.theme.default.min.css" />
<link rel="stylesheet" href="resources/csss/owl.theme.default.min.css" />

<link rel="stylesheet" href="resources/csss/jquery.fancybox.min.css" />

<link rel="stylesheet" href="resources/csss/bootstrap-datepicker.css" />

<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="csss/aos.css" />
<link href="resources/csss/jquery.mb.YTPlayer.min.css" media="all"
	rel="stylesheet" type="text/css" />

<link href="resources/csss/style.css" rel="stylesheet" />
<link href="resources/csss/board-detail.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />

<style type="text/css">



footer {
	background: none;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">

		//게시글에 태그를 눌렀을시 해당 태그가 달린 게시물 리스트를 보여줌
		function sendTag(i, item){
			var tag = item;
			location.href="tagList.do?question_Tag="+item;
		}
			

		//댓글보기 버튼 클릭
		function showComment(){
			
			if($(".comment-list").css("display") == "none"){
				$(".comment-list").css("display", "block");
				$("#shwComm").val("댓글 숨기기");
			} else{
				$(".comment-list").css("display", "none");
				$("#shwComm").val("댓글 보기");
			} 
		}
		
		
		//글 삭제시 알림창 띄워주기
		function deleteBoard(question_No){
			
			result = confirm("게시글을 삭제하시겠습니까?");
			
			if(result == true){
				alert("삭제되었습니다.");
				location.href='qna_delete.do?question_No='+question_No;
			}

		}
	// ------------------------ 답변 -------------------------------
	
		//답변쓰기
		function writeAnswer(){
			
			var user_Id = '<c:out value="${User.user_Id}"></c:out>';
			var question_No = ${qlist.question_No}
			var answer_Title = $("#answer_Title").val();
			var answer_Content = $("textarea#answer_Content").val();
			
			
			// 답변 유효성 검사
			if(answer_Title == "" || answer_Title == null){
				alert("제목을 작성해주세요.");
			 	return false;
			}
			
			if(answer_Content == "" || answer_Content == null){
				alert("내용을 작성해 주세요.");
				return false;
			}
			
			if(user_Id == "" || user_Id == null){
				
				var setting = "width=400, height=430"
				var url = "nonUserAnswer.do?question_No="+question_No+"&answer_Title="+answer_Title+"&answer_Content="+answer_Content;
				
				window.open(url, "", setting);
				return false;
			}
			
			
			
			
			 $.ajax({
				url: "answer_write.do",
				type: 'POST',
				data: {"answer_Title":answer_Title, "answer_Content":answer_Content, "user_Id":user_Id, "question_No":question_No},
				success: function(data){
					alert("답변이 작성 완료되었습니다.")
					location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
				}
			}); 
			
		}

	

	// 답변수정
	 function modifyAnswer(question_No, answer_No, answer_Title, answer_Content){
			
		
		var setting = "width=400, height=450"
		var url = "answer_modify.do?question_No="+question_No+"&answer_No="+answer_No+"&answer_Title="+answer_Title+"&answer_Content="+answer_Content;
		
		window.open(url, "", setting);
		window.close();
		
		} 
	


	// 답변삭제
	function deleteAnswer(answer_No, question_No){
		
		var msg = confirm("해당 답변을 삭제하시겠습니까?");
		
		if(msg){
			
			$.ajax({
				url: "answer_delete.do",
				type: 'POST',
				data:{"answer_No":answer_No, "question_No":question_No},
				success:function(data){
						alert("답변이 삭제되었습니다.")
						location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		} else{
			return false;
		} 
	}
	
	// ------------------------- 답변 -----------------------------
	
	
	// ------------------------ 댓글 ------------------------------
	
	
		//댓글 입력창 (로그인을 하지 않앗을때)
		$(function(){
			$("#noneId_Comm").click(function(){
				alert("로그인 후 이용해 주시기 바랍니다.");
				location.href="login.do";
			});
		});
	
		
		//댓글 창이 빈칸일경우 검사
		function sendComment(){
			
			var comment = $("#inputComment").val().trim();
			
			if(comment == null || comment == ""){
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
			
			alert("댓글이 등록되었습니다.");
			$("#commentForm").submit();
			
		}
	
	
		//댓글삭제
		function deleteComment(comment_No, question_No){
		
			var msg = confirm("댓글을 삭제하시겠습니까?");
			
			if(msg){
				
				$.ajax({
					url: "qcomment_delete.do",
					type: "POST",
					data: {"comment_No":comment_No, "question_No":question_No},
					success:function(data){
							alert("댓글이 삭제되었습니다.")
							location.reload();
					},
					error: function(request, status, error){
						alert("ajax 통신 실패!");
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			} else{
				return false;
			} 
		}
		
		//댓글수정 -> input 폼 추가
		function modifyComment(comment_No, comment_Content ,i){
			
				var a = "";
				
				a += '<div class="input-group">';
			    a += '<input type="text" class="form-control" name="comm_Content" value="'+comment_Content+'"/>&nbsp;&nbsp;&nbsp;';
			    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdate('+comment_No+',\''+comment_Content+'\');">수정</button>&nbsp;';
			    a += '<button class="btn btn-default" type="button" onclick="commentReset('+i+',\''+comment_Content+'\');">취소</button> </span>'
			    a += '</div>';
			
			$(".result").eq(i).html(a);
			
		}
		
		//댓글 수정 취소 버튼 
		function commentReset(index, comment_Content){
			$(".result").eq(index).html(comment_Content);
		}
		
		//댓글수정
		function commentUpdate(comment_No,comment_Content){
			
			var comm = $('input[name=comm_Content]').val();
			
			
			console.log(comment_No + ": " + comm);
			
			$.ajax({
				url: "updateComment.do",
				type: "POST",
				data: {"comment_No":comment_No, "comment_Content" : comm},
				success:function(data){
						alert("댓글이 수정되었습니다.")
						location.reload();
				},
				error: function(request, status, error){
					alert("ajax 통신 실패!");
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			
		}
		
		//대댓글 창 열기
		function Reply(comment_No, depth, group_Id, i){
			
			//alert(comment_No + " : "+depth + " : "+group_Id);
			
			var a = '';
			
			a += '<form action="writeReply.do" id="commentForm" method="post">';
			a += '<input type="hidden" name="user_Id" value="${User.user_Id }" />';
			a += '<input type="hidden" name="question_No" value="${qlist.question_No }" />';
			a += '<input type="hidden" name="user_Pic" value="${User.user_Pic }" />';
			a += '<input type="hidden" name="comment_No" value="'+comment_No+'" />';
			a += '<input type="hidden" name="depth" value="'+depth+'" />'; 
			a += '<input type="hidden" name="group_Id" value="'+group_Id+'" />'; 
           	a += '<div>';
            a += '<div>';
            a += '<table> ';                   
            a += '<tr>';
            a += '<td>';
            a += '<svg class="bi bi-arrow-return-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">';
            a += '<path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 9l-2.647-2.646a.5.5 0 0 1 0-.708z"/>';
            a += '<path fill-rule="evenodd" d="M3 2.5a.5.5 0 0 0-.5.5v4A2.5 2.5 0 0 0 5 9.5h8.5a.5.5 0 0 0 0-1H5A1.5 1.5 0 0 1 3.5 7V3a.5.5 0 0 0-.5-.5z"/>';
            a += '</svg></td>';
            a += '<td><input type="text" style="width:700px;" class="form-control" id="inputComment" name="comment_Content" placeholder="댓글을 입력하세요." />';
            a += '</td>';
            a += '<td style="text-align: right; mdisplay:table-cell; vertical-align:middle;">';
            a += '<input type="submit" class="btn btn-primary" value="등록" style="width: 60px; height: 37px;"/>';
           	a += '</td>';
           	a += '</tr>';
           	a += '</table>';
           	a += '</div>';
           	a += '</div>';  
           	a += '</form>'; 
           	
           	$(".reply_result").eq(i).html(a);
		}
	
		
		
		
		
		
	// ------------------------ 댓글 ------------------------------

        
</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<%@ include file="header.jsp"%>
	<div id="logo" class="container">
		<h1>질문 게시판</h1>
	</div>

	<section class="site-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 blog-content">

				<!--------- 질문글 START ----------->
				<span class="title" style="font-weight: bold; font-size: 30px;">${qlist.question_Title }</span>
				<div class="post-meta">
					<span class="author">${qlist.user_Id }</span> <span class="date"><fmt:formatDate
							value="${qlist.question_Date }" pattern="yyyy.MM.dd" /></span>
				</div>
				<hr />
				<p class="lead">${qlist.question_Content }</p>
				<br></br> <br></br> <br></br>
				<div class="pt-5">
					<p>
						Tags:&nbsp;&nbsp;
						<c:forTokens items="${qlist.question_Tag }" delims="#" var="item"
							varStatus="i">
							<span><a onclick="sendTag(${i.index },'${item }');"
								style="cursor: pointer;" id="oneTag">#${item }&nbsp;</a></span>
						</c:forTokens>
					</p>
				</div>
				<div style="text-align: right;">
					<c:if
						test="${!empty User && (User.user_Id eq qlist.user_Id) || (User.user_Id eq 'ADMIN')}">
						<input type="button" class="btn btn-secondary" value="수정"
							onclick="location.href='qna_update.do?question_No=${qlist.question_No}'" />
						<input type="button" class="btn btn-secondary" value="삭제"
							onclick="deleteBoard(${qlist.question_No});" />
					</c:if>
					<input type="button" class="btn btn-secondary" value="목록"
						onclick="location.href='qna.do'" />
				</div>
				<!--------- 질문글 End ----------->


				<br></br> <br></br>


				<!--------- 댓글 START ----------->
				<form action="writeComment.do" id="commentForm" method="post">
					<input type="hidden" name="user_Id" value="${User.user_Id }" />
					<input type="hidden" name="question_No"
						value="${qlist.question_No }" />
					<input type="hidden" name="user_Pic" value="${User.user_Pic }" />
					<div>
						<div>
							<table class="table">
								<tr>
									<td
										style="font-weight: bold; font-size: 20px; font-family: initial;">${clist.size() }
										Comments</td>
									<td><input type="button" class="btn btn-outline-secondary"
										value="댓글 숨기기" onclick="showComment();" id="shwComm" /></td>
								</tr>
								<tr>
									<c:choose>
										<c:when test="${empty User}">
											<td><textarea class="form-control"
													style="width: 1000px; resize: none;" rows="2" cols="30"
													id="inputComment" name="comment_Content"
													placeholder="댓글 작성은 회원만 이용 가능합니다." disabled></textarea></td>
											<td
												style="text-align: right; mdisplay: table-cell; vertical-align: middle;">
												<input type="submit" class="btn btn-primary" value="등록"
												style="width: 90px; height: 50px;" onclick="return false"
												id="noneId_Comm" />
											</td>
										</c:when>
										<c:otherwise>
											<td><textarea class="form-control"
													style="width: 1000px; resize: none;" rows="2" cols="30"
													id="inputComment" name="comment_Content"
													placeholder="댓글을 입력해주세요."></textarea></td>
											<td
												style="text-align: right; mdisplay: table-cell; vertical-align: middle;">
												<input type="button" class="btn btn-primary" value="등록"
												style="width: 90px; height: 50px;" onclick="sendComment();" />
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</table>
						</div>
					</div>
				</form>
				<br></br>
				<ul class="comment-list">
					<c:choose>
						<c:when test="${empty clist }">
							<li>---------- 작성된 댓글이 없습니다. ----------</li>
						</c:when>
						<c:otherwise>
							<c:forEach items="${clist }" var="dto" varStatus="i">

								<c:choose>
									<c:when test="${dto.parent_No eq 0 }">
										<li class="comment" id="onecomm" style="margin-bottom: 0px;">
											<div class="vcard bio">
												<img
													src="${pageContext.request.contextPath}/upload${dto.user_Pic }"
													alt="Image" />
											</div>
											<div class="comment-body">
												<span style="font-size: 20px; font-family: initial;">${dto.user_Id }</span>
												<c:if test="${!empty User }">
													<button class="btn btn-link"
														onclick="Reply(${dto.comment_No}, ${dto.depth }, ${dto.group_Id }, ${i.index });">Reply</button>
												</c:if>
												<span class="meta"><fmt:formatDate
														value="${dto.comment_Date }" pattern="yyyy.MM.dd HH:mm" /></span>&nbsp;&nbsp;
												<c:if
													test="${!empty User && (User.user_Id eq dto.user_Id) || (User.user_Id eq 'ADMIN')}">
													<input type="button" class="btn btn-link" value="수정"
														onclick="modifyComment(${dto.comment_No}, '${dto.comment_Content }',${i.index });" />
													<input type="button" class="btn btn-link" value="삭제"
														onclick="deleteComment(${dto.comment_No}, ${qlist.question_No });" />
												</c:if>
												<p class="result">${dto.comment_Content }</p>
												<p class="reply_result"></p>
											</div>
										</li>
									</c:when>
									<c:otherwise>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
									<svg class="bi bi-arrow-down-right-circle" width="1em"
											height="1em" viewBox="0 0 16 16" fill="currentColor"
											xmlns="http://www.w3.org/2000/svg"> <path
											fill-rule="evenodd"
											d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
										<path fill-rule="evenodd"
											d="M10.5 11h-4a.5.5 0 0 1 0-1h2.793L5.146 5.854a.5.5 0 1 1 .708-.708L10 9.293V6.5a.5.5 0 0 1 1 0v4a.5.5 0 0 1-.5.5z" />
										</svg>
										<div style="margin-left: 50px; margin-bottom: 0px;">
											<span></span>
											<li class="comment" id="onecomm">
												<div class="vcard bio">
													<img
														src="${pageContext.request.contextPath}/upload${dto.user_Pic }"
														alt="Image" />
												</div>
												<div class="comment-body">
													<span style="font-size: 20px; font-family: initial;">${dto.user_Id }</span>
													<button class="btn btn-link"
														onclick="Reply(${dto.comment_No}, ${dto.depth }, ${dto.group_Id }, ${i.index });">Reply</button>
													<span class="meta"><fmt:formatDate
															value="${dto.comment_Date }"
															pattern="yyyy.MM.dd HH:mm:ss" /></span>&nbsp;&nbsp;
													<c:if
														test="${!empty User && (User.user_Id eq dto.user_Id) || (User.user_Id eq 'ADMIN') }">
														<input type="button" class="btn btn-link" value="수정"
															onclick="modifyComment(${dto.comment_No}, '${dto.comment_Content }',${i.index });" />
														<input type="button" class="btn btn-link" value="삭제"
															onclick="deleteComment(${dto.comment_No}, ${qlist.question_No });" />
													</c:if>
													<p class="result">${dto.comment_Content }</p>
													<p class="reply_result"></p>
												</div>
											</li>
										</div>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<br />
			<!--------- 댓글 END ----------->



			<!--------- 답글 START ----------->
			<div class="pt-5" style="width: 100%; margin-bottom: 50px;">
				<div>
					<h3 class="mb-5">${alist.size()}Answers</h3>
				</div>
				<c:choose>
					<c:when test="${empty alist }">
					</c:when>
					<c:otherwise>
						<c:forEach items="${alist }" var="dto">
							<span class="title" style="font-size: 20px;">RE:
								${dto.answer_Title }</span>
							<div class="post-meta">
								<span class="author">${dto.user_Id }</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="date"><fmt:formatDate
										value="${dto.answer_Date }" pattern="yyyy.MM.dd HH:mm" /></span>
								<c:if
									test="${!empty User && (User.user_Id eq dto.user_Id) || (User.user_Id eq 'ADMIN')}">
									<input type="button" class="btn btn-link" value="수정"
										onclick="modifyAnswer(${qlist.question_No }, ${dto.answer_No}, '${dto.answer_Title }', '${dto.answer_Content }');" />
									<input type="button" class="btn btn-link" value="삭제"
										onclick="deleteAnswer(${dto.answer_No}, ${qlist.question_No });" />
								</c:if>
							</div>
							<hr />
							<p class="lead" id="comm">${dto.answer_Content }</p>
							<div class="container">
								<div class="commentContent"></div>
							</div>
							<br></br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<!--------- 답글 END ----------->


			<!--------- 답글작성칸 START ----------->
			<div class="pt-5">
				<h3 class="mb-5">Your Answer</h3>
				<table>
					<tr>
						<th style="text-align: center">TITLE</th>
						<td><input type="text" id="answer_Title"
							style="width: 400px; height: 40px;" /></td>
					</tr>
					<tr>
						<th style="text-align: center">CONTENT&nbsp;&nbsp;&nbsp;</th>
						<td><textarea class="answer" id="answer_Content"
								style="width: 600px; height: 150px; resize: none;"></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="button" class="btn btn-secondary btn-sm"
							value="Post Your Answer" onclick="writeAnswer();" /></td>
					</tr>
				</table>
			</div>
			<hr />
			<!--------- 답글작성칸 END ----------->


		</div>
	</div>
	</section>



</body>
<%@ include file="footer.jsp"%>
</html>
