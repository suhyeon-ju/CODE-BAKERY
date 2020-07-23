package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QuizResultDto;

@Repository
public class QuizResultDaoImpl implements QuizResultDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(QuizResultDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		}catch(Exception e) {
			System.out.println("[error] : QuizResultInsert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<QuizResultDto> selectList(String user_Id) {
		List<QuizResultDto> quizResultList = new ArrayList<QuizResultDto>();
		
		try {
			quizResultList = sqlSession.selectList(NAMESPACE+"selectList", user_Id);
		}catch(Exception e) {
			System.out.println("[error] : QuizResult SelectList");
			e.printStackTrace();
		}
		return quizResultList;
	}

	@Override
	public QuizResultDto selectOne(QuizResultDto dto) {
		QuizResultDto quizResultOne = new QuizResultDto();
		
		try {
			quizResultOne = sqlSession.selectOne(NAMESPACE+"selectOne", dto);
		}catch(Exception e) {
			System.out.println("[error] : QuizResult SelectOne" );
			e.printStackTrace();
		}
		return quizResultOne;
	}

	@Override
	public int update(QuizResultDto quizResultDto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", quizResultDto);
		}catch(Exception e) {
			System.out.println("[error] : QuizResultDto Update");
			e.printStackTrace();
		}
		return res;
	}

}