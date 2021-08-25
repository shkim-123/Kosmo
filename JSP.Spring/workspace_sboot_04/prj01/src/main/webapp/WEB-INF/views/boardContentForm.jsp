<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@page import="com.naver.erp.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery 삽입 -->
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>

	$(document).ready(function(){
		
	});

	function goBoardList(){
		location.replace('/boardList.do');
	}

	function goReplyRegForm(){
		location.replace('/replyRegForm.do');
	}
	
</script>

</head>
<body>

<center>
	
	<table border="1">
		<caption>[게시글 보기]</caption>
		
		<% BoardDTO boardDTO = (BoardDTO)request.getAttribute("board"); %>
		
		<tr>
			<th>이름</th>
			<td><%out.print(boardDTO.getWriter());%></td>
		</tr>
		
		<tr>
			<th>조회수</th>
			<td><%out.print(boardDTO.getReadcount());%></td>
		</tr>		
		
		<tr>
			<th>제목</th>
			<td><%out.print(boardDTO.getSubject());%></td>
		</tr>
		
		<tr>
			<th>작성일</th>
			<td><%out.print(boardDTO.getReg_date());%></td>
		</tr>

		<tr>
			<th>이메일</th>
			<td><%out.print(boardDTO.getEmail());%></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><%out.print(boardDTO.getContent());%></td>
		</tr>
		
	</table>
	
	<br>
	
	<input type="button" value="댓글작성" onClick="goReplyRegForm()">
	<input type="button" value="목록보기" onClick="goBoardList()">
	
	
</center>

</body>
</html>