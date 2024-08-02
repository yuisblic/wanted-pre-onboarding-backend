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
 <script type="text/javascript">
  $(document).ready(function(){
     $("button[type='reset']").on("click", function(e){
       history.back(); // 이전 페이지로 이동
     });
   });
 </script>
</head>
<body>
 
<div class="container">
  <h2><a href="${cpath }/">채용공고 사이트</a></h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body">
     	<form action="${cpath }/board/register" method="post">
     		<input type="hidden" name="companyID" value="${sessionScope.companyID }"/>
     		<input type="hidden" name="companyName" value="${sessionScope.companyName }"/>
     		<input type="hidden" name="nation" value="${sessionScope.nation }"/>
     		<input type="hidden" name="region" value="${sessionScope.region }"/>
     		<div class="form-group">
     			<label>채용포지션</label>
     			<input type="text" name="position" class="form-control"/>
     		</div>
     		<div class="form-group">
     			<label>채용보상금</label>
     			<input type="text" name="reward" class="form-control" />
     		</div>
     		<div class="form-group">
     			<label>채용내용</label>
     			<textarea rows="10" name="content" class="form-control" ></textarea>
     		</div>
     		<div class="form-group">
     			<label>사용기술</label>
     			<input type="text" name="skill" class="form-control" />
     		</div>
     		<button type="submit" class="btn btn-primary btn-sm">등록</button>
     		<button type="reset" class="btn btn-warning btn-sm">취소</button>
     	</form>
    </div>
  </div>
</div>

</body>
</html>