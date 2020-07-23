package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.NoticeCommentDao;
import com.mvc.cb.model.dto.NoticeCommentDto;

@Service
public class NoticeCommentBizlmpl implements NoticeCommentBiz{
   
   @Autowired
   private NoticeCommentDao dao;
   
   @Override
   public List<NoticeCommentDto> selectAll(int notice_No) {
      return dao.selectAll(notice_No);
   }

   @Override
   public int insert(NoticeCommentDto dto) {
      return dao.insert(dto);
   }

   @Override
   public int delete(int comment_No) {
      return dao.delete(comment_No);
   }

}