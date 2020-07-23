package com.mvc.cb.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

//import 주의!!
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogFilter implements Filter{
//   로그 객체 선언, 
   private Logger logger = LoggerFactory.getLogger(LogFilter.class);
   
   //init(): 필터 초기화
   //doFilter(): 전후처리
   //destroy(): 필터 인스턴스 종료
   @Override
   public void init(FilterConfig filterConfig) throws ServletException {
      // TODO Auto-generated method stub
      
   }

   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
         throws IOException, ServletException {
      
      HttpServletRequest req = (HttpServletRequest) request;
      
      String remoteAddr = req.getRemoteAddr();
      String uri=req.getRequestURI();
      String url=req.getRequestURL().toString();
      String queryString = req.getQueryString();
      
      String referer = req.getHeader("referer");
      String agent = req.getHeader("User-Agent");
      
      StringBuffer sb = new StringBuffer();
      sb.append("remoteAddr: "+remoteAddr+"\n") //ip주소, ipv6
         .append("uri: " + uri+"\n")
         .append("url: " +url+"\n")
         .append("queryString: " +queryString+"\n")
         .append("referer: " +referer+"\n")    //이전 페이지(보내는 페이지) url
         .append("agent: " +agent+"\n");       //사용자 정보(browser, os 등등)
      
      logger.info("LOG FILTER\n"+sb);
      
      chain.doFilter(req, response);    //다음 필터가 있으면 다음 필터가 실행될 수 있게 체인으로 연결
      
   }

   @Override
   public void destroy() {
      // TODO Auto-generated method stub
      
   }

}