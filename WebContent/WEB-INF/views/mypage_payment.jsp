<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/payment_style.css">
<link href="./css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="./css/fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">

	.form{
		background-color: white;
		width: 70%;
		margin: auto;
		margin-top: 10%;
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
		height:400px;
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
 <script type="text/javascript">
 $(function(){
	    var IMP = window.IMP; // 생략가능
	    IMP.init('imp38792034'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
		$('#btn_step1').click(function(){
			if($('input:radio[name=firstcharge]').is(':checked')){
			$('#div_step1').addClass('hiddendiv');
			$('#div_step2').removeClass('hiddendiv');
			$('#stepslijs1').removeClass('on');
			$('#stepslijs2').addClass('on');
			}else{
				alert('충전 포인트를을 선택해 주세요!');
			}
		});
		
		$('#btn_step2').click(function(){
			
			var pay_method_val = $('input[name=rdo_pay]:checked').val();
	        var member_id_val = '${User.user_Id}';
	        var price_val = $('input:radio[name=firstcharge]:checked').val();
	        var user_Point = '${User.user_Point}';
	        var point_Date = new Date();;
	        
	        console.log("멤버 아이디"+member_id_val+"가격"+price_val);  //값 들어옴
	        
	        
	        var point_Sum = parseInt(price_val)+parseInt(user_Point);
	        console.log(point_Sum);
	        
	        
	        
	        var chargeVal={//키 값은 dto의 변수명과 같아야한다.
	                "user_Id":member_id_val
	          };
	          
	        var chargeinfo={//키 값은 dto의 변수명과 같아야한다.
	              "user_Id":member_id_val,
	              "user_Point": point_Sum,
	               "point_Charge":price_val,
	              "point_Date":point_Date 
	        };
	        
	        
				console.log(chargeVal); //값 들어옴
				
			$.ajax({
				url: "charge_middle.do" ,
				type: 'POST',
				dataType: "json",
				contentType:"application/json",
				data:  JSON.stringify(chargeVal),//기타 필요한 데이터가 있으면 추가 전달
	            
				success:function(msg){
					if(msg.check == true){
						//사이트로 보내는 정보
					    IMP.request_pay({
					        pg : 'html5_inicis',
					        pay_method : pay_method_val,
					        merchant_uid : 'merchant_' + new Date().getTime(),
					        name : '포인트 충전',
					        amount : price_val,
					        buyer_email : '${User.user_Mail}',
					        buyer_name : '${User.user_Name}',
					        buyer_tel : '${User.user_Phone}',
					       /*  buyer_addr : '${User.user_Mail}', */
					        buyer_postcode : '123-456',
					        //m_redirect_url : 'http://www.naver.com'
					    }, function(rsp) {
					        if ( rsp.success) {
					            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					                 $.ajax({
					            			url: "charge.do" ,
					            			type: 'POST',
					            			dataType: "json",
					            			contentType:"application/json",
					            			data:  JSON.stringify(chargeinfo),//기타 필요한 데이터가 있으면 추가 전달
					            			success:function(msg){
					            				if(msg.check==true){
					            					
					            					 location.href="mypoint.do?id="+member_id_val;
					            				}
					            			},error:function(){
					            				msg = '결제 데이터 전송 실패.';
					            				msg += '에러내용 : AJAX charge.do 통신 연결 실패';
					            				alert(msg);
					            			}
					                    });
					            
					        } else {
					            msg = '결제에 실패하였습니다.';
					            msg += '에러내용 : ' + rsp.error_msg;
					            //실패시 이동할 페이지
					            location.href="mypoint.do";
					            alert(msg);
					        }
					    });
					}else{
						alert("ajax 연결에 실패하였습니다.");
					}	
				},
				
				error:function(){
					msg = '결제에 실패하였습니다.결제창 안뜨는 오류';
					msg += '에러내용 : AJAX 통신 연결 실패';
					alert(msg);
				}
			});//ajax1
		});
		
	});
</script>
</head>
<body>
<%@ include file="header.jsp"%>
	
		<!--수정할 부분  -->
		<div class="title_box col-sm-12">
	            <div class="steps fright">
	            <div class="fright">
	                <div class="title_box">
	                    <div class="steps">
	                        <li class="on fleft" id="stepslijs1"><b>01</b>포인트 선택</li>
	                        <img src="">
	                        <li class="fleft" id="stepslijs2"><b>02</b>결제 방법</li>
	                        <img src="">
	                        <li class="fleft" id="stepslijs3"><b>03</b>결제</li>
	                    </div>
	                </div>
	            </div>
	        </div>
	     <!--수정할 부분  --> 
	<div>
	</div>     
	<div class="form">
		<div class="title" style="margin-bottom: 20px; margin-top: 50px; ">
			<div class="sub_title">
			  <h2 class="class_title">포인트 충전</h2>
				<div class="clearfix uline upad"></div>
		 <!--  -->
		  <div class="content step1" id="step1_wrap">
        <div class="step1 left">
            <!-- <div class="pimg"></div> -->
            <div class="pmessage">
                <p><textarea cols="35" rows="15" readonly style="resize:none;">          <<요금 가이드>>

           1point = 1원 


     기본 5000point 신청 가능


          500point당 3분</textarea></p>
            </div>
        </div>
		 
		 	
			<div class="step1 right" id="div_step1">
		            <div class="conwrap">
		                <div class="contitle">원하시는 포인트를 선택해주세요.</div>
		            
		            <div class="conchk">
		                
		                <div class="con-row">
		                    <label><input type="radio" name="firstcharge" value="300">300point</label>
		                </div>
		                <div class="con-row">
		                   <label><input type="radio" name="firstcharge" value="5000">5000point</label>
		                </div>
		                <div class="con-row">
		                    <label><input type="radio" name="firstcharge" value="10000">10000point</label>
		                </div>
		             
		               
		            </div>
		            </div>
		            <button class="nextbtn-step1" id="btn_step1">다음으로 진행하기</button>
		            
		        </div>
		        
		        <div class="step1 right hiddendiv" id="div_step2">
		            <div class="conwrap">
		                <div class="contitle">결제 수단을 선택해 주세요.</div>
		            
		            <div class="conchk">
		                <div class="con-row">
		                    <label><input type="radio" name="rdo_pay" value="card">
		                    신용카드</label>
		                </div>
		                <div class="con-row">
		                    <label><input type="radio" name="rdo_pay" value="trans">
		                    실시간 계좌이체</label>
		                </div>
		                <div class="con-row">
		                    <label><input type="radio" name="rdo_pay" value="phone">
		                    휴대폰 소액결제</label>
		                </div>
		                <div class="con-row">
		                    <label><input type="radio" name="rdo_pay" value="vbank">
		                    무통장 입금</label>
		                </div>
		                
		            </div>
		            </div>
		            <button class="nextbtn-step1" id="btn_step2">다음으로 진행하기</button>
		        </div>
		        
		        <div class="step1 right hiddendiv" id="div_step3">
		            <div class="conwrap">
		                <div class="contitle">결제 완료</div>
		            
		            <div class="conchk">
		                <div class="con-row" id="lsarrtep_uid">
		                    결제 고유 번호 : ##_결제_고유_번호_##
		                </div>
		                <div class="con-row" id="lsarrtep_price">
		                    결제 금액 : ##_결제_금액_##
		                </div>
		                <div class="con-row" id="lsarrtep_method">
		                    결제 수단 : ##_결제_수단_##
		                </div>
		                <div class="con-row" id="lsarrtep_time">
		                    결제 일자 : yyyy년 mm월 dd일 HH시Mm분
		                </div>
		            </div>
		            </div>
		            <button class="nextbtn-step1" id="btn_step3">다음으로 진행하기</button>
		        </div>            
			</div>
			</div>
			</div>
			</div>
			<br>
		</div>
	</div> 
	

	
	
	
	<br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>