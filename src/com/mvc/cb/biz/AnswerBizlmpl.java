package com.mvc.cb.biz;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.logging.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.AnswerDao;
import com.mvc.cb.model.dto.AnswerDto;
import com.mvc.cb.model.dto.QuestionDto;

@Service
public class AnswerBizlmpl implements AnswerBiz{

	@Autowired
	private AnswerDao dao;
	
	@Override
	public List<AnswerDto> selectList(int question_No) {
		return dao.selectList(question_No);
	}
	
	@Override
	public int insert(AnswerDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int answer_No) {
		return dao.delete(answer_No);
	}

	@Override
	public int update(AnswerDto dto) {
		return dao.update(dto);
	}

	@Override
	public List<Integer> getCntAnswer(List<QuestionDto> qList) {
		
		List<Integer> answerList = new ArrayList<Integer>(); // 답변 개수가 담길 List
		
		for(QuestionDto dto : qList) {
			
			answerList.add(dao.cntAnswer(dto.getQuestion_No()));
			
		}
		return answerList;
	}
	
	@Override
	public int count() {
		return dao.count();
	}

	@Override
	public List<AnswerDto> answerList() {
		return dao.answerList();
	}

	@Override
	public AnswerDto selectOne(AnswerDto dto) {
		return dao.selectOne(dto);
	}


}
