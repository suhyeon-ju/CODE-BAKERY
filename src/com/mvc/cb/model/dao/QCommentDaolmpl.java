package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.QnACommentDto;

@Repository
public class QCommentDaolmpl implements QCommentDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<QnACommentDto> selectList(int question_No) {
		
		List<QnACommentDto> list = new ArrayList<QnACommentDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", question_No);
		}catch(Exception e) {
			System.out.println("[error] : QCommentDao selectList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insert(QnACommentDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertQuestion", dto);
		} catch (Exception e) {
			System.out.println("[error] : QCommentDao insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(QnACommentDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		}catch (Exception e) {
			System.out.println("[error] : QCommentDao update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int comment_No) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"delete", comment_No);
		}catch (Exception e) {
			System.out.println("[error] : QCommentDao delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertReply(QnACommentDto dto) {
		
		int res = 0;
		
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertReply", dto);
		} catch (Exception e) {
			System.out.println("[error] : QCommentDao insertReply");
			e.printStackTrace();
		}
		
		return res;
	}

	
	

}
