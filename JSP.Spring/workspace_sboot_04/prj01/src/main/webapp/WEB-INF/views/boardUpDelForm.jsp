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

	function checkBoardUpDelForm(upDel){
		
		var boardUpDelFrom = $("[name='boardUpDelForm']");

		boardUpDelFrom.find("[name='upDel']").val(upDel);

		//----------------------------------------------------------------
		// 매개변수로 들어온 upDel 에 "up"이 저장되었으면
		// 즉, 수정 버튼을 눌렀으면 각 입력양식의 유효성 체크하고 수정 여부 물어보기
		//----------------------------------------------------------------
		if(upDel == "up"){

			if(!confirm("정말 수정하시겠습니까?")) { return; }

			// 비동기 통신
			$.ajax({
				url: "/boardUpDelProc.do" 
				, type: "post"
				, data: boardUpDelFrom.serialize()
				, success: function(responseHtml) {
					console.log(responseHtml);
	
					var boardUpCnt = $(responseHtml).filter(".boardUpCnt").text();
					var msg = $(responseHtml).filter(".msg").text();
					boardUpCnt = parseInt(boardUpCnt, 10);

					// 1인 경우 업데이트 성공
					if( boardUpCnt == 1 ){
						alert("업데이트 성공!");
						location.replace("/boardList.do");
					}
					// -1인 경우 암호 불일치 
					else if(boardUpCnt == -1) {
						alert("암호가 일치하지 않습니다.");
						$(".pwd").val("");
						$(".pwd").focus();
					}
					// -3인 경우 게시글 삭제됨 
					else if(boardUpCnt == -3) {
						alert("원 게시글이 삭제되었습니다.");
						location.replace("/boardList.do");
					}
					// -4인 경우 유효성 체크 통과 못함
					else if(boardUpCnt == -4){
						alert(msg);
					}
						
				}
				, error: function() {
					alert("서버 통신 실패!");
				}
			});
				
		} 
		//----------------------------------------------------------------
		// 삭제인 경우
		//----------------------------------------------------------------
		else if(upDel == "del") {
			if(!confirm("정말 삭제하시겠습니까?")){ return; }

			// 비동기 통신
			$.ajax({
				url: "/boardUpDelProc.do" 
				, type: "post"
				, data: boardUpDelFrom.serialize()
				, success: function(responseHtml){
					console.log(responseHtml);

					var boardDelCnt = $(responseHtml).filter(".boardDelCnt").text();
					boardDelCnt = parseInt(boardDelCnt, 10);

					// 1인 경우 삭제 성공!
					if(boardDelCnt == 1){
						alert("삭제 성공!");
						location.replace("/boardList.do");
					} 
					// -1인 경우 암호 불일치 
					else if(boardDelCnt == -1){
						alert("암호가 일치하지 않습니다.");
						$(".pwd").val("");
						$(".pwd").focus();
					}
					// -3인 경우 게시글 삭제됨 
					else if(boardDelCnt == -3){
						alert("원 게시글이 삭제되었습니다.");
						location.replace("/boardList.do");
					}
						
				}
				, error: function() {
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
		BoardDTO boardDTO = (BoardDTO)request.getAttribute("board");
	
		int b_no = 0;
		
		
		//----------------------------------------------------------------
		// boardDTO가 null이 아닐때 
		//----------------------------------------------------------------
		if(boardDTO != null) {
			b_no = boardDTO.getB_no();
			String subject = boardDTO.getSubject();
			String content = boardDTO.getContent();
			String writer = boardDTO.getWriter();
			String reg_date = boardDTO.getReg_date();
			int readcount = boardDTO.getReadcount();
			String email = boardDTO.getEmail();
		
	%>
	
	<!-- ************************************************************* -->
	<!-- [게시글 수정/삭제] 화면을 출력하는 form 태그 선언 -->	
	<!-- ************************************************************* -->
	<form name="boardUpDelForm" method="post" action="/boardUpDelProc.do">
		<table border="1">
			<caption><b>[게시글 수정/삭제]</b></caption>
			<tr>
				<th bgcolor="lightgray">이름</th>
				<td>
					<!-- ************************************************************* -->
					<input type="text" size="10" name="writer" class="writer" maxlength="10" value="<%=writer%>">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th bgcolor="lightgray">제목</th>
				<td>
					<!-- ************************************************************* -->
					<input type="text" size="40" name="subject" class="subject" maxlength="30" value="<%=subject%>">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th bgcolor="lightgray">이메일</th>
				<td>
					<!-- ************************************************************* -->
					<input type="text" size="40" name="email" class="email" maxlength="30" value="<%=email%>">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th bgcolor="lightgray">내용</th>
				<td>
					<!-- ************************************************************* -->
					<textarea name="content" class="content" rows="13" cols="40"><%=content%></textarea>
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th bgcolor="lightgray">비밀번호</th>
				<td>
					<!-- ************************************************************* -->
					<input type="password" size="8" name="pwd" class="pwd" maxlength="4">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			
		</table>
		
		<div style="height:6px"></div>
		
		<input type="hidden" name="b_no" value="<%=b_no%>">
		
		<input type="hidden" name="upDel">
		
		<input type="button" value="수정하기" onClick="checkBoardUpDelForm('up')">
		<input type="button" value="삭제하기" onClick="checkBoardUpDelForm('del')">
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기" onClick="goBoardList();">
	
	</form>
		
		<% 
			// if문 블록 닫기 
			} 
			// boardDTO 가 null 일 때
			else {
				out.print("<script>alert('삭제된 글입니다.'); goBoardList();</script>");
			}
		%>

</center>

</body>
</html>