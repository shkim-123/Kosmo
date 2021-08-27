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

<style>
	th {
		background-color: lightgray;
	}
</style>

<!-- JQuery 삽입 -->
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>

	$(document).ready(function(){
		
	});

	function goBoardList(){
		location.replace('/boardList.do');
	}

	function checkBoardUpDelForm(upDel){
		
		//----------------------------------------------------------------
		// 변수 boardUpDelFrom 선언, name="boardUpDelForm" 을 가진 태그의 JQuery 객체 생성 후 메위주 저장
		// name="boardUpDelForm" 후손 중 name="upDel" 을 가진 태그의 value값을 upDel 데이터로 넣어주기
		//----------------------------------------------------------------
		var boardUpDelFrom = $("[name='boardUpDelForm']");
		boardUpDelFrom.find("[name='upDel']").val(upDel);

		//----------------------------------------------------------------
		// 매개변수로 들어온 upDel 에 "up"이 저장되었으면
		// 즉, 수정 버튼을 눌렀으면 수정 여부 물어보기
		//----------------------------------------------------------------
		if(upDel == "up"){
			if(!confirm("정말 수정하시겠습니까?")) { return; }
		}
		//----------------------------------------------------------------
		// upDel 에 "del"이 저장되었으면 즉, 삭제 버튼을 눌렀으면 삭제 여부 물어보기
		//----------------------------------------------------------------
		else if(upDel == "del") {
			if(!confirm("정말 삭제하시겠습니까?")){ return; }
		}

		// alert(boardUpDelFrom.serialize());
		
		//----------------------------------------------------------------
		// 현재 화면에서 페이지 이동 없이 서버쪽 "/boardUpDelProc.do"로 접속해서 수정 또는 삭제하기 
		//----------------------------------------------------------------
		$.ajax({
			//----------------------------------------------------------------
			// 서버 쪽 호출 URL 주소 지정
			//----------------------------------------------------------------
			url: "/boardUpDelProc.do" 
			//----------------------------------------------------------------
			// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
			//----------------------------------------------------------------
			, type: "post"
			//----------------------------------------------------------------
			// 웹서버로 보낼 파라미터명과 파라미터값 지정
			//----------------------------------------------------------------
			, data: boardUpDelFrom.serialize()
			//----------------------------------------------------------------
			// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
			// 익명함수의 매개변수에는 서버가 보내온 html 소스가 문자열로 들어온다.
			// 즉, 응답메시지 안의 html 소스가 문자열로써 익명함수의 매개변수로 들어온다.
			// 응답메시지 안의 html 소스는 boardUpDelProc.jsp의 실행 결과물이다.
			//----------------------------------------------------------------
			, success: function(responseHtml) {
				console.log(responseHtml);

				//----------------------------------------------------------------
				// boardUpDelCnt 변수 선언, class="boardUpDelCnt" 태그의 데이터 저장
				// msg 변수 선언, class="msg" 태그의 데이터 저장
				//----------------------------------------------------------------
				var boardUpDelCnt = $(responseHtml).filter(".boardUpDelCnt").text();
				var msg = $(responseHtml).filter(".msg").text();
				
				//----------------------------------------------------------------
				// boardUpDelCnt 정수형으로 변환
				// msg 앞 뒤 공백 제거
				//----------------------------------------------------------------
				boardUpDelCnt = parseInt(boardUpDelCnt, 10);
				msg = $.trim(msg);

				//----------------------------------------------------------------
				// msg가 ""가 아니라면, alert으로 출력하고 함수 중단
				//----------------------------------------------------------------
				if( msg != "" ) {
					alert(msg);
					return;
				}

				//----------------------------------------------------------------
				// 수정인 경우
				//----------------------------------------------------------------
				if(upDel == "up") {

					//----------------------------------------------------------------
					// boardUpDelCnt의 데이터에 따라 처리 분기
					//----------------------------------------------------------------
					if( boardUpDelCnt == -1 ){
						alert("게시판 글이 삭제되었습니다.");
						location.replace("/boardList.do");
					} else if( boardUpDelCnt == -2 ){
						alert("암호가 일치하지 않습니다.");
						$(".pwd").val("");
						$(".pwd").focus();
					} else if( boardUpDelCnt == 1 ){
						alert("수정 성공");

						//----------------------------------------------------------------
						// 목록 화면 이동 여부 물어보기, true 인 경우 목록으로 이동
						//----------------------------------------------------------------
						if(confirm("목록 화면으로 이동할까요?")){
							location.replace("/boardList.do");
						}
						
					} else {
						alert("서버 에러 발생! 관리자에게 문의해 주세요.");
					}
				} 
				//----------------------------------------------------------------
				// 삭제인 경우
				//----------------------------------------------------------------
				else if(upDel == "del") {

					//----------------------------------------------------------------
					// boardUpDelCnt의 데이터에 따라 처리 분기
					//----------------------------------------------------------------
					if( boardUpDelCnt == 1 ) {
						alert("삭제 성공");
						location.replace("/boardList.do");
					} else if( boardUpDelCnt == -1 ){
						alert("게시판 글이 삭제되었습니다.");
						location.replace("/boardList.do");
					} else if( boardUpDelCnt == -2 ){
						alert("암호가 일치하지 않습니다.");
						$(".pwd").val("");
						$(".pwd").focus();
					} else if ( boardUpDelCnt == -3 ){
						alert("댓글이 있어 삭제가 불가능합니다.");
					} else {
						alert("서버 에러 발생! 관리자에게 문의해 주세요.");
					}
					
				}
						
			}
			//----------------------------------------------------------------
			// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			//----------------------------------------------------------------
			, error: function() {
				alert("서버 통신 실패!");
			}
		});
		
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
	<form name="boardUpDelForm">
	
		<!-- ************************************************************* -->
		<!-- b_no, upDel value 값을 가진 type="hidden" input 태그 선언 -->
		<!-- ************************************************************* -->
		<input type="hidden" name="b_no" value="<%=b_no%>">
		<input type="hidden" name="upDel">
		<!-- ************************************************************* -->
	
		<table border="1">
			<caption><b>[게시글 수정/삭제]</b></caption>
			<tr>
				<th>이름</th>
				<td>
					<!-- ************************************************************* -->
					<input type="text" size="10" name="writer" class="writer" maxlength="10" value="<%=writer%>">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<!-- ************************************************************* -->
					<input type="text" size="40" name="subject" class="subject" maxlength="30" value="<%=subject%>">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>
					<!-- ************************************************************* -->
					<input type="text" size="40" name="email" class="email" maxlength="30" value="<%=email%>">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<!-- ************************************************************* -->
					<textarea name="content" class="content" rows="13" cols="40"><%=content%></textarea>
					<!-- ************************************************************* -->
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<!-- ************************************************************* -->
					<input type="password" size="8" name="pwd" class="pwd" maxlength="4">
					<!-- ************************************************************* -->
				</td>
			</tr>
			
		</table>
		
		<div style="height:6px"></div>

		<!-- ************************************************************* -->
		<input type="button" value="수정하기" onClick="checkBoardUpDelForm('up')">
		<input type="button" value="삭제하기" onClick="checkBoardUpDelForm('del')">
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기" onClick="goBoardList();">
		<!-- ************************************************************* -->
	
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