package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.QnACommentDto;

public interface QCommentDao {
	
	String NAMESPACE = "qcomment.";

	
	// 댓글 목록
	public List<QnACommentDto> selectList(int question_No);
	
	// 댓글 작성
	public int insert(QnACommentDto dto);
	
	// 댓글 수정
	public int update(QnACommentDto dto);
	
	// 댓글 삭제
	public int delete(int comment_No);

	// 대댓글 작성
	public int insertReply(QnACommentDto dto);

	
}
