<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script>
            L_NO_TOUCH = false;
            L_DISABLE_3D = false;
    </script>
	<title><tiles:insertAttribute name="title"/></title>
	<style>html, body {width: 100%;height: 100%;margin: 0;padding: 0;}</style>
    <style>#map {position:absolute;top:0;bottom:0;right:0;left:0;}</style>
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
		@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
		}
	
		body{
		font-family: 'Pretendard-Regular';
		}
	</style>
</head>
<body>
<div class="flex-container" style="background:#F5F5F5; min-height: 100vh">
		<div style="background: #ffffff">
			<tiles:insertAttribute name="header"/>
		</div>
		<div class="sticky-top">
			<tiles:insertAttribute name="sidebar"/>
		</div>
		
		<div class="scroll d-flex justify-content-between flex-column" style="overflow-y: scroll; ">
			<tiles:insertAttribute name="body"/>
			<tiles:insertAttribute name="footer"/>
		</div>
</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap5/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>