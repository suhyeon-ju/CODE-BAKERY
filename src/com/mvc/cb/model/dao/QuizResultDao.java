package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.QuizResultDto;

public interface QuizResultDao {
	
	String NAMESPACE = "quizResult.";

	int insert(QuizResultDto dto);

	List<QuizResultDto> selectList(String user_Id);

	QuizResultDto selectOne(QuizResultDto dto);

	int update(QuizResultDto quizResultDto);

}