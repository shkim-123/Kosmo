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
	
</script>

</head>
<body>

<div class="empRegResult">

	<center>
		
		<form name="empRegForm">
			<table border="1" cellpadding="7" class="tbcss2" width="400">
				<caption><b>[직원정보 등록]</b></caption>
				
				<tr>
					<th>직원명</th>
					<td>
						<input type="text" name="emp_name" class="emp_name">
					</td>
				</tr>
				<tr>	
					<th>부서번호</th>
					<td>
						<select name="dep_no" class="dep_no">
							<!-- 부서번호 꺼내기 -->
							<c:forEach var ="dept" items="${deptList}">
								<option value="${dept.dep_no}">${dept.dep_no}</option>
							</c:forEach>	
						</select>
						<span class="dep_name">${deptList.get(0).dep_name}</span>
					</td>
				</tr>
<%-- 				<tr>
					<th>부서명</th>
					<td><span class="dep_name">${deptList.get(0).dep_name}</span></td>
				</tr> --%>
				<tr>	
					<th>직급</th>
					<td>
						<select name="jikup" class="jikup">
							<!-- 직급 꺼내기 -->
							<c:forEach var="jikup" items="${jikupList}">
								<option value="${jikup}">${jikup}</option>
							</c:forEach>
						</select>
					</td>
				</tr>	
				<tr>
					<th>연봉</th>
					<td>
						<input type="text" name="salary" class="salary">
					</td>
				</tr>		
				<tr>	
					<th>입사일</th>
					<td>
						<input type="text" name="hire_date" class="hire_date">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin_num" class="jumin_num"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" class="phone">
					</td>
				</tr>
				<tr>
					<th>상사번호</th>
					<td>
						<select name="mgr_emp_no" class="mgr_emp_no">
							<!-- 직원번호 꺼내기 -->
							<c:forEach var="empNoName" items="${empNoNameList}">
								<option value="${empNoName.emp_no}">${empNoName.emp_no}</option>
							</c:forEach>
						</select>
						<span class="mgr_emp_name">${empNoNameList.get(0).emp_name}</span>
						<input type="checkbox" class="mgr_emp_no_chkbox">없음
					</td>
				</tr>
<%-- 				<tr>
					<th>상사이름</th>
					<td><span class="mgr_emp_name">${empNoNameList.get(0).emp_name}</span></td>
				</tr> --%>
				<tr>
					<th>이미지</th>
					<td>
						<input type="file" name="img" class="img">
					</td>
				</tr>
				
			</table>
						
			<br>
				
			<input type="button" value="등록하기" class="empRegFormBtn">&nbsp;
			<input type="reset" value="초기화">
		</form>
		
		
		
	</center>

</div>

</body>
</html>