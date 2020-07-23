<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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

<!------- 페이징 효과때문에 추가 ------>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
<!------- 페이징 효과때문에 추가 ------>

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<style type="text/css">
	
	#notice>table>thead>tr { text-align: center; }
	#notice>table>tbody>tr { text-align: center; }
	.pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}
	
</style>

</head>

<body>

	<%@ include file="header.jsp"%>
	
	<div id="logo" class="container">
		<h1>공지사항</h1>
	</div>

	<!--============== 공지사항 게시글 리스트 START ==============-->
 	 		<div class="container" id="notice">
                <table class="table table-hover">
                  <thead style="background-color: #DCDCDC;">
                    <tr style="text-align: center;">
                    	<td style="width: 100px;">No</td>
                        <td style="width: 300px;">Title</td>
                        <td style="width: 150px;">Writer</td>
                        <td style="width: 150px;">Date</td>
                        <td style="width: 150px;">View</td>
                    </tr>
                    </thead>
                <tbody>
                    <c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="7" align="center">--- 공지사항이 없습니다. ----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${ list }" var="list">
								<tbody class="tbody">
									<tr>
										<td>${ list.notice_No }</td>
										<td><a href="notice_view.do?notice_No=${list.notice_No }">${ list.notice_Title }</a></td>
										<td>${ list.user_Id }</td>
										<td>${ list.notice_Date }</td>
										<td>${ list.notice_Views }</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:otherwise>
					</c:choose>
                    </tbody>
            </table>
            
            
                <br><br>
                
               	<!-- 관리자 일때만 글쓰기버튼 활성화 -->
                <c:if test="${User.user_Grade == '관리자' && !empty User}">
                <div class="text-right">
                    <button type="button" class="btn btn-secondary pull-right" onclick="location.href='notice_write.do'" style="width: 6%; text-align:center;" >글쓰기</button>
                </div>
                </c:if>
                
				<br><br>
			<!--============== 공지사항 게시글 리스트 END ============== -->
			
			<!--============== 페이지 버튼 STATRT ==============-->
          	
      <div> 
		        <div style="width: 100%; height:100%;  text-align: center;">
		                <div style="margin: 0 auto; display: inline-block;">
			                <div class="container">
								<ul class="pagination">
								
								<c:if test="${pageMaker.prev }">
			               			<li class="page-item">
			                 			<a class="page-link" href="notice.do?page=${pageMaker.startPage - 1 }" aria-label="Previous">
			                   				<span aria-hidden="true">&laquo;</span>
			                 			</a>
			               			</li>                          
			            		 </c:if>
			            		 
			            		 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					                <c:choose>
					                   <c:when test="${idx eq page }">
					                     <li class="page-item active"><a class="page-link" href="notice.do?page=${idx }">${idx }</a></li>
					                   </c:when>
					                   <c:otherwise>                      
					                     <li class="page-item"><a class="page-link" href="notice.do?page=${idx }">${idx }</a></li>
					                   </c:otherwise>
					                </c:choose>                
			            		 </c:forEach>
			            		 
			            		 <c:if test="${pageMaker.next && pageMaker.endPage>0 }">
						               <li class="page-item">
						                 <a class="page-link" href="notice.do?page=${pageMaker.endPage + 1 }" aria-label="Next">
						                   <span aria-hidden="true">&raquo;</span>
						                 </a>
						               </li>           
			           			 </c:if>
			           			 
								 </ul>
							</div>
		                </div>
		            </div>
        
      </div>
          	
            <!--============== 페이지 버튼 END ==============-->
        </div>

	<%@ include file="footer.jsp"%>
</body>
</html>
