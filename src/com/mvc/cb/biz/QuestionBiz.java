package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.QnAPagingDto;
import com.mvc.cb.model.dto.QuestionDto;

public interface QuestionBiz {
	
	
	// 게시글 목록
	public List<QuestionDto> selectList(QnAPagingDto dto);
	
	// 게시글 질문 제목 클릭시 해당 글 정보만 가져옴
	public QuestionDto selectOne(int question_No);
	
	// 글 작성
	public int insert(QuestionDto dto);
	
	// 글 삭제
	public int delete(int question_No);
	
	// 글 수정
	public int update(QuestionDto dto);

	// 게시물 총 갯수
	public int countBoard();
	
	// 태그 값에 대한 게시글 목록
	public List<QuestionDto> selectTagList(QnAPagingDto dto,String question_Tag);
	
	// 해당 태그에 대한 게시물 갯수
	public int countTags(String question_Tag);
		
	// 질문글에 대한 조회수
	public void plusCnt(int question_No);
	
	//메인화면에 보여지는 질문글 갯수
	public int count();

	public List<QuestionDto> questionList();
	
	
}
