package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.MentorReviewDto;

@Repository
public class MentorReviewDaolmpl implements MentorReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MentorReviewDto> selectList(int mentor_No) {

		List<MentorReviewDto> list = new ArrayList<MentorReviewDto>();

		try {

			list = sqlSession.selectList(NAMESPACE + "mentorReviewAll",mentor_No);

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;
	}

	@Override
	public MentorReviewDto selectOne(int mentor_No) {

		MentorReviewDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<MentorReviewDto> review(int mentor_No) {

		List<MentorReviewDto> list = new ArrayList<MentorReviewDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "Review", mentor_No);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insert(MentorReviewDto rdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"ReviewInsert",rdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
