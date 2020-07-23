package com.mvc.cb.biz;

import com.mvc.cb.model.dto.UserDto;

public interface UserBiz {

	
	public int signup(UserDto dto);

	public UserDto login(UserDto dto);

	public UserDto idcheck(String user_Id);

	public int adjust(UserDto dto);
	
	//아이디 비밀번호찾기
	public UserDto selectOne(UserDto dto);
	
	//아이디 비밀번호 존재여부
	public UserDto chkIdPw(UserDto dto);
	
	//아이디 찾기
	public UserDto findId(UserDto dto);
	
}
