<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="scroll m-auto card mt-5 mb-5 p-4" style="width:90%; overflow-y:scroll;">
	<div class="text-start fs-4 mb-4">
		<span>| 결재</span>
	</div>
	<div>
	<form name="approval-search"  method="post" action="${pageContext.request.contextPath}/approval/main">
		<div class="d-flex justify-content-center align-items-center">
			<input name="s_date" class="form-control me-2" type="date">
			<span>~</span>
			<input name="e_date" class="form-control ms-2 today" type="date"> 
			<button type="button" class="btn bg-sub bg-gradient ms-2"><i class="fa-solid fa-magnifying-glass"></i></button>
		</div>
	</form>
	</div>
	<div class="mt-4">
		<div class="card">
			<div class="card-header bg-sub bg-gradient text-start">
				<blockquote class="blockquote mb-0">
			      <p>결재 대기 목록</p>
			    </blockquote>
			</div>
			<div class="card-body">
			<c:choose >
			<c:when test="${not empty approvalList}">
				<table class="table text-center">
					<thead>
	        			<tr>
	        				<th>#</th>
	        				<th style="width: 50%">제목</th>
	        				<th style="width: 15%">부서 </th>
	        				<th style="width: 10%">직급</th> 
	        				<th style="width: 10%">기안자</th>
	        				<th style="width: 15%">상태</th>
	        			</tr>
        			</thead>
        			<tbody class="sendList">
        			<c:forEach items="${approvalList}" var="ap" varStatus="status">
        				<tr>
        					<th>${status.count}</th>
        					<td class="title">${ap.title}</td>
        					<td class="dep">${ap.depName}</td>
        					<td class="rank">${ap.rankName}</td>
        					<td class="name">${ap.name}</td>
        					<td>
        					<c:choose>
        						<c:when test="${ap.state == 0 }">기안</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 1 }">1차 승인</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 2 }">2차 승인</c:when>
        						<c:when test="${ap.state< ap.max_state }">결재 완료</c:when>
        						<c:otherwise>문의</c:otherwise>
        					</c:choose>
        					</td>
        					<td class="signNum" style="display: none">${ap.signNum}</td>
        				</tr>
        			</c:forEach>
        			</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<blockquote class="blockquote mt-5 mb-5 text-center text-muted">
			      <p>" 결재 대기중인 목록이 없습니다 "</p>
			    </blockquote>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	<div class="mt-4">
		<div class="card">
			<div class="card-header bg-sub bg-gradient text-start">
				<blockquote class="blockquote mb-0">
			      <p>${sessionScope.employee.name}님의 결재</p>
			    </blockquote>
			</div>
			<div class="card-body">
				<c:choose >
			<c:when test="${not empty myApprovalList}">
				<table class="table text-center">
					<thead>
	        			<tr>
	        				<th>#</th>
	        				<th style="width: 50%">제목</th>
	        				<th style="width: 15%">부서 </th> 
	        				<th style="width: 10%">직급</th>
	        				<th style="width: 10%">기안자</th>
	        				<th style="width: 15%">상태</th>
	        			</tr>
        			</thead>
        			<tbody class="sendList">
        			<c:forEach items="${myApprovalList}" var="ap" varStatus="status">
        				<tr>
        					<th>${status.count}</th>
        					<td class="title">${ap.title}</td>
        					<td class="dep">${ap.depName}</td>
        					<td class="rank">${ap.rankName}</td>
        					<td class="name">${ap.name}</td>
        					<td>
        					<c:choose>
        						<c:when test="${ap.state == 0 }">기안</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 1 }">1차 승인</c:when>
        						<c:when test="${ap.state < ap.max_state && ap.state == 2 }">2차 승인</c:when>
        						<c:when test="${ap.state< ap.max_state }">결재 완료</c:when>
        						<c:otherwise>문의</c:otherwise>
        					</c:choose>
        					</td>
        					<td class="signNum" style="display: none">${ap.signNum}</td>
        				</tr>
        			</c:forEach>
        			</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<blockquote class="blockquote mt-5 mb-5 text-center text-muted">
			      <p>" ${sessionScope.employee.name}님이 작성한 결재가 없습니다 "</p>
			    </blockquote>
			</c:otherwise>
			</c:choose>
			</div>
			<div>${paging}</div>		
		</div>
	</div>
	<div class="mt-4 mb-4 d-flex justify-content-end">
		<div>
			<button class="btn bg-sub bg-gradient" type="button" onclick="location.href='${pageContext.request.contextPath}/approval/write'">신규 결재</button>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(".sendList").children().click(function(){
		let signNum = this.querySelector(".signNum").textContent;
		location.href="${pageContext.request.contextPath}/approval/read/"+signNum;
	});

</script>
