<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@page import="com.sohee.erp.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ************************************************************* -->
<!-- JSP 페이지에서 사용할 [사용자 정의 태그]의 한 종류인 [JSTL의 C 코어 태그]를 사용하겠다는 선언 -->
<!-- ************************************************************* -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 
	JSTL이란? 
	=> 자카르타라는 단체에서 만든 [사용자 정의 태그]를 말한다.
	=> 자바 문법을 HTML과 같은 태그 형태로 표현한다.
	=> HTML과 같은 태그 형태로 표현하면 뒤에서 자바 문법으로 바뀌어 실행된다.
	=> JSTL 사용 장점
		- 태그 형태이므로 디자이너, 퍼블리셔, 초급 개발자가 접근이 쉽다.
		- 큰 에러가 아닌 이상 화면이 멈추지 않는다.
		- null 처리에 대해 관대하다. null에 대해 민감한 반응을 보이지 않는다.
	=> JSTL은 EL과 같이 쓰인다
-->

<!-- ************************************************************* -->
<!-- JSTL이란 커스텀 태그의 C코어 태그를 사용하여 HttpServletRequest 객체 키값-데이터 저장하기 -->
<!-- ************************************************************* -->
<c:set var="thBgcolor" value="#aebfbe" scope="request"/>
	<!-- 위 코드는 아래 자바 코드와 동일한 기능을 가진다. -->
	<%
		// request.setAttribute("thBgcolor", "#aebfbe") ;
	%>
	
<!-- body bgcolor -->
<c:set var="bodycolor" value="#f5f5f5" scope="request"/>

<!-- URL 경로 -->
<c:set var="soheePath" value="<%=Info.soheePath%>" scope="request"/>

<!-- 게시판 이미지 비율 -->
<c:set var="boardImgRate1" value="70%" scope="request"/>
<c:set var="boardImgRate1" value="300px" scope="request"/>

<!-- 테이블 cellpadding -->
<c:set var="cellpadding" value="5" scope="request"/>

<!-- 테이블 색상 지정 -->
<c:set var="headerTrColor" value="#aebfbe" scope="request"/>
<c:set var="oddTrColor" value="#ffffff" scope="request"/>
<c:set var="evenTrColor" value="#e0f2f1" scope="request"/>


