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
<title>사원 정보 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
	$(document).ready(function(){
	
		// 등록 버튼 클릭 시
		$(".inputFormBtn").click(function(){
			checkStaffInputForm();
		});

		// 주민번호1 입력 시
		$(".jumin_num1").keyup(function(){
			onlyNumberCheck($(this));
		});
		
		// 주민번호2 입력 시
		$(".jumin_num2").keyup(function(){
			onlyNumberCheck($(this));
		});

		graduateDayCheck();
	
	
	});

	//=================================================
	// 등록 버튼 클릭 시 호출되는 함수 선언
	//=================================================
	function checkStaffInputForm(){
		
		//-------------------
		var staff_nameObj = $(".staff_name");
		var jumin_num1Obj = $(".jumin_num1");
		var jumin_num2Obj = $(".jumin_num2");
		var religion_codeObj = $(".religion_code");
		var school_codeObj = $(".school_code");
		var skill_codeObj = $(".skill_code");
		var graduate_day_yearObj = $(".graduate_day_year");
		var graduate_day_monthObj = $(".graduate_day_month");
		var graduate_day_dayObj = $(".graduate_day_day");
		//-------------------
		var jumin_num1 = jumin_num1Obj.val();
		var jumin_num2 = jumin_num2Obj.val();
		//-------------------
		var graduate_day_year = graduate_day_yearObj.val();
		var graduate_day_month = graduate_day_monthObj.val();
		var graduate_day_day = graduate_day_dayObj.val();
		//-------------------

		//-------------------
		// 필수입력 항목 입력 여부 체크
		if( !requiredCheck(staff_nameObj, "이름") ){return;}
		if( !requiredCheck(jumin_num1Obj, "첫번째 주민번호") ){return;}
		if( !requiredCheck(jumin_num2Obj, "두번째 주민번호") ){return;}
		if( !requiredCheck(religion_codeObj, "종교") ){return;}
		if( !requiredRadioCheckboxCheck(school_codeObj, "학력") ){return;}
		if( !requiredRadioCheckboxCheck(skill_codeObj, "스킬") ){return;}
		if( !requiredCheck(graduate_day_yearObj, "졸업연도") ){return;}
		if( !requiredCheck(graduate_day_monthObj, "졸업월") ){return;}
		if( !requiredCheck(graduate_day_dayObj, "졸업일") ){return;}
		//-------------------
	 	
		//-------------------
		// 올바른 주민번호를 입력 했는지 체크
		var regExp = new RegExp( /^\d{2}([0]{1}\d{1})|([1]{1}[0-2]{1})[0-3]{1}\d{1}$/ );
		
		if(!regExp.test(jumin_num1)){
			alert("올바른 주민번호를 입력해 주세요.");
			jumin_num1Obj.focus();
			return;
		}
		
		if(!(jumin_num2.length == 7)){
			alert("올바른 주민번호를 입력해 주세요.");
			jumin_num2Obj.focus();
			return;
		}
		//-------------------

		//-------------------
		// 저장 여부 확인
		if(confirm("정말 저장 하시겠습니까?") == false){return;}
		//-------------------
	
		//-------------------
		// 졸업 월, 일 10 미만 숫자인 경우 0 붙여주기
		if(graduate_day_month < 10){ graduate_day_month = "0" + graduate_day_month; }
		if(graduate_day_day < 10){ graduate_day_day = "0" + graduate_day_day; }
		//-------------------

		//-------------------
		// 주민번호, 졸업일 히든 태그에 value 값 저장
		$(".jumin_num").val(jumin_num1 + jumin_num2);
		$(".graduate_day").val(graduate_day_year + graduate_day_month + graduate_day_day);

		console.log("jumin_num => " + $(".jumin_num").val());
		console.log("graduate_day => " + $(".graduate_day").val());
		console.log($("[name='staffInputForm']").serialize());
		//-------------------

		//-------------------
		// 비동기 방식으로 웹서버와 통신하기
		$.ajax({
			url: "/staff_input_proc.do"
			,type: "post"
			,data: $("[name='staffInputForm']").serialize()
			,success: function(json){
				
				//-------------------
				console.log(json);
				var staffInsertCnt = json.staffInsertCnt;
				var msg = json.msg;

				console.log(staffInsertCnt);
				console.log(msg);
				
				//-------------------
				if( msg != null && msg.length > 0 ){
					alert(msg);
					return;
				}

				//-------------------
				if( staffInsertCnt == 1 ){
					alert("직원 정보 등록 성공!");
				} else if ( staffInsertCnt == -1 ){
					alert("이미 등록된 주민번호 입니다.");
				} else if ( staffInsertCnt == -2 ) {
					alert("직원 정보 등록 실패!");
				} else if ( staffInsertCnt == -3 ){
					alert("직원 스킬 정보 등록 실패!");
				}
				//-------------------
				
			}
			,error: function(){
				alert("서버 통신 실패!");
			}
		});
		//-------------------
		
	}

	//=================================================
	// 입력 여부 체크 함수 선언, 입력 안되어 있으면 false를 리턴함(인풋, 셀렉트용)
	//=================================================
	function requiredCheck(obj, msgStr){
		var flag = true;
		var objValue=obj.val();
		if( objValue == null || objValue.split(" ").join("") == "" ){
			objValue = "";
			alert(msgStr + " 을(를) 입력해 주세요.");
			obj.focus();
			flag = false;
		}
		return flag;
	}
	
	//=================================================
	// 입력 여부 체크 함수 선언, 입력 안되어 있으면 false를 리턴함 (라디오, 체크박스용)
	//=================================================
	function requiredRadioCheckboxCheck(obj, msgStr){
		var flag = true;
		var length = obj.filter(":checked").length;
		if(length <= 0){
			alert(msgStr + " 을(를) 선택해 주세요.");
			flag = false;
		} 
		return flag;
	}

	//=================================================
	// 숫자만 입력했는지 체크 함수 선언
	//=================================================
	function onlyNumberCheck(obj){
		var objValue = obj.val();
		var num = "";
		var notNum = 0;
		//------------------
		if(objValue.length > 0 ){
			//------------------
			for(var i = 0; i < objValue.length; i++){
				var str = objValue.charAt(i);
				"0123456789".indexOf(str) >= 0 ? num += str : notNum++;
			}
			//------------------
			if(notNum > 0){	alert("숫자만 입력해 주세요."); }
			//------------------
			// num 이 ""가 아닌 경우 숫자로 변환
			if(num != ""){ num = parseInt(num, 10); }
			//------------------
			obj.val(num);
		}
	}

	//=================================================
	// 졸업일select에 option 값 넣어주는 함수 선언
	//=================================================
	function graduateDayCheck(){
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		var date = today.getDate();
		//-------------------
		var graduate_day_year = $(".graduate_day_year");
		var graduate_day_month = $(".graduate_day_month");
		var graduate_day_day = $(".graduate_day_day");
		//-------------------

		//-------------------
		graduate_day_year.append("<option disabled selected value=''>년</option>");
		graduate_day_month.append("<option disabled selected value=''>월</option>");
		graduate_day_day.append("<option disabled selected value=''>일</option>");
		for(var i = 1960; i <= year; i++){
			graduate_day_year.append("<option value="+i+">"+i+"</option>");
		}
		//-------------------

		//-------------------
		// 졸업 년 값 변경 시, 월 값 넣어주기
		graduate_day_year.change(function(){
			var thisObj = $(this);
			var thisValue = thisObj.val();
			var endNum = 12;
			//-------------------
			selectEmptyAppend(graduate_day_month, "월");
			selectEmptyAppend(graduate_day_day, "일");
			//-------------------
			if( thisValue == year ){endNum = month;}
			//-------------------
			for(var j = 1; j <=endNum; j++){
				graduate_day_month.append("<option value="+j+">"+j+"</option>");
			}				
		});
		
		//-------------------
		// 졸업 월 값 변경 시, 일 값 넣어주기
		graduate_day_month.change(function(){
			var thisObj = $(this);
			var thisValue = thisObj.val();
			var graduate_day_yearValue = graduate_day_year.val();
			var endNum_day = new Date(graduate_day_yearValue, thisValue, 0);
			var endNum = endNum_day.getDate();
			//-------------------
			selectEmptyAppend(graduate_day_day, "일");
			//-------------------
			if( thisValue == month && graduate_day_yearValue == year ){endNum = date;}
			//-------------------
			for(var j = 1; j <= endNum; j++){
				graduate_day_day.append("<option value="+j+">"+j+"</option>");
			}
		});
		
		//-------------------
		// select 태그 자식(=option태그) 삭제하고 disable 태그 넣어주는 함수 선언
		function selectEmptyAppend(obj, str){
			obj.empty();
			obj.append("<option disabled selected value=''>"+str+"</option>");
		}
		
	}

