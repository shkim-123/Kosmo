<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ************************************************************* -->
<!-- 현재 JSP 페이지에서 사용할 클래스 수입하기 -->
<!-- ************************************************************* -->
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<!-- ************************************************************* -->
<%@include file="../common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- flatpicker -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
.searchResult tr td{
	cursor: pointer;
}

th {
	background-color: ${thBgcolor};
}

.searchResult tr {
	text-align: center;
}

.modal { 
	position: absolute; 
	top: 0; 
	left: 0; 
	width: 100%; 
	height: 100%; 
	display: none; 
	background-color: rgba(0, 0, 0, 0.4); 
}

.modal_body { 
	position: absolute; 
	top: 50%; 
	left: 50%; 
	width: 400px; 
	height: 600px; 
	padding: 40px; 
	text-align: center; 
	background-color: rgb(255, 255, 255); 
	border-radius: 10px; 
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
	transform: translateX(-50%) translateY(-50%); 
}

.hire_date{
	width: 100px;
}

.mgr_emp_name,.dep_name{
	padding: 0 7px;
}

img {
	padding-top : 7px;
}
</style>

<script>

	$(document).ready(function(){

		// $(".hire_date_year_end option").last().attr("selected", true);
		// $(".hire_date_month_end option").last().attr("selected", true);
		flatpickr();
		changeBgColor();
		
		// 검색 버튼 클릭 시
		$("[name='empSearchForm'] .empSearchBtn").click(function(){
			search();
		});

		// 모두 검색 버튼 클릭 시
		$(".empSearchAllBtn").click(function(){
			$(".keyword").val("");
			$(".jikup").prop("checked", false);
			$(".dep_name").prop("checked", false);
/* 			$(".hire_date_year_start").val("1980").prop("selected", true);
			$(".hire_date_month_start").val("1").prop("selected", true);
			$(".hire_date_year_end").val("2021").prop("selected", true);
			$(".hire_date_month_end").val("12").prop("selected", true); */
			flatpickr();

			search();
			
		});

		// 직원 등록 버튼 클릭 시
		$(".goEmpRegFormBtn").click(function(){
			//location.replace("/empRegForm.do");
			getEmpRegForm();
		});

		// 모달창 닫기 버튼 클릭 시
		$(".closeBtn").click(function(){
			$(".modal").css("display", "none");	
		});
			
		
	});

	// 비동기 검색 
	function search(){

		console.log($("[name='empSearchForm']").serialize());

		//=================================================
		// 검색 비동기 방식
		//=================================================
		$.ajax({
			url: "/${requestScope.naverPath}employeeList.do"
			,type: "post"
			,data: $("[name='empSearchForm']").serialize()
			,success:function(responseHtml){
				// console.log(responseHtml);
				// 검색 결과 반영
				$(".searchResult").html($(responseHtml).find(".searchResult").html());

				changeBgColor();
				
			}
			,error:function(){
				alert("서버 통신 실패");
			}
		});
	}

	// 글 선택 시
	function goContentForm(emp_no){

		// 상세 화면으로 이동
		//$("[name='goEmpContentForm']").find(".emp_no").val(emp_no);
		//document.goEmpContentForm.submit();

		// 수정/삭제 화면으로 이동
		$("[name='goEmpUpDelForm']").find(".emp_no").val(emp_no);
		// document.goEmpUpDelForm.submit();
		
		// 수정/삭제 화면 가져오기
		getEmpUpDelForm();
		
	}
	
	//=================================================
	// selectBox/checkbox 선택 시 값 변경 이벤트, 입력양식 이벤트
	//=================================================
	function selectEvent(){

		// 부서번호 변경 시 부서명 변경되도록
		$(".dep_no").change(function(){
			var dep_no = $(this).val();
			
 			<c:forEach var ="dept" items="${deptList}">
				if(${dept.dep_no} == dep_no){
					$(".dep_name").text("${dept.dep_name}");
				}
			</c:forEach>		 

		});

		// 상사번호 변경 시 상사이름 변경되도록
		$(".mgr_emp_no").change(function(){
			var mgr_emp_no = $(this).val();

			<c:forEach var="empNoName" items="${empNoNameList}">
				if(${empNoName.emp_no} == mgr_emp_no){
					$(".mgr_emp_name").text("${empNoName.emp_name}");
				}
			</c:forEach>
		});


		// 상사번호 없음 선택 선택 시
		var mgr_emp_name = "";
		$(".mgr_emp_no_chkbox").change(function(){
			var chkbox = $(this);
			var mgrEmpNameObj = $(".mgr_emp_name");

			$(".mgr_emp_no").prop("disabled", chkbox.prop("checked"));

			
			if(chkbox.prop("checked")){
				mgr_emp_name = mgrEmpNameObj.text();
				mgrEmpNameObj.text("-");
			} else {
				mgrEmpNameObj.text(mgr_emp_name);
			}

		});


		// 연봉에 숫자만 입력되도록 설정
		$(".salary").keyup(function(){
			var thisObj = $(this);
			var salary = thisObj.val();
			var num = "";

			// salary에 데이터가 입력된 경우
			if(salary.length > 0 ){
				for(var i = 0; i < salary.length; i++){
					var str = salary.charAt(i);
					// 숫자만 num에 저장
					if("0123456789".indexOf(str) >= 0 ){
						num += str;
					}
				}

				// num 숫자로 변환, 0으로 시작하는 경우 고려
				num = parseInt(num, 10);
				// input에 value값 넣어주기
				thisObj.val(num);
			}
		
		});
		
	}

	//=================================================
	// 직원 등록 html 가져오기
	//=================================================
	function getEmpRegForm(){
		
		$.ajax({
			url: "/${requestScope.naverPath}empRegForm.do"
			,success:function(responseHtml){
				// 모달창 띄우기
				$(".modal").css("display", "block");

				// 불러온 데이터 넣기
				$(".resultWrap").html($(responseHtml).filter(".empRegResult").html());	

				// selectbox 이벤트 걸기
				selectEvent();

				// 직원 등록 이벤트 걸기
				empRegFormEvent();

				// 기본값 주기
				setting();

				// 입사일 이벤트 걸기
				flatpickr();

			}
			,error:function(){
				alert("서버 통신 에러!");
			}
		});
		
	}

	//=================================================
	// 직원 등록하기 비동기 방식
	//=================================================
	function empRegFormEvent(){
		
		$(".empRegFormBtn").click(function(){

			// 파일 업로드 form 설정값 추가
			document.empRegForm.enctype="multipart/form-data";

			console.log($("[name='empRegForm']").serialize());
			
			$.ajax({
				url: "/${requestScope.naverPath}empRegProc.do"
				,type: "post"
				,processData : false
				,contentType : false
				,data : new FormData( $("[name='empRegForm']").get(0) )
/* 				,data: $("[name='empRegForm']").serialize()  */
				,success:function(json){

					var msg = json.msg;
					var insertCnt = json.insertCnt;

					if(msg != "") {alert(msg); return;}
					
					if(insertCnt == 1){
						alert("직원 등록 성공!");
						$(".closeBtn").click();
						$(".empSearchAllBtn").click();
					}

				}
				,error:function(){
					alert("서버 통신 에러!");
				}
			});
			
		});

	}

	//=================================================
	// 직원 수정/삭제 화면 html 가져오기
	//=================================================
	function getEmpUpDelForm(){
		
		$.ajax({
			url: "/${requestScope.naverPath}empUpDelForm.do"
			,data: $("[name='goEmpUpDelForm']").serialize()
			,type: "post"
			,success:function(responseHtml){
				// 모달창 띄우기
				$(".modal").css("display", "block");	
				// 불러온 데이터 html 넣기
				$(".resultWrap").html($(responseHtml).filter(".empUpDelResult").html());
				// selectBox 이벤트 걸기
				selectEvent();

				// 수정/삭제 화면 이벤트 걸기
				empUpDelFormEvent();

				// 입사일 이벤트 걸기, default 때문에 일단 JQuery로 호출함
				//flatpickr();
				$(".hire_date").flatpickr({
					dateFormat: "Y-m-d"
					,minDate: "1980-01"
					,maxDate: "today"
				});
				
				
				
			}
			,error:function(){
				alert("서버 통신 실패!");
			}
		});
		
	}
	

	// 수정/삭제 화면 이벤트 처리
	function empUpDelFormEvent(){
		
		// 삭제하기 버튼 클릭 시 
		$(".empDelFormBtn").click(function(){
			if(!confirm("정말 삭제하시겠습니까?")){return;}

			$("[name='empUpDelForm'] .upDel").val("del");
			
			empUpDelProcEvent();
		});

		// 수정하기 버튼 클릭 시
		$(".empUpFormBtn").click(function(){
			if(!confirm("정말 수정하시겠습니까?")){return;}
			
			$("[name='empUpDelForm'] .upDel").val("up");
			
			empUpDelProcEvent();
			
		});
		
	}

	//=================================================
	// 수정/삭제 비동기 방식
	//=================================================
	function empUpDelProcEvent(){
		
		// 파일 업로드 form 설정값 추가
		document.empUpDelForm.enctype="multipart/form-data";

		console.log($("[name='empUpDelForm']").serialize());

		var upDel = $("[name='empUpDelForm'] .upDel").val();
	
		$.ajax({
			url: "/${requestScope.naverPath}empUpDelProc.do"
			,type: "post"
			,processData : false
			,contentType : false
			,data : new FormData( $("[name='empUpDelForm']").get(0) )
/* 			,data: $("[name='empUpDelForm']").serialize() */
			,success:function(json){
				console.log(json);

				var msg = json.msg;
				var upDelCnt = json.upDelCnt;

				if(msg != "") {alert(msg); return;}

				if(upDel == "up"){
					if(upDelCnt == 1){
						alert("수정 성공!");
						$(".empSearchAllBtn").click();
					} else if(upDelCnt == -1){
						alert("이미 삭제된 직원입니다.");
					}
				}

				if(upDel == "del") {
					
					if(upDelCnt == 1) {
						alert("삭제 성공!");
						$(".empSearchAllBtn").click();
					} else if(upDelCnt == -1) {
						alert("이미 삭제된 직원입니다.");
					} else if(upDelCnt == -2) {
						alert("부하 직원이 있는 직원입니다.");
					} else if(upDelCnt == -3) {
						alert("담당 고객이 있는 직원입니다.");
					}
					
				}

				// 모달 닫기
				$(".closeBtn").click();
				
			}
			,error:function(){
				alert("서버 통신 실패");
			}
		});
		
	}

	// 개발용
	function setting(){
		$(".emp_name").val("이무진");
		$(".salary").val("5000");
		//$(".hire_date").val("2021-09-12");
		$(".jumin_num").val("9012122000000");
		$(".phone").val("01012341234");
	}

	// flatpickr 설정
	function flatpickr(){
		$(".hire_date").flatpickr({
			dateFormat: "Y-m-d"
			,minDate: "1980-01"
			,maxDate: "today"
			,defaultDate : "today"	
		});

		
		// flatpicker 입사일 검색 시작일
		$("[name='hire_date_start']").flatpickr({
			dateFormat: "Y-m-d"
			,minDate: "1980-01"
			,maxDate: "today"
			,defaultDate : "1980-01"	
		});
		
/* 		// flatpicker : https://flatpickr.js.org/
		$(".selector").flatpickr(); */
	}


