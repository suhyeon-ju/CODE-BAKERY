<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	#btnDone, #btnList{
		font-size: 14px;
		width: 60px;
	}
	
</style>


</head>

<body>

	<%@ include file="header.jsp"%>
	
	<div id="logo" class="container">
		<h1>글쓰기</h1>
	</div>

 	<!--============== 공지사항 글쓰기 START ==============-->
        <div>
            <form action="write_res.do" method="post">
                <div>
                    <div>
                        <table style="margin: 0px auto;">
                            <tr>
                                <th>제목</th>
                                <td style="padding:10px;"><input style="width: 821px; height: 35px;" type="text" name="notice_Title"/></td>
                            </tr>
                            <br><br>
                            <tr>
                                <th>작성자</th>
                                <td style="padding:10px;"><input style="width: 821px; height: 35px;" type="text" id="writer" name="user_Id" value="시스템 관리자" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <th style="display: table-cell; vertical-align: middle;">내용</th>
                                <td style="padding:10px;"><textarea style="resize: none; width: 821px;" rows="15" name="notice_Content" ></textarea></td>
                            </tr>
                        </table>
                        <tr>
	                        <div style="width: 850px; margin: 0 auto; text-align: right;" >
	                            <button type="submit" class="btn btn-secondary pull-right" id="btnDone" style="text-align:center;">완료</button>
	                            <button type="button" class="btn btn-secondary pull-right" id="btnList" style="text-align: center;" onclick="location.href='notice.do'">취소</button>
	                        </div>
                   	 </tr>
                    </div>
                </div>
            </form>
           </div>
       	<!--============== 공지사항 글쓰기 END ==============-->
           
           
            <br><br><br><br><br><br>


	<%@ include file="footer.jsp"%>
</body>
</html>
