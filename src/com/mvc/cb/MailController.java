package com.mvc.cb;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class MailController {
 
  @Autowired
  private JavaMailSender mailSender;
 
 
 
  // mailSending 코드
  @RequestMapping(value = "/mypage_apply.do")
  public String mailSending(HttpServletRequest request) {
   
    String setfrom = "codebakeryy@gmail.com";         
    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
    String applicant  = request.getParameter("applicant");     // 받는 사람 이메일
    String title   = request.getParameter("title");      // 제목
    String content = request.getParameter("content");    // 내용
    String content1 = request.getParameter("content1");    // 내용
   
    System.out.println("content"+content);
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText("신청자: "+applicant+"\n"+"멘토 경력: "+content+"\n"+"멘토 소개: "+content1);  // 메일 내용
//                    +"\n"+content1 추가해보기
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
   
//    return "redirect:/mypage_apply.do";
    return "mypage_applyfinish";
  }
} 