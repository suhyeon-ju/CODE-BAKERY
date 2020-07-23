package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.AnswerDto;
import com.mvc.cb.model.dto.QuestionDto;

public interface AnswerBiz {

	// 답변목록 불러오기
	public List<AnswerDto> selectList(int question_No);

	// 답변 작성
	public int insert(AnswerDto dto);

	// 답변 삭제
	public int delete(int answer_No);

	// 답변 수정
	public int update(AnswerDto dto);

	// 답변 갯수
	public List<Integer> getCntAnswer(List<QuestionDto> qList);

	// 메인에서 보여지는 답변 갯수
	public int count();

	// 로우넘 답변 리스트
	public List<AnswerDto> answerList();

	// 답변 selectOne
	public AnswerDto selectOne(AnswerDto dto);

}
