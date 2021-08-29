<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새글쓰기</title>
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>

	// 저장하기 버튼 눌렀을 경우
	function goBoardRegProc(){

		if(!confirm("정말 저장하시겠습니까?")){return;}

		// 비동기 통신
		$.ajax({
			url:"/boardRegProc.do"
			,type:"post"
			,data:$("[name='boardRegForm']").serialize()
			,success:function(responseHTML){
				console.log(responseHTML);
				var insert_cnt = $(responseHTML).filter(".insert_cnt").text();
				var msg = $(responseHTML).filter(".msg").text();
				insert_cnt = parseInt(insert_cnt, 10);
				msg = $.trim(msg);	

				if(msg!=""){
					alert(msg);
					return;
				}

				if(insert_cnt == 1){
					alert("저장 성공!");
					location.replace("/boardList.do");
				}
				
			}
			,error:function(){
				alert("서버 통신 에러!");
			}
		});

	}
	
	// 목록으로 버튼 눌렀을 경우
	function goBoardList(){
		//if(!confirm("목록으로 이동하시겠습니까?")){return;}

		location.replace("/boardList.do");
	}


</script>


</head>

<body>

<center>
	
	<form name="boardRegForm">
		<table border="1">
			<caption>[새글쓰기]</caption>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="writer" size="30">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" size="54">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="30">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea cols="50" rows="10" name="content"></textarea>
				</td>
			</tr>			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" size="10" maxlength="4">
				</td>
			</tr>
		</table>
		
		<br>
		
		<input type="button" value="저장하기" onClick="goBoardRegProc();">
		<input type="reset" value="다시쓰기">
		<input type="button" value="목록으로" onClick="goBoardList();">
		
	</form>

</center>


</body>

</html>