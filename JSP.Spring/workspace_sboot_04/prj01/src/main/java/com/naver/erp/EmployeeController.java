package com.naver.erp;

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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping(value="/employeeList.do")
	public ModelAndView getEmployeeList(EmployeeSearchDTO empSearchDTO) {
		ModelAndView mav = new ModelAndView();
		int employeeListCnt = 0;
		List<EmployeeDTO> employeeList = null;
		
		
		// 검색 결과 개수 가져오기
		try {
			employeeListCnt = this.employeeDAO.getEmployeeListCnt(empSearchDTO);
		} catch(Exception ex) {
			System.out.println("getEmployeeList employeeListCnt catch!! => " + ex);
		}
		
		
		
		// 리스트 가져오기
		try {
			employeeList = this.employeeDAO.getEmployeeList(empSearchDTO);
			
		} catch(Exception ex) {
			System.out.println("getEmployeeList employeeList catch!!! => " + ex);
		}

		
		mav.setViewName("employeeList.jsp");
		mav.addObject("employeeListCnt", employeeListCnt);
		mav.addObject("employeeList", employeeList);
		
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
			System.out.println("goEmpContentForm catch!! => " + ex);
		}
		
		mav.setViewName("empContentForm.jsp");
		mav.addObject("empContent", employeeContent);
		
		return mav;
	}
	
	@RequestMapping(value="/empUpDelForm.do")
	public ModelAndView goEmpUpDelForm(@RequestParam(value="emp_no") int emp_no) {
		ModelAndView mav = new ModelAndView();
		EmployeeDTO employeeContent = null;
		
		try {
			// 게시물 가져오기
			employeeContent = this.employeeService.getEmployeeContent(emp_no);
		} catch(Exception ex) {
			System.out.println("goEmpUpDelForm catch!! =>" + ex);
		}
		
		mav.setViewName("empUpDelForm.jsp");
		mav.addObject("empContent", employeeContent);
		
		return mav;
	}

	
}
