package com.naver.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.erp.dto.DeptDTO;
import com.naver.erp.dto.EmployeeDTO;
import com.naver.erp.dto.EmployeeSearchDTO;

//----------------------------------------------------------------
// [DAO 클래스]인 [EmployeeDAOImpl 클래스] 선언
//----------------------------------------------------------------
// @Repository를 붙임으로써 [DAO 클래스]임을 지정하게 되고, bean 태그로 자동 등록된다.
//----------------------------------------------------------------
@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	//----------------------------------------------------------------
	// 속성변수 sqlSession 선언하고, [SqlSessionTemplate 객체]를 생성해 저장
	//----------------------------------------------------------------
	// @Autowired 역할 : 속성변수에 붙은 자료형이 [인터페이스]면 이를 구현한 [클래스]를 객체화하여 저장한다.
	// @Autowired 역할 : 속성변수에 붙은 자료형이 [클래스]명 이를 객체화하여 저장한다.
	//----------------------------------------------------------------
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시판 총 개수 가져오기
	@Override
	public int getEmployeeListCnt(EmployeeSearchDTO empSearchDTO) {
		
		int employeeListCnt = this.sqlSession.selectOne("com.naver.erp.dao.EmployeeDAO.getEmployeeListCnt", empSearchDTO);
		
		return employeeListCnt;
	}
	
	// 게시판 리스트 가져오기
	@Override
	public List<EmployeeDTO> getEmployeeList(EmployeeSearchDTO empSearchDTO) {
		
		List<EmployeeDTO> employeeList = this.sqlSession.selectList("com.naver.erp.dao.EmployeeDAO.getEmployeeList", empSearchDTO);
		
		return employeeList;
	}
	
	// 게시글 있는지 확인하기
	@Override
	public int getEmployeeCnt(int emp_no) {
		
		int employeeCnt = this.sqlSession.selectOne("com.naver.erp.dao.EmployeeDAO.getEmployeeCnt", emp_no);
		
		return employeeCnt;
	}
	
	// 게시글 하나 가져오기
	@Override
	public EmployeeDTO getEmployeeContent(int emp_no) {
		
		EmployeeDTO employeeContent = this.sqlSession.selectOne("com.naver.erp.dao.EmployeeDAO.getEmployeeContent", emp_no);
		
		return employeeContent;
	}
	
	// 직급 리스트 가져오기
	@Override
	public List<String> getJikupList() {
		
		List<String> jikupList = this.sqlSession.selectList("com.naver.erp.dao.EmployeeDAO.getJikupList");
		
		return jikupList;
	}
	
	// 부서 리스트 가져오기
	@Override
	public List<DeptDTO> getDeptList() {
		
		List<DeptDTO> deptList = this.sqlSession.selectList("com.naver.erp.dao.EmployeeDAO.getDeptList");
		
		return deptList;
	}
	
	// 직원번호, 직원명 리스트 가져오기
	@Override
	public List<EmployeeDTO> getEmpNoNameList() {
		
		List<EmployeeDTO> empNoNameList = this.sqlSession.selectList("com.naver.erp.dao.EmployeeDAO.getEmpNoNameList");
		
		return empNoNameList;
	}
	
	// 직원 등록하기
	@Override
	public int insertEmployee(EmployeeDTO employeeDTO) {
		
		int insertCnt = this.sqlSession.insert("com.naver.erp.dao.EmployeeDAO.insertEmployee", employeeDTO);
		
		return insertCnt;
	}
	
	// 부하직원 존재 개수 얻기
	@Override
	public int getSubEmployeeCnt(EmployeeDTO employeeDTO) {
		
		int subEmployeeCnt = this.sqlSession.selectOne("com.naver.erp.dao.EmployeeDAO.getSubEmployeeCnt", employeeDTO);
		
		return subEmployeeCnt;
	}
	
	// 담당고객 존재 개수 얻기
	@Override
	public int getStaffEmployeeCnt(EmployeeDTO employeeDTO) {
		
		int staffEmployeeCnt = this.sqlSession.selectOne("com.naver.erp.dao.EmployeeDAO.getStaffEmployeeCnt", employeeDTO);
		
		return staffEmployeeCnt;
	}
	
	// 직원 삭제 적용 개수 얻기
	@Override
	public int deleteEmployee(EmployeeDTO employeeDTO) {
		
		int deleteCnt = this.sqlSession.delete("com.naver.erp.dao.EmployeeDAO.deleteEmployee", employeeDTO);
		
		return deleteCnt;
	}
	
	// 직원 수정 적용 개수 얻기
	@Override
	public int updateEmployee(EmployeeDTO employeeDTO) {
		
		int updateCnt = this.sqlSession.update("com.naver.erp.dao.EmployeeDAO.updateEmployee", employeeDTO);
		
		return updateCnt;
	}

	
}
