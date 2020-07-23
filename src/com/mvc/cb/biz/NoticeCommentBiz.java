package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.NoticeCommentDto;

public interface NoticeCommentBiz {
   
   public List<NoticeCommentDto> selectAll(int notice_No);
   public int insert(NoticeCommentDto dto);
   public int delete(int comment_No);
   
}