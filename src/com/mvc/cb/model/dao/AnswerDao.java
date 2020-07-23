package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.AnswerDto;

public interface AnswerDao {
	
	String NAMESPACE = "answer.";
	
	
	// 답변목록 불러오기
	public List<AnswerDto> selectList(int question_No);

	// 답변 작성
	public int insert(AnswerDto dto);
	
	// 답변 삭제
	public int delete(int answer_No);

	// 답변 수정
	public int update(AnswerDto dto);

	// 답변 갯수 
	public int cntAnswer(int question_No);
	
	// 메인에서 보여지는 답변 갯수
	public int count();

	public List<AnswerDto> answerList();

	// 답변 selectOne
	public AnswerDto selectOne(AnswerDto dto);


}
