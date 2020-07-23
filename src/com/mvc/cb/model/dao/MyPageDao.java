package com.mvc.cb.model.dao;

import java.util.List;

import com.mvc.cb.model.dto.UserDto;

public interface MyPageDao {

	String NAMESPACE = "myuser.";
	
	public int updateMember(UserDto dto);

	public int member_delete(UserDto dto);

	public UserDto getInfo(UserDto dto);
	
	//관리자 유저리스트
	public List<UserDto> userList();

	public int updatePoint(UserDto dto);

	public UserDto selectOne(String user_Id);

}
