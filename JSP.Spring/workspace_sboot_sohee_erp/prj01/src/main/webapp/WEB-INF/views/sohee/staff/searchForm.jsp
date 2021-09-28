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
<title>사원 정보 검색</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>

	$(document).ready(function(){
		// 검색 버튼 클릭 시
		$(".staffSearchBtn").click(function(){ search(); });
		// 전부 검색 버튼 클릭 시
		$(".staffSearchAllBtn").click(function(){ searchAll(); });
		// 등록 버튼 클릭 시
		$(".goInputFormBtn").click(function(){ getInputFormExe(); });
		// 테이블 이벤트 함수 호출
		tableTrEvent();
		// 페이징 이벤트 추가
		search_with_changePageNo();
		// ~개씩 보기 이벤트 추가
		rowCntPerPageEvent();
		// 처음 화면
/* 		$(".searchResult").html(""); */
		// placeholder 넣어주기
		$(".keyword").attr("placeholder", "검색어를 입력해 주세요");

		// 21.09.25 졸업일 검색 유효성 체크 함수 호출
		graduateDaySearchCheck();
		
/* 		// 상세검색 클릭 시
		$(".detailSearch").click(function(){

			var thisObj = $(this);
			var thisObjVal = thisObj.val();

			if(thisObjVal.indexOf("▼") >= 0){
				$(".tbcss1").css("display", "table");
				thisObj.val("상세검색 ▲");
			} else { 
				$(".tbcss1").css("display", "none");
				thisObj.val("상세검색 ▼");
			}
			
		}); */
		
		//$(".tbcss1").css("display", "none");

		// 키워드 검색에서 엔터 시 검색 함수 호출 (21.09.25)
		$(".keyword").keyup(function(){
			if(event.keyCode==13){ search(); }
		});

		// 로그아웃 추가 (21.09.25)
		$(".logoutBtn").click(function(){
			if(!confirm("로그아웃 하시겠습니까?")){return;}
			
			location.replace("/logout.do")
		});
	});

	//=================================================
	// 졸업일 검색 시 유효성 체크 함수 호출
	//=================================================
	function graduateDaySearchCheck(){
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		//-------------------
		var searchFormObj = $("[name='staffSearchForm']");
		//-------------------
		var year_start = searchFormObj.find(".graduate_day_year_start");
		var month_start = searchFormObj.find(".graduate_day_month_start");
		var year_end = searchFormObj.find(".graduate_day_year_end");
		var month_end = searchFormObj.find(".graduate_day_month_end");
		//-------------------

		//-------------------
		year_start.append("<option disabled selected value=''>년</option>");
		month_start.append("<option disabled selected value=''>월</option>");
		year_end.append("<option disabled selected value=''>년</option>");
		month_end.append("<option disabled selected value=''>월</option>");
		
		for(var i = 1960; i <= year; i++){
			year_start.append("<option value="+i+">"+i+"</option>");
			year_end.append("<option value="+i+">"+i+"</option>");
		}
		//-------------------

		//-------------------
		// 졸업 년 값 변경 시, 월 값 넣어주기
		year_start.change(function(){
			var thisObj = $(this);
			var endNum = changeMonth(thisObj, month_start);
			month_start.find("[value='1']").prop("selected", true);				
			graduateDayRangeCheck(year_start, month_start);
		});
		
		year_end.change(function(){
			var thisObj = $(this);
			var endNum = changeMonth(thisObj, month_end);
			month_end.find("[value="+endNum+"]").prop("selected", true);				
			graduateDayRangeCheck(year_end, month_end);
		});
		//-------------------
		
		//-------------------
		// 월 선택 시 졸업일 유효 범위 체크 함수 호출
		month_start.change(function(){ graduateDayRangeCheck(year_start, month_start); });
		month_end.change(function(){ graduateDayRangeCheck(year_end, month_end); });
		//-------------------

		//-------------------
		// 월 selectbox에 option 태그 넣어주고 마지막 월을 리턴하는 함수 선언
		function changeMonth(yearObj, monthObj){
			var thisValue = yearObj.val();
			var endNum = 12;
			//-------------------
			selectEmptyAppend(monthObj, "월");
			//-------------------
			if( thisValue == year ){endNum = month;}
			//-------------------
			for(var j = 1; j <=endNum; j++){
				monthObj.append("<option value="+j+">"+j+"</option>");
			}
			//-------------------
			return endNum;
		}
		//-------------------
		
		//-------------------
		// select 태그 자식(=option태그) 삭제하고 disable 태그 넣어주는 함수 선언
		function selectEmptyAppend(obj, str){
			obj.empty();
			obj.append("<option disabled selected value=''>"+str+"</option>");
		} 
		//-------------------

		//-------------------
		// 미니멈 년, 월 맥시멈 년, 월 모두 선택되었을 때 미니멈 년월이 맥시멈 년월보다 크면 경고 후 비우기
		function graduateDayRangeCheck(yearObj, monthObj){
			var year_start_val = parseInt(year_start.val(),10);
			var month_start_val = parseInt(month_start.val(),10);
			var year_end_val = parseInt(year_end.val(),10);
			var month_end_val = parseInt(month_end.val(),10);
			var flag = true;
			//-------------------
			console.log("------------");
			console.log(year_start_val);
			console.log(month_start_val);
			console.log(year_end_val);
			console.log(month_end_val);
			console.log("------------");
			//-------------------
			if(month_start_val == null || month_end_val == null) {return flag;}
			//-------------------
			// 시작 졸업연도가 끝 졸업연도보다 클 경우, 매개변수로 들어온 년도의 선택값을 지우기
			if( year_start_val > year_end_val ){
				alert("졸업일의 최소날짜가 최대날짜보다 큽니다. 다시 선택해 주세요.");
				yearObj.find("[value='']").prop("selected", true);
				selectEmptyAppend(monthObj, "월");	// 월 option 값 지우는 함수 호출
				yearObj.focus();					// 매개변수로 들어온 년도에 포커스 넣기
				flag = false;
			} 
			// 시작 졸업연도와 끝 졸업연도가 같고, 시작 월이 끝 월보다 클 경우, 매개변수로 들어온 년도에 change 이벤트 호출
			else if( (year_start_val == year_end_val) && (month_start_val > month_end_val) ){
				alert("졸업일의 최소날짜가 최대날짜보다 큽니다. 다시 선택해 주세요.");
				yearObj.change();		// 매개변수로 들어온 년도에 change 이벤트 호출, 시작 월이면 1 선택, 끝 월이면 마지막 월이 선택되도록 하기 위해
				flag = false;
			}
			//-------------------
			return flag;
		}
		//-------------------
		
	}
	
	//=================================================
	// 검색 버튼 클릭 시 호출되는 함수 선언
	//=================================================
	function search(){
		var searchFormObj = $("[name='staffSearchForm']");
		//-------------------
		var keyword = searchFormObj.find(".keyword").val();
		var year_start = searchFormObj.find(".graduate_day_year_start").val();
		var month_start = searchFormObj.find(".graduate_day_month_start").val();
		var year_end = searchFormObj.find(".graduate_day_year_end").val();
		var month_end = searchFormObj.find(".graduate_day_month_end").val();
		//-------------------
		
		//-------------------
		// 이름 키워드 비었는지 확인
		if( keyword == null || keyword.split(" ").join("") == "" ){
			keyword = "";
		}
		searchFormObj.find(".keyword").val($.trim(keyword));
		//-------------------

		/*
		// 21.09.25 졸업일 수정 (graduateDaySearchCheck() 함수로 분리)
		//-------------------
		// 졸업 연도 혹은 졸업 월을 선택 안했을 경우
		if( (year_start == null && month_start != null) || (year_end == null && month_end != null) ){
			alert("졸업 연도를 선택해 주세요.");
			return;
		} else if ( (year_start != null && month_start == null) || (year_end != null && month_end == null) ) {
			alert("졸업 월을 선택해 주세요.");
			return;
		}
		//-------------------

		//-------------------
		// 졸업일 최대날짜는 선택했는데 최소날짜 선택안했을 경우, 혹은 반대의 경우
		if( year_start == null && month_start == null && year_end != null && month_end != null ){
			alert("졸업일의 최소날짜를 선택해 주세요.");
			return;
		} else if(year_start != null && month_start != null && year_end == null && month_end == null){
			alert("졸업일의 최대날짜를 선택해 주세요.");
			return;

		}
		//-------------------
		
		//-------------------
		// 졸업일 최소날짜 가 최대날짜 보다 크면 경고 메시지 보이고 검색하지 않음.
		if( (year_start > year_end) || (year_start == year_end && month_start > month_end) ){
			alert("선택한 졸업일의 최소날짜가 최대날짜보다 큽니다. 다시 선택해 주세요.");
			return;
		} 
		//-------------------
		*/

		//-------------------
		searchExe();
		//-------------------
	}

	//=================================================
	// 전부 검색 버튼 클릭 시 호출되는 함수 선언
	//=================================================
	function searchAll(){
		var searchFormObj = $("[name='staffSearchForm']");
		//-------------------
		searchFormObj.find(".keyword").val("");
		searchFormObj.find(".gender").prop("checked", false);
		searchFormObj.find(".religion_code").val("").prop("selected", true);
		searchFormObj.find(".school_code").prop("checked", false);
		searchFormObj.find(".skill_code").prop("checked", false);
		searchFormObj.find(".graduate_day_year_start").val("").prop("selected", true);
		searchFormObj.find(".graduate_day_month_start").val("").prop("selected", true);
		searchFormObj.find(".graduate_day_year_end").val("").prop("selected", true);
		searchFormObj.find(".graduate_day_month_end").val("").prop("selected", true);
		//-------------------
		searchFormObj.find(".selectPageNo").val(1);
		//-------------------
		searchExe();
		//-------------------
	}

	//=================================================
	// 웹서버에 접근해서 검색 결과 가져오는 함수 선언
	//=================================================
	function searchExe(){
		var searchFormObj = $("[name='staffSearchForm']");
		//-------------------
		console.log("searchExe serialize => " + searchFormObj.serialize());
		//-------------------
		$.ajax({
			url: "/staff_search_form.do"
			,type: "post"
			,data: searchFormObj.serialize()
			,success:function(responseHtml){
				//-------------------
				$(".searchResult").html($(responseHtml).find(".searchResult").html()); 
				// 테이블 이벤트 함수 호출
				tableTrEvent();
				tableThSortAppend();
				// 페이지 번호 변경 함수 호출
				search_with_changePageNo();
				// ~개씩 보기 함수 호출
				rowCntPerPageEvent();
				//-------------------
				// 검색 건수
				var staffListCnt = $(".searchResult").find(".staffListCnt").text();
					staffListCnt = parseInt(staffListCnt, 10);
				// 검색 건수가 0이면
				if(staffListCnt == 0){
					$(".searchResult").find("tbody").append("<td colspan='6' class='noSearch'>검색 결과가 없습니다!<br>다시 검색해주세요.");
				} 
				//-------------------
				var rowCntNo = $(".rowCntPerPage").val();
				$(".rowCntPerPageNo").find("[value="+rowCntNo+"]").prop("selected", true);
			}
			,error:function(){ alert("서버 통신 실패!"); }
		});
		//-------------------

	}

	//=================================================
	// 테이블 이벤트 설정
	//=================================================
	function tableTrEvent(){
		
		// 이름 열 클릭 시 정렬
		$(".staff_name_th").click(function(){ tableThSort($(this), "staff_name"); });

		// 성별 열 클릭 시 정렬
		$(".gender_th").click(function(){ tableThSort($(this), "gender"); });

		// 종교 열 클릭 시 정렬
		$(".religion_th").click(function(){ tableThSort($(this), "religion_name"); });

		// 스킬 열 클릭 시 정렬
		$(".skill_th").click(function(){ tableThSort($(this), "skill_name"); });

		// 졸업일 열 클릭 시 정렬
		$(".graduate_day_th").click(function(){ tableThSort($(this), "graduate_day"); });

		// 행 클릭 시
		$(".searchTr").click(function(){
			var thisObj = $(this);
			var id = thisObj.attr("id");	
			// 수정 화면 불러오는 함수 호출
			getUpdelForm(id);
		});
	}

	//=================================================
	// 테이블 열 정렬 함수 선언
	//=================================================
	function tableThSort(obj, sortStr){
		var text = obj.text();
			text = $.trim(text);
		//-------------------
		if( text.indexOf("▲") >= 0 ){ $(".sort").val(""); } 
		else if( text.indexOf("▼") >= 0 ) { $(".sort").val(sortStr+ " asc"); } 
		else { $(".sort").val(sortStr+" desc"); }
		//-------------------
		search();
	}

	//=================================================
	// 테이블 열 정렬 후 ▲, ▼ 추가 여부 확인하는 함수 선언
	//=================================================
	function tableThSortAppend(){
		//-------------------
		var sort=$(".sort").val();
		//-------------------
		if(sort=="staff_name asc"){ $(".staff_name_th").append("▲"); } 
		else if(sort=="staff_name desc"){ $(".staff_name_th").append("▼"); } 
		//-------------------
		if(sort=="gender asc"){ $(".gender_th").append("▲"); } 
		else if(sort=="gender desc"){ $(".gender_th").append("▼");	} 
		//-------------------
		if(sort=="religion_name asc"){ $(".religion_th").append("▲"); } 
		else if(sort=="religion_name desc"){ $(".religion_th").append("▼"); } 
		//-------------------
		if(sort=="skill_name asc"){ $(".skill_th").append("▲"); } 
		else if(sort=="skill_name desc"){ $(".skill_th").append("▼"); } 
		//-------------------
		if(sort=="graduate_day asc"){ $(".graduate_day_th").append("▲"); } 
		else if(sort=="graduate_day desc"){ $(".graduate_day_th").append("▼");	} 
		//-------------------
		
	}

	//=================================================
	// 페이지 번호 변경 함수 선언
	//=================================================
	function search_with_changePageNo(){
		// 페이지 번호 클릭 시 
		$(".changePageNo").click(function(){
			var thisObj = $(this);
			var id = thisObj.attr("id");
			// selectPageNo 히든 태그 value 값 넣어주기
			$(".selectPageNo").val(id);
			// 검색 함수 호출
			search();
		});

	}

	//=================================================
	// ~개씩 보기 값 변경 시 검색 함수 호출하는 함수 선언
	//=================================================
	function rowCntPerPageEvent(){
		$(".rowCntPerPageNo").change(function(){
			//alert($(this).val());
			$(".rowCntPerPage").val($(this).val());
			search();
		});
	}

	//=================================================
	// 등록화면 불러오는 함수 선언
	//=================================================
	function getInputFormExe(){
		console.log("등록화면 가져온다!");
		//-------------------
		$.ajax({
			url: "/staff_input_form.do"
			,type: "post"
			,success:function(responseHtml){
				//-------------------
				// 모달 보이기
				$(".modal-state").prop("checked", true);
				// 등록화면 넣어주기
				$(".staffFormContainer").html($(responseHtml).find(".inputContainer").html());
				//-------------------
				// 등록 버튼 클릭 시
				$(".inputFormBtn").click(function(){ checkStaffInputForm(); });
				//-------------------
				// 주민번호1, 2 입력 시 숫자인지 체크하는 함수 호출
				$(".jumin_num1").keyup(function(){ onlyNumberCheck($(this)); });
				$(".jumin_num2").keyup(function(){ onlyNumberCheck($(this)); });
				//-------------------
				// 졸업일 select box의 option 값 넣어주는 함수 호출
				graduateDayCheck();
				//-------------------

			}
			,error:function(){ alert("서버 통신 실패!"); }
		});	
		//-------------------
	}


	//=================================================
	// 등록하기 화면에서 등록 버튼 클릭 시 호출되는 함수 선언
	//=================================================
	function checkStaffInputForm(){

 		//-------------------
		var inputFormObj = $("[name='staffInputForm']");
 		//-------------------
 		// 입력 양식 체크하는 함수 호출
		if( !checkForm(inputFormObj) ){return;}
 		//-------------------
		// 저장 여부 확인
		if( confirm("정말 저장 하시겠습니까?") == false ){return;}
		//-------------------
/* 		console.log("jumin_num => " + inputFormObj.find(".jumin_num").val());
		console.log("graduate_day => " + inputFormObj.find(".graduate_day").val());
		console.log(inputFormObj.serialize()); */
		//-------------------
		// 비동기 방식으로 웹서버와 통신하기
		$.ajax({
			url: "/staff_input_proc.do"
			,type: "post"
			,data: inputFormObj.serialize()
			,success: function(json){
				//-------------------
				console.log(json);
				//-------------------
				var staffInsertCnt = json.staffInsertCnt;
				var msg = json.msg;
				//-------------------
				console.log(staffInsertCnt);
				console.log(msg);
				//-------------------
				if( msg != null && msg.length > 0 ){ alert(msg); return; }
				//-------------------
				if( staffInsertCnt == 1 ){ alert("사원 정보 등록 성공!"); modalClose(); } 
				else if ( staffInsertCnt == -1 ){ alert("이미 등록된 주민번호 입니다."); inputFormObj.find(".jumin_num1").focus(); } 
				else if ( staffInsertCnt == -2 ) { alert("사원 정보 등록 실패!"); } 
				else if ( staffInsertCnt == -3 ){ alert("사원 스킬 정보 등록 실패!"); }
				//-------------------
				
			}
			,error: function(){ alert("서버 통신 실패!"); }
		});	
		//-------------------
		
	}
	
	//=================================================
	// 입력양식 비었는지, 올바른 주민번호인지 확인하는 함수 선언
	// 주민번호, 졸업일 히든 태그에 value 값 넣어줌
	//=================================================
	function checkForm(formObj){
		var flag = true;
		//-------------------
		var staff_nameObj = formObj.find(".staff_name");
		var jumin_num1Obj = formObj.find(".jumin_num1");
		var jumin_num2Obj = formObj.find(".jumin_num2");
		var religion_codeObj = formObj.find(".religion_code");
		var school_codeObj = formObj.find(".school_code");
		var skill_codeObj = formObj.find(".skill_code");
		var graduate_day_yearObj = formObj.find(".graduate_day_year");
		var graduate_day_monthObj = formObj.find(".graduate_day_month");
		var graduate_day_dayObj = formObj.find(".graduate_day_day");
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
		if( !requiredCheck(staff_nameObj, "이름") ){ return false;}
		if( !requiredCheck(jumin_num1Obj, "첫번째 주민번호") ){return false;}
		if( !requiredCheck(jumin_num2Obj, "두번째 주민번호") ){return false;}
		if( !requiredCheck(religion_codeObj, "종교") ){return false;}
		if( !requiredRadioCheckboxCheck(school_codeObj, "학력") ){return false;}
		if( !requiredRadioCheckboxCheck(skill_codeObj, "스킬") ){return false;}
		if( !requiredCheck(graduate_day_yearObj, "졸업연도") ){return false;}
		if( !requiredCheck(graduate_day_monthObj, "졸업월") ){return false;}
		if( !requiredCheck(graduate_day_dayObj, "졸업일") ){return false;}
		//-------------------
		
		//-------------------
		// 올바른 주민번호를 입력 했는지 체크
		var regExp = new RegExp( /^\d{2}([0]{1}\d{1})|([1]{1}[0-2]{1})[0-3]{1}\d{1}$/ );
		
		if(!regExp.test(jumin_num1)){
			alert("올바른 주민번호를 입력해 주세요.");
			jumin_num1Obj.focus();
			return false;
		}
		
		if(!(jumin_num2.length == 7)){
			alert("올바른 주민번호를 입력해 주세요.");
			jumin_num2Obj.focus();
			return false;
		}
		//-------------------
		
		//-------------------
		// 졸업 월, 일 10 미만 숫자인 경우 0 붙여주기
		if(graduate_day_month < 10){ graduate_day_month = "0" + graduate_day_month; }
		if(graduate_day_day < 10){ graduate_day_day = "0" + graduate_day_day; }
		//-------------------

		//-------------------
		// 주민번호, 졸업일 히든 태그에 value 값 저장
		formObj.find(".jumin_num").val(jumin_num1 + jumin_num2);
		formObj.find(".graduate_day").val(graduate_day_year + graduate_day_month + graduate_day_day);
		//-------------------
		
		return flag;
	}

	//=================================================
	// 입력 여부 체크 함수 선언, 입력 안되어 있으면 false를 리턴함(인풋, 셀렉트용)
	//=================================================
	function requiredCheck(obj, msgStr){
		var flag = true;
		var objValue=obj.val();
		//-------------------
		if( objValue == null || objValue.split(" ").join("") == "" ){
			objValue = "";
			alert(msgStr + " 을(를) 입력해 주세요.");
			obj.focus();
			flag = false;
		}
		//-------------------
		return flag;
	}
	
	//=================================================
	// 입력 여부 체크 함수 선언, 입력 안되어 있으면 false를 리턴함 (라디오, 체크박스용)
	//=================================================
	function requiredRadioCheckboxCheck(obj, msgStr){
		var flag = true;
		var length = obj.filter(":checked").length;
		//-------------------
		if(length <= 0){
			alert(msgStr + " 을(를) 선택해 주세요.");
			flag = false;
		} 
		//-------------------
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
	// 졸업일 select에 option 값 넣어주는 함수 선언
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

	//=================================================
	// 수정 화면 불러오는 함수 선언
	//=================================================
	function getUpdelForm(staff_no){
		$.ajax({
			url: "/staff_updel_form.do"
			,type: "post"
			,success:function(responseHtml){
				//-------------------
				// 모달 보이기
				$(".modal-state").prop("checked", true);
				// 등록화면 넣어주기
				$(".staffFormContainer").html($(responseHtml).find(".updelContainer").html());
				//-------------------
				// 수정 버튼 클릭 시
				$(".upFormBtn").click(function(){ checkStaffUpdelForm("up"); });
				//-------------------
				// 삭제 버튼 클릭 시
				$(".delFormBtn").click(function(){ checkStaffUpdelForm("del"); });
				//-------------------
				// 주민번호1, 2 입력 시 숫자인지 체크하는 함수 호출
				$(".jumin_num1").keyup(function(){ onlyNumberCheck($(this)); });
				$(".jumin_num2").keyup(function(){ onlyNumberCheck($(this)); });
				//-------------------
				// 졸업일 select box의 option 값 넣어주는 함수 호출
				graduateDayCheck();
				//-------------------
				// 사원 정보 가져오는 함수 호출
				getUpdelFormData(staff_no);
				
			}
			,error:function(){ alert("서버 통신 실패!"); }
		});
		//-------------------
	}

	//=================================================
	// 수정 화면에서 보여줄 사원 정보 가져오는 함수 선언
	//=================================================
	function getUpdelFormData(staff_no){
		// 사원 정보를 json으로 가져옴		
		$.ajax({
			url: "/staff_updel_form_data.do"
			,type: "post"
			,data: "staff_no=" + staff_no
			,success:function(json){
				//-------------------
				var staff = json.staff;
				var staffUpdelFormObj = $("[name='staffUpdelForm']");
				//-------------------
				console.log(staff);
				//-------------------
				// 입력양식에 값 넣어주기
				staffUpdelFormObj.find(".staff_no").val(staff.staff_no);
				staffUpdelFormObj.find(".staff_name").val(staff.staff_name);
				staffUpdelFormObj.find(".jumin_num1").val(staff.jumin_num.substr(0, 6));
				staffUpdelFormObj.find(".jumin_num2").val(staff.jumin_num.substr(6, 7));
				staffUpdelFormObj.find(".religion_code").val(staff.religion_code).prop("selected", true);
 				staffUpdelFormObj.find(".school_code").filter("[value='"+staff.school_code+"']").prop("checked", true);

				for(var j = 0; j < staff.skill_code.length; j++){
					staffUpdelFormObj.find(".skill_code").filter("[value='"+staff.skill_code[j]+"']").prop("checked", true);
				} 

				staffUpdelFormObj.find(".graduate_day_year").val(parseInt(staff.graduate_day.substr(0,4))).prop("selected", true);
				staffUpdelFormObj.find(".graduate_day_year").change();
				staffUpdelFormObj.find(".graduate_day_month").val(parseInt(staff.graduate_day.substr(4,2))).prop("selected", true);
				staffUpdelFormObj.find(".graduate_day_month").change();
				staffUpdelFormObj.find(".graduate_day_day").val(parseInt(staff.graduate_day.substr(6,2))).prop("selected", true);
				//-------------------
			}
			,error:function(){ alert("서버 통신 실패!"); }
		});		
		//-------------------
	}

	//=================================================
	// 수정하기 화면에서 수정 버튼 클릭 시 호출되는 함수 선언
	//=================================================
	function checkStaffUpdelForm(upDel){
 		//-------------------
		var updelFormObj = $("[name='staffUpdelForm']");
 		//-------------------
 		// upDel 히든 태그에 value 값 넣어주기
 		$(".upDel").val(upDel);
 		//-------------------
		if(upDel == "del"){
	 		//-------------------
			// 삭제 여부 확인
			if(confirm("정말 삭제 하시겠습니까?") == false){return;}
	 		//-------------------
		} else if( upDel == "up" ){
	 		//-------------------
 			// 입력 양식 체크하는 함수 호출
			if( !checkForm(updelFormObj) ){return;}
	 		//-------------------
			// 수정 여부 확인
			if( confirm("정말 수정 하시겠습니까?") == false ){return;}
		}
		//-------------------
		console.log("updelFormObj serialize => " + updelFormObj.serialize());
		//-------------------
		$.ajax({
			url: "/staff_updel_proc.do"
			,type: "post"
			,data: updelFormObj.serialize()
			,success: function(json){
				//-------------------
				console.log(json);
				//-------------------
				var staffUpdelCnt = json.staffUpdelCnt;
				var msg = json.msg;
				//-------------------
				console.log(staffUpdelCnt);
				console.log(msg);
				//-------------------
				if( msg != null && msg.length > 0 ){ alert(msg); return; }
				//-------------------
				if( upDel == "del" ){
					//-------------------
					if( staffUpdelCnt == 1 ){ alert("사원 정보 삭제 성공!"); modalClose(); } 
					else if( staffUpdelCnt == -1 ){ alert("이미 삭제된 사원 정보 입니다."); modalClose(); } 
					else if( staffUpdelCnt == -2 ){ alert("사원 스킬 정보 삭제 실패!"); } 
					else { alert("사원 정보 삭제 실패!"); }
					//-------------------
				} else if( upDel == "up" ){
					//-------------------
					if( staffUpdelCnt == 1 ){ alert("사원 정보 수정 성공!"); modalClose(); } 
					else if( staffUpdelCnt == -1 ) { alert("이미 삭제된 사원 정보 입니다."); modalClose(); } 
					else if( staffUpdelCnt == -2 ){ alert("주민번호가 중복되었습니다."); updelFormObj.find(".jumin_num1").focus(); } 
					else if( staffUpdelCnt == -3 || staffUpdelCnt == -4 ){ alert("사원 스킬 정보 수정 실패!"); } 
					else { alert("사원 정보 수정 실패!"); }
					//-------------------
				}
				//-------------------
				
			}
			,error: function(){ alert("서버 통신 실패!"); }
		});
		//-------------------
	}

	//=================================================
	// 모달 창 닫고, 전부 검색 처리하는 함수 선언
	//=================================================
	function modalClose(){
		$(".modal__close").click();
		$(".staffSearchAllBtn").click();
	}

</script>


</head>

<body>


<center>


<div class="container">
	<span class="logoutBtnWrap"><b>${login_id}</b>님 안녕하세요😊 <button class="logoutBtn btn">로그아웃</button></span>
	<br/>
	<h2>사원 정보 검색</h2>

	<!-- 검색 영역 -->
	<form name="staffSearchForm" onSubmit="return false;">
		<!-- 21.09.23 키워드 수정으로 변경 -->
		<!-- <span><input type="text" name="keyword" class="keyword form-control" style="height:2.5rem;"></span> -->
	<!-- 	<input type="button" class="detailSearch btn" value="상세검색 ▼" style="width:80px;"> -->
		<table class="tbcss1">
			<tr>
				<th>키워드</th>
				<td colspan="3">
					<!-- name_keyword -> keyword 로 변경, 21.09.25 수정 -->
					<input type="text" name="keyword" class="keyword form-control" > 
				</td>
			
			</tr> 
			<tr>
				<th>성별</th>
				<td>
					<input type="checkbox" name="gender" class="gender input-checkbox" value="남">남
					<input type="checkbox" name="gender" class="gender input-checkbox" value="여">여
				</td>
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
						<input type="checkbox" name="school_code" class="school_code input-checkbox" value="${schoolMap.school_code}">${schoolMap.school_name}
					</c:forEach>
				</td>
				<th>기술</th>
				<td colspan="3">
					<!-- 기술 리스트 표현 -->
					<c:forEach var="skillMap" items="${skillList}">
						<input type="checkbox" name="skill_code" class="skill_code input-checkbox" value="${skillMap.skill_code}">${skillMap.skill_name}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>졸업일</th>
				<td colspan="5">
					<select name="graduate_day_year_start" class="graduate_day_year_start form-control">
					</select>
					<select name="graduate_day_month_start" class="graduate_day_month_start form-control">
					</select> ~ 
					<select name="graduate_day_year_end" class="graduate_day_year_end form-control">
					</select>
					<select name="graduate_day_month_end" class="graduate_day_month_end form-control">
					</select>
				</td>
			</tr>
		</table>
		
		<div style="height:12px;"></div>
		
		<!-- 버튼 영역 -->
		<input type="button" class="staffSearchBtn btn" value="검색">
		<input type="button" class="staffSearchAllBtn btn" value="전부검색">
		<input type="reset" class="btn" value="초기화">
		<input type="button" class="goInputFormBtn btn" value="등록">
		
		<!-- 히든 영역 -->
		<input type="hidden" name="sort" class="sort">
		<input type="hidden" name="selectPageNo" class="selectPageNo" value="1">
		<input type="hidden" name="rowCntPerPage" class="rowCntPerPage" value="10">
	</form>
	
	
	
	<!-- 검색 목록 -->
	<div class="searchResult">
		<div class="searchCnt">
			검색건수 --> <span class="staffListCnt">${staffListCnt}</span>건
			<select class="rowCntPerPageNo form-control">
				<c:forEach var="no" begin="10" end="30" step="5">
					<option value="${no}">${no}개씩</option>			
				</c:forEach>		
			</select> 
		</div>
		<table class="tbcss0">
			<tr class="headTr">	
				<th>번호</th>
				<th><span class="staff_name_th">이름</span></th>
				<th><span class="gender_th">성별</span></th>
				<th><span class="religion_th">종교</span></th>
				<th><span class="skill_th">스킬</span></th>
				<th><span class="graduate_day_th">졸업일</span></th>
			</tr>
			<c:forEach var="staff" items="${staffList}" varStatus="loopTagStatus">
				<tr id="${staff.staff_no}" class="searchTr">
					<td>${pagingMap.selectPageNo*pagingMap.rowCntPerPage-pagingMap.rowCntPerPage+1+loopTagStatus.index}</td>
					<td>${staff.staff_name}</td>
					<td>${staff.gender}</td>
					<td>${staff.religion_name}</td>
					<td>${staff.skill_name}</td>
					<td>${staff.graduate_day}</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 페이징 처리 -->
		<div class="pageNo">			 
			<c:if test="${staffListCnt>0}">
				<c:if test="${pagingMap.selectPageNo>1}">
					<span class="changePageNo" id="1">[처음]</span>
					<span class="changePageNo" id="${pagingMap.selectPageNo-1}">[이전]</span>
				</c:if> 
				
				<c:forEach var="no" begin="${pagingMap.min_pageNo}" end="${pagingMap.max_pageNo}" step="1">
					<c:if test="${no==pagingMap.selectPageNo}">
						<span class="selectThisPage">${no}</span>
					</c:if>
					<c:if test="${no!=pagingMap.selectPageNo}">
						<span class="changePageNo" id="${no}">[${no}]</span>
					</c:if>
				</c:forEach>
				
				<c:if test="${pagingMap.selectPageNo<pagingMap.last_pageNo}">
					<span class="changePageNo" id="${pagingMap.selectPageNo+1}">[다음]</span>
					<span class="changePageNo" id="${pagingMap.last_pageNo}">[마지막]</span>
				</c:if>
			</c:if>
		</div>
	</div>
	
	
	<!-- 모달 -->
	<input class="modal-state" id="modal-1" type="checkbox" /> 
	<div class="modal">
  		<label class="modal__bg" for="modal-1"></label>
  		<div class="modal__inner">
  			<!-- 닫기 버튼 -->
    		<label class="modal__close" for="modal-1"></label>
  			<center>
  				<!-- 가져온 html 덮어쓰기할 영역 -->
  				<div class="staffFormContainer">
  				</div>  
  			</center>	
    	</div>
  	</div>
  	
  	

</div>
</center>


</body>

</html>
