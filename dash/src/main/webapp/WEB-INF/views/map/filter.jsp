<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script>
            L_NO_TOUCH = false;
            L_DISABLE_3D = false;
    </script>
	<title>지도</title>
	<style>html, body {width: 100%;height: 100%;margin: 0;padding: 0;}</style>
    <script src="https://cdn.jsdelivr.net/npm/leaflet@1.9.3/dist/leaflet.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet@1.9.3/dist/leaflet.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap5/icon/bootstrap-icons.css" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Leaflet.awesome-markers/2.0.2/leaflet.awesome-markers.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/python-visualization/folium/folium/templates/leaflet.awesome.rotate.min.css"/>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kyw.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/analysis.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" type="text/css">
	
	<meta name="viewport" content="width=device-width,
                initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<style type="text/css">
#map_1 {
                    position: relative;
                    width: 100.0%;
                    height: 100.0%;
                    left: 0.0%;
                    top: 0.0%;
                }
.leaflet-container { font-size: 1rem; }
 </style>
</head>
<body>
  <div class="folium-map" id="map_1">
  </div>
   
<script>         
function ajaxFun(url, method, query, dataType, fn) {
   	$.ajax({
   		type:method,
   		url:url,
   		data:query,
   		dataType:dataType,
   		success:function(data) {
   			fn(data);
   		},
   		beforeSend:function(jqXHR) {
   			jqXHR.setRequestHeader("AJAX", true);
   		},
   		error:function(jqXHR) {
   			if(jqXHR.status === 403) {
   				login();
   				return false;
   			} else if(jqXHR.status === 400) {
   				alert("요청 처리가 실패 했습니다.");
   				return false;
   			}
   	    	
   			console.log(jqXHR.responseText);
   		}
   	});
   }
   
var arr_100=[];
var arr_300=[];
var arr_500=[];
var jsO_100;
var jsO_300;
var jsO_500;

$(function(){
	let url = "${pageContext.request.contextPath}/map/meter";
	
	
	
	
	const fn =function (data) {
		for(item of data.list_100){
			let obj; 
			obj = { "type" : item["type"], "properties" : item["properties"], "geometry":item["geometry"] };  	
			arr_100.push(obj); 
			
		}
    	
		console.log(arr_100)
		
		jsO_100 = {
	 				"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
	   				"features": arr_100
	   			};
		
		console.log(jsO_100);
		
		for(item of data.list_300){
			let obj; 
			obj = { "type" : item["type"], "properties" : item["properties"], "geometry":item["geometry"] };  	
			arr_300.push(obj); 
			
		}
    	
		console.log(arr_300)
		
		jsO_300 = {
	 				"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
	   				"features": arr_300
	   			};
		
		console.log(jsO_300);
		
		for(item of data.list_500){
			let obj; 
			obj = { "type" : item["type"], "properties" : item["properties"], "geometry":item["geometry"] };  	
			arr_500.push(obj); 
			
		}
    	
		console.log(arr_500)
		
		jsO_500 = {
	 				"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
	   				"features": arr_500
	   			};
		
		console.log(jsO_500);
		geo_json_100_add (jsO_100);
		geo_json_300_add (jsO_300);
		geo_json_500_add (jsO_500);
	}

	//ajaxFun(url,"get",null,"json",fn);
	
	
	
});




var map_1 = L.map(
    "map_1",
    {
        center: [37.541, 126.986],
        crs: L.CRS.EPSG3857,
        zoom: 14,
        zoomControl: true,
        preferCanvas: false,
    }
);


	
var tile_layer_e7d08d3bddd0875bfc28142ded8cd1f7 = L.tileLayer(
    "http://xdworld.vworld.kr:8080/2d/Base/service/{z}/{x}/{y}.png",{
                attribution: 'DASH &copy; VWORLD(국토부)',
            	subdomains: 'abcd',
            	maxZoom: 19}
).addTo(map_1);



function geo_json_100_onEachFeature(feature, layer) {
layer.on({
});
};
var geo_json_100 = L.geoJson(null, {
    onEachFeature: geo_json_100_onEachFeature,

});

function geo_json_100_add (data) {
geo_json_100
    .addData(data)
    .addTo(map_1);
}




function geo_json_300_onEachFeature(feature, layer) {
	layer.on({
	});
	};
var geo_json_300 = L.geoJson(null, {
    onEachFeature: geo_json_300_onEachFeature,

});

function geo_json_300_add (data) {
geo_json_300
    .addData(data)
    .addTo(map_1);
}


	
function geo_json_500_onEachFeature(feature, layer) {
	layer.on({
	});
	};
var geo_json_500 = L.geoJson(null, {
    onEachFeature: geo_json_500_onEachFeature,

});

function geo_json_500_add (data) {
geo_json_500
    .addData(data)
    .addTo(map_1);
}



L.Control.Filter = L.Control.extend({
	  onAdd: function(map_1) {
	    var el = L.DomUtil.create('div', 'leaflet-bar my-control');

	    el.innerHTML = '<div class="d-flex mb-2">'
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white me-2">100m</button>';
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white me-2">300m</button>';
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white">500m</button>';
	    el.innerHTML += '</div> <hr>';
	    el.innerHTML += '<div class="d-flex mb-2">'
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white me-2">6개월</button>';
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white me-2">3개월</button>';
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white">1개월</button>';
	    el.innerHTML += '</div> <hr>';
	    el.innerHTML += '<div class="d-flex">'
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white me-2">기준1</button>';
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white me-2">기준2</button>';
	    el.innerHTML += '<button type="button" class="btn bg-main btn-Point text-white">기준3</button>';
	    el.innerHTML += '</div>';

	    return el;
	  },

	  onRemove: function(map_1) {
	    // Nothing to do here
	  }
	});

	L.control.Filter = function(opts) {
	  return new L.Control.Filter(opts);
	}

	L.control.Filter({
		"autoZIndex": true, "collapsed": true,position: 'topleft'
	}).addTo(map_1);

L.Control.Home= L.Control.extend({
	onAdd: function(map_1){
		var el2 = L.DomUtil.create('div', 'leaflet-bar my-control2');
		
		el2.innerHTML = "<button class='btn btn-primary' type='button' onclick='location.href=${pageContext.request.contextPath}/'><i class='fa-solid fa-house'></i></button>"
		return el2;
	},
	onRemove: function(map_1) {
	    // Nothing to do here
	 }
});

	L.control.Home = function(opts) {
	  return new L.Control.Home(opts);
	}

	L.control.Home({
		"autoZIndex": true, "collapsed": true,position: 'bottomright'
	}).addTo(map_1);

var layer_control = {
	    base_layers : {
	        "openstreetmap" : tile_layer_e7d08d3bddd0875bfc28142ded8cd1f7,
	    },
	    overlays :  {
	        "100m" : geo_json_100, "300m" : geo_json_300, "500m" : geo_json_500,
	    },
	};
	L.control.layers(
	    layer_control.base_layers,
	    layer_control.overlays,
	    {"autoZIndex": true, "collapsed": true, "position": "topright"}
	).addTo(map_1);



</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
