package com.sohee.erp.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sohee.erp.Info;
import com.sohee.erp.StaffValidator;
import com.sohee.erp.Util;
import com.sohee.erp.dao.StaffDAO;
import com.sohee.erp.dto.StaffDTO;
import com.sohee.erp.dto.StaffSearchDTO;
import com.sohee.erp.service.StaffService;

@Controller
public class StaffController {

	@Autowired
	private StaffService staffService;
	
	@Autowired
	private StaffDAO staffDAO;
	
	// jsp 파일 경로
	private String path = Info.soheePath + "staff/";
	
	//=======================================================
	// 사원 정보 검색으로 이동
	//=======================================================
	@RequestMapping(value="/staff_search_form.do")
	public ModelAndView getStaffList(StaffSearchDTO staffSearchDTO) {
		ModelAndView mav = new ModelAndView();
		List<Map<Integer, String>> religionList = null;
		List<Map<Integer, String>> schoolList = null;
		List<Map<Integer, String>> skillList = null;
		int staffListCnt = 0;
		List<StaffDTO> staffList = null;
		//------------------
		String graduate_day_year_start = staffSearchDTO.getGraduate_day_year_start();
		String graduate_day_month_start = staffSearchDTO.getGraduate_day_month_start();
		String graduate_day_year_end = staffSearchDTO.getGraduate_day_year_end();
		String graduate_day_month_end = staffSearchDTO.getGraduate_day_month_end();
		//------------------
		
		//==================================
		// 졸업일 세팅, 월 10 미만인 경우 0 넣어주기 ex) 1 -> 01, 년+월+01 을 DTO에 세팅
		//==================================
		if(graduate_day_year_start != null && graduate_day_month_start != null) {
			if(Integer.parseInt(graduate_day_month_start) < 10) {
				graduate_day_month_start = "0" + graduate_day_month_start;
			} 
			staffSearchDTO.setGraduate_day_start(graduate_day_year_start + graduate_day_month_start + "01");
		}
		
		if(graduate_day_year_end != null && graduate_day_month_end != null) {
			if(Integer.parseInt(graduate_day_month_end) < 10) {
				graduate_day_month_end = "0" + graduate_day_month_end;
			}
			staffSearchDTO.setGraduate_day_end(graduate_day_year_end + graduate_day_month_end + "01");
		}
		
		//==================================
		// 사원 정보 리스트 개수 가져오기
		//==================================
		try {
			staffListCnt = this.staffDAO.getStaffListCnt(staffSearchDTO);
		} catch(Exception ex) {
			System.out.println("getStaffList catch!! => " + ex.getMessage());
		}
		
		//==================================
		// 페이징 처리
		//==================================
		Map<String, Integer> pagingMap = Util.getPagingNos(
				staffListCnt
				, staffSearchDTO.getSelectPageNo()
				, staffSearchDTO.getRowCntPerPage()
				, 10);
		staffSearchDTO.setSelectPageNo(pagingMap.get("selectPageNo"));
		
		//==================================
		// 종교, 학력, 기술, 사원 정보 리스트 가져오기
		//==================================
		try {
			religionList = this.staffDAO.getReligionList();
			schoolList = this.staffDAO.getSchoolList();
			skillList = this.staffDAO.getSkillList();
			staffList = this.staffDAO.getStaffList(staffSearchDTO);
		} catch(Exception ex) {
			System.out.println("getStaffList catch!! => " + ex.getMessage());
		}
		
		
		//------------------
		mav.setViewName(path+"searchForm.jsp");
		//------------------
		mav.addObject("religionList", religionList);
		mav.addObject("schoolList", schoolList);
		mav.addObject("skillList", skillList);
		//------------------
		mav.addObject("staffListCnt", staffListCnt);
		mav.addObject("staffList", staffList);
		//------------------
		mav.addObject("pagingMap", pagingMap);
		//------------------
		
		return mav;
	}
	
	
	//=======================================================
	// 사원 정보 등록으로 이동
	//=======================================================
	@RequestMapping(value="/staff_input_form.do")
	public ModelAndView goStaffInputForm(StaffDTO staffDTO) {
		ModelAndView mav = new ModelAndView();
		List<Map<Integer, String>> religionList = null;
		List<Map<Integer, String>> schoolList = null;
		List<Map<Integer, String>> skillList = null;
		//------------------
		
		//==================================
		// 종교, 학력, 기술 리스트 가져오기
		//==================================
		try {
			religionList = this.staffDAO.getReligionList();
			schoolList = this.staffDAO.getSchoolList();
			skillList = this.staffDAO.getSkillList();
		} catch(Exception ex) {
			System.out.println("goStaffInputForm catch!! => " + ex.getMessage());
		}
		
		//------------------
		mav.setViewName(path+"InputForm.jsp");
		//------------------
		mav.addObject("religionList", religionList);
		mav.addObject("schoolList", schoolList);
		mav.addObject("skillList", skillList);
		//------------------
		
		return mav;
	}
	
