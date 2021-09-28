<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<!-- ************************************************************* -->
<%@include file="../common/common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>

	$(document).ready(function(){
		$(".login_id").attr("placeholder", "아이디");
		$(".pwd").attr("placeholder", "비밀번호");

		$(".loginBtn").click(function(){
			checkLoginForm();
		});

		$(".goJoinBtn").click(function(){
			location.replace("/join_form.do");
		});
	});

	function checkLoginForm(){
		var login_id = $(".login_id").val();	
		var pwd = $(".pwd").val();		
		if( login_id.split(" ").join("") == "" ) {
			alert("아이디를 입력해 주세요.");
			$(".login_id").val("");
			$(".login_id").focus();
			return;
		}

		if( pwd.split(" ").join("") == "" ) {
			alert("암호를 입력해 주세요.");
			$(".pwd").val("");
			$(".pwd").focus();
			return;
		}

		
		$.ajax({
			url : "/loginProc.do"				
			, type : "post"				
			, data : $("[name='loginForm']").serialize()		
			, success : function(idCnt) {
				if(idCnt == 1) {		
					location.replace("staff_search_form.do");
				} else {				
					alert("로그인 실패!");
				}
			}
			, error : function() {		
				alert("서버 접속 실패");	
			}	
		});
	}

	
</script>


</head>

<body>

<center>

<div class="loginContainer">
	<h2>로그인</h2>

	<form name="loginForm" class="loginForm">
		<input type="text" name="login_id" class="login_id form-control" maxlength="20" value="${cookie.login_id.value}"/>
		<input type="password" name="pwd" class="pwd form-control" maxlength="20" value="${cookie.pwd.value}" />
	
		<div class="rememberChkWrap">
			<input type="checkbox" name="is_login" class="rememberChk input-checkbox" value="true" ${empty cookie.login_id.value?'':'checked'}/> 아이디/비밀번호 저장
		</div>
		<input type="button" class="loginBtn btn" value="로그인" />
	</form>
	
	<div class="loginBtnWrap">
		<button class="naverLoginBtn btn">네이버 아이디로 로그인하기</button>
		<button class="goJoinBtn btn" >아직 아이디가 없으시다면? 회원가입하기</button>
	</div>
	
</div>
</center>


</body>

</html>
