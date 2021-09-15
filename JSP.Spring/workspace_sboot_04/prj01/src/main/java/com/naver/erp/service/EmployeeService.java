package com.naver.erp.service;

import org.springframework.web.multipart.MultipartFile;

import com.naver.erp.dto.EmployeeDTO;

public interface EmployeeService {
	
	// 게시글 하나 가져오기
	EmployeeDTO getEmployeeContent(int emp_no);
	
	// 직원 등록하기
	int insertEmployee(EmployeeDTO employeeDTO, MultipartFile multi) throws Exception;
	
	// 직원 삭제하기
	int deleteEmployee(EmployeeDTO employeeDTO);
	
	// 직원 수정하기
	int updateEmployee(EmployeeDTO employeeDTO, MultipartFile multi) throws Exception;
	
}
