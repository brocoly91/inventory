<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>board</title>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/main.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<style>
.sv :not(p) {
  color:red;
}
</style>
</head>

<script type="text/javascript">
$(document).ready(function(){	
	var sk = "${searchKey}"
	if(sk == null || sk == ""){
		$("#searchKey").val("title").prop("selected", true);
	}else{
		$("#searchKey").val("${searchKey}").prop("selected", true);
	}

});

function fn_contentView(boardNo){

	var url = "${pageContext.request.contextPath}/content/getBoardContent";

	url = url + "?boardNo="+boardNo;

	location.href = url;

}
function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	
	if(${testn} == 100){
		location.href="${pageContext.request.contextPath}/category/boardList?nowPage=${paging.nowPage}&cntPerPage="+sel+"&n=100&boardTitle=${boardTitle}";
	}
	else if(${testn} == 200){
		location.href="${pageContext.request.contextPath}/category/boardList?nowPage=${paging.nowPage}&cntPerPage="+sel+"&n=200&searchValue=${searchValue}&searchKey=${searchKey}";
	}
	else{
		location.href="${pageContext.request.contextPath}/category/boardList?nowPage=${paging.nowPage}&cntPerPage="+sel+"&n=1";
	}
}

</script>
<body>
<!-- <table class="table table-hover"> -->
<!--  <thead> -->
<!--    <tr> -->
<!--       <th>Firstname</th> -->
<!--       <th>Lastname</th> -->
<!--       <th>Email</th> -->
<!--    </tr> -->
<!--  </thead> -->
<!--  <tbody> -->
<!--    <tr> -->
<!--       <td>John</td> -->
<!--       <td>Doe</td> -->
<!--       <td>john@example.com</td> -->
<!--    </tr> -->
<!--    <tr> -->
<!--       <td>Mary</td> -->
<!--       <td>Moe</td> -->
<!--       <td>mary@example.com</td> -->
<!--    </tr> -->
<!--    <tr> -->
<!--       <td>July</td> -->
<!--       <td>Dooley</td> -->
<!--       <td>july@example.com</td> -->
<!--    </tr> -->
<!--     <tr> -->
<!--       <td>July</td> -->
<!--       <td>Dooley</td> -->
<!--       <td>july@example.com</td> -->
<!--    </tr> -->
<!--  </tbody>  -->

<!-- </table> -->
<!-- <article> -->

<!-- 	<table class="table table-striped table-sm table-bordered table-hover"> -->
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> 
	<br>
	<p>
	<!-- 옵션선택 끝 -->
	<table class="table table-sm  table-bordered table-hover">
		<colgroup>

			<col style="width:4%;" />

			<col style="width:auto;" />
			
			<col style="width:12%;" />

			<col style="width:12%;" />

			<col style="width:9%;" />

			<col style="width:9%;" />

		</colgroup>

		<thead>

			<tr>

				<th>NO</th>

				<th>글제목</th>

				<th>분류</th>
				
				<th>작성자</th>

				<th>조회수</th>

				<th>작성일</th>

			</tr>

		</thead>

		<tbody>

			<c:choose>

				<c:when test="${empty boardList }" >

					<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>

				</c:when> 

				<c:when test="${!empty boardList}">

					<c:forEach var="list" items="${boardList}">

						<tr>

							<td><c:out value="${list.boardNo}"/></td>
							<td>
								<a href="#" style='color: black' onClick="fn_contentView(<c:out value="${list.boardNo}"/>)"><c:out value="${list.boardTitle}"/></a>&nbsp;
									<span style='color:blue'>[${list.cntRno}]</span>
							</td>
							
							<td>
								<c:out value="${list.boardCategory}"/>
							</td>
							
							<td><c:out value="${list.userId}"/></td>

							<td><c:out value="${list.hit}"/></td>

							<td><c:out value="${list.boardregiDate}"/></td>
							
						</tr>

					</c:forEach>

				</c:when>

			</c:choose>

		</tbody>

	</table>
	
<!-- </article> -->
	
	<div>
		<form method="get" action="/category/boardList">
	        <select id="searchKey" name="searchKey" style="width:10%;float: left;margin:0.5%;"><!-- 검색키 : search key -->
	            <option value="title">제목</option>
	            <option value="content">내용</option>
	            <option value="titleContnt">제목+내용</option>
	            <option value="id">아이디</option>
	            <option value="no">글번호</option>
	        </select>
	        
	        <c:choose>

			<c:when test="${empty searchValue}">
			     <input type="text" name="searchValue" style="width:60%;float: left;margin:0.5%"><!-- 검색값 : search value -->
			</c:when>
			
			
			<c:otherwise>
			 <input type="text" name="searchValue" value="${searchValue}" style="width:60%;float: left;margin:0.5%">
			</c:otherwise>
			
			</c:choose>



	        
<!-- 	        <input type="text" name="searchValue" style="width:60%;float: left;margin:0.5%">검색값 : search value -->
	        <input type="submit" value="검색버튼"style="margin:0.5%;">
	        <input type="hidden" name="n" id="n" value="200" />
	    </form>
	</div>
	<c:choose>
	    <c:when test="${testn eq 100}">
        	<div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&n=100&boardTitle=${boardTitle}">◀ </a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&n=100&boardTitle=${boardTitle}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&n=100&boardTitle=${boardTitle}">▶ </a>
				</c:if>
			</div>
	    </c:when>
   	    <c:when test="${testn eq 200}">
        	<div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&n=200&searchValue=${searchValue}&searchKey=${searchKey}">◀ </a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&n=200&searchValue=${searchValue}&searchKey=${searchKey}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&n=200&searchValue=${searchValue}&searchKey=${searchKey}">▶ </a>
				</c:if>
			</div>
	    </c:when>
	    <c:otherwise>
        	<div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&n=1">◀ </a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&n=1">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&n=1">▶ </a>
				</c:if>
			</div>
	    </c:otherwise>
	</c:choose>


	
<!-- 	<div style="display: block; text-align: center;">		 -->
<%-- 		<c:if test="${paging.startPage != 1 }"> --%>
<%-- 			<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&n=1">◀ </a> --%>
<%-- 		</c:if> --%>
<%-- 		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p"> --%>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${p == paging.nowPage }"> --%>
<%-- 					<b>${p }</b> --%>
<%-- 				</c:when> --%>
<%-- 				<c:when test="${p != paging.nowPage }"> --%>
<%-- 					<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&n=1">${p }</a> --%>
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:if test="${paging.endPage != paging.lastPage}"> --%>
<%-- 			<a href="<%=request.getContextPath()%>/category/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&n=1">▶ </a> --%>
<%-- 		</c:if> --%>
<!-- 	</div> -->
	
</body>

</html>



