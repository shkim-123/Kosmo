package com.sohee.erp.service;

import com.sohee.erp.dto.LoginDTO;

public interface LoginService {
	
	// 회원 정보 등록
	int insertLogin(LoginDTO loginDTO);
	
}
