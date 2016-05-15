<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");

IndexMgr indexMgr=IndexMgr.getInstance();
List<Pension_Dto> pensionList=indexMgr.getMapPensionList();
%>   

<html> 
	<head> 
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	  	<link href="Index.css" type="text/css" rel="stylesheet">
	  	<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
	  	<style type="text/css">
	  		#map{
	  			margin: 0 auto;
	  			width: 1000px; 
	  			height: 500px;
	  		}
	  		
	  		#Map_img{
	  			width: 100px;
	  			height: 60px;
	  		}
	  		
	  		A:link{
				text-decoration:none
			}
	
			A:visited{
				text-decoration:none
			}
	  	</style>
	</head> 
	<body>
		<%@ include file="Top.jsp" %>
		
  		<div id="map"></div>
  		
		<%@ include file="Bottom.html" %>
		
		
  		<script type="text/javascript">
  			var testerArr=new Array();
	
			function tester(num, pension, lng, lat, photo, addr1, addr2, tel){
				testerArr[testerArr.length]=new Array(num, pension, lng, lat, photo, addr1, addr2, tel);
			}
		</script>
   		<%
   			for(int i=0; i<pensionList.size(); i++){
	  	%>
	  	<script type="text/javascript">
	  		tester(
		  		<%=pensionList.get(i).getP_num()%>, 
		  		"<%=pensionList.get(i).getP_name()%>",
		  		<%=pensionList.get(i).getP_lat()%>, 
		  		<%=pensionList.get(i).getP_lng()%>, 
		  		"<%=pensionList.get(i).getP_photo()%>",
		  		"<%=pensionList.get(i).getP_addr1()%>",
		  		"<%=pensionList.get(i).getP_addr2()%>",
		  		"<%=pensionList.get(i).getP_tel()%>"
	  		)
		</script>
	  	<%	
	  		}
		%>
   		<script> 
   			var map = new google.maps.Map(document.getElementById('map'), {
     			zoom: 8,
      			center: new google.maps.LatLng(37.301433, 127.715051),
      			mapTypeId: google.maps.MapTypeId.ROADMAP
    		});
   			var infowindow = new google.maps.InfoWindow();
    		var marker, i;
    		
    		for (i = 0; i < testerArr.length; i++) {  
      			marker = new google.maps.Marker({
        		position: new google.maps.LatLng(testerArr[i][2], testerArr[i][3]),
        		map: map
      		});
      
      		google.maps.event.addListener(marker, 'click', (function(marker, i) {
        		return function() {
          			infowindow.setContent(
        		  		'<div>'+
	        		  		'<table>'+
	        	    			'<tr>'+
        	    					'<td>'+
        	    						'<a href="DetailView.jsp?p_num='+testerArr[i][0]+'">'+
        	    							'<img src="imgs/pension/'+testerArr[i][0]+'/'+testerArr[i][4]+'" id="Map_img">'+
        	    						'</a>'+
        	    					'</td>'+
        	    				'<td>'+
        	    					'<table>'+
        	    						'<tr>'+
        	    							'<td>'+
        	    								'<a href="DetailView.jsp?p_num='+testerArr[i][0]+'">'+
        	    									'<font size="3" color="#3F48CC">'+testerArr[i][1]+'</font>'+
        	    								'</a>'+
        	    							'</td>'+
        	    						'</tr>'+
        	    						'<tr>'+
			        	    				'<td>'+
						        	    		'<font size="2" color="#7F7F7F">'+testerArr[i][5]+' '+testerArr[i][6]+'</font>'+
						        	    	'</td>'+
					        	    	'</tr>'+
					        	    	'<tr>'+
					        	    		'<td>'+
						        	    		'<font size="2">Tel) '+testerArr[i][7]+'</font>'+
						        	    	'</td>'+
				        	    		'</tr>'+
				        	    	'</table>'+
				        	    '</td>'+
        	    			'</tr>'+
        	    		'</table>'+
        		  	'</div>'
						);
         				infowindow.open(map, marker);
        			}
      			})(marker, i));
   			}
  		</script>
	</body>
</html>
