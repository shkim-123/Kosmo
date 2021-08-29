<%@page import="com.naver.erp.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정/삭제</title>
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>

	// 목록으로 버튼 눌렀을 경우
	function goBoardList(){
		//if(!confirm("목록으로 이동하시겠습니까?")){return;}

		location.replace("/boardList.do");
	}

	// 수정/삭제 버튼 눌렀을 경우
	function goBoardUpDelForm(upDel){
		if(upDel == "up" && !confirm("정말 수정하시겠습니까?")){return;}
		else if(upDel == "del" && !confirm("정말 삭제하시겠습니까?")){return;}

		$("[name='upDel']").val(upDel);
		
		
		if(upDel == "up"){

			// 비동기 통신
			$.ajax({
				url: "/boardUpDelProc.do"
				,type: "post"
				,data: $("[name='boardUpDelForm']").serialize()
				,success: function(responseHtml){

					var upDelCnt = $(responseHtml).filter(".upDelCnt").text();
					var msg = $(responseHtml).filter(".msg").text();
					upDelCnt = parseInt(upDelCnt, 10);
					msg = $.trim(msg);

					// 유효성 체크했는지 확인
					if(msg!=""){
						alert(msg);
						return;
					}

					// 리턴값에 따른 분기
					if(upDelCnt == 1){
						alert("게시물 수정 성공!");

						if(confirm("목록으로 이동하시겠습니까?")){
							location.replace("/boardList.do");
						} 
						
					} else if(upDelCnt == -1){
						alert("이미 삭제된 게시글 입니다.");
						location.replace("/boardList.do");
					} else if(upDelCnt == -2){
						alert("비밀번호가 일치하지 않습니다.");
						$(".pwd").val("");
						$(".pwd").focus();
					} else {
						alert("서버 에러! 관리자에게 문의해주세요.");
					}

				}
				,error: function(){
					alert("서버 통신 실패!");
				}
			});
			
		} else if(upDel == "del"){

			// 비동기 통신
			$.ajax({
				url: "/boardUpDelProc.do"
				,type: "post"
				,data: $("[name='boardUpDelForm']").serialize()
				,success: function(responseHtml){

					var upDelCnt = $(responseHtml).filter(".upDelCnt").text();
					upDelCnt = parseInt(upDelCnt, 10);

					if(upDelCnt == 1){
						alert("게시물 삭제 성공!");	
						location.replace("/boardList.do");
					} else if(upDelCnt == -1){
						alert("이미 삭제된 게시글 입니다.");
						location.replace("/boardList.do");
					} else if(upDelCnt == -2){
						alert("비밀번호가 일치하지 않습니다.");
						$(".pwd").val("");
						$(".pwd").focus();
					} else if(upDelCnt == -3){
						alert("댓글이 있어서 삭제가 불가능합니다.");
					} else {
						alert("서버 에러! 관리자에게 문의해주세요.");
					}
					
				}
				,error: function(){
					alert("서버 통신 실패!");
				}
			});
			
		}
					
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
	
	<form name="boardUpDelForm">
		<table border="1">
			<caption>[게시글 수정/삭제]</caption>
			<tr>
				<th>번호</th>
				<td><%=b_no%></td>
				<th>조회수</th>
				<td><%=readcount%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3">
					<input type="text" name="writer" size="30" value="<%=writer%>">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="subject" size="54" value="<%=subject%>">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">
					<input type="text" name="email" size="30" value="<%=email%>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea cols="50" rows="10" name="content"><%=content%></textarea>
				</td>
			</tr>			
			<tr>
				<th>비밀번호</th>
				<td colspan="3">
					<input type="password" name="pwd" size="10" maxlength="4">
				</td>
			</tr>
		</table>
		
		<br>
		
		<input type="hidden" name="b_no" value="<%=b_no%>">
		<input type="hidden" name="upDel">
		
		<input type="button" value="댓글쓰기" onClick="goBoardRegForm();">
		<input type="button" value="수정하기" onClick="goBoardUpDelForm('up');">
		<input type="button" value="삭제하기" onClick="goBoardUpDelForm('del');">
		<input type="button" value="목록으로" onClick="goBoardList();">
		
	</form>
	
	<% 
		} else {
			out.print("<script>alert('이미 삭제된 글입니다'); goBoardList();</script>");
		}
	%>

</center>


</body>

</html>