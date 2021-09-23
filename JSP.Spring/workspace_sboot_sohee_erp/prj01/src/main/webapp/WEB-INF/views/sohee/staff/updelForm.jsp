<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../common/common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>사원 정보 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body>

<center>

<div class="updelContainer">
	<h3>사원 정보 수정</h3>

	<form name="staffUpdelForm">
		<table class="tbcss1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="staff_name" class="staff_name form-control" maxlength="10"> 
				</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td>
					<input type="text" class="jumin_num1 form-control" maxlength="6"> - 
					<input type="password" class="jumin_num2 form-control" maxlength="7">
				</td>
			</tr>
			<tr>
				<th>종교</th>
				<td>
					<select name="religion_code" class="religion_code form-control">
						<!-- 종교 리스트 표현 -->
						<option disabled selected value="">종교를 선택해주세요</option>
						<c:forEach var="religionMap" items="${religionList}">
							<option value="${religionMap.religion_code}">${religionMap.religion_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>학력</th>
				<td>
					<!-- 학력 리스트 표현 -->
					<c:forEach var="schoolMap" items="${schoolList}">
						<input type="radio" name="school_code" class="school_code input-radio" value="${schoolMap.school_code}">${schoolMap.school_name}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>기술</th>
				<td>
					<!-- 기술 리스트 표현 -->
					<c:forEach var="skillMap" items="${skillList}">
						<input type="checkbox" name="skill_code" class="skill_code input-checkbox" value="${skillMap.skill_code}">${skillMap.skill_name}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>졸업일</th>
				<td>
					<!-- option 태그는 자스로 제어 -->
					<select class="graduate_day_year form-control">
					</select>
					<select class="graduate_day_month form-control">
					</select> 
					<select class="graduate_day_day form-control">
					</select> 
				</td>
			</tr>
		</table>
		
		<div style="height:12px;"></div>
		
		<!-- 히든 태그 영역 -->
		<input type="hidden" name="jumin_num" class="jumin_num">
		<input type="hidden" name="graduate_day" class="graduate_day">
		<input type="hidden" name="staff_no" class="staff_no">
		<input type="hidden" name="upDel" class="upDel">
		
		<div>
			<!-- 버튼 영역 -->
			<input type="button" class="upFormBtn btn" value="수정">	
			<input type="button" class="delFormBtn btn" value="삭제">	
		</div>
	</form>
	
</div>

</center>

</body>

</html>