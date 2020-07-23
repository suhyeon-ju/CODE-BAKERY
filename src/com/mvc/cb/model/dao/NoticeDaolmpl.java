package com.mvc.cb.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.NoticeDto;
import com.mvc.cb.model.dto.PageNavigator;

@Repository
public class NoticeDaolmpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeDto> selectAll(PageNavigator paging) {

		List<NoticeDto> list = new ArrayList<NoticeDto>();

		int start = paging.getStartRow();
		int end = paging.getEndRow();

		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("start", start);
		param.put("end", end);
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", param);
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public NoticeDto selectOne(int notice_No) {

		NoticeDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", notice_No);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(NoticeDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(NoticeDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int notice_No) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "delete", notice_No);
		} catch (Exception e) {
			System.out.println("[error] : delete");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int viewUpdate(int notice_No) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "viewUpdate", notice_No);
		} catch (Exception e) {
			System.out.println("[error] : viewUpdate");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int pageCnt() {
		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "pageCnt");
		} catch (Exception e) {
			System.out.println("[error] : pageCnt");
			e.printStackTrace();
		}

		return res;

	}

	@Override
	public List<NoticeDto> noticeList() {
		List<NoticeDto> list = new ArrayList<NoticeDto>();

		try {
			list=sqlSession.selectList(NAMESPACE+"noticeList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}