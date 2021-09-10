package com.naver.erp;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//----------------------------------------------------------------
// 개발자가 만든 SessionInterceptor 클래스를 [인터셉터]로 등록하기 위한 MvcConfiguration 클래스 선언하기
// 즉, 설정을 위한 클래스이다.
//----------------------------------------------------------------
@Configuration
public class MvcConfiguration implements WebMvcConfigurer{
	
	//----------------------------------------------------------------
	// SessionInterceptor 객체를 인터셉터로 등록하는 코딩이 내포된 addInterceptors 메소드를 오버라이딩한다.
	//----------------------------------------------------------------
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//----------------------------------------------------------------
		// InterceptorRegistry 객체의 addInterceptor 메소드를 호출하여 SessionInterceptor 객체를 인터셉터로 등록하고
		// excludePathPatterns 메소드를 호출하여 예외되는 URL 주소 패턴을 등록한다.
		//----------------------------------------------------------------
		registry.addInterceptor(new SessionInterceptor()).excludePathPatterns(
			"/loginForm.do"
			,"/loginProc.do"
			,"/logout.do"
			,"/login_alert.do"
			,"/memRegForm.do"
			,"/resources/**"
		);
		
	}
}
