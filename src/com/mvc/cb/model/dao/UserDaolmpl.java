package com.mvc.cb.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.cb.model.dto.UserDto;

@Repository
public class UserDaolmpl implements UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int signup(UserDto dto) {
		System.out.println("다오 인설트문 왔다");
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			System.out.println("다오에서 insert 돌았단다");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}

		return res;
	}

	@Override
	public UserDto login(UserDto dto) {

		System.out.println("로그인 왔다");
		UserDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
			System.out.println("로그인 가져왔다");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public UserDto idchk(String user_Id) {

		UserDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "idcheck", user_Id);
			System.out.println("idcheck했다");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int adjust(UserDto dto) {

		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "adjust", dto);
		} catch (Exception e) {
			System.out.println("[error] : adjust");
			e.printStackTrace();
		}

		return res;

	}
	
	//아이디 비밀번호 찾기
	@Override
	public UserDto selectOne(UserDto dto) {
		
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "search", dto);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}

		return res;
		
	}
	
	@Override
	public UserDto chkIdPw(UserDto dto) {
		
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "chkIdPw", dto);
		} catch(Exception e) {
			System.out.println("[error] : chkIdPw");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public UserDto findId(UserDto dto) {
		
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "findId", dto);
		} catch(Exception e) {
			System.out.println("[error] : findId");
			e.printStackTrace();
		}
		
		return res;
	}

}
