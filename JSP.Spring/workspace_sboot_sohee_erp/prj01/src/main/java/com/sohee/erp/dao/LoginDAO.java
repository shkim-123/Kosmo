package com.sohee.erp.dao;

import java.util.Map;

import com.sohee.erp.dto.LoginDTO;

public interface LoginDAO {

	public int getLogin_idCnt( Map<String, String> id_pwd );
	
	// 아이디 개수 가져오기
	int getLogin_idCnt(LoginDTO loginDTO);
	
}
