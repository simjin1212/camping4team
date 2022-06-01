<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>

</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>

  <c:if test="${sessionScope.id == 'admin'}">
   <a href="noticeform.do">글작성</a>  <br>
</c:if>
  
</header>
<h1 style="margin-bottom:50px;">--</h1>
<div class="container" style="background-color:white;">
	글 갯수 : ${listcount}
	<table border=1 align=center width=700>
		<caption>게시판 목록</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		
		<!-- 화면 출력 번호 -->
		<c:set var="num" value="${listcount-(page-1)*10}"/>
		<c:forEach var="b" items="${noticelist}">
		<tr>
			<td><c:out value="${num}"/>
				<c:set var="num" value="${num-1}" />
			</td>
			<td>
				<a href="noticecontent.do?not_no=${b.not_no}&page=${page}">
					${b.subject}
				</a>
			</td>
			<td>
				<fmt:formatDate value="${b.no_date}"
					 pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		</c:forEach>
		
	</table>
	
	
<!-- 페이지로 처리 -->	
<center>
<c:if test="${listcount > 0}">
	
<!-- 1페이지로 이동 -->	
<a href="noticelist.do?page=1" style="text-decoration:none"> << </a>
	
<!-- 이전 블럭으로 이동 -->
<c:if test="${startPage > 10}">
	<a href="noticelist.do?page=${startPage-10 }">[이전]</a>	
</c:if>

<!-- 각 블럭에 10개의 페이지 출력 -->	
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i == page}">		<!-- 현재 페이지 -->
		[${i}]
	</c:if>
	<c:if test="${i != page}">		<!-- 현재 페이지가 아닌 경우 -->
		<a href="noticelist.do?page=${i}">[${i}]</a>
	</c:if>
</c:forEach>	
	
<!-- 다음 블럭으로 이동 -->	
<c:if test="${endPage < pageCount}">
	<a href="noticelist.do?page=${startPage+10}">[다음]</a>
</c:if>
	
<!-- 마지막 페이지로 이동 -->	
<a href="noticelist.do?page=${pageCount}" style="text-decoration:none"> >> </a>

</c:if>
</center>	
</div>
</body>
</html>