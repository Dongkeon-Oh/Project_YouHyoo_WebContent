<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  	<head>
    	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    	<script src="moment.js"></script>
    	<meta charset="utf-8">
    	<title>Info windows</title>
    	<style>
      		html, body {
        		height: 100%;
        		margin: 0;
        		padding: 0;
     		}
      		#cal_saturday {
        		background-color: #0080FF;
        		
      		}
      		#cal_sunday {
        		background-color: #FF5050;
      		}
    	</style>
  	</head>
  	<body>
	    <div>
	    	<script>
	    	var days=new Array("일", "월", "화", "수", "목", "금", "토");
    		var checkDay=moment().format('dddd');	// 요일 설정부분
    		    		
    		function setDayForm(){
    	   		var temp=days[0];
        		for(var j=0; j<6; j++){
        			days[j]=days[j+1];
        		}
        		days[6]=temp;        
    		}
    		
    		switch(checkDay){
	    		case 'Saturday': setDayForm();
	    		case 'Friday': setDayForm();
	    		case 'Thursday': setDayForm();
	    		case 'Wednesday': setDayForm();
	    		case 'Tuesday': setDayForm();
				case 'Monday': setDayForm();
			}
    		
    		function printDays(){
	    		for(var i=0; i<2; i++){
		    		for(var j=0; j<days.length; j++){
		    			if(days[j]=='토'){
		    				document.write('<td id="cal_saturday"><font size="2" color="#FFFFFF">'+days[j]+'</font></td>');
		    			}else if(days[j]=='일'){
		    				document.write('<td id="cal_sunday"><font size="2" color="#FFFFFF">'+days[j]+'</font></td>');
		    			}else{
			    			document.write('<td><font size="2" color="#000000">'+days[j]+'</font></td>');
			    		}
		    		}
	    		}
    		}
	    	</script>
	    	
	    	<table>
	    		<tr>
	    			<td></td>
	    			<script>printDays()</script>
	    		</tr>
	    	</table>
	    	
	    </div>
  	</body>
</html>