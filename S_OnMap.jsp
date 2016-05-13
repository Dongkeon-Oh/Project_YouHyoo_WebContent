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
		
		
		
	  	<script>
	 	var locArr=new Array(<%=len%>); 
	 	var locArrCounter=0;
	 	
	 	for(var i=0; i<locArr.length; i++){
	 		locArr[i]=new Array(3);
	 		locArr[i][0]="TEST";
	 		locArr[i][1]=37+0.1*i;
	 		locArr[i][2]=127+0.1*i;
	 	}
	    
	    var map = new google.maps.Map(document.getElementById('map'), {
	      zoom: 8,
	      center: new google.maps.LatLng(37, 127.1),
	      mapTypeId: google.maps.MapTypeId.ROADMAP
	    });
	    var infowindow = new google.maps.InfoWindow();
	    var marker, i;
	    for (i = 0; i < locArr.length; i++) {  
	      marker = new google.maps.Marker({
	        position: new google.maps.LatLng(locArr[i][1], locArr[i][2]),
	        map: map
	      });
	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
	        return function() {
	          infowindow.setContent(locArr[i][0]);
	          infowindow.open(map, marker);
	        }
	      })(marker, i));
	    }
	  </script>
	  
	  
	</body>
</html>