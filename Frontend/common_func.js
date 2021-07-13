// 매개변수로 들어온 데이터가 비어있거나 공백으로 구성되어 있으면 
// true 리턴, 아니면 false 리턴하는 함수 선언
// 매개변수: str (문자열이 저장되는 매개변수)
function isEmpty(str) {
	var flag = false;   // true/false 변수로 많이 사용한다.
	if( str.split(" ").join("") == "" ) {
		flag = true;
	} 
	return flag;
	// flag 안의 데이터를 리턴한다
}

// 한글 이름 유효성 체크
// 한글 2자 ~ 20자 입력
// 유효성 체크 통과 시 true, 아니면 false 리턴
function isMem_name(mem_name){
	var regExp = new RegExp(/^[가-힣]{2,20}$/);
	return regExp.test(mem_name);
}


// 아이디 유효성 체크
// 첫글자는 영소문자 입력하고, 이후 영소문자 숫자 _ 만 입력가능. 5자~10자 입력
// 유효성 체크 통과 시 true, 아니면 false 리턴
function isUid(uid) {
	var regExp = new RegExp(/^[a-z][a-z0-9_]{4,9}$/);
	return regExp.test(uid);
}

// 비밀번호 유효성 체크
// 영소문자, 숫자, _ 만 입력, 5 ~ 8자 입력
// 유효성 체크 통과 시 true, 아니면 false 리턴
function isPwd(pwd) {
	var regExp = new RegExp(/^[a-z0-9_]{5,8}$/);
	return regExp.test(pwd);
}

// 이메일 체크 함수 선언
// 매개변수로 들어온 이메일 문자가 이메일 문자 패턴에 맞으면 true 리턴
// 틀리면 false 리턴하기
// 매개변수 : email (검사할 문자열, 즉 이메일 문자열이 저장되는 매개변수)
function isValidEmail(email) {
	var regExp = new RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
	return regExp.test(email);
}

// 문자열의 패턴 체크 함수 선언
// 매개변수로 들어온 RegExp 객체와 검사 문자열을 이용하여
// 검사 문자열의 RegExp 객체가 관리하는 문자 패턴에 맞으면 true 리턴
// 틀리면 false 리턴하기
// 매개변수: regExpObj (RegExp 객체의 메모리 위치 주소값이 저장되는 매개변수)
// 			targetStr (패턴을 검사할 문자열이 저장되는 매개변수)
function isValidPattern(regExpObj, targetStr) {
	// RegExp 객체의 test() 메서드 호출하여 받은 리턴값
	return regExpObj.test(targetStr);
}

//------------------------------------------------------------------------------
// checkbox 또는 radio 의 체크 개수 구해서 리턴하는 함수 선언
// arrObj (Array 객체의 메위주가 저장되는 매개변수 선언 
// Array 객체 안의 배열변수 안에는 Radio 객체 또는 checkbox 객체의 메위주가 들어 있다)
//------------------------------------------------------------------------------
function getCheckedCnt( arrObj ) {
	//--------------------------------------------------------------------------
	// len 변수 선언하고 매개변수로 들어온 Array 객체의 배열변수 개수를 구해 저장하기
	// Radio 또는 checkbox 의 체크 개수가 저장되는 변수 checkedCnt 선언하고 0 저장
	//--------------------------------------------------------------------------
	var len = arrObj.length;
	var checkedCnt = 0;

	//------------------------------------------------------------
	// len 변수 안의 데이터가 undefined 면, 
	// 즉 매개변수로 Array 객체가 안들어오고 다른 객체 
	// 즉 Checkbox 객체 또는 Radio 객체가 들어오면 
	// 존재하지 않는 length 라는 속성변수에는 undefined 가 들어 있다
	// Radio 객체 또는 Checkbox 객체의 메위주 상상도를 살펴봐야 한다
	//------------------------------------------------------------
	if(len == undefined) {
		if(!arrObj.checked){
			return 0;
		} else {
			return 1;
		}
	}

	//--------------------------------------------------------------------
	// 반복문 선언, 반복문은 0 ~ len 변수 안의 배열변수 개수 미만 만큼 돈다
	// 반복문을 돌려서 Array 객체의 배열변수 안에 저장된 
	// Radio 객체 또는 checkbox 객체에 접근하기 위하여
	//--------------------------------------------------------------------
	for(var i = 0; i < len; i++) {
		//-----------------------------------------------------------------------------
		// 만약 i 번째 배열변수 안의 Radio 객체 또는 checkbox 객체의 속성변수
		// checked 에 true가 저장되어 있으면 checkedCnt 변수 안의 숫자를 1 업데이트하기
		// 즉, i 번째 Radio 또는 checkbox 입력양식에 체크가 되어 있으면 
		// checkedCnt 변수 안의 숫자를 1 업데이트하기
		//-----------------------------------------------------------------------------
		if(arrObj[i].checked) { checkedCnt++; }
	}
	//-----------------------------------------------------
	// checkedCnt 변수 안의 데이터 리턴하기
	// 즉, Radio 또는 checkbox 입력양식에 체크 개수 리턴하기
	//-----------------------------------------------------
	return checkedCnt;

}
