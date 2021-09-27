package com.sohee.erp;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.sohee.erp.dto.LoginDTO;
import com.sohee.erp.dto.StaffDTO;

import java.util.List;
import java.util.regex.Pattern;


public class LoginValidator implements Validator {

	//----------------------------------------------------------------
	//  유효성 체크할 객체의 클래스 타입 정보 얻어 리턴하기
	//----------------------------------------------------------------
	@Override
	public boolean supports(Class<?> arg0) {
		return LoginDTO.class.isAssignableFrom(arg0);  // 검증할 객체의 클래스 타입 정보
	}

	//----------------------------------------------------------------
	//  유효성 체크할 메소드 선언하기
	//----------------------------------------------------------------
	@Override
	public void validate(
		Object obj          // DTO 객체 저장 매개변수
		, Errors errors     // 유효성 검사 시 발생하는 에러를 관리하는 Errors 객체 저장 매개변수
	){
		try {
			//----------------------------------------------------------------
			// 유효성 체크할 DTO 객체 얻기
			//----------------------------------------------------------------
			LoginDTO dto = (LoginDTO)obj;

			// 로그인 아이디 확인
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login_id", "아이디를 입력해 주세요.");
			String login_id = dto.getLogin_id();
			if(login_id != null && !Pattern.matches("^(\\w|_){3,20}$", login_id)) {
				errors.rejectValue("login_id", "아이디는 영대소문자, 숫자 3자 이상 20자 이하입니다. 특수문자는 _만 가능합니다.");
			}
			
			// 비밀번호 확인
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "비밀번호를 입력해 주세요.");
			String pwd = dto.getPwd();
			if(pwd != null && !Pattern.matches("^(\\w|_){3,20}$", pwd)) {
				errors.rejectValue("pwd", "비밀번호는 영대소문자, 숫자 3자 이상 20자 이하입니다. 특수문자는 _만 가능합니다.");
			}
			
		}catch(Exception ex) {
			System.out.println( "LoginValidator.validate 메소드 실행 시 예외발생!" + ex.getMessage() );
		}
	}
    
}
