package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface EmployeeDAO {
	
	// 게시판 총 개수 가져오기
	int getEmployeeListCnt(EmployeeSearchDTO empSearchDTO);
	
	// 게시판 리스트 가져오기
	List<EmployeeDTO> getEmployeeList(EmployeeSearchDTO empSearchDTO);
	
	// 게시글 있는지 확인하기
	int getEmployeeCnt(int emp_no);
	
	// 게시글 하나 가져오기
	EmployeeDTO getEmployeeContent(int emp_no);
	
	// 직급 리스트 가져오기
	List<String> getJikupList();
	
	// 부서명 리스트 가져오기
	List<String> getDepNameList();
	
}
