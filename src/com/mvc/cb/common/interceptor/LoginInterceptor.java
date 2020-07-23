package com.mvc.cb.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor   {

   private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
   
   //Controller 실행 요청 전에 수행되는 메서드
   //return 값이 false인 경우 controller 실행 시키지 않는다.
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      logger.info("[interceptor] : preHandle");
      
      return false;         
   }

   //view 단으로 forward 되기전에 수행
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
	   logger.info("[interceptor] : postHandle");
   }

   //view까지 처리가 끝난 후 처리
   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
         throws Exception {
	   logger.info("[interceptor] : afterCompletion");
   }

}