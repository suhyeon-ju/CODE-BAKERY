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
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
	rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">

/* slideul */
.slideWrap {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 300px;
	text-align: center;
	background-color: red;
	border: 1px solid;
}

.slideUl {
	display: inline-block;
}

.slideUl li {
	display: none;
	list-style: none;
	font-size: 30pt;
	margin-top: 130px;
}

.mainlogo{
  -webkit-animation: text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
           animation: text-focus-in 1s cubic-bezier(0.550, 0.085, 0.680, 0.530) both;
}

.major {
   -webkit-animation: tracking-in-contract-bck 1s cubic-bezier(1.000, 1.000, 1.000, 1.000) both;
           animation: tracking-in-contract-bck 1s cubic-bezier(1.000, 1.000, 1.000, 1.000) both;
}

@-webkit-keyframes text-focus-in {
  0% {
    -webkit-filter: blur(12px);
            filter: blur(12px);
    opacity: 0;
  }
  100% {
    -webkit-filter: blur(0px);
            filter: blur(0px);
    opacity: 1;
  }
}
@keyframes text-focus-in {
  0% {
    -webkit-filter: blur(12px);
            filter: blur(12px);
    opacity: 0;
  }
  100% {
    -webkit-filter: blur(0px);
            filter: blur(0px);
    opacity: 1;
  }
}


@-webkit-keyframes tracking-in-contract-bck {
  0% {
    letter-spacing: 1em;
    -webkit-transform: translateZ(400px);
            transform: translateZ(400px);
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    -webkit-transform: translateZ(0);
            transform: translateZ(0);
    opacity: 1;
  }
}
@keyframes tracking-in-contract-bck {
  0% {
    letter-spacing: 1em;
    -webkit-transform: translateZ(400px);
            transform: translateZ(400px);
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    -webkit-transform: translateZ(0);
            transform: translateZ(0);
    opacity: 1;
  } 

</style>

<!-- 리뷰 배너 스크립트 -->
<script type="text/javascript">

	/* 숫자 카운팅 */
	$(document).ready(
			function() {
				function numberCounter(target_frame, target_number) {
					this.count = 0;
					this.diff = 0;
					this.target_count = parseInt(target_number);
					this.target_frame = document.getElementById(target_frame);
					this.timer = null;
					this.counter();
				}
				;
				numberCounter.prototype.counter = function() {
					var self = this;
					this.diff = this.target_count - this.count;

					if (this.diff > 0) {
						self.count += Math.ceil(this.diff / 5);
					}

					this.target_frame.innerHTML = this.count.toString()
							.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

					if (this.count < this.target_count) {
						this.timer = setTimeout(function() {
							self.counter();
						}, 70);
					} else {
						clearTimeout(this.timer);
					}
				};

				new numberCounter("counter1", ${answer});
				new numberCounter("counter2", ${quiz});
				new numberCounter("counter3", ${question});
				new numberCounter("counter4", 10);
			});
</script>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<div id="logo" class="container">
		<h1>
			<span class="mainlogo">Code-Bakery</span>
		</h1>
	</div>
	<hr></hr>
	<div id="portfolio-wrapper" class="mento">
		<div id="portfolio" class="container">
			<div class="major">
				<h2>자랑스러운 멘토</h2>
				<span class="byline">국내 최고의 멘토진들을 소개합니다</span>
			</div>
			<c:forEach items="${mentor }" var="dto" begin="0" end="3"
				varStatus="i" step="1">
				<div class="column${i.index+1} ">
					<a href="mentor_detail.do?mentor_No=${dto.mentor_No}"
						class="image image-full"><img
						src="${pageContext.request.contextPath}/upload${dto.user_Pic }"
						height="150" alt="" /></a>
					<div class="box">
						<p>${dto.mentor_Content}</p>
						<a href="mentor_detail.do?mentor_No=${dto.mentor_No}"
							class="button">자세히 보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div id="featured-wrapper">
		<div id="featured" class="container">
			<div class="major">
				<h2>코드베이커리</h2>
				<span class="byline">실시간 통계</span>
			</div>
			<div class="column1">
				<p id="counter1" style="font-size: 30pt; margin-left: 75px;"></p>
				<div class="title">
					<h2>현재 답변 수</h2>
				</div>
			</div>
			<div class="column2">
				<p id="counter2" style="font-size: 30pt; margin-left: 50px;"></p>
				<div class="title">
					<h2>현재 올라온 문제</h2>

				</div>
			</div>
			<div class="column3">
				<p id="counter3" style="font-size: 30pt; margin-left: 50px;"></p>
				<div class="title">
					<h2>현재 올라온 질문</h2>

				</div>
			</div>
			<div class="column4">
				<p id="counter4" style="font-size: 30pt; margin-left: 50px;">></p>
				<div class="title">
					<h2>현재 가능한 언어</h2>

				</div>
			</div>
		</div>
	</div>

	<div id="portfolio-wrapper" class="mento">
		<div id="portfolio" class="container">
			<div class="major">
				<h2>새로운 글</h2>
			</div>
			<div class="column1">
				<div class="box">
					<p style="font-weight: bold">새로운 질문</p>
					<c:choose>
						<c:when test="${empty questionlist }">
							<p>새글이 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${questionlist }" var="dto" begin="0" end="4"
								varStatus="i" step="1">
								<a href="qna_detail.do?question_No=${dto.question_No}"><p>${dto.question_Title }</p></a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="column2">
				<div class="box">
					<p style="font-weight: bold">새로운 답변</p>
					<c:choose>
						<c:when test="${empty answerlist }">
							<p>새 답변이 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${answerlist }" var="dto" begin="0" end="3"
								varStatus="i" step="1">
								<a href="answer_detail.do?answer_No=${dto.answer_No }&question_No=${dto.question_No}"><p>${dto.answer_Title }</p></a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="column3">
				<div class="box">
					<p style="font-weight: bold">새로운 문제</p>
					<c:choose>
						<c:when test="${empty quizlist }">
							<p>새 퀴즈가 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${quizlist }" var="dto" begin="0" end="3"
								varStatus="i" step="1">
								<a href="quiz_detail.do?quiz_No=${dto.quiz_No}"><p>${dto.quiz_Title }</p></a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="column4">
				<div class="box">
					<p style="font-weight: bold">공지사항</p>
					<c:choose>
						<c:when test="${empty noticelist }">
							<p>새 공지사항이 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noticelist }" var="dto" begin="0" end="3"
								varStatus="i" step="1">
								<a href="notice_view.do?notice_No=${dto.notice_No}"><p>${dto.notice_Title }</p></a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="./footer.jsp"%>
</body>
</html>
