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
		var result = '${result}';	//vo.getIdx()
		checkModal(result);
		
		$("#regBtn").click(function(){
			location.href="${cpath}/board/register";
		});
		
		//페이징 처리 jQuery로 구현하기 = 페이지 번호 클릭 시 이동
		var pageFrm = $("#pageFrm");
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();	// a태그의 기능을 막음
			var page = $(this).attr("href"); //페이지 번호를 가져옴
			pageFrm.find("#page").val(page); //페이지 번호를 가지고 pagefrm의 id가 page인 곳에 대입
			pageFrm.submit();
		});
		
		//상세보기(get.jsp) 클릭 시 이동하기
		$(".move").on("click", function(e){
			e.preventDefault();	// a태그 기능 막기
			var idx = $(this).attr("href");	// a태그의 href값 가져오기
			var tag = "<input type='hidden' name='idx' value='"+idx+"'/>";
			pageFrm.append(tag);	// pageFrm에 tag 값 추가하기
			pageFrm.attr("action","${cpath}/board/get");	// pageFrm에 action값 변경하기
			pageFrm.attr("method","get");
			pageFrm.submit();
		});
		
	});
	function checkModal(result){
		if(result ==''){
			return;
		}
		if(parseInt(result) > 0){
			//모달창 호출하기
			$(".modal-body").html("채용공고를 등록하였습니다.");
		}
		$("#myModal").modal("show");
	}
	
	
</script>
</head>
<body>
 
<div class="container">
  <h2><a href="${cpath }/">채용공고 사이트</a></h2>
  <div class="panel panel-default">
      <div class="panel-heading">채용공고 목록</div>
    	<div class="col-lg-3">
		  	<jsp:include page="../left.jsp"/>
		 </div>
    <div class="col-lg-7">
    	<table class="table table-bordered table-hover">
    		<thead>
    			<tr>
	    			<th>채용공고_ID</th>
	    			<th>회사명</th>
	    			<th>국가</th>
	    			<th>지역</th>
	    			<th>채용포지션</th>
	    			<th>채용보상금</th>
	    			<th>사용기술</th>
	    		</tr>
    		</thead>
    		<c:forEach var="vo" items="${list }">
    			<tr>
	    			<td>${vo.idx }</td>
		    		<td>${vo.companyName }</td>
	    			<td>${vo.nation }</td>
	    			<td>${vo.region }</td>
	    			<td><a class="move" href="${vo.idx }">${vo.position }</a></td>
	    			<td>${vo.reward }</td>
	    			<td>${vo.skill }</td>
	    		</tr>
    		</c:forEach>
	    		<tr>
	    			<td colspan="7">
	    				<button id="regBtn" class="btn btn-sm btn-primary pull-right" >채용공고 등록하기</button>
	    			</td>
	    		</tr>
    	</table>
    	<!-- 검색메뉴 -->
    	<div style="text-align: center">
    		<form class="form-inline" action="${cpath }/board/list" method="post">
			  <div class="form-group">
			  	<select name="type" class="form-control">	
			  		<option value="companyName" ${pageMaker.cri.type=='companyName'? 'selected':''}>회사명</option>
			  		<option value="position" ${pageMaker.cri.type=='position'? 'selected':''}>채용포지션</option>
			  		<option value="skill" ${pageMaker.cri.type=='skill'? 'selected':''}>사용기술</option>
			  	</select>
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword }">
			  </div>
			  <button type="submit" class="btn btn-success">검색</button>
			</form>
    	</div>
    	<!-- 검색메뉴 end -->
    	<!-- 페이징 처리 뷰 -->
    		<div style="text-align: center">
    			<ul class="pagination">
    		<!-- 이전버튼 처리 -->
    		<c:if test="${pageMaker.prev }">
    			<li class="paginate_button previous">
    				<a href="${pageMaker.startPage-1}">◀</a>
    			</li>
    		</c:if>
    		
    		<!-- 페이징(=페이지번호) 처리 -->
    			<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
    			  	<li class="paginate_button ${pageMaker.cri.page==pageNum ? 'active' : '' }"><a href="${pageNum }">${pageNum }</a></li>
    			</c:forEach>
    			
    		<!-- 다음버튼 처리 -->
    		<c:if test="${pageMaker.next }">
    			<li class="paginate_button next">
    				<a href="${pageMaker.endPage+1}">▶</a>
    			</li>
    		</c:if>
    		
				</ul>
    		</div>
    	<!-- 페이징 처리 뷰 end -->
    	<!-- 페이징 처리를 jQuery로 하기 -->
    	<form id="pageFrm" action="${cpath }/board/list" method="post">
    		<!-- get.jsp로 가게될때 idx값도 가지고 갈수있도록 변형해보자! js에 상세보기 참고 -->
    		<input type="hidden" id="page" name="page" value="${pageMaker.cri.page }"/>
    		<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
    		<!-- 검색결과에 대하여 페이지 이동시 결과값이 유지되도록 하기위해서 -->
    		<input type="hidden" name="type" value="${pageMaker.cri.type }"/>
    		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
    	</form>    	
    	
    	<!-- 모달창 -->
    	<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">게시글 등록</h4>
		      </div>
		      <div class="modal-body">
		        <!-- 글 작성될 div -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		 </div>
		 <!-- 모달끝 -->

  </div>
</div>
    </div>
  </div>
</div>

</body>
</html>