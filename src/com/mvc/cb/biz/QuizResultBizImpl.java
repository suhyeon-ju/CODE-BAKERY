package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.QuizResultDao;
import com.mvc.cb.model.dto.QuizResultDto;

@Service
public class QuizResultBizImpl implements QuizResultBiz{
	
	@Autowired
	private QuizResultDao quizResultDao;
	
	@Override
	public int insert(QuizResultDto dto) {
		return quizResultDao.insert(dto);
	}

	@Override
	public List<QuizResultDto> selectList(String user_Id) {
		return quizResultDao.selectList(user_Id);
	}

	@Override
	public QuizResultDto selectOne(QuizResultDto dto) {
		return quizResultDao.selectOne(dto);
	}

	@Override
	public int update(QuizResultDto quizResultDto) {
		return quizResultDao.update(quizResultDto);
	}
	
	
}