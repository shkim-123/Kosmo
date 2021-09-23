package com.sohee.erp.service;

import com.sohee.erp.dto.StaffDTO;

public interface StaffService {
	
	// 사원 정보 등록
	int insertStaff(StaffDTO staffDTO);
	
	// 사원 정보 가져오기
	StaffDTO getStaff(int staff_no);
	
	// 사원 정보 삭제
	int deleteStaff(StaffDTO staffDTO);
	
	// 사원 정보 수정
	int updateStaff(StaffDTO staffDTO);
	
}
