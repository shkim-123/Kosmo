

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


