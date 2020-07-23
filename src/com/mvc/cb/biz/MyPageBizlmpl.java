package com.mvc.cb.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cb.model.dao.MyPageDao;
import com.mvc.cb.model.dto.UserDto;

@Service
public class MyPageBizlmpl implements MyPageBiz {

	@Autowired
	private MyPageDao dao;

	@Override
	public int updateMember(UserDto dto) {
		return dao.updateMember(dto);
	}

	@Override
	public int member_delete(UserDto dto) {
		return dao.member_delete(dto);
	}

	@Override
	public UserDto getInfo(UserDto dto) {
		return dao.getInfo(dto);
	}

	// 관리자 유저리스트
	@Override
	public List<UserDto> userList() {
		return dao.userList();
	}

	@Override
	public int updatePoint(UserDto dto) {
		return dao.updatePoint(dto);
	}

	@Override
	public UserDto selectOne(String user_Id) {
		return dao.selectOne(user_Id);
	}
}
