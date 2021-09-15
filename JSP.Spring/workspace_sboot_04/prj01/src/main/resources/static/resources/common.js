

function setTrBgcolor( tableClassV, headBgcolor, oddTrBgcolor, evenTrBgcolor, mouseOverBgcolor ){
	
	try{
	
		var tableObj = $("."+tableClassV);
		var firstTrObj = tableObj.find("tr:first");
		var oddTrObj = firstTrObj.siblings("tr").filter(":even");
		var evenTrObj = firstTrObj.siblings("tr").filter(":odd");
		
		firstTrObj.attr("bgcolor", headBgcolor);
		oddTrObj.attr("bgcolor", oddTrBgcolor);
		evenTrObj.attr("bgcolor", evenTrBgcolor);
		
	/*	oddTrObj.find("td,th").css("color", "#263238");
		evenTrObj.find("td,th").css("color", "#263238");*/
		
		oddTrObj.hover(
			function(){
				$(this).attr("bgcolor", mouseOverBgcolor);	
			}
			, function(){
				$(this).attr("bgcolor", oddTrBgcolor);	
			}
		);
		
		evenTrObj.hover(
			function(){
				$(this).attr("bgcolor", mouseOverBgcolor);	
			}
			, function(){
				$(this).attr("bgcolor", evenTrBgcolor);	
			}
		);
		
	} catch(e) {
		alert("setTrBgcolor 함수 호출 시 예외발생 => " + e.message);
	}

}

//---------------------------------------------

// 랜덤하게 데이터를 뽑아서 리턴
function getRandomData( arr ){
	
	var randomData = "";
	
	var size = arr.length;
	
	randomData = arr[Math.floor(Math.random()*size)]
	
	return randomData;

}

// 랜덤하게 뽑을 데이터의 개수 만큼 뽑아서 Array 객체에 담아서 리턴
// 중복을 허락하지 않음
function getRandomDataArr( arr, cnt ){
	
	var randomDataArr = [];
	var size = arr.length;
	
	if(size >= cnt){
	
		for(var i = 0; i < cnt; i++){
			
			var randomData = getRandomData(arr);
		
			randomDataArr.join("").indexOf(randomData) < 0 ? randomDataArr.push(randomData) : i--;
	
		}
	} else {
		randomDataArr = null;
	}
	
	
	return randomDataArr;

}

// 랜덤하게 뽑을 데이터의 최소 개수, 최대 개수만큼 랜덤하게 뽑아서 Array 객체에 담아서 리턴
function getRandomDataArr2( arr, min_cnt, max_cnt ) {
	
	var randomDataArr = [];
	
	var cnt = Math.floor(Math.random()*(max_cnt-min_cnt+1)) + min_cnt;
	
	randomDataArr = getRandomDataArr( arr, cnt );
	
	return randomDataArr;
	
}

