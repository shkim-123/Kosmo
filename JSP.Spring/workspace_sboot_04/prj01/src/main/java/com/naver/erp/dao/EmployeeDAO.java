package com.naver.erp.dao;

import java.util.List;
import java.util.Map;

import com.naver.erp.dto.DeptDTO;
import com.naver.erp.dto.EmployeeDTO;
import com.naver.erp.dto.EmployeeSearchDTO;

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
	
	// 부서 리스트 가져오기
	List<DeptDTO> getDeptList();
	
	// 직원번호, 직원명 리스트 가져오기
	List<EmployeeDTO> getEmpNoNameList();
	
	// 직원 등록하기
	int insertEmployee(EmployeeDTO employeeDTO);
	
	// 부하직원 존재 개수 얻기
	int getSubEmployeeCnt(EmployeeDTO employeeDTO);
	
	// 담당고객 존재 개수 얻기
	int getStaffEmployeeCnt(EmployeeDTO employeeDTO);
	
	// 직원 삭제 적용 개수 얻기
	int deleteEmployee(EmployeeDTO employeeDTO);
	
	// 직원 수정 적용 개수 얻기
	int updateEmployee(EmployeeDTO employeeDTO);
	
}
