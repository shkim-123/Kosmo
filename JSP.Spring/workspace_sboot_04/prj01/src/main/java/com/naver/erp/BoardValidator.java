package com.naver.erp;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.naver.erp.dto.BoardDTO;

import java.util.regex.Pattern;


//----------------------------------------------------------------
// BoardDTO 객체에 저장된 데이터의 유효성 체크할 BoardValidator 클래스 선언하기
//----------------------------------------------------------------
public class BoardValidator implements Validator {

	//----------------------------------------------------------------
	//  유효성 체크할 객체의 클래스 타입 정보 얻어 리턴하기
	//----------------------------------------------------------------
	@Override
	public boolean supports(Class<?> arg0) {
		return BoardDTO.class.isAssignableFrom(arg0);  // 검증할 객체의 클래스 타입 정보
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
			BoardDTO dto = (BoardDTO)obj;

			//        String sWriter = dto.getWriter();
			//        if(sWriter == null || sWriter.trim().isEmpty()) {
			//            System.out.println("Writer is null or empty");
			//            errors.rejectValue("writer", "trouble");
			//        }

			//----------------------------------------------------------------
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			// BoardDTO 객체의 속성변수명 writer 이 비거나 공백으로 구성되어 있으면
			// 경고 메시지를 Errors 객체에 저장하기
			//----------------------------------------------------------------
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                       // Errors 객체
				, "writer"                   // BoardDTO 객체의 속성변수명
				, "작성자명 입력요망"         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			
			// ValidationUtils.rejectIfEmpty(errors, null, null);
			
			//----------------------------------------------------------------
			// BoardDTO 객체의 속성변수명 "writer" 저장된 데이터의 길이가 10자 보다 크면
			// Errors 객체에 속성변수명 "writer" 과 경고 메시지 저장하기
			//----------------------------------------------------------------
			// writer가 null 이면 String 객체 생성이 되지 않은 것이다.
			// String 객체 생성이 되지 않은 상태에서 length 메소드를 호출할 수 없다. (에러)
			// && 연산자는 false가 나오면 뒤에 나오는 연산을 실행하지 않는다.
			//----------------------------------------------------------------
			String writer = dto.getWriter();
			if( writer!=null && writer.length() > 10) {
				errors.rejectValue("writer", "작성자명은 공백없이 10자이하 입니다.");
			}

			//----------------------------------------------------------------
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			// BoardDTO 객체의 속성변수명 subject 이 비거나 공백으로 구성되어 있으면
			// 경고 메시지를 Errors 객체에 저장하기
			//----------------------------------------------------------------
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                       // Errors 객체
				, "subject"                   // BoardDTO 객체의 속성변수명
				, "제목 입력요망"         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			
			//----------------------------------------------------------------
			// BoardDTO 객체의 속성변수명 "subject" 저장된 데이터의 길이가 20자 보다 크면
			// Errors 객체에 속성변수명 "subject" 과 경고 메시지 저장하기
			//----------------------------------------------------------------
			String subject = dto.getSubject();
			if( subject!=null && subject.length() > 20) {
				errors.rejectValue("subject", "제목은 20자이하 입니다.");
			}
			
			//----------------------------------------------------------------
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			// BoardDTO 객체의 속성변수명 email 이 비거나 공백으로 구성되어 있으면
			// 경고 메시지를 Errors 객체에 저장하기
			//----------------------------------------------------------------
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                       // Errors 객체
				, "email"                   // BoardDTO 객체의 속성변수명
				, "이메일 입력요망"         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);

			//----------------------------------------------------------------
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			// BoardDTO 객체의 속성변수명 content 이 비거나 공백으로 구성되어 있으면
			// 경고 메시지를 Errors 객체에 저장하기
			//----------------------------------------------------------------
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                    // Errors 객체
				, "content"                 // BoardDTO 객체의 속성변수명
				, "내용 입력요망"         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			
			//----------------------------------------------------------------
			// BoardDTO 객체의 속성변수명 "content" 저장된 데이터의 길이가 300자 보다 크면
			// Errors 객체에 속성변수명 "content" 과 경고 메시지 저장하기
			//----------------------------------------------------------------
			String content = dto.getContent();
			if( content!=null && content.length() > 300) {
				errors.rejectValue("content", "내용은 공백없이 300자이하 입니다.");
			}

			//----------------------------------------------------------------
			// ValidationUtils 클래스의 rejectIfEmptyOrWhitespace 메소드 호출하여
			// BoardDTO 객체의 속성변수명 pwd 이 비거나 공백으로 구성되어 있으면
			// 경고 메시지를 Errors 객체에 저장하기
			//----------------------------------------------------------------
			ValidationUtils.rejectIfEmptyOrWhitespace(
				errors                    // Errors 객체
				, "pwd"                 // BoardDTO 객체의 속성변수명
				, "암호 입력요망"         // BoardDTO 객체의 속성변수명이 비거나 공백으로 구성되어 있을때 경고 문구
			);
			
			//----------------------------------------------------------------
			// BoardDTO 객체의 속성변수명 "pwd" 저장된 데이터가 숫자로 4자리가 아니면
			// Errors 객체에 속성변수명 "pwd" 과 경고 메시지 저장하기
			//----------------------------------------------------------------
			String pwd = dto.getPwd();
			if( pwd!=null && !Pattern.matches("^[0-9]{4}$", pwd) ) {
				errors.rejectValue("pwd", "암호는 숫자 4자리 입니다. 재입력 요망");
			}

		}catch(Exception ex) {
			System.out.println( "BoardValidator.validate 메소드 실행 시 예외발생!" );
		}
	}
    
}
