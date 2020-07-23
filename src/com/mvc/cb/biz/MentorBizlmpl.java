package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.MentorDao;
import com.mvc.cb.model.dto.MentorDto;

@Service
public class MentorBizlmpl implements MentorBiz {

	@Autowired
	private MentorDao dao;

	@Override
	public List<MentorDto> selectList() {
		return dao.selectList();
	}

	@Override
	public MentorDto selectOne(int mentor_No) {
		return dao.selectOne(mentor_No);
	}

	@Override
	public int insert(MentorDto dto) {
		return dao.insert(dto);
	}

}
