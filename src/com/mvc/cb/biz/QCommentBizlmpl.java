package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.QCommentDao;
import com.mvc.cb.model.dto.QnACommentDto;

@Service
public class QCommentBizlmpl implements QCommentBiz{
	
	@Autowired
	private QCommentDao dao;

	@Override
	public List<QnACommentDto> selectList(int question_No) {
		return dao.selectList(question_No);
	}

	@Override
	public int insert(QnACommentDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(QnACommentDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int comment_No) {
		return dao.delete(comment_No);
	}

	@Override
	public int insertReply(QnACommentDto dto) {
		return dao.insertReply(dto);
	}


}
