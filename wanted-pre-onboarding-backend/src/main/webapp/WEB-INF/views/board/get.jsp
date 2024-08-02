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
  		var companyName = "${vo.companyName}";
  		var meIdx = "${vo.idx}";
  		loadList(companyName, meIdx);
  		
  		$("button").on("click", function(e){	
  			var formData = $("#frm");
  			var btn = $(this).data("btn");	
  			if(btn=='modify'){
  				formData.attr("action", "${cpath}/board/modify");
  			}else if(btn=='list'){
  				formData.find("#idx").remove();	//list는 idx값이 필요없으므로
  				formData.attr("action", "${cpath}/board/list");
  			}
  			formData.submit();	//전송
  		});
  		
  	});
  	
  	function loadList(companyName, meIdx){
  		$.ajax({
  			url: "${cpath}/board/hiring",
  			type: "get",
  			dataType: "json",
  			data: {"companyName": companyName },
  			success: function(data){
  				var listHtml = "";
  	            $.each(data, function(idx, item) {
  	            	if(meIdx != item.idx){
		  	            listHtml += "<td><button class='btn btn-sm btn-default' onclick='goPage("+item.idx+")'>" + item.idx+"</button></td>";
  	            	}
  	            	
  	            });
  	            $("#hiringList").html(listHtml);
  			},
  			error: function(){alert("에러");}
  		});
  	}
  	function applyCheck(idx){
  		$.ajax({
  			url:"${cpath}/board/apply",
  			type:"get",
  			dataType:"json",
  			data:{"idx":idx,"memID":"${sessionScope.memID}"},
  			success: function(data){
  				if(data==0){
  					alert("지원이 완료되었습니다.");
  				}else if(data==1){
  					alert("이미 지원하신 공고입니다.");
  				};
  				window.location.href="${cpath}/board/list";
  			} 
  			,
  			error: function(){alert("에러");}
  		});
  	}
  	
  	function goPage(idx){
  		//해당 회사가 올린 다른 채용공고로 이동하기
  		var currentUrl = window.location.href;
  		var url = new URL(currentUrl);
  		var params = new URLSearchParams(url.search);
  		params.set('idx', idx);
  		url.search = params.toString();
  		window.location.href = url.href;
  	}
  </script>
</head>
<body>
 
<div class="container">
  <h2><a href="${cpath }/">채용공고 사이트</a></h2>
  <div class="panel panel-default">
    <div class="panel-heading">채용공고 상세보기</div>
    <div class="panel-body">
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
    			<td><input type="text" class="form-control" name="region" readonly="readonly" value="${vo.region }"</td>
    		</tr>
    		<tr>
	    		<td>채용포지션</td>
    			<td><input type="text" class="form-control" name="position" readonly="readonly" value="${vo.position }"</td>
    		</tr>
    		<tr>
	    		<td>채용보상금</td>
    			<td><input type="text" class="form-control" name="reward" readonly="readonly" value="${vo.reward }"</td>
    		</tr>
    		<tr>
	    		<td>사용기술</td>
    			<td><input type="text" class="form-control" name="skill" readonly="readonly" value="${vo.skill }"</td>
    		</tr>
    		<tr>
	    		<td>채용내용</td>
    			<td><textarea rows="5" class="form-control" readonly><c:out value="${vo.content }"/></textarea></td>
    		</tr>
    		<tr>
	    		<td>회사가 올린 다른 채용공고_ID</td>
    			<td id="hiringList">	</td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align: center;">
    				<c:if test="${sessionScope.mvo==1 }">
		    			<button data-btn="apply" class="btn btn-sm btn-primary" onclick="applyCheck(${vo.idx})">지원하기</button>
    				</c:if>
    				<c:if test="${sessionScope.mvo==0 && vo.companyID eq sessionScope.companyID}">
    					<button data-btn="modify" class="btn btn-sm btn-success" >수정하기</button>
    				</c:if>
    				<button data-btn="list" class="btn btn-sm btn-info" >목록</button>
    			</td>
    		</tr>
    	</table>
    	<!-- onclick 간단하게 만들어주기 -->
    	<form id="frm" method="get">	
			<input type="hidden" id="idx" name="idx" value="<c:out value='${vo.idx }'/>"/>
			<input type="hidden" name="page" value="<c:out value='${cri.page }'/>"/>
			<input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum }'/>"/>
			<input type="hidden" name="type" value="<c:out value='${cri.type }'/>" />
			<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>" />
    	</form>
    </div>
  </div>
</div>

</body>
</html>