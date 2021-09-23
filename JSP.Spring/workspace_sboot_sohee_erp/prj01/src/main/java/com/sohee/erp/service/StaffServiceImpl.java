package com.sohee.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sohee.erp.dao.StaffDAO;
import com.sohee.erp.dto.StaffDTO;
import com.sohee.erp.dto.StaffSkillDTO;

@Service
@Transactional
public class StaffServiceImpl implements StaffService {

	@Autowired
	private StaffDAO staffDAO;
	
	//======================================================
	// 사원 정보 등록
	//=======================================================
	@Override
	public int insertStaff(StaffDTO staffDTO) {
		
		// 중복된 주민번호 있는지 확인
		int juminNumCnt = this.staffDAO.getJuminNumCnt(staffDTO);
		if(juminNumCnt > 0) {return -1;}
	
		// 사원 정보 등록
		int staffInsertCnt = this.staffDAO.insertStaff(staffDTO);
		if(staffInsertCnt <= 0) {return -2;}
		
		// 사원 스킬 정보 등록
		int staffInsertSkillCnt = 0;
		int skillCode = 0;
		List<Integer> staffSkillList = staffDTO.getSkill_code();
		for(int i = 0; i < staffSkillList.size(); i++) {
			skillCode = staffSkillList.get(i);
			staffInsertSkillCnt += this.staffDAO.insertStaffSkill(skillCode);
		}
		if(staffInsertSkillCnt <= 0) {return -3;}
		
		return staffInsertCnt; 
	}
	
	//=======================================================
	// 사원 정보 가져오기
	//=======================================================
	@Override
	public StaffDTO getStaff(int staff_no) {
		// 사원 정보 가져오기
		StaffDTO staff  = this.staffDAO.getStaff(staff_no);
		
		// 사원 스킬 정보 가져오기
		staff.setSkill_code(this.staffDAO.getStaffSkillList(staff_no));
		
		return staff;
	}
	
	//=======================================================
	// 사원 정보 삭제
	//=======================================================
	@Override
	public int deleteStaff(StaffDTO staffDTO) {
		
		// 사원 정보가 존재하는지 확인
		int staffCnt = this.staffDAO.getStaffCnt(staffDTO);
		if(staffCnt <= 0 ) {return -1;}
		
		// 사원 스킬 정보 삭제
		int staffDelSkillCnt = this.staffDAO.deleteStaffSkill(staffDTO);
		if(staffDelSkillCnt <= 0) {return -2;}
		
		// 사원 정보 삭제
		int staffDelCnt = this.staffDAO.deleteStaff(staffDTO);
		
		return staffDelCnt;
	}
	
	//=======================================================
	// 사원 정보 수정
	//=======================================================
	@Override
	public int updateStaff(StaffDTO staffDTO) {
		
		// 사원 정보가 존재하는지 확인
		int staffCnt = this.staffDAO.getStaffCnt(staffDTO);
		if(staffCnt <= 0 ) {return -1;}
		
		// 중복된 주민번호 2개 이상 있는지 확인
		int juminNumCnt = this.staffDAO.getJuminNumCnt(staffDTO);
		if(juminNumCnt > 1) {return -2;}
		
		// 사원 스킬 정보 삭제
		int staffDelSkillCnt = this.staffDAO.deleteStaffSkill(staffDTO);
		if(staffDelSkillCnt <= 0) {return -3;}
		
		// 사원 스킬 정보 수정(입력)
		int staffUpSkillCnt = 0;
		StaffSkillDTO staffSkillDTO = new StaffSkillDTO();
		staffSkillDTO.setStaff_no(staffDTO.getStaff_no());
		List<Integer> staffSkillList = staffDTO.getSkill_code();
		
		for(int i = 0; i < staffSkillList.size(); i++) {
			staffSkillDTO.setSkill_code(staffSkillList.get(i));
			staffUpSkillCnt += this.staffDAO.updateStaffSkill(staffSkillDTO);
		}
		if(staffUpSkillCnt <= 0) {return -4;}

		// 사원 정보 수정
		int staffUpCnt = this.staffDAO.updateStaff(staffDTO);
		
		return staffUpCnt;
	}
}
