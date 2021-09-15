package com.naver.erp.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.naver.erp.FileUpLoad;
import com.naver.erp.dao.EmployeeDAO;
import com.naver.erp.dto.EmployeeDTO;

//----------------------------------------------------------------
// [서비스 클래스]인 [BoardServiceImpl 클래스] 선언
//----------------------------------------------------------------
// [서비스 클래스]에는 @Service와 @Transactional를 붙인다.
//----------------------------------------------------------------
// @Service : [서비스 클래스] 임을 지정하고 bean 태그로 자동 등록된다.
// @Transactional : [서비스 클래스]의 메소드 내부에서 일어나는 모든 작업에는 [트랜잭션]이 걸린다.
//----------------------------------------------------------------
@Service 
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
	
	//----------------------------------------------------------------
	// 속성변수 employeeDAO 선언하고, [EmployeeDAO 인터페이스]를 구현한 클래스를 객체화해서 저장한다.
	//----------------------------------------------------------------
	// @Autowired 역할 : 속성변수에 붙은 자료형인 [인터페이스]를 구현한 [클래스]를 객체화하여 저장한다.
	//----------------------------------------------------------------
	@Autowired
	private EmployeeDAO employeeDAO;
	
	String upLoadDir = "C:\\zzz\\workspace_sboot_04_fileUpload\\prj01\\src\\main\\resources\\static\\resources\\img\\";
	
	// 게시글 하나 가져오기
	@Override
	public EmployeeDTO getEmployeeContent(int emp_no) {
		
		// 게시글 있는지 확인
		int employeeCnt = this.employeeDAO.getEmployeeCnt(emp_no);
			if(employeeCnt < 1) {return null;}
		
		// 게시글 하나 가져오기
		EmployeeDTO employeeContent = this.employeeDAO.getEmployeeContent(emp_no);
		
		return employeeContent;
	}
	
	
	// 직원 등록하기
	@Override
	public int insertEmployee(EmployeeDTO employeeDTO, MultipartFile multi) throws Exception {
		
		FileUpLoad fileUpLoad = new FileUpLoad(multi);
		
		employeeDTO.setPic(fileUpLoad.getNewFileName());
		
		int insertCnt = this.employeeDAO.insertEmployee(employeeDTO);
		
		fileUpLoad.upLoadFile(upLoadDir);
		
		return insertCnt;
	}
	
	// 직원 삭제하기
	@Override
	public int deleteEmployee(EmployeeDTO employeeDTO) {
		
		// 직원 존재 개수 얻기
		int employeeCnt = this.employeeDAO.getEmployeeCnt(employeeDTO.getEmp_no());
		if(employeeCnt < 1) {return -1;}
		
		// 부하직원이 존재 개수 얻기
		int subEmployeeCnt = this.employeeDAO.getSubEmployeeCnt(employeeDTO);
		if(subEmployeeCnt > 0) {return -2;}
		
		// 담당고객이 존재 개수 얻기
		int staffEmployeeCnt = this.employeeDAO.getStaffEmployeeCnt(employeeDTO);
		if(staffEmployeeCnt > 0) {return -3;}
		
		String pic = this.employeeDAO.getPic(employeeDTO);
		
		// 삭제 적용행의 개수 얻기
		int deleteCnt = this.employeeDAO.deleteEmployee(employeeDTO);
		
		if(pic != null && pic.length() > 0) {
			File file = new File(upLoadDir + pic);
			file.delete();
		}
		
		
		return deleteCnt;
	}
	
	// 직원 수정하기
	@Override
	public int updateEmployee(EmployeeDTO employeeDTO, MultipartFile multi) throws Exception {
		
		FileUpLoad fileUpLoad = new FileUpLoad(multi);
		
		// 직원 존재 개수 얻기
		int employeeCnt = this.employeeDAO.getEmployeeCnt(employeeDTO.getEmp_no());
		if(employeeCnt < 1) {return -1;}
		
		employeeDTO.setPic(fileUpLoad.getNewFileName());
		String pic = this.employeeDAO.getPic(employeeDTO);
		
		// 수정 적용행의 개수 얻기
		int updateCnt = this.employeeDAO.updateEmployee(employeeDTO);
		
		fileUpLoad.delete(upLoadDir, pic != null && pic.length() > 0);
		fileUpLoad.upLoadFile(upLoadDir);
		
		return updateCnt;
	}
	
}
