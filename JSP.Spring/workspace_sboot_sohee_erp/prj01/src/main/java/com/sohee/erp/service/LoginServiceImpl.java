package com.sohee.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sohee.erp.dao.LoginDAO;
import com.sohee.erp.dto.LoginDTO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO loginDAO;
	
	// 회원 정보 등록
	@Override
	public int insertLogin(LoginDTO loginDTO) {
		
		// 아이디 중복 여부 확인
		int login_idCnt = this.loginDAO.getLogin_idCnt(loginDTO);
		if(login_idCnt > 0) {return -1;}
		
		// 회원 정보 등록
		int joinCnt = this.loginDAO.insertLogin(loginDTO);
		
		return joinCnt;
	}
	
}
