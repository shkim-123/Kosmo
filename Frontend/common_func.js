// 매개변수로 들어온 데이터가 비어있거나 공백으로 구성되어 있으면 
// true 리턴, 아니면 false 리턴하는 함수 선언
function isEmpty(str) {
	var flag = false;   // true/false 변수로 많이 사용한다.
	if( str.split(" ").join("") == "" ) {
		flag = true;
	} 
	return flag;
}