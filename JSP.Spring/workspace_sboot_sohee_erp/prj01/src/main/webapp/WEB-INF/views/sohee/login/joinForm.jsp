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
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>

	//-------------------
	// 진행 단계 체크 변수 선언
	var stepCnt = 1;	
	//-------------------
	
	$(document).ready(function(){
		//-------------------
		$(".login_id").attr("placeholder", "아이디 입력");
		$(".pwd").attr("placeholder", "비밀번호 입력");
		$(".pwdChk").attr("placeholder", "비밀번호 확인");
		//-------------------
		$(".join_step2").css("display", "none");
		$(".join_step3").css("display", "none");
		//-------------------
		
		//-------------------
		// 다음 버튼 클릭 시
		$(".nextBtn").click(function(){ goJoinStepPage(++stepCnt); });
		
		//-------------------
		// 로그인하기 버튼 클릭 시
		$(".goLoginBtn").click(function(){ location.replace("/login_form.do"); });
		//-------------------
		$(".goLoginForm").click(function(){ location.replace("/login_form.do"); });
	});
	
	//=================================================
	// 다음 단계로 넘어가기
	//=================================================
	// ajax 통신이 비동기 방식으로 진행되어 원하는 순서대로 진행되지 않았다.
	// 해결방법 : await 키워드를 사용하여 ajax의 결과를 리턴받아 처리하였다.
	// 함수명 앞에는 async 키워드를 추가해야 한다. ajax의 결과를 리턴받은 후 이후 코드가 처리되는 방식이다.
	async function goJoinStepPage(step){
		console.log(step);
		//-------------------
		if(step!=1 && !checkJoin(step)){--stepCnt; return;}
		//-------------------
		var json = await goJoinProc(step);
		var msg = json.msg;
		var joinCnt = json.joinCnt;
			joinCnt = parseInt(joinCnt, 10);
		//-------------------
		if(msg != ""){alert(msg); $(".login_id").focus(); --stepCnt; return;}
		//-------------------
		if(step == 2){
			if(joinCnt != 0){
				alert("이미 등록된 아이디 입니다. 다시 입력해 주세요.");
				$(".login_id").focus();
				--stepCnt; return;
			} 
		} else if(step == 3){
			if(joinCnt != 1) {
				alert("에러!");
				--stepCnt; return;
			}
		}		
		//-------------------
		$(".join_step"+(step-1)).css("display", "none");
		$(".join_step"+step).css("display", "block");
		//-------------------

		if(step == 3){
			$(".goLoginForm").css("display", "none");
	 	}
	}

	//=================================================
	// 유효성 체크
	//=================================================
	function checkJoin(step){
		//-------------------
		// step2 넘어가기 전 체크
		if(step == 2) {
			if(!emptyCheck($(".login_id"), "아이디")){return false;}
		}
		//-------------------
		// step3 넘어가기 전 체크
		if(step == 3){
			if(!emptyCheck($(".pwd"), "비밀번호")){return false;}
			if(!emptyCheck($(".pwdChk"), "비밀번호 확인")){return false;}
			if(!pwdCheck()){return false;}
		}
		//-------------------
		return true;
	}
	
	//=================================================
	// 입력값 있는지 체크, 없으면 alert 후 false 리턴
	//=================================================
	function emptyCheck(obj, str){
		var objValue = obj.val();
		if(objValue.split(" ").join("") == ""){
			alert(str + "을(를) 입력해 주세요.");
			obj.val("");
			obj.focus();
			return false;
		}
		return true;
	}

	//=================================================
	// 웹서버랑 비동기 통신, ajax를 리턴
	//=================================================
	function goJoinProc(step){
		//-------------------
		var flag = false; 
		$(".step").val(step);
		//-------------------
		console.log($(".joinForm").serialize());
		//-------------------
		return $.ajax({
			url: "/joinProc.do"
				,type: "post"
				,data: $(".joinForm").serialize()
				,success: function(json){}
				,error: function(){alert("서버 통신 에러!");}
			});
	}

	//=================================================
	// 비밀번호, 비밀번호 확인 일치 여부 확인
	//=================================================
	function pwdCheck(){
		var pwd = $(".pwd").val();
		var pwdChk = $(".pwdChk").val();
			pwd = $.trim(pwd);
			pwdChk = $.trim(pwdChk);

		if(pwd != pwdChk){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
			$(".pwd").val("");
			$(".pwdChk").val("");
			$(".pwd").focus();
			return false;
		}
		return true;
	}

	
</script>


</head>

<body>

<center>

<div class="joinContainer">
	<h2>회원가입</h2>

	<form name="joinForm" class="joinForm" onSubmit="return false;">
	
		<div class="join_step1">
			<h3>로그인에 사용할 <br>
			아이디를 입력해주세요.</h3>
			<input type="text" name="login_id" class="login_id form-control" maxlength="20" /> 
			<button class="nextBtn btn">다음</button>
		</div>
		
		<div class="join_step2">
			<h3>로그인에 사용할 <br>
			비밀번호를 입력해주세요.</h3>
			<input type="password" name="pwd" class="pwd form-control" maxlength="20" /> 
			<input type="password" class="pwdChk form-control" maxlength="20" /> 
			<button class="nextBtn btn">다음</button>
		</div>
		
		<div class="join_step3">
			<h3>회원가입 완료!</h3>
			<button class="goLoginBtn btn">로그인하기</button>
		</div>
		
		
		<input type="hidden" name="step" class="step" >
	</form>
	
	<a class="goLoginForm">로그인화면으로 이동</a>
	
	
</div>
</center>


</body>

</html>