</script>

</head>

<body>

<center>
	
	<form name="empSearchForm" onSubmit="return false;">
	
		<!-- 검색 영역 -->
		<table border="1" cellpadding="5" class="tbcss2">
			<caption><b>직원검색</b></caption>
			<tr>
				<th>키워드</th>
				<td>
					<input type="text" name="keyword" class="keyword">
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td>
					<!-- 직급 리스트 가져오기 -->
					<c:forEach var="jikup" items="${jikupList}">
						<input type="checkbox" name="jikup" class="jikup" value="${jikup}">${jikup}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<!-- 부서 리스트 가져오기 -->
					<c:forEach var="dep_name" items="${deptList}">
						<input type="checkbox" name="dep_name" class="dep_name" value="${dep_name.dep_name}">${dep_name.dep_name}
					</c:forEach>
					
				</td>
			</tr>
<%-- 			<tr>
				<th>입사일</th>
				<td>
					<select name="hire_date_year_start" class="hire_date_year_start">
						<c:forEach var="num" begin="1980" end="2020" step="1">
							<option value="${num}">${num}</option>
						</c:forEach> 
					</select>년
					<select name="hire_date_month_start" class="hire_date_month_start">
						<c:forEach var="num" begin="1" end="12" step="1">
							<option value="${num}">${num}</option>
						</c:forEach>
					</select>월 ~ 
					<select name="hire_date_year_end" class="hire_date_year_end">
						<c:forEach var="num" begin="1980" end="2021" step="1">
							<option value="${num}">${num}</option>
						</c:forEach> 
					</select>년
					<select name="hire_date_month_end" class="hire_date_month_end">
						<c:forEach var="num" begin="1" end="12" step="1">
							<option value="${num}">${num}</option>
						</c:forEach>
					</select>월
				</td>
			</tr> --%>
			<tr>
				<th>입사일</th>
				<td>
					<input type="text" class="hire_date" name="hire_date_start">
					~
					<input type="text" class="hire_date" name="hire_date_end">
				</td>
			</tr>
		</table>
		
		<div style="padding:10px">
			<input type="button" class="empSearchBtn" value="검색">
			<input type="button" class="empSearchAllBtn" value="모두검색">
		</div>
