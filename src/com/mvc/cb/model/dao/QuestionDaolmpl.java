package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QnAPagingDto;
import com.mvc.cb.model.dto.QuestionDto;

@Repository
public class QuestionDaolmpl implements QuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QuestionDto> selectList(QnAPagingDto dto) {

		List<QuestionDto> list = new ArrayList<QuestionDto>();

		int start = dto.getStartRow();
		int end = dto.getEndRow();

		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", start);
		param.put("end", end);

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", param);

		} catch (Exception e) {
			System.out.println("[error] : Question selectList");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public QuestionDto selectOne(int question_No) {

		QuestionDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", question_No);
		} catch (Exception e) {
			System.out.println("[error] : Question selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(QuestionDto dto) {

		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
			System.out.println("[error] : Question insert");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int question_No) {

		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", question_No);
		} catch (Exception e) {
			System.out.println("[error] : Question delete");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(QuestionDto dto) {

		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			System.out.println("[error] : Question update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countBoard() {

		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "countBoard");
		} catch (Exception e) {
			System.out.println("[error] : countBoard selectOne");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<QuestionDto> selectTagList(QnAPagingDto dto ,String question_Tag) {
		
		List<QuestionDto> list = new ArrayList<QuestionDto>();
		
		int start = dto.getStartRow();
		int end = dto.getEndRow();
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", start);
		param.put("end", end);
		param.put("question_Tag", question_Tag);
		
		
		try {
			list = sqlSession.selectList(NAMESPACE+"tagList", param);
			
		}catch(Exception e) {
			System.out.println("[error] : Question selectList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int countTags(String question_Tag) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countTags", question_Tag);
		} catch(Exception e) {
			System.out.println("[error] : countTags");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public void plusCnt(int question_No) {

		sqlSession.update(NAMESPACE + "plusCnt", question_No);

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
	public List<QuestionDto> questionList() {

		List<QuestionDto> list = new ArrayList<QuestionDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "questionList");
			System.out.println("문제list 가져왔다");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
