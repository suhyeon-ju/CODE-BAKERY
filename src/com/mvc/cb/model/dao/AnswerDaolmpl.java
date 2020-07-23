package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.AnswerDto;

@Repository
public class AnswerDaolmpl implements AnswerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AnswerDto> selectList(int question_No) {

		List<AnswerDto> list = new ArrayList<AnswerDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", question_No);
		} catch (Exception e) {
			System.out.println("[error] : Answer selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insert(AnswerDto dto) {

		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : Answer insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int answer_No) {

		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", answer_No);
		} catch (Exception e) {
			System.out.println("[error] : Answer delete");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(AnswerDto dto) {

		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			System.out.println("[error] : Answer update");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int cntAnswer(int question_No) {

		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "countAnswer", question_No);
		} catch (Exception e) {
			System.out.println("[error] : count Answer");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int count() {

		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<AnswerDto> answerList() {

		List<AnswerDto> list = new ArrayList<AnswerDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "answerList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public AnswerDto selectOne(AnswerDto dto) {

		AnswerDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE + "selectOne", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
