package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.QuestionDao;
import com.mvc.cb.model.dto.QnAPagingDto;
import com.mvc.cb.model.dto.QuestionDto;

@Service
public class QuestionBizlmpl implements QuestionBiz{
	
	@Autowired
	private QuestionDao dao;

	@Override
	public List<QuestionDto> selectList(QnAPagingDto dto) {
		return dao.selectList(dto);
	}

	@Override
	public QuestionDto selectOne(int question_No) {
		return dao.selectOne(question_No);
	}

	@Override
	public int insert(QuestionDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int question_No) {
		return dao.delete(question_No);
	}

	@Override
	public int update(QuestionDto dto) {
		return dao.update(dto);
	}

	@Override
	public void plusCnt(int question_No) {
		dao.plusCnt(question_No);
	}

	@Override
	public int countBoard() {
		return dao.countBoard();
	}

	@Override
	public int countTags(String question_Tag) {
		return dao.countTags(question_Tag);
	}
	
	@Override
	public List<QuestionDto> selectTagList(QnAPagingDto dto, String question_Tag) {
		return dao.selectTagList(dto, question_Tag);
	}

	@Override
	public int count() {
		return dao.count();
	}

	@Override
	public List<QuestionDto> questionList() {
		return dao.questionList();
	}


}
