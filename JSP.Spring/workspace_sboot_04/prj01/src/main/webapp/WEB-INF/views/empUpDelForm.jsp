<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ************************************************************* -->
<!-- 현재 JSP 페이지에서 사용할 클래스 수입하기 -->
<!-- ************************************************************* -->
<%@page import="com.naver.erp.BoardDTO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<!-- ************************************************************* -->
<%@include file="common.jsp" %>

<style>
	th {
		background-color: lightgray;
	}
</style>

<script>

	$(document).ready(function(){

		$(".dep_no").val("${empContent.dep_no}").prop("selected", true);
		$(".jikup").val("${empContent.jikup}").prop("selected", true);

		$(".goListBtn").click(function(){
			location.replace("/employeeList.do");
		});

		$(".goUpDelFormBtn").click(function(){
			document.goUpDelForm.submit();
		});
	});

	
	
</script>

</head>
<body>

<center>

	<!-- ------------------------------------------------------------- -->
	<!-- empty : EL의 연산자, 오른쪽에 나온 데이터가 null값이면 true를 리턴 -->
	<!-- ------------------------------------------------------------- -->
	<c:if test="${!empty requestScope.empContent}">
		<table border="1" cellpadding="3" width="500">
			<caption><b>[글 상세 보기]</b></caption>
			
			<tr>
				<th width="70">직원번호</th>
				<td width="130">${empContent.emp_no}</td>
				<th width="70">직원명</th>
				<td width="130">
					<input type="text" name="emp_name" value="${empContent.emp_name}">
				</td>
			</tr>
			<tr>	
				<th>부서번호</th>
				<td>
					<select name="dep_no" class="dep_no">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="40">40</option>
					</select>
				</td>
				<th>부서명</th>
				<td>${empContent.dep_name}</td>
			</tr>
			<tr>	
				<th>직급</th>
				<td>
					<select name="jikup" class="jikup">
						<option value="사장">사장</option>
						<option value="부장">부장</option>
						<option value="과장">과장</option>
						<option value="대리">대리</option>
						<option value="주임">주임</option>
						<option value="사원">사원</option>
					</select>
				</td>
				<th>연봉</th>
				<td>
					<input type="text" name="salary" value="${empContent.salary}">
				</td>
			</tr>			
			<tr>	
				<th>입사일</th>
				<td colspan="3">${empContent.hire_date}</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td colspan="3">${empContent.jumin_num}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="3">
					<input type="text" name="phone" value="${empContent.phone}">
				</td>
			</tr>
			<tr>
				<th>상사번호</th>
				<c:if test="${empContent.mgr_emp_no==0}">
					<td>
						<input type="text" name="phone" value="없음">
					</td>
				</c:if>
				<c:if test="${empContent.mgr_emp_no!=0}">
					<td>
						<input type="text" name="phone" value="${empContent.mgr_emp_no}">
					</td>
				</c:if>
				<th>상사이름</th>
				<c:if test="${empContent.mgr_emp_no==0}">
					<td>-</td>
				</c:if>
				<c:if test="${empContent.mgr_emp_no!=0}">
					<td>${empContent.mgr_emp_name}</td>
				</c:if>
			</tr>
			
			
			
		</table>
				
		<br>
		
		<input type="button" value="수정/삭제" class="goUpDelFormBtn">&nbsp;
		<input type="button" value="목록보기" class="goListBtn">
	</c:if>
	
	
	<c:if test="${empty requestScope.empContent}">
		<script>
			alert('삭제된 글입니다.'); 
			location.replace("/employeeList.do");
		</script>
	</c:if>
	
	<form name="goUpDelForm" method="post" action="/empUpDelForm.do">
		<input type="hidden" name="emp_no" value="${empContent.emp_no}">
	</form>
	
	
	
	
</center>

</body>
</html>