</script>


</head>

<body>

<center>

<div class="inputContainer">
	<h3>사원 정보 등록</h3>

	<form name="staffInputForm">
		<table class="tbcss1">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="staff_name" class="staff_name form-control" maxlength="10"> 
				</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td>
					<input type="text" class="jumin_num1 form-control" maxlength="6"> - 
					<input type="password" class="jumin_num2 form-control" maxlength="7">
				</td>
			</tr>
			<tr>
				<th>종교</th>
				<td>
					<select name="religion_code" class="religion_code form-control">
						<!-- 종교 리스트 표현 -->
						<option disabled selected value="">종교를 선택해주세요</option>
						<c:forEach var="religionMap" items="${religionList}">
							<option value="${religionMap.religion_code}">${religionMap.religion_name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>학력</th>
				<td>
					<!-- 학력 리스트 표현 -->
					<c:forEach var="schoolMap" items="${schoolList}">
						<input type="radio" name="school_code" class="school_code input-radio" value="${schoolMap.school_code}">${schoolMap.school_name}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>기술</th>
				<td>
					<!-- 기술 리스트 표현 -->
					<c:forEach var="skillMap" items="${skillList}">
						<input type="checkbox" name="skill_code" class="skill_code input-checkbox" value="${skillMap.skill_code}">${skillMap.skill_name}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>졸업일</th>
				<td>
					<!-- option 태그는 자스로 제어 -->
					<select class="graduate_day_year form-control">
					</select>
					<select class="graduate_day_month form-control">
					</select> 
					<select class="graduate_day_day form-control">
					</select> 
				</td>
			</tr>
		</table>
		
		<div style="height:12px;"></div>
		
		<!-- 히든 태그 영역 -->
		<input type="hidden" name="jumin_num" class="jumin_num">
		<input type="hidden" name="graduate_day" class="graduate_day">
		
		<div>
			<!-- 버튼 영역 -->
			<input type="button" class="inputFormBtn btn" value="등록">	
			<input type="reset" class="btn" value="초기화">
		</div>
	</form>
	
</div>

</center>


</body>

</html>