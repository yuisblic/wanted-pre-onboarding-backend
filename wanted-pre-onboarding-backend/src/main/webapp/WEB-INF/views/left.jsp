<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	<!-- 날짜포맷팅 라이브러리 -->
<c:set var="cpath" value="${pageContext.request.contextPath }"/>	<!-- contextPath 가져옴 -->
<div class="card" style="min-height: 500px; max-height: 1000px;">
	<div class="row">
		<div class="col-lg-12">
			<div class="card-body">
				<h4 class="card-title">
					<c:if test="${!empty sessionScope.mvo && sessionScope.mvo eq 1}">
						${sessionScope.memName }
					</c:if>
					<c:if test="${!empty sessionScope.companyID && sessionScope.mvo eq 0}">
						${sessionScope.companyName }
					</c:if>
				</h4>
				<p class="card-text">회원님 환영합니다.</p>
			</div>
		</div>
	</div>
	
</div>