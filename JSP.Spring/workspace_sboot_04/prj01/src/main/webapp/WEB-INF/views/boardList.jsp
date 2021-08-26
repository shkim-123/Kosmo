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
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- JQuery 삽입 -->
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<style>
	a {
		text-decoration:none;
	    display:block;
	    width:80px;
	    line-height:30px;
	    text-align:center;
	    background-color:#222;
	    color:#fff;
	}
</style>

<script>

	//--------------------------------------------------------------
	// [게시판 글쓰기 화면]으로 이동하는 함수 선언
	//--------------------------------------------------------------
	function goBoardRegForm(){
		location.replace("/boardRegForm.do");
	}

	//--------------------------------------------------------------
	// [게시판 상세보기 화면]으로 이동하는 함수 선언
	//--------------------------------------------------------------
	function goBoardContentForm(b_no){

		//--------------------------------------------------------------
		// name="boardContentForm" 가진 form 태그 내부의 name="b_no" 가진
		// 입력 양식에 클릭한 행의 게시판 번호 저장하기
		//--------------------------------------------------------------
		$("[name='boardContentForm'] [name='b_no']").val(b_no); 

		//--------------------------------------------------------------
		// name="boardContentForm" 가진 form 태그 내부의 action 값의 URL 주소로 서버에 접속하기
		// 즉, 상세보기 화면으로 이동하기
		//--------------------------------------------------------------
		document.boardContentForm.submit();
		
	}

</script>

</head>
<body>

<center>
		
	<!-- ************************************************************* -->
	<!-- href="javascript:자바스크립트코드" 클릭 시 코딩한 자바스크립트코드를 실행한다. -->
	<!-- ************************************************************* -->
	<a href="javascript:goBoardRegForm();">새글쓰기</a>
		
	<table border="1">
		
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
		
		
		<%
			List<Map<String, String>> boardList = (List<Map<String, String>>)request.getAttribute("boardList");
		
		
			//--------------------------------------------------------------
			// boardList가 null이 아니면
			//--------------------------------------------------------------
			if( boardList != null ) {
				
				//--------------------------------------------------------------
				// 역순번호 넣어줄 변수 선언
				//--------------------------------------------------------------
				int totCnt = boardList.size();
				
				for( int i = 0; i < boardList.size(); i++ ) {
					
					//--------------------------------------------------------------
					// boardList에서 i번째 요소 꺼내서 map에 저장하기
					//--------------------------------------------------------------
					Map<String,String> map = boardList.get(i);
					
					//--------------------------------------------------------------
					// map에서 키값에 대한 데이터 꺼내서 각 변수에 저장하기
					//--------------------------------------------------------------
					int b_no = Integer.parseInt(map.get("B_NO"), 10);
					String subject = map.get("SUBJECT");
					String writer = map.get("WRITER");
					String readcount = map.get("READCOUNT");
					String reg_date = map.get("REG_DATE");
					int print_level = Integer.parseInt(map.get("PRINT_LEVEL"), 10);
					String xxx = "";
					
					
					//--------------------------------------------------------------
					// print_level 만큼 반복문 돌려서 공백 저장해주기
					//--------------------------------------------------------------
					for(int j=0; j < print_level; j++){
						xxx += "&nbsp&nbsp&nbsp";
					}
					
					//--------------------------------------------------------------
					// "ㄴ" 추가해주기
					//--------------------------------------------------------------
					if(print_level > 0) { xxx = xxx + "ㄴ"; }
					
					//--------------------------------------------------------------
					// 출력
					//--------------------------------------------------------------
					out.println( "<tr style='cursor:pointer' onClick='goBoardContentForm("+b_no+")'><td>"+(totCnt--)+"<td>"+xxx+subject
							+"<td>"+writer+"<td>"+readcount+"<td>"+reg_date );
					
				}
			}
		%>
		
	</table> 
	
	<!-- ************************************************************* -->
	<!-- 게시판 상세 보기 화면으로 이동하는 form 태그 선언하기 -->
	<!-- form 태그 안에 action 값이 있다면 페이지 이동하겠다는 말이다. -->
	<!-- ************************************************************* -->
	<form name="boardContentForm" method="post" action="/boardContentForm.do">
		<!-- ************************************************************* -->
		<!-- [클릭한 게시판 글의 고유번호]가 저장되는 [hidden 입력 양식] 선언 -->
		<!-- hidden 태그에 어떤 값이 들었는지 모르니까 개발하는 동안 type="text"로 변경하여 편함! -->
		<!-- ************************************************************* -->
		<input type="hidden" name="b_no">
	</form>
		
</center>


</body>
</html>