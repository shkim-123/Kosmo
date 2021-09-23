package com.sohee.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sohee.erp.dto.StaffDTO;
import com.sohee.erp.dto.StaffSearchDTO;
import com.sohee.erp.dto.StaffSkillDTO;

@Repository
public class StaffDAOImpl implements StaffDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 종교 리스트 가져오기
	@Override
	public List<Map<Integer, String>> getReligionList() {
		
		List<Map<Integer, String>> religionList = this.sqlSession.selectList("com.sohee.erp.dao.StaffDAO.getReligionList");
		
		return religionList;
	}
	
	// 학력 리스트 가져오기
	@Override
	public List<Map<Integer, String>> getSchoolList() {
		
		List<Map<Integer, String>> schoolList = this.sqlSession.selectList("com.sohee.erp.dao.StaffDAO.getSchoolList");
		
		return schoolList;
	}
	
	// 기술 리스트 가져오기
	@Override
	public List<Map<Integer, String>> getSkillList() {
		
		List<Map<Integer, String>> skillList = this.sqlSession.selectList("com.sohee.erp.dao.StaffDAO.getSkillList");
		 
		return skillList;
	}
	
	// 사원 정보 리스트 개수 가져오기
	@Override
	public int getStaffListCnt(StaffSearchDTO staffSearchDTO) {
		
		int staffListCnt = this.sqlSession.selectOne("com.sohee.erp.dao.StaffDAO.getStaffListCnt", staffSearchDTO);
		
		return staffListCnt;
	}
	
	// 사원 정보 리스트 가져오기
	@Override
	public List<StaffDTO> getStaffList(StaffSearchDTO staffSearchDTO) {
		
		List<StaffDTO> staffList = this.sqlSession.selectList("com.sohee.erp.dao.StaffDAO.getStaffList", staffSearchDTO);
		
		return staffList;
	}
	
	// 주민번호 중복 여부 확인
	@Override
	public int getJuminNumCnt(StaffDTO staffDTO) {
		
		int juminNumCnt = this.sqlSession.selectOne("com.sohee.erp.dao.StaffDAO.getJuminNumCnt", staffDTO);
		
		return juminNumCnt;
	}
	
	// 사원 정보 등록
	@Override
	public int insertStaff(StaffDTO staffDTO) {
		
		int staffInsertCnt = this.sqlSession.insert("com.sohee.erp.dao.StaffDAO.insertStaff", staffDTO);
		
		return staffInsertCnt;
	}
	
	// 사원 스킬 정보 등록
	@Override
	public int insertStaffSkill(int skillCode) {
		
		int staffInsertSkillCnt = this.sqlSession.insert("com.sohee.erp.dao.StaffDAO.insertStaffSkill", skillCode);
		
		return staffInsertSkillCnt;
	}
	
	// 사원 정보 가져오기
	@Override
	public StaffDTO getStaff(int staff_no) {
	
		StaffDTO staff = this.sqlSession.selectOne("com.sohee.erp.dao.StaffDAO.getStaff", staff_no);
		
		return staff;
	}
	
	// 사원 스킬 정보 가져오기
	@Override
	public List<Integer> getStaffSkillList(int staff_no) {
		
		List<Integer> staffSkillList = this.sqlSession.selectList("com.sohee.erp.dao.StaffDAO.getStaffSkillList", staff_no);
		
		return staffSkillList;
	}
	
	// 사원 정보 존재 개수 확인
	@Override
	public int getStaffCnt(StaffDTO staffDTO) {
		
		int staffCnt = this.sqlSession.selectOne("com.sohee.erp.dao.StaffDAO.getStaffCnt", staffDTO);
		
		return staffCnt;
	}
	
	// 사원 스킬 정보 삭제
	@Override
	public int deleteStaffSkill(StaffDTO staffDTO) {
		
		int staffDelSkillCnt = this.sqlSession.delete("com.sohee.erp.dao.StaffDAO.deleteStaffSkill", staffDTO); 
		
		return staffDelSkillCnt;
	}
	
	// 사원 정보 삭제
	@Override
	public int deleteStaff(StaffDTO staffDTO) {
		
		int staffDelCnt = this.sqlSession.delete("com.sohee.erp.dao.StaffDAO.deleteStaff", staffDTO);
		
		return staffDelCnt;
	}
	
	// 사원 정보 수정
	@Override
	public int updateStaff(StaffDTO staffDTO) {
		
		int staffUpCnt = this.sqlSession.update("com.sohee.erp.dao.StaffDAO.updateStaff", staffDTO);
		
		return staffUpCnt;
	}
	
	// 사원 스킬 정보 수정(입력)
	@Override
	public int updateStaffSkill(StaffSkillDTO staffSkillDTO) {
		
		int staffUpSkillCnt = this.sqlSession.insert("com.sohee.erp.dao.StaffDAO.updateStaffSkill", staffSkillDTO);
		
		return staffUpSkillCnt;
	}


}
