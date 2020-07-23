<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODEBAKERY</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon"
   href="resources/images/favicon.png" />
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
   href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900"
   rel="stylesheet" />

<link href="./css/default.css" rel="stylesheet" type="text/css"
   media="all" />
<link href="./fonts/fonts.css" rel="stylesheet" type="text/css"
   media="all" />
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style type="text/css">
h1 {
   text-align: center;
   padding: 40px;
   text-decoration: underline;
   text-underline-position: under;
   text-decoration-color: green;
}

.form {
   background-color: white;
   width: 70%;
   height: 810px;
   margin: auto;
   margin-top: 10%;
   margin-botton: 10%;
   box-shadow: 5px 5px 5px 5px gray;
}

.introduce {
   background-color: whitesmoke;
   width: 60%;
   margin: auto;
   height: 120px;
   text-align: center;
}

button {
   width: 120px;
   height: 44px;
   background-color: #4CAF50; /* Green */
   border: none;
   color: white;
   padding: 15px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
}

#content {
   background-color: lightgrey;
   height: 40%;
   width: 70%;
   margin: auto;
   text-align: center;
   margin-left: 15%;
}

#apply_button {
   width: 120px;
   height: 44px;
   background-color: #4CAF50;
   border: none;
   color: white;
   padding: 15px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
}

#textcounter {
   text-align: right;
   margin-right: 21%;
}
</style>
<script type="text/javascript">
   $(function() {

      $('#textarea').keyup(function() {
         var content = $(this).val();
         /*  $(this).height(((content.split('\n').length + 1) * 1.5) + 'em'); */
         $('#counter').html(content.length + '/500');
      });
      // $('#content').keyup();

      $('#apply_button').click(function() {
         var content = $('#textarea').val();
         if (content.length < 300) {
            alert("최소 300자를 채워주세요.");

            return false;
         } else if (content.length > 500) {
            alert("최대 500자까지 작성 가능합니다.");

            return false;
         }
      });

   });
</script>
</head>
<body>
   <%@ include file="header.jsp"%>

   <div class="form">
      <h1 style="padding: 30px;">멘토 신청하기</h1>

      <div class="introduce">
         <br> 안녕하세요. 환영합니다.<br> 내용을 성의있게 작성해 주세요.<br> 심사 후 결과를
         알려드리겠습니다.<br> 감사합니다.<br>
      </div>


      <form action="mypage_apply.do" method="post">
         <div style="text-align: center;">
            <div style="padding: 2%;">
               신청자 &nbsp;&nbsp; <input type="text" name="applicant"
                  style="width: 200px; height: 20px; text-align: center;"
                  value="${User.user_Id }"><br> <input type="hidden"
                  name="tomail" size="120" style="width: 100%"
                  value="jusu2529@gmail.com" class="form-control">
            </div>
            <div>
               멘토경력&nbsp;&nbsp; <input type="hidden" name="title" size="120"
                  style="width: 100%; padding-bottom:3%;" value="멘토 신청합니다." class="form-control">
               <textarea name="content" rows="5" cols="70"
                  style="text-align: center; resize: none;"
                  placeholder="경력을 자유롭게 기재해 주세요."></textarea>

            </div>
            <div style="padding-top: 3%;">
               멘토소개&nbsp;&nbsp;
               <textarea name="content1" id="textarea" rows="15" cols="70"
                  style="text-align: center; resize: none;"
                  placeholder="최소 300자 이상 입력해주세요."></textarea>
               <!-- <div><span id="count">0</span>/<span id="max-count">0</span></div> -->
               <div id="textcounter">
                  <span id="counter">0/500</span>
               </div>
            </div>
            <div>
               <br>
               <!--    <button>신청하기</button> -->
               <input type="submit" id="apply_button" value="신청하기">
            
            </div>
         </div>
      </form>
   </div>
   <br>
   <br>
   <br>
   <br>
   <br>
   <%@ include file="footer.jsp"%>
</body>
</html>