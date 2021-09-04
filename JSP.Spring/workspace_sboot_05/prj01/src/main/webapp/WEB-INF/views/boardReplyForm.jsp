<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글쓰기</title>
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>

	// 저장하기 버튼 눌렀을 경우
	function goBoardReplyProc(){

		if(!confirm("정말 저장하시겠습니까?")){return;}

		// 비동기 통신
		$.ajax({
			url:"/boardReplyProc.do"
			,type:"post"
			,data:$("[name='boardReplyForm']").serialize()
			,success:function(responseHTML){

				console.log(responseHTML);

				var insertReplyCnt = $(responseHTML).filter(".insertReplyCnt").text();
				var msg = $(responseHTML).filter(".msg").text();

				msg = $.trim(msg);

				// 유효성 체크 통과 못함
				if(msg != ""){
					alert(msg);
					return;
				}

				if(insertReplyCnt == 1){
					alert("댓글 등록 성공!");
					goBoardList();
				} else if(insertReplyCnt == -1){
					alert("이미 삭제된 게시글입니다.");
					goBoardList();
				} else {
					alert("에러 발생! 관리자에게 문의해주세요.");
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
	
	<form name="boardReplyForm">
		<table border="1">
			<caption>[댓글쓰기]</caption>
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
		
		<input type="hidden" name="b_no" value="<%out.print(request.getParameter("b_no"));%>">
		
		<input type="button" value="저장하기" onClick="goBoardReplyProc();">
		<input type="reset" value="다시쓰기">
		<input type="button" value="목록으로" onClick="goBoardList();">
		
	</form>

</center>


</body>

</html>