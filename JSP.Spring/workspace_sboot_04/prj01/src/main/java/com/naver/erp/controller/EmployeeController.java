package com.naver.erp.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.erp.Info;
import com.naver.erp.dao.EmployeeDAO;
import com.naver.erp.dto.DeptDTO;
import com.naver.erp.dto.EmployeeDTO;
import com.naver.erp.dto.EmployeeSearchDTO;
import com.naver.erp.service.EmployeeService;

@Controller
@RequestMapping(value="/naver")
public class EmployeeController {
	
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Autowired
	EmployeeService employeeService;
	
	private String path=Info.naverPath+"employee/";
	
	// 직원 목록
	@RequestMapping(value="/employeeList.do")
	public ModelAndView getEmployeeList(EmployeeSearchDTO empSearchDTO) {
		ModelAndView mav = new ModelAndView();
		int employeeListCnt = 0;
		List<EmployeeDTO> employeeList = null;
		List<String> jikupList = null;
		List<DeptDTO> deptList=  null;
		List<EmployeeDTO> empNoNameList = null;
		
		
		try {
			// 직급 리스트 가져오기
			jikupList = this.employeeDAO.getJikupList();
			// 부서명 리스트 가져오기
			deptList = this.employeeDAO.getDeptList();
			// 검색 결과 개수 가져오기
			employeeListCnt = this.employeeDAO.getEmployeeListCnt(empSearchDTO);
			// 리스트 가져오기
			employeeList = this.employeeDAO.getEmployeeList(empSearchDTO);
			// 직원번호, 직원명 리스트 가져오기
			empNoNameList = this.employeeDAO.getEmpNoNameList();
		} catch(Exception ex) {
			System.out.println("getEmployeeList catch!! => " + ex.getMessage());
		}
		
		mav.setViewName(path+"employeeList.jsp");
		mav.addObject("employeeListCnt", employeeListCnt);
		mav.addObject("employeeList", employeeList);
		mav.addObject("jikupList", jikupList);
		mav.addObject("deptList", deptList);
		mav.addObject("empNoNameList", empNoNameList);
		
		return mav;
	}
	
	
	@RequestMapping(value="/empContentForm.do")
	public ModelAndView goEmpContentForm(@RequestParam(value="emp_no") int emp_no) {
		ModelAndView mav = new ModelAndView();
		EmployeeDTO employeeContent = null;
		
		try {
			// 게시물 가져오기
			employeeContent = this.employeeService.getEmployeeContent(emp_no);
		} catch(Exception ex) {
			System.out.println("goEmpContentForm catch!! => " + ex.getMessage());
		}
		
		mav.setViewName(path+"empContentForm.jsp");
		mav.addObject("empContent", employeeContent);
		
		return mav;
	}
	

	// employeeList.jsp 에서 비동기(AJAX) 방식으로 불러올 경우
	@RequestMapping(value="/empUpDelForm.do")
	public ModelAndView goEmpUpDelForm(@RequestParam(value="emp_no") int emp_no) {
		ModelAndView mav = new ModelAndView();
		EmployeeDTO employeeContent = null;
		List<DeptDTO> deptList=  null;
		List<String> jikupList = null;
		List<EmployeeDTO> empNoNameList = null;
		
		try {
			// 게시물 가져오기
			employeeContent = this.employeeService.getEmployeeContent(emp_no);
			// 부서 리스트 가져오기
			deptList = this.employeeDAO.getDeptList();
			// 직급 리스트 가져오기
			jikupList = this.employeeDAO.getJikupList();
			// 직원번호, 직원명 리스트 가져오기
			empNoNameList = this.employeeDAO.getEmpNoNameList();
		} catch(Exception ex) {
			System.out.println("goEmpUpDelForm catch!! =>" + ex.getMessage());
		}
		
		mav.setViewName(path+"empUpDelForm.jsp");
		mav.addObject("empContent", employeeContent);
		mav.addObject("deptList", deptList);
		mav.addObject("jikupList", jikupList);
		mav.addObject("empNoNameList", empNoNameList);
		
		return mav;
	}

	@RequestMapping(value="/empRegForm.do")
	public ModelAndView goEmpRegForm() {
		ModelAndView mav = new ModelAndView();
		List<DeptDTO> deptList=  null;
		List<String> jikupList = null;
		List<EmployeeDTO> empNoNameList = null;
		
		try {
			// 부서 리스트 가져오기
			deptList = this.employeeDAO.getDeptList();
			// 직급 리스트 가져오기
			jikupList = this.employeeDAO.getJikupList();
			// 직원번호, 직원명 리스트 가져오기
			empNoNameList = this.employeeDAO.getEmpNoNameList();
		} catch(Exception ex) {
			System.out.println("goEmpRegForm catch!! => " + ex.getMessage());
		}
		
		mav.addObject("deptList", deptList);
		mav.addObject("jikupList", jikupList);
		mav.addObject("empNoNameList", empNoNameList);
		mav.setViewName(path+"empRegForm.jsp");
		
		return mav;
	}
	
	// 직원 등록하기, ajax로 map 리턴
	@RequestMapping(value="/empRegProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> insertEmployee(EmployeeDTO employeeDTO) {
		Map<String, String> map = new HashMap<String, String>();
		String msg = "";
		int insertCnt = 0;
		
		//=========================================================
		// 유효성 체크
		//=========================================================
		
		
		try {
			if("".equals(msg)) {
				// 등록
				insertCnt = this.employeeService.insertEmployee(employeeDTO);
			}
		} catch(Exception ex) {
			System.out.println("insertEmployee catch!! => " + ex.getMessage());
		}
		
		// map에 넣기
		map.put("msg", msg);
		map.put("insertCnt", insertCnt+"");
		
		return map;
	}
	
	
	@RequestMapping(value="/empUpDelProc.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> empUpDelProc(
			@RequestParam(value="upDel") String upDel
			, EmployeeDTO employeeDTO
	){
		Map<String, String> map = new HashMap<String, String>();
		String msg ="";
		int upDelCnt = 0;
		
		try {
			if("up".equals(upDel)) {
				
				//=========================================================
				// 유효성 체크
				//=========================================================
				
				
				
				
				if("".equals(msg)) {
					upDelCnt = this.employeeService.updateEmployee(employeeDTO);
				}
			} else if("del".equals(upDel)) {
				upDelCnt = this.employeeService.deleteEmployee(employeeDTO);
			}
			
		} catch(Exception ex) {
			System.out.println("empUpDelProc catch!! => " + ex.getMessage());
		}
		
		// map에 넣기
		map.put("msg", msg);
		map.put("upDelCnt", upDelCnt+"");
		
		return map;
	}
	
	
}
