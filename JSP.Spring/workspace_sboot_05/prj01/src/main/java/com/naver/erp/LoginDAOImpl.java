package com.naver.erp;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int get_loginCNT(Map<String,String> login_map) {
		
		System.out.println("LoginDAOImpl.get_loginCNT 시작=====");
		System.out.println("LoginDAOImpl.get_loginCNT login_map =>" + login_map);
		
		int login_cnt = sqlSession.selectOne("com.naver.erp.LoginDAO.getLogin_idCnt", login_map);
		
		System.out.println("LoginDAOImpl.get_loginCNT 끝=====");
		
		return login_cnt;
	}
	
	
	
}
