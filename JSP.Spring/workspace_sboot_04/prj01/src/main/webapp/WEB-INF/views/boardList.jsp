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

	//--------------------------------------------------------------
	// 키워드에 입력한 데이터를 가진 [게시판 목록]을 검색하여 결과를 보여주는 함수 선언
	//--------------------------------------------------------------
	function search(){
		//--------------------------------------------------------------
		// 입력한 키워드 얻어오기
		//--------------------------------------------------------------
		var keyword1 = $(".keyword1").val();

		//--------------------------------------------------------------
		// 만약 키워드가 비어있거나 공백으로 구성되어 있으면 경고 후 비우고 함수 중단하기
		//--------------------------------------------------------------
		if( keyword1 == null || keyword1.split(" ").join("") == "" ){
			// alert("키워드를 입력해주세요.");
			$(".keyword1").val("");
			// return;
		}

		//--------------------------------------------------------------
		// 입력한 키워드의 앞 뒤 공백 제거하고 다시 넣어주기
		//--------------------------------------------------------------
		$(".keyword1").val($.trim(keyword1));
		
		//--------------------------------------------------------------
		// 비동기 방식으로 웹서버에 접속하여 키워드를 만족하는 
		// 검색 결과물을 응답받아 현 화면에 반영하기
		//--------------------------------------------------------------
		searchExe();
	}

	//--------------------------------------------------------------
	// 모두검색 버튼을 눌렀을 경우
	//--------------------------------------------------------------
	function searchAll(){
		$(".keyword1").val("");
		searchExe();
	}

	function searchExe(){

		//--------------------------------------------------------------
		// 현재 화면에서 페이지 이동 없이(=비동기 방식으로)
		// 서버쪽 /boardList.do 로 접속하여 키워드를 만족하는
		// 검색 결과물을 응답받아 현 화면에 반영하기
		//--------------------------------------------------------------
		$.ajax({
			//--------------------------------------------------------------
			// 서버 쪽 호출 URL 주소 지정
			//--------------------------------------------------------------
			url: "/boardList.do"
			//--------------------------------------------------------------
			// form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
			//--------------------------------------------------------------
			,type: "post"
			//--------------------------------------------------------------
			// 서버로 보낼 파라미터명과 파라미터값을 설정
			//--------------------------------------------------------------
			,data: $("[name='boardListForm']").serialize()
			//--------------------------------------------------------------
			// 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정
			// 익명함수의 매개변수에는 서버가 보내온 html 소스가 문자열로 들어온다
			// 즉, 응답메시지 안의 html 소스가 문자열로써 익명함수의 매개변수로 들어온다.
			// 응답메시지 안의 html 소스는 boardList.jsp 의 실행 결과물이다.
			//--------------------------------------------------------------
			,success: function(responseHtml){

				//--------------------------------------------------------------
				// 매개변수 responseHtml로 들어온 검색 결과물 html 소스문자열에서 
				// class="searchResult"를 가진 태그 내부의 [검색 결과물 html 소스]를 얻어서
				// 아래 현 화면의 html 소스 중에 class="searchResult" 를 가진 태그 내부에 덮어씌우기
				//--------------------------------------------------------------
				$(".searchResult").html($(responseHtml).find(".searchResult").html());

				//--------------------------------------------------------------
				// 매개변수 responseHtml로 들어온 검색 결과물 html 소스문자열에서 
				// class="boardListAllCnt"를 가진 태그 내부의 [총개수 문자열]을 얻어서
				// 아래 현 화면의 html 소스 중에 class="boardListAllCnt" 를 가진 태그 내부에 덮어씌우기
				//--------------------------------------------------------------
				$(".boardListAllCnt").html($(responseHtml).find(".boardListAllCnt").text());

				//--------------------------------------------------------------
				// 매개변수 responseHtml로 들어온 검색 결과물 html 소스문자열에서 
				// class="pageNo"를 가진 태그 내부의 [페이지 번호]를 얻어서
				// 아래 현 화면의 html 소스 중에 class="pageNo" 를 가진 태그 내부에 덮어씌우기
				//--------------------------------------------------------------
				$(".pageNo").html($(responseHtml).find(".pageNo").html());
				
			}
			//--------------------------------------------------------------
			// 서버의 응답을 못 받았을 경우 실행할 익명함수 설정
			//--------------------------------------------------------------
			,error: function(){
				alert("서버 접속 실패!");
			}		
		});

	}

	//--------------------------------------------------------------
	// 페이지 번호를 클릭하면 호출되는 함수 선언
	//--------------------------------------------------------------
	function search_with_changePageNo(selectPageNo){
		//--------------------------------------------------------------
		// class="selectPageNo" 의 value값을 매개변수로 들어온 selectPageNo 으로 변경한다
		//--------------------------------------------------------------
		$(".selectPageNo").val(selectPageNo);
		search();
	}
	
</script>

</head>
<!-- class="keyword1" 인풋 태그 포커스 아웃인 상태에서도 이벤트 실행하고 싶다면 태그 안에다 이벤트를 넣어주면 된다.  -->
<body onKeydown="if(event.keyCode==13){search();}">

