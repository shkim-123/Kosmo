<%@page import="com.naver.erp.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>

	// 목록으로 버튼 눌렀을 경우
	function goBoardList(){
		//if(!confirm("목록으로 이동하시겠습니까?")){return;}

		location.replace("/boardList.do");
	}

	// 수정/삭제 버튼 눌렀을 경우
	function goBoardUpDelForm(){
		// location.replace("/boardUpDelForm.do");
		document.boardContentForm.submit();
	}

	// 댓글쓰기 버튼 눌렀을 경우
	function goBoardReplyForm(){
		document.boardReplyForm.submit();
		// location.replace("/boardReplyForm.do");
	}
	


</script>


</head>

<body>

<center>
	
	<%
		BoardDTO boardDTO = (BoardDTO)request.getAttribute("getBoard");
		
		if(boardDTO != null){
			int b_no = boardDTO.getB_no();
			String subject = boardDTO.getSubject();
			String writer = boardDTO.getWriter();
			String content = boardDTO.getContent();
			String email = boardDTO.getEmail();
			String reg_date = boardDTO.getReg_date();
			int readcount = boardDTO.getReadcount();
	%>
	
	<form name="boardContentForm" method="post" action="/boardUpDelForm.do">
		<table border="1">
			<caption>[게시글 보기]</caption>
			<tr>
				<th>번호</th>
				<td><%=b_no%></td>
				<th>조회수</th>
				<td><%=readcount%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<%=writer%>
				</td>
				<th>이메일</th>
				<td>
					<%=email%>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<%=subject%>
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td colspan="3">
					<%=reg_date%>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea cols="50" rows="10" name="content" readonly><%=content%></textarea>
				</td>
			</tr>			
		</table>
		
		<br>
		
		<input type="hidden" name="b_no" value="<%=b_no%>">
		
		<input type="button" value="댓글쓰기" onClick="goBoardReplyForm();">
		<input type="button" value="수정/삭제하기" onClick="goBoardUpDelForm();">
		<input type="button" value="목록으로" onClick="goBoardList();">
		
	</form>
	
	<form name="boardReplyForm" method="post" action="/boardReplyForm.do">
		<input type="hidden" name="b_no" value="<%=b_no%>"> 
	</form>
	
	<% 
		} else {
			out.print("<script>alert('이미 삭제된 글입니다'); goBoardList();</script>");
		}
	%>

</center>


</body>

</html>