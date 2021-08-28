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

	<a href="javascript:goBoardRegForm()">새글쓰기</a>
	
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
	
	<form name="boardContentForm" method="post" action="/boardContentForm.do" >
		<input type="hidden" name="b_no">
	</form>
	

</center>


</body>

</html>