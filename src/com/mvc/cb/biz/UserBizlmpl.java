package com.mvc.cb.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.UserDao;
import com.mvc.cb.model.dto.UserDto;

@Service
public class UserBizlmpl implements UserBiz {

	@Autowired
	private UserDao dao;

	@Override
	public int signup(UserDto dto) {
		return dao.signup(dto);
	}

	@Override
	public UserDto login(UserDto dto) {
		return dao.login(dto);
	}

	@Override
	public UserDto idcheck(String user_Id) {
		return dao.idchk(user_Id);
	}

	@Override
	public int adjust(UserDto dto) {
		return dao.adjust(dto);
	}
	
	//아이디 비밀번호찾기
	@Override
	public UserDto selectOne(UserDto dto) {
		return dao.selectOne(dto);
	}
	
	@Override
	public UserDto chkIdPw(UserDto dto) {
		return dao.chkIdPw(dto);
	}

	@Override
	public UserDto findId(UserDto dto) {
		return dao.findId(dto);
	}
}
