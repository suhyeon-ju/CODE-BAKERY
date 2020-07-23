package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.MentorDto;

public interface MentorDao {
	
	String NAMESPACE = "mentor.";

	List<MentorDto> selectList();

	MentorDto selectOne(int mentor_No);

	int insert(MentorDto dto);

}
