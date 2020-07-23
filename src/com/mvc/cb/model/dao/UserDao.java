package com.mvc.cb.model.dao;

import com.mvc.cb.model.dto.UserDto;

public interface UserDao {
	
	String NAMESPACE = "myuser.";

	public int signup(UserDto dto);

	public UserDto login(UserDto dto);

	public UserDto idchk(String user_Id);

	public int adjust(UserDto dto);
	
	//아이디 비밀번호 찾기
	public UserDto selectOne(UserDto dto);
	
	public UserDto chkIdPw(UserDto dto);
	
	//아이디 찾기
	public UserDto findId(UserDto dto);
}
