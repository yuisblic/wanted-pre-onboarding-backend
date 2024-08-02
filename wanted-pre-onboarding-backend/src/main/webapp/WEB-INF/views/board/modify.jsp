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
	  $("button").on("click",function(e){
		var formData = $("#frm");
		var btn = $(this).data("btn");
		if(btn=='modify'){
			formData.attr("action", "${cpath}/board/modify");
		}else if(btn=='remove'){
			formData.find("#position").remove();
			formData.find("#reward").remove();
			formData.find("#skill").remove();
			formData.find("#content").remove();
			formData.attr("action", "${cpath}/board/remove");
			formData.attr("method", "get");
		}else if(btn=='list'){
			formData.find("#position").remove();
			formData.find("#reward").remove();
			formData.find("#skill").remove();
			formData.find("#content").remove();
			formData.attr("action", "${cpath}/board/list");
			formData.attr("method", "get");
		};
		formData.submit();
	  });
   });
  </script>

</head>
<body>
 
<div class="container">
  <h2><a href="${cpath }/">채용공고 사이트</a></h2>
  <div class="panel panel-default">
    <div class="panel-heading">채용공고 수정하기</div>
    <div class="panel-body">
    <form id="frm" method="post">
    	<table class="table table-bordered">
    		<tr>
	    		<td class="col-md-3">채용공고_ID</td>
    			<td><input type="text" class="form-control" name="idx" readonly="readonly" value="${vo.idx }"/></td>
    		</tr>
    		<tr>
	    		<td>회사명</td>
    			<td><input type="text" class="form-control" name="companyName" readonly="readonly" value="${vo.companyName }"/></td>
    		</tr>
    		<tr>
	    		<td>국가</td>
    			<td><input type="text" class="form-control" name="nation" readonly value="${vo.nation }"/></td>
    		</tr>
    		<tr>
	    		<td>지역</td>
    			<td><input type="text" class="form-control" name="region" readonly value="${vo.region }"</td>
    		</tr>
    		<tr>
	    		<td>채용포지션</td>
    			<td><input type="text" class="form-control" name="position" value="${vo.position }"</td>
    		</tr>
    		<tr>
	    		<td>채용보상금</td>
    			<td><input type="text" class="form-control" name="reward" value="${vo.reward }"</td>
    		</tr>
    		<tr>
	    		<td>사용기술</td>
    			<td><input type="text" class="form-control" name="skill" value="${vo.skill }"</td>
    		</tr>
    		<tr>
	    		<td>채용내용</td>
    			<td><textarea rows="10" name="content" class="form-control"><c:out value="${vo.content }"/></textarea></td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<button type="button" data-btn="modify" class="btn btn-sm btn-primary">수정</button>
    				<button type="button" data-btn="remove" class="btn btn-sm btn-warning">삭제</button>
    				<button type="button" data-btn="list" class="btn btn-sm btn-info">목록</button>
    			</td>
    		</tr>
    	</table>
    	<!-- 기존에 table태그를 감싸던 form태그를 아래와 같이 수정 -->
			<input type="hidden" name="page" value="<c:out value='${cri.page }'/>"/>
			<input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum }'/>"/>
			<input type="hidden" name="type" value="<c:out value='${cri.type }'/>"/>
			<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>"/>
    	</form>
    </div>
  </div>
</div>

</body>
</html>