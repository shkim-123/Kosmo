package com.sohee.erp;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.sohee.erp.dto.StaffDTO;

import java.util.List;
import java.util.regex.Pattern;


public class StaffValidator implements Validator {

	//----------------------------------------------------------------
	//  유효성 체크할 객체의 클래스 타입 정보 얻어 리턴하기
	//----------------------------------------------------------------
	@Override
	public boolean supports(Class<?> arg0) {
		return StaffDTO.class.isAssignableFrom(arg0);  // 검증할 객체의 클래스 타입 정보
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
			StaffDTO dto = (StaffDTO)obj;

			
			// 이름 확인
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "staff_name", "이름을 입력해 주세요.");
			
			String staff_name = dto.getStaff_name();
			if(staff_name != null && staff_name.length() > 10) {
				errors.rejectValue("staff_name", "이름은 공백없이 10자이하 입니다.");
			}
			
			// 주민번호 확인
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "jumin_num", "주민번호를 입력해 주세요.");
			String jumin_num = dto.getJumin_num();
			if(jumin_num != null && !Pattern.matches("^[0-9]{13}$", jumin_num) ) {
				errors.rejectValue("jumin_num", "주민번호는 숫자 13자 입니다.");
			}
			
			// 종교 확인
			int religion_code = dto.getReligion_code();
			if(religion_code <= 0) {
				errors.rejectValue("religion_code", "종교를 선택해 주세요.");
			}
			
			// 학력 확인
			int school_code = dto.getSchool_code();
			if(school_code <= 0) {
				errors.rejectValue("school_code", "학력을 선택해 주세요.");
			}
			
			// 스킬 확인
			List<Integer> skill_code = dto.getSkill_code();
			if(skill_code.size() <= 0) {
				errors.rejectValue("skill_code", "스킬을 선택해 주세요.");
			}
			
			// 졸업일 확인
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "graduate_day", "졸업일을 선택해 주세요.");
			String graduate_day = dto.getGraduate_day();
			
			// 주민번호로 출생연월일 구하기
			String birth = "";
			String xxx = jumin_num.substring(6, 7);
			
			if(xxx.equals("1") || xxx.equals("2") ) {
				birth = "19";
			} else {
				birth = "20";
			}
			
			birth += jumin_num.substring(0, 6);
			
			// 졸업일이 주민번호보다 전일 경우
			if(graduate_day != null && Integer.parseInt(graduate_day) < Integer.parseInt(birth)) {
				errors.rejectValue("graduate_day", "졸업일이 출생년도 전입니다. 다시 선택해 주세요.");
			}
			
		}catch(Exception ex) {
			System.out.println( "StaffValidator.validate 메소드 실행 시 예외발생!" + ex.getMessage() );
		}
	}
    
}
