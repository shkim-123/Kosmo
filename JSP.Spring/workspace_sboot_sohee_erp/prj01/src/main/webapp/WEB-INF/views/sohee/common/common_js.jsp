<!-- ************************************************************* -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ************************************************************* -->

<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다 라고 설정함  -->
<!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
<!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열을 부호화할 수 있는 방법이다. -->
<!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
$(document).ready(function() {

	$("body").attr("bgcolor", "${bodycolor}");


	// 파일 업로드 용량 제한 이벤트 처리
	$(".img").off().on("change", function(){
		// 업로드한 파일이 있는지 확인
		if(this.files && this.files[0]){

			// 최대 용량 사이즈 지정
			// 업로드한 파일 용량 
			var maxSize = 1*1024*1024;
			var fileSize =this.files[0].size;

			// 만약 업로드한 파일 용량이 최대 용량 사이즈보다 크다면
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 1MB 이내로 등록 가능합니다.");
				// 업로드한 파일 제거
				$(this).val('');
				return false;
			}
			
		}
		
	});
	
});


//--------------------------------------------------------------
//table 태그 내부의 배경색 바꾸는 함수 선언
//--------------------------------------------------------------
function changeBgColor(){
	setTrBgcolor( 
			"tbcss0"		// table tag의 클래스값
			, "${requestScope.headerTrColor}"	// head tr의 배경색값
			, "${requestScope.oddTrColor}"		// head tr 이후의 홀수 tr의 배경색값
			, "${requestScope.evenTrColor}"		// head tr 이후의 짝수 tr의 배경색값
			, "#4db6ac"		// 마우스 올렸을 때 배경색값
	);
}



</script>

