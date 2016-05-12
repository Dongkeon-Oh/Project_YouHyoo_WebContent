<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html> 
	<head> 
	  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	  <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
	</head> 
	
	<body>
		<div id="map" style="width: 1000px; height: 500px;"></div>
	  	<%
	  	int len=10;
	  	double arrTest[][]=new double[len][2];
	  	for(int i=0; i<len; i++){
	  		arrTest[i][0]=i*1.1;
	  		arrTest[i][1]=i*1.111;
	  	%>
	  		
	  	<%	
	  	}
		%>
		
		
		
	  	<script type="text/javascript">
	 	var locArr=new Array(<%=len%>); 
	  	function setArray(lng, lat){
		  	loc[i]=new Array(2);
		  	loc[i][0]=lng;
		  	loc[i][1]=lat;
	  	}
	  
	    var locations = [
	      ['삼익사이버 아파트', 37.0211403, 127.0971617, 28],
	      ['국립축산과학원 축산자원개발부', 36.93309333, 127.10487485, 10]
	    ];
	    var map = new google.maps.Map(document.getElementById('map'), {
	      zoom: 8,
	      center: new google.maps.LatLng(37, 127.1),
	      mapTypeId: google.maps.MapTypeId.ROADMAP
	    });
	    var infowindow = new google.maps.InfoWindow();
	    var marker, i;
	    for (i = 0; i < locations.length; i++) {  
	      marker = new google.maps.Marker({
	        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	        map: map
	      });
	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent(locations[i][0]);
	          infowindow.open(map, marker);
	        }
	      })(marker, i));
	    }
	  </script>
	  
	  
	</body>
</html>