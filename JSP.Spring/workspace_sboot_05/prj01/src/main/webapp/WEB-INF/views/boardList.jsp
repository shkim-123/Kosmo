<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>


	$(document).ready(function(){

		// 검색 버튼 클릭 시
		$(".boardSearch").click(function(){

			// 키워드에 입력한 값 가져오기
			var keyword1 = $(".keyword1").val();

			// 키워드에 입력한 값이 있는지 확인
			if(keyword1.split(" ").join("") == "" ){
				// alert("키워드를 입력해 주세요.");
				$(".keyword1").val("");
				// return;
			}

			// 키워드에 입력한 값이 있다면 비동기로 검색 함수 호출
			search();
		});

		// 모두 검색 버튼 클릭 시
		$(".boardSearchAll").click(function(){
			$(".keyword1").val("");
			$(".day").prop("checked", false);
			search();
		});

		// 행보기 셀렉트 박스 값 변경 시 
		$(".rowCntPerPage").change(function(){
			search();
		}); 

		// 체크박스 선택 시
		$(".day").change(function(){
			search();
		})
			
	});

	function search(){

		console.log($("[name='boardListForm']").serialize());
		
		// 비동기 검색
		$.ajax({
			url: "/boardList.do"
			,type: "post"
			,data: $("[name='boardListForm']").serialize()
			,success:function(responseHtml){

				// console.log(responseHtml);
				
				// 검색 결과 반영
				var searchResult = $(responseHtml).find(".searchResult").html();
				
				$(".searchResult").html(searchResult);
				
			}
			,error:function(){
				alert("서버 연동 실패!");
			}
		});
		
	}
		

	function goBoardRegForm(){
		location.replace("/boardRegForm.do");
	}

	function goBoardContentForm(b_no){
		$("[name='boardContentForm'] [name='b_no']").val(b_no);

		document.boardContentForm.submit();	
	}

	function search_with_changePageNo(selectPageNo){
		$(".selectPageNo").val(selectPageNo);

		search();
		
	}

</script>


</head>

<body>

<center>
	
	<!-- 변수 선언 -->
	<% 
		int boardListAllCnt = (int)request.getAttribute("boardListAllCnt");
		int rowCntPerPage = (int)request.getAttribute("rowCntPerPage");
		int selectPageNo = (int)request.getAttribute("selectPageNo");
		int last_pageNo = (int)request.getAttribute("last_pageNo");
		int min_pageNo = (int)request.getAttribute("min_pageNo");
		int max_pageNo = (int)request.getAttribute("max_pageNo");
		
	%>
	
	
	<!-- 검색영역 -->
	<form name="boardListForm" onSubmit="return false;">
		<!--  -->
		[키워드] : 
		<input type="text" name="keyword1" class="keyword1" onKeydown="if(event.keyCode==13){search();}">
		
		<select name="orAnd">
			<option value="or">or</option>
			<option value="and">and</option>
		</select>
		
		<input type="text" name="keyword2" class="keyword2" onKeydown="if(event.keyCode==13){search();}">
		
		
		<!-- 행 선택 -->
		<select name="rowCntPerPage" class="rowCntPerPage">
			<option value="10">10</option>
			<option value="15">15</option>
			<option value="20" selected>20</option>
			<option value="25">25</option>
			<option value="30">30</option>
		</select> 행 보기
		
		
		<!-- 체크박스 -->
		<input type="checkbox" name="day" class="day" value="오늘">오늘
		<input type="checkbox" name="day" class="day" value="어제">어제
		<input type="checkbox" name="day" class="day" value="그제">그제
		<input type="checkbox" name="day" class="day" value="일주일내">일주일내
		
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
		
		<!-------------------- 버튼 영역 -------------------->
		<input type="button" name="boardSearch" class="boardSearch" value="검색">
		<input type="button" name="boardSearchAll" class="boardSearchAll" value="모두검색">
		<!--------------------------------------------------->
		
		
		<a href="javascript:goBoardRegForm()">새글쓰기</a>
	</form>
	<!-- 키워드 검색 END -->
	
	<br>

	<div class="searchResult">
		<div class="">총 : <%=boardListAllCnt%>개</div>
		
		<table border="1">
			<tr>	
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
	
			<% 
				List<Map<String,String>> boardList = (List<Map<String,String>>)request.getAttribute("boardList");
				
				int serial_asc = selectPageNo*rowCntPerPage-rowCntPerPage+1;
				int serial_desc = boardListAllCnt - (selectPageNo*rowCntPerPage-rowCntPerPage+1) + 1;
				
				for(int i=0; i< boardList.size(); i++){
					Map<String,String> map = boardList.get(i);
					
					String subject = map.get("SUBJECT");
					String writer = map.get("WRITER");
					String reg_date = map.get("REG_DATE");
					int readcount = Integer.parseInt(map.get("READCOUNT"));
					int print_level = Integer.parseInt(map.get("PRINT_LEVEL"));
					int b_no = Integer.parseInt(map.get("B_NO"));
					String reply = "";
					
					for(int j=0;j<print_level;j++){
						reply += "&nbsp;&nbsp;&nbsp;";
					}
					
					if(print_level!=0){
						reply = reply + "ㄴ";
					}
					
					out.print("<tr style='cursor:pointer' onClick='goBoardContentForm("+b_no+");'> <td>"
				//	+(serial_asc++)
					+(serial_desc--)
					+"<td>"+reply+subject+"<td>"+writer+"<td>"+readcount+"<td>"+reg_date);
					
				}
			
			%>
	
		</table>
		
		
		<!-- 페이징 처리 -->
		<%
			if(boardListAllCnt > 0){
				// 처음
				if(selectPageNo > 1){
					out.println("<span style='cursor:pointer' onClick='search_with_changePageNo(1)'>[처음]</span>");
				}
				// 이전
				if(min_pageNo > 10){
					out.println("<span style='cursor:pointer' onClick='search_with_changePageNo("+(min_pageNo-1)+")'>◀</span>");
				}
				for(int i = min_pageNo; i <= max_pageNo; i++){
					if(i != selectPageNo){
						out.println("<span style='cursor:pointer' onClick='search_with_changePageNo("+i+")'>["+ i + "]</span>");
					} else if(i == selectPageNo){
						out.println("<span>"+ i + "</span>");
					}
				}
				// 다음
				if(max_pageNo < last_pageNo){
					out.println("<span style='cursor:pointer' onClick='search_with_changePageNo("+(max_pageNo+1)+")'>▶</span>");
				}
				// 마지막
				if(selectPageNo < last_pageNo){
					out.println("<span style='cursor:pointer' onClick='search_with_changePageNo("+(last_pageNo)+")'>[마지막]</span>");
				}
			}
		%>
		
		
	</div>
	
	<form name="boardContentForm" method="post" action="/boardContentForm.do" >
		<input type="hidden" name="b_no">
	</form>
	
	

</center>


</body>

</html>