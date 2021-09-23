package com.sohee.erp.dao;

import java.util.List;
import java.util.Map;

import com.sohee.erp.dto.StaffDTO;
import com.sohee.erp.dto.StaffSearchDTO;
import com.sohee.erp.dto.StaffSkillDTO;

public interface StaffDAO {

	// 종교 리스트 가져오기
	List<Map<Integer, String>> getReligionList();
	// 학력 리스트 가져오기
	List<Map<Integer, String>> getSchoolList();
	// 기술 리스트 가져오기
	List<Map<Integer, String>> getSkillList();
	// 사원 정보 리스트 개수 가져오기
	int getStaffListCnt(StaffSearchDTO staffSearchDTO);
	// 사원 정보 리스트 가져오기
	List<StaffDTO> getStaffList(StaffSearchDTO staffSearchDTO);
	
	// 주민번호 중복 여부 확인
	int getJuminNumCnt(StaffDTO staffDTO);
	// 사원 정보 등록
	int insertStaff(StaffDTO staffDTO);
	// 사원 스킬 정보 등록
	int insertStaffSkill(int skillCode);
	
	// 사원 정보 가져오기
	StaffDTO getStaff(int staff_no);
	// 사원 스킬 정보 가져오기
	List<Integer> getStaffSkillList(int staff_no);
	
	// 사원 정보 존재 개수 확인
	int getStaffCnt(StaffDTO staffDTO);
	
	// 사원 정보 삭제
	int deleteStaff(StaffDTO staffDTO);
	// 사원 스킬 정보 삭제
	int deleteStaffSkill(StaffDTO staffDTO);
	
	// 사원 정보 수정
	int updateStaff(StaffDTO staffDTO);
	// 사원 스킬 정보 수정(입력)
	int updateStaffSkill(StaffSkillDTO staffSkillDTO);
}
