<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="sidebar" class="list-group mt-4">
		<a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" aria-current="page" href="${pageContext.request.contextPath}/message/receive/main">미확인 쪽지<span class="badge bg-main rounded-pill">${sessionScope.employee.msgcount}</span></a>
		<a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" aria-current="page" href="${pageContext.request.contextPath}/schedule/main">오늘 일정<span class="badge bg-main rounded-pill">${sessionScope.employee.scdcount}</span></a>
		<a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" aria-current="page" href="${pageContext.request.contextPath}/">알림<span class="badge bg-main rounded-pill">14</span></a>
		<a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/insa/list">사원현황</a>
</div>