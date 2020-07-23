package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.MentorDto;
import com.mvc.cb.model.dto.QuestionDto;

@Repository
public class MentorDaolmpl implements MentorDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MentorDto> selectList() {

		List<MentorDto> list = new ArrayList<MentorDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "mentorAll");

		} catch (Exception e) {
			System.out.println("[error] : mentor selectList");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public MentorDto selectOne(int mentor_No) {

		MentorDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", mentor_No);
		} catch (Exception e) {
			System.out.println("[error] : mentor selectOne");
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(MentorDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
