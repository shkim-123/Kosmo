package com.naver.erp;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class BoardValidator implements  Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return BoardDTO.class.isAssignableFrom(arg0);
	}
	
	@Override
	public void validate(Object obj, Errors errors) {
		try {
			
			BoardDTO dto = (BoardDTO)obj;
			
			// 작성자명 공백 체크
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "writer", "작성자명을 입력해 주세요.");
			
			// 작성자명 10자 초과 시
			String writer = dto.getWriter();
			if(writer!=null && writer.length() > 10) {
				errors.rejectValue("writer", "작성자명은 10자 이하로 입력해 주세요.");
			}
			
			// 제목 공백 체크
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "제목을 입력해 주세요.");
			
			// 제목 20자 초과 시
			String subject = dto.getSubject();
			if(subject!=null && subject.length()>20) {
				errors.rejectValue("subject", "제목은 20자 이하로 입력해 주세요.");
			}
			
			// 이메일 공백 체크
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "이메일을 입력해 주세요.");
			
			// 내용 공백 체크
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "내용을 입력해 주세요.");
			
			// 내용 300자 초과 시
			String content = dto.getContent();
			if(content!=null && content.length()>300) {
				errors.rejectValue("content", "내용은 300자 이하로 입력해 주세요.");
			}
			
			// 암호 공백 체크
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "비밀번호를 입력해 주세요.");
			
			// 암호 유효성 체크
			String pwd = dto.getPwd();
			if(pwd!=null && !Pattern.matches("^[0-9]{4}$", pwd)) {
				errors.rejectValue("pwd", "암호는 숫자 4자리로만 입력해 주세요.");
			}
			
		} catch(Exception ex) {
			System.out.println("BoardValidator catch!!!! => " + ex);
		}
	}
	
}
