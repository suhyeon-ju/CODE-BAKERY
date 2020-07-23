package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.QuizResultDto;

public interface QuizResultBiz {

	int insert(QuizResultDto dto);

	List<QuizResultDto> selectList(String user_Id);

	QuizResultDto selectOne(QuizResultDto dto);

	int update(QuizResultDto quizResultDto);

}