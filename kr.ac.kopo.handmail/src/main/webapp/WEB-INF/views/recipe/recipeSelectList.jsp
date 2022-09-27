<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손안의 편의점 지침서</title>


<!-- BBS Style -->
<link href="/resources/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/resources/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/include.css" type="text/css"/>
<link href="/resources/css/board.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>


<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div id="wrap" class="layyer">
<h1>게시글 목록</h1>

<div>
<form action="${pageContext.request.contextPath}/board/list.do">
	<select name="searchType">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="total">제목+내용</option>
	</select>
	<script type="text/javascript">
		if ('${searchInfo.searchType}'){			
//		document.querySelector('[name="searchType"]').value = '${searchInfo.searchType}'
		$('[name="searchType"]').val( '${searchInfo.searchType}' );
		}
	</script>
	<input type="text" name="searchWord" value="${searchInfo.searchWord}" placeholder="검색어를 입력하세요"/>
	<input type="submit" value="검색"/>
</form>
</div>

<table class="table table-hover">
	<thead class="table-secondary">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="VO" items="${result}">	
			<tr>	
				<td><c:out value="${VO.boardNo}"/></td>
				<td><a href="${pageContext.request.contextPath}/board/edit.do?boardNo=${VO.boardNo}"><c:out value="${VO.boardTitle}"/></a></td>
	 			<td><c:out value="${VO.boardWriter}"/></td>
	 			<td><fmt:formatDate value="${VO.boardRegDate}" pattern="yyyy/MM/dd"/><br></td>
	 		</tr>
		</c:forEach>
	</tbody>
</table>

<a href='${pageContext.request.contextPath}/board/add.do'>글쓰기</a><br><br><br>
</div>
	


<%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>
</html>