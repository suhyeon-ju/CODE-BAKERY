<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/boardstyle.css" rel="stylesheet" type="text/css" media="all" />


<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

<style type="text/css">

	#btnUpdate, #btnDelete, #btnList{
		font-size: 14px;
		width: 60px;
	}
	
	
	
</style>


</head>

<body>
	<%@ include file="header.jsp"%>

	
	<div id="logo" class="container">
		<h1>공지사항</h1>
	</div>

 	<!--============== 공지사항 내용 START ==============-->
        <div>
            <form method="post">
                <div>
                    <div>
                        <table style="margin: 0px auto;">
                            <tr>
                                <th style="text-align: right;">제목</th>
                                <td style="padding:10px;"><input style="width: 821px; height: 35px;" type="text" value="${detail.notice_Title }" readonly/></td>
                            </tr>
                            <tr>
                                <th style="text-align: right;">작성자</th>
                                <td style="padding:10px;"><input style="width: 821px; height: 35px;" type="text" value="${detail.user_Id }" readonly/></td>
                            </tr>
                            <tr>
                                <th style="display: table-cell; vertical-align: middle; text-align: right;">내용</th>
                                <td style="padding:10px;"><textarea style="resize: none; width:821px;" rows="15" readonly>${detail.notice_Content }</textarea></td>
                            </tr>
                        </table>
                        
                        <div style="width: 850px; margin: 0 auto; text-align: right;" >
                        	<!-- 관리자일때만 수정삭제 보이게함 -->
                        	 <c:if test="${User.user_Grade == '관리자' && !empty User}">
                            <button type="button" class="btn btn-secondary pull-right" id="btnUpdate" onclick="location.href='notice_edit.do?notice_No=${detail.notice_No}'" style="text-align: center;">수정</button>
                            <button type="button" class="btn btn-secondary pull-right" id="btnDelete" onclick="location.href='notice_delete.do?notice_No=${detail.notice_No}'" style="text-align: center;">삭제</button>
                            </c:if>
                            <button type="button" class="btn btn-secondary pull-right" id="btnList" onclick="location.href='notice.do?'" style="text-align: center;">목록</button>
                        </div>
                    </div>
                </div>
            </form>
          </div>
       	<!--============== 공지사항 내용 END ==============-->
       	
       <br></br>
       
        <!--============== 공지사항 디테일 댓글 쓰기 START ==============-->
        <c:if test="${!empty User}">
        <div class="container">
           <form action="comment_write.do?notice_No=${detail.notice_No}&user_Id=${User.user_Id }" method="post">
               <div>
                   <div style="margin-top: 70px;">
                       <span style="font-weight: bold;">Comments</span>
                       <hr></hr>
                   </div>
                   <div>
                       <table>                    
                           <tr>
                               <td>
                                   <textarea style="resize: none;" rows="3" cols="160" placeholder="댓글을 입력하세요." name="comment_Content"></textarea>
                                   <div style="text-align:right;"><input type="submit" class="btn btn-primary pull-right" style="width:55px; height:35px; text-align: center;" value="등록"/></div>
                               </td>
                           </tr>
                       </table>
                   </div>
               </div>
           </form>
       </div>
       </c:if>
       <!--============== 공지사항 디테일 댓글 쓰기 END ==============-->
            
            <br></br>
            
        <!--============== 공지사항 디테일 댓글 리스트 START ==============-->
           <div class="container">
               <form method="post">
                   <div>
                       <div>
                           <div>
                               <table class='table'>
                               
                               <c:forEach items="${c_list }" var="reply">
                               	<tr>
                               		<td>
                                   	<strong>${reply.user_Id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
                                   	<fmt:formatDate value="${reply.comment_Date}" pattern="yyyy.MM.dd HH:mm"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <c:if test="${!empty User && (User.user_Id eq reply.user_Id) || (User.user_Id eq 'ADMIN')}">
                                    <a href="comment_delete.do?notice_No=${reply.notice_No }&comment_No=${reply.comment_No}">삭제</a>
                                    </c:if>
                                    </td>
                                </tr>
                                <tr>
                                  <td>${reply.comment_Content }</td>
                                </tr>
                                </c:forEach>
                                
                               </table>
                           </div>
                       </div>
                   </div>
               </form>
           </div>
           <br><br><br><br><br><br>
   <!--============== 공지사항 디테일 댓글 리스트 END ==============-->


	<%@ include file="footer.jsp"%>
</body>
</html>
