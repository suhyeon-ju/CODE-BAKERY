package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.QuizDto;

public interface QuizBiz {

	public int insert(QuizDto dto);

	public List<QuizDto> selectList();

	public int count();

	public QuizDto selectOne(int quiz_No);

	public List<QuizDto> quizList();

	public int update(QuizDto quizDto);
}
