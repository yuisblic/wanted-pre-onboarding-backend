<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	<!-- 날짜포맷팅 라이브러리 -->
<c:set var="cpath" value="${pageContext.request.contextPath }"/>	<!-- contextPath 가져옴 -->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>채용공고 사이트_유정민</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
  	<h2>채용공고 사이트_유정민</h2>
  	<div class="panel panel-default">
    <div class="panel-heading"></div>
    <div class="panel-body">
		<div class="col-lg-3">
			<jsp:include page="board/left.jsp"/>
		</div>
		<div class="col-lg-6">
			<table class="table table-bordered table-hover">
				
			</table>
		</div>
    </div>
  </div>
</div>
</body>
</html>