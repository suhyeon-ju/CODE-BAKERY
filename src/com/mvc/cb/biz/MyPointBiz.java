package com.mvc.cb.biz;

import java.util.List;

import com.mvc.cb.model.dto.PointDto;

public interface MyPointBiz {
	public List<PointDto> selectAll(String id);
	public int insert(PointDto dto);
	public int insert_use(PointDto dto);

}
