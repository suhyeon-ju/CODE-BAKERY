package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.PointDto;

public interface MyPointDao {
	String NAMESPACE = "point.";
	
	public List<PointDto> selectAll(String id);
	public int insert(PointDto dto);
	public int insert_use(PointDto dto);
}