	//=======================================================
	// 사원 정보 등록 비동기 방식
	//=======================================================
	@RequestMapping(value="/staff_input_proc.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> insertStaff(StaffDTO staffDTO, BindingResult bindingResult){
		Map<String, String> map = new HashMap<String, String>();
		int staffInsertCnt = 0;
		String msg = "";
		//------------------
		
		try {
			//==================================
			// 유효성 체크
			//==================================
			msg = check_StaffDTO(staffDTO, bindingResult);
			
			//==================================
			// 유효성 체크 통과 시 직원 정보 등록
			//==================================
			if(msg.equals("")) {
				staffInsertCnt = this.staffService.insertStaff(staffDTO);
			}
			
		}catch(Exception ex) {
			System.out.println("insertStaff catch!! => " + ex.getMessage());
			msg = "서버쪽에서 문제 발생! 서버 관리자에게 문의 바람";
		}
		
		//------------------
		map.put("staffInsertCnt", staffInsertCnt+"");
		map.put("msg", msg);
		//------------------
		
		return map;
	}
	
	
	//=======================================================
	// 사원 정보 수정으로 이동
	//=======================================================
	@RequestMapping(value="/staff_updel_form.do")
	public ModelAndView goStaffUpdelForm() {
		ModelAndView mav = new ModelAndView();
		List<Map<Integer, String>> religionList = null;
		List<Map<Integer, String>> schoolList = null;
		List<Map<Integer, String>> skillList = null;
		//------------------
		
		//==================================
		// 종교, 학력, 기술 리스트 가져오기
		//==================================
		try {
			religionList = this.staffDAO.getReligionList();
			schoolList = this.staffDAO.getSchoolList();
			skillList = this.staffDAO.getSkillList();
			//------------------
		} catch(Exception ex) {
			System.out.println("goStaffUpdelForm catch!! => " + ex.getMessage());
		}
		
		//------------------
		mav.setViewName(path+"updelForm.jsp");
		//------------------
		mav.addObject("religionList", religionList);
		mav.addObject("schoolList", schoolList);
		mav.addObject("skillList", skillList);
		//------------------
		
		return mav;
	}
	
	//=======================================================
	// 사원 정보 수정화면으로 사원 정보를 리턴함
	//=======================================================
	@RequestMapping(value="/staff_updel_form_data.do",method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, StaffDTO> goStaffUpdelFormData(@RequestParam(value="staff_no") int staff_no) {
		Map<String, StaffDTO> map = new HashMap<String, StaffDTO>();
		//------------------
		StaffDTO staff = null;
		//------------------
		
		//==================================
		// 사원 정보 가져오기
		//==================================
		try {
			staff = this.staffService.getStaff(staff_no);
		} catch(Exception ex) {
			System.out.println("goStaffUpdelForm catch!! => " + ex.getMessage());
		}
		
		//------------------
		map.put("staff", staff);
		
		return map;
	}
	
	@RequestMapping(value="/staff_updel_proc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> updelStaff(StaffDTO staffDTO, @RequestParam(value = "upDel") String upDel, BindingResult bindingResult){
		Map<String, String> map = new HashMap<String, String>();
		int staffUpdelCnt = 0;
		String msg = "";
		//------------------
		
		try {
			//------------------
			if(upDel.equals("del")) {
				//==================================
				// 직원 정보 삭제
				//==================================
				staffUpdelCnt = this.staffService.deleteStaff(staffDTO);
				
			} else if(upDel.equals("up")) {
				
				//==================================
				// 유효성 체크
				//==================================
				msg = check_StaffDTO(staffDTO, bindingResult);
				
				//==================================
				// 유효성 체크 통과 시 직원 수정
				//==================================
				if(msg.equals("")) {
					staffUpdelCnt = this.staffService.updateStaff(staffDTO);
				}
				//------------------
			}
			
		}catch(Exception ex) {
			System.out.println("updelStaff catch!! => " + ex.getMessage());
			msg = "서버쪽에서 문제 발생! 서버 관리자에게 문의 바람";
		}
		
		//------------------
		map.put("staffUpdelCnt", staffUpdelCnt+"");
		map.put("msg", msg);
		//------------------
		
		return map;
		
	}
	
	//=======================================================
	// 사원 정보 입력 또는 수정 시 게시판 입력글의 입력양식의 유효성을 검사하고 
	// 문제가 있으면 경고 문자를 리턴하는 메소드 선언
	//=======================================================	
	public String check_StaffDTO(StaffDTO staffDTO, BindingResult bindingResult) {
		
		//----------------------------------------------------------------
		String checkMsg = "";
		StaffValidator staffValidator = new StaffValidator();
		
		staffValidator.validate(staffDTO, bindingResult);
		
		if( bindingResult.hasErrors() ) {
			checkMsg = bindingResult.getFieldError().getCode();
		}
		
		return checkMsg;
	}
	
}
