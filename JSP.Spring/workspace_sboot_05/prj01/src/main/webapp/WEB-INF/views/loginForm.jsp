<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>

<script>

	$(document).ready(function(){

		// 아이디, 비밀번호 유효성 체크
		checkForm();
	});

	// 아이디, 비밀번호 유효성 체크
	function checkForm(){

		var loginForm = $("[name='login_form']");
		
		// class="login_btn" 클릭 시
		loginForm.find(".login_btn").click(function(){

			var login_id = $(".login_id").val();
			var pwd = $(".pwd").val();

			if(login_id.split(" ").join("") == "") {
				alert("아이디 입력해주삼");
				$(".login_id").val("");
				$(".login_id").focus();
				return;
			}

			if(pwd.split(" ").join("") == "") {
				alert("비밀번호 입력해주삼");
				$(".pwd").val("");
				$(".pwd").focus();
				return;
			}

			$.ajax({
				url: "/loginProc.do"
				, type : "post"
				, data : loginForm.serialize()	
				, success:function(responseHTML){

					var login_cnt = $(responseHTML).filter(".login_cnt").text();
					login_cnt = parseInt(login_cnt, 10);
					
					if(login_cnt == 1){
						alert("로그인 성공!");
						location.replace("/boardList.do")
					} else {
						alert("로그인 실패!")
					}
					
				}
				, error : function() {
					alert("서버통신 실패!");
				}
			});


			
		});
		
	}
	
</script>


</head>

<body>

<center>

	<form name="login_form">
	
		<table cellpadding="4px" border="1">
			<caption><b>[로그인]</b></caption>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="login_id" class="login_id">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" class="pwd">
				</td>
			</tr>
		</table>
		
		<div style="padding:5px;">
			<input type="button" class="login_btn" value="로그인">
		</div>
		
	
	</form>

</center>


</body>

</html>