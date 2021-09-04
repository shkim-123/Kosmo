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
				alert("키워드를 입력해 주세요.");
				$(".keyword1").val("");
				return;
			}

			// 키워드에 입력한 값이 있다면 비동기로 검색 함수 호출
			search();
		});

		// 모두 검색 버튼 클릭 시
		$(".boardSearchAll").click(function(){
			$(".keyword1").val("");
			search();
		});
			
	});

	function search(){

		// 비동기 검색
		$.ajax({
			url: "/boardList.do"
			,type: "post"
			,data: $("[name='boardListForm']").serialize()
			,success:function(responseHtml){

				console.log(responseHtml);
				
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

</script>


</head>

<body>

<center>

	
	<!-- 키워드 검색부분!!! -->
	<form name="boardListForm" onSubmit="return false;">
		[키워드] : <input type="text" name="keyword1" class="keyword1">
		
		<input type="button" name="boardSearch" class="boardSearch" value="검색">
		<input type="button" name="boardSearchAll" class="boardSearchAll" value="모두검색">
		
		<a href="javascript:goBoardRegForm()">새글쓰기</a>
	</form>
	<!-- 키워드 검색 END -->
	
	<br>

	<div class="searchResult">
		<div class="">총 : <%=(int)request.getAttribute("boardListAllCnt")%>개</div>
		
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
				
				int boardCnt = boardList.size();
				
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
					
					out.print("<tr style='cursor:pointer' onClick='goBoardContentForm("+b_no+");'> <td>"+boardCnt--+"<td>"+reply+subject+"<td>"+writer+"<td>"+readcount+"<td>"+reg_date);
					
				}
			
			%>
	
		</table>
	</div>
	
	<form name="boardContentForm" method="post" action="/boardContentForm.do" >
		<input type="hidden" name="b_no">
	</form>
	

</center>


</body>

</html>