<!-- 		<input type="reset" class="resetBtn" value="초기화"> -->
		
		<div style="padding:10px">
			<input type="button" class="goEmpRegFormBtn" value="직원등록">
			<input type="button" class="goCustomerListBtn" value="고객관리">
		</div>
		
		
	<!-- 	<input type="button" class="xxxBtn" value="모달창 테스트"> -->
	</form>
	
	<!-- 검색 결과 노출 -->
	<div class="searchResult">
		<div>총 : ${employeeListCnt}</div>
		<table border="1" cellpadding="3" class="tbcss0">
			<tr>
				<th>번호</th>
				<th>직원번호</th>
				<th>직원명</th>
				<th>직급</th>
				<th>입사일</th>
				<th>소속부서명</th>
			</tr>
			
			<!-- DB 연동 결과물 출력 -->
			<c:if test="${!empty employeeList}">
				<c:forEach var="employee" items="${employeeList}" varStatus="loopTagStatus">
					<tr onClick="goContentForm(${employee.emp_no});">
						<td>${employeeListCnt-loopTagStatus.index}</td>
 						<td>${employee.emp_no}</td>
						<td>${employee.emp_name}</td>
						<td>${employee.jikup}</td>
						<td>${employee.hire_date}</td>
						<td>${employee.dep_name}</td>
					</tr>
				</c:forEach>
			</c:if>
				
		</table>
	</div>
	
	
	
	<!-- 상세 화면으로 이동 -->
	<form name="goEmpContentForm" method="post" action="/${requestScope.naverPath}empContentForm.do">
		<input type="hidden" name="emp_no" class="emp_no">
	</form>
	
	<!-- 수정/삭제 화면으로 이동 -->
	<form name="goEmpUpDelForm" method="post" action="/${requestScope.naverPath}empUpDelForm.do">
		<input type="hidden" name="emp_no" class="emp_no">
	</form>
	
	
	
	<!-- ******************************************************* -->
	<!-- 모달로 띄우기 -->
	<!-- ******************************************************* -->
	<div class="modal">
		<div class="modal_body">
			<div class="resultWrap"></div>
			<input type="button" class="closeBtn" value="닫기">
		</div>
	</div>
	
	


</center>

</body>
</html>