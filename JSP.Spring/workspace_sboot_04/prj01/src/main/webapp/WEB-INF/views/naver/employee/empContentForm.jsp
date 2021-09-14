<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<!-- ************************************************************* -->
<%@include file="../common.jsp" %>

<style>
th {
	background-color: ${thBgcolor};
}
</style>

<script>

	$(document).ready(function(){
		$(".goListBtn").click(function(){
			location.replace("/${requestScope.naverPath}employeeList.do");
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
		<table border="1" cellpadding="3" width="450" class="tbcss2">
			<caption><b>[글 상세 보기]</b></caption>
			
			<tr>
				<th width="70">직원번호</th>
				<td width="130">${empContent.emp_no}</td>
				<th width="70">직원명</th>
				<td width="130">${empContent.emp_name}</td>
			</tr>
			<tr>	
				<th>부서번호</th>
				<td>${empContent.dep_no}</td>
				<th>부서명</th>
				<td>${empContent.dep_name}</td>
			</tr>
			<tr>	
				<th>직급</th>
				<td>${empContent.jikup}</td>
				<th>연봉</th>
				<td>${empContent.salary}</td>
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
				<td colspan="3">${empContent.phone}</td>
			</tr>
			<tr>
				<th>상사번호</th>
				<c:if test="${empContent.mgr_emp_no==0}">
					<td>없음</td>
				</c:if>
				<c:if test="${empContent.mgr_emp_no!=0}">
					<td>${empContent.mgr_emp_no}</td>
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
			location.replace("/${requestScope.naverPath}employeeList.do");
		</script>
	</c:if>
	
	<form name="goUpDelForm" method="post" action="/${requestScope.naverPath}empUpDelForm.do">
		<input type="hidden" name="emp_no" value="${empContent.emp_no}">
	</form>
	
	
	
	
</center>

</body>
</html>