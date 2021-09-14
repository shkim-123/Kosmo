<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@page import="com.naver.erp.dto.BoardDTO"%>
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
		//----------------------------------------------------------------
		// val() 문자열 데이터를 넣어줘야 한다.
		// 즉, EL로 표현된 데이터가 자스안에 문자열로 들어간다면 꼭 "" 을 붙여야 한다.
		// EL은 데이터를 표현만 해서 자동으로 "" 가 붙지 않는다.
		// $(".writer").val(${requestScope.board.writer});
		// => $(".writer").val(홍길동); 과 같이 들어간 것과 같아서 에러가 난다.
		//----------------------------------------------------------------
		$(".writer").val("${requestScope.board.writer}");
		$(".pwd").val("1234");
	});

	function goBoardList(){
		location.replace('/${requestScope.naverPath}boardList.do');
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
		
		//--------------------------------------------------------------
		// form 태그에 파일업로드 전송 관련 설정하기
		//--------------------------------------------------------------
		document.boardUpDelForm.enctype="multipart/form-data";
		
		//----------------------------------------------------------------
		// 현재 화면에서 페이지 이동 없이 서버쪽 "/boardUpDelProc.do"로 접속해서 수정 또는 삭제하기 
		//----------------------------------------------------------------
		$.ajax({
			//----------------------------------------------------------------
			// 서버 쪽 호출 URL 주소 지정
			//----------------------------------------------------------------
			url: "/${requestScope.naverPath}boardUpDelProc.do" 
			//----------------------------------------------------------------
			// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
			//----------------------------------------------------------------
			, type: "post"

			//--------------------------------------------------------------
			// 파일 업로드를 위한 설정
			//--------------------------------------------------------------
			// 서버로 보내는 데이터에 파일이 있으므로
			// 전송하는 파라미터명, 파라미터값을 serialize를 하여 Query String으로 변경하지 않게 설정하기
			// 서버로 보내는 데이터에 파일이 없으면 processData: false 를 생략한다.
			//--------------------------------------------------------------
			, processData : false
			//--------------------------------------------------------------
			// 서버로 보내는 데이터에 파일이 있으므로
			// 현재 form 태그에 설정된 enctype 속성값을 Content-Type 으로 사용하도록 설정하기
			// 이게 없으면 현재 form 태그에 설정된 enctype 속성값과 관계없이 무조건 enctype 이 application/x-www-form-urlencoded 로 설정된다.
			// 서버로 보내는 데이터에 파일이 없으면, contentType: false 를 생략한다.
			//--------------------------------------------------------------
			, contentType : false
			//--------------------------------------------------------------
			// 서버로 보내는 데이터 설정하기
			// 서버로 보내는 데이터에 파일이 있으므로 FormData 객체 설정
			//--------------------------------------------------------------
			, data : new FormData( $("[name='boardUpDelForm']").get(0) )

			//----------------------------------------------------------------
			// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
			// 익명함수의 매개변수에는 서버가 보내온 Map<String, String> 객체가 JSON객체로 바뀌어 들어온다.
			//----------------------------------------------------------------
			, success: function(json) {

				//----------------------------------------------------------------
				// JSON 객체에서 유효성 체크 문자열 꺼내기
				// JSON 객체에서 수정/삭제 성공 행의 개수 꺼내기
				//----------------------------------------------------------------
				var msg = json.msg;
				var boardUpDelCnt = json.boardUpDelCnt;
				
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
						location.replace("/${requestScope.naverPath}boardList.do");
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
							location.replace("/${requestScope.naverPath}boardList.do");
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
						location.replace("/${requestScope.naverPath}boardList.do");
					} else if( boardUpDelCnt == -1 ){
						alert("게시판 글이 삭제되었습니다.");
						location.replace("/${requestScope.naverPath}boardList.do");
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

	<c:if test="${!empty requestScope.board}">
	
		<!-- ************************************************************* -->
		<!-- [게시글 수정/삭제] 화면을 출력하는 form 태그 선언 -->	
		<!-- ************************************************************* -->
		<form name="boardUpDelForm">
		
			<!-- ************************************************************* -->
			<!-- b_no, upDel value 값을 가진 type="hidden" input 태그 선언 -->
			<!-- ************************************************************* -->
			<input type="hidden" name="b_no" value="${requestScope.board.b_no}">
			<input type="hidden" name="upDel">
			<!-- ************************************************************* -->
		
			<table border="1" class="tbcss2" cellpadding="5">
				<caption><b>[게시글 수정/삭제]</b></caption>
				<tr>
					<th>이름</th>
					<td>
						<!-- ************************************************************* -->
						<%-- <input type="text" size="10" name="writer" class="writer" maxlength="10" value="${requestScope.board.writer}"> --%>
						<input type="text" size="10" name="writer" class="writer" maxlength="10">
						<!-- ************************************************************* -->
					</td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td>
						<!-- ************************************************************* -->
						<input type="text" size="40" name="subject" class="subject" maxlength="30" value="${requestScope.board.subject}">
						<!-- ************************************************************* -->
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						<!-- ************************************************************* -->
						<input type="text" size="40" name="email" class="email" maxlength="30" value="${requestScope.board.email}">
						<!-- ************************************************************* -->
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<!-- ************************************************************* -->
						<textarea name="content" class="content" rows="13" cols="40">${requestScope.board.content}</textarea>
						<!-- ************************************************************* -->
					</td>
				</tr>
				
				<tr>
					<th>이미지</th>
					<td colspan="3">
						<!-- ************************************************************* -->
						<input type="file" name="img" class="img">
						<!-- ************************************************************* -->
						<c:if test="${!empty requestScope.board.pic}">
							<div style="height:7px"></div>
							<img src="/resources/img/${requestScope.board.pic}" width="300px">
							<input type="checkbox" name="is_del" class="is_del" value="yes">삭제
						</c:if>
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
	
	</c:if>
		
	<c:if test="${empty requestScope.board}">
		<script>
			alert('삭제된 글입니다.'); 
			goBoardList();
		</script>
	</c:if>

</center>

</body>
</html>