<center>

	<%
		//--------------------------------------------------------------
		// 자바 변수 선언하고 검색 화면 구현에 필요한 데이터 저장하기
		//--------------------------------------------------------------
		List<Map<String, String>> boardList = (List<Map<String, String>>)request.getAttribute("boardList");
		int boardListAllCnt = (Integer)request.getAttribute("boardListAllCnt");
		int last_pageNo = (Integer)request.getAttribute("last_pageNo");
		int min_pageNo = (Integer)request.getAttribute("min_pageNo");
		int max_pageNo = (Integer)request.getAttribute("max_pageNo");
		int selectPageNo = (Integer)request.getAttribute("selectPageNo");
		int rowCntPerPage= (Integer)request.getAttribute("rowCntPerPage");
	%>

	<!-- ************************************************************* -->
	<!-- [게시판 검색 조건 입력 양식] 내포한 form 태그 선언 -->
	<!-- form 태그 내에 input 태그가 1개인 경우 엔터 시 웹브라우저는 자동으로 웹서버에 접근을 시도한다.(동기방식, 웹브라우저의 오지랖...) -->
	<!-- 위와 같은 기능을 막는 방법 -->
	<!-- onSubmit = "return false;" : 웹서버로 접근을 시도하는 이벤트 발생 시 자스코딩을 실행하여 웹서버 접근 무력화 -->
	<!-- true 라면 웹서버에 접근, false라면 웹서버 접근하지 못한다. -->
	<!-- ************************************************************* -->
	<form name="boardListForm" onSubmit="return false;">
		[키워드] : <input type="text" name="keyword1" class="keyword1">
		<input type="button" value="검색" class="boardSearch" onClick="search();">&nbsp;
		<input type="button" value="모두검색" class="boardSearchAll" onClick="searchAll();">&nbsp;	
		
		<!-- 선택한 페이지 번호 저장 -->
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
		<!-- 한 화면에 보여줄 행의 개수 선택 -->
		<select name="rowCntPerPage" class="rowCntPerPage" onChange="search();">
			<option value="10">10</option>			
			<option value="15">15</option>			
			<option value="20">20</option>			
			<option value="25">25</option>			
			<option value="30">30</option>			
		</select> 행보기
			
		<!-- ************************************************************* -->
		<!-- href="javascript:자바스크립트코드" 클릭 시 코딩한 자바스크립트코드를 실행한다. -->
		<!-- ************************************************************* -->
		<a href="javascript:goBoardRegForm();">새글쓰기</a>
	</form>
	
	<div style="height:10px"></div>
	
	<div class="boardListAllCnt">총 : <%=boardListAllCnt%>개</div>
	<div class="searchResult">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
			
			
			<%
				//--------------------------------------------------------------
				// boardList가 null이 아니면
				//--------------------------------------------------------------
				if( boardList != null ) {
					
					//--------------------------------------------------------------
					// 정순번호, 역순번호 변수 선언
					//--------------------------------------------------------------
					int serialNo = selectPageNo*rowCntPerPage-rowCntPerPage+1;
					int reverseSerialNo = boardListAllCnt - serialNo + 1;
					
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
						out.println( "<tr style='cursor:pointer' onClick='goBoardContentForm("+b_no+")'><td>"
								+(reverseSerialNo--)+"<td>"+xxx+subject
								+"<td>"+writer+"<td>"+readcount+"<td>"+reg_date );
						
					}
				}
			%>
			
			
		</table> 
	</div>
	
	<div style="height:10px"></div>
	
	<!-- 페이지 번호 출력 -->
	<div class="pageNo">	
		<%	
			if( boardListAllCnt > 0 ){
				
				/*
				// 이전, 다음 선택 시 페이지 번호가 10단위로 변경
				if(min_pageNo > 10){
					out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+ (min_pageNo-1) + ");'>[이전]</span> ");
				}
				
				for(int i = min_pageNo; i <= max_pageNo; i++){
					if(selectPageNo == i){
						out.print( "<span>"+ i + "</span> ");
					} else {
						out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+i+");'>["+ i + "]</span> ");
					}
				}
				
				if(max_pageNo < last_pageNo){
					out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+ (max_pageNo+1) + ");'>[다음]</span> ");
				}
				*/
				
				// 이전, 다음 선택 시 페이지 번호가 1씩 변경
				if(selectPageNo > 1){
					out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+ (1) + ");'>[처음]</span> ");
					out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+ (selectPageNo-1) + ");'>[이전]</span> ");
					out.print( "&nbsp;&nbsp;");
				} else {
					// 처음, 이전을 항상 보여주도록 설정
					out.print( "<span>[처음]</span> ");
					out.print( "<span>[이전]</span> ");
					out.print( "&nbsp;&nbsp;");
				}
				for(int i = min_pageNo; i <= max_pageNo; i++){
					if(selectPageNo == i){
						out.print( "<span>"+ i + "</span> ");
					} else {
						out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+i+");'>["+ i + "]</span> ");
					}
				}
				if(selectPageNo < last_pageNo){
					out.print( "&nbsp;&nbsp;");
					out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+ (selectPageNo+1) + ");'>[다음]</span> ");
					out.print( "<span style='cursor:pointer' onClick='search_with_changePageNo("+ (last_pageNo) + ");'>[마지막]</span> ");
				} else {
					// 다음, 마지막을 항상 보여주도록 설정
					out.print( "<span>[다음]</span> ");
					out.print( "<span>[마지막]</span> ");
					out.print( "&nbsp;&nbsp;");
				}
				
			}
		%>
	</div>
	
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