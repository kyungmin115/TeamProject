<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손안의 편의점 지침서</title>

<!-- BBS Style -->
<link href="/resources/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/resources/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />

<link rel="stylesheet" href="/resources/css/include.css" type="text/css" />

<link href="/resources/css/board.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
th {
width: 20%;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="gong"></div>
	<div class="layyer">
		<div class="container">
			<div>
				<div style="text-align: center;">
					<form action="${pageContext.request.contextPath}/board/list.do">
						<select name="searchType">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="total">제목+내용</option>
						</select>
						<script type="text/javascript">
							if ('${searchInfo.searchType}') {
								//		document.querySelector('[name="searchType"]').value = '${searchInfo.searchType}'
								$('[name="searchType"]').val(
										'${searchInfo.searchType}');
							}
						</script>
						<input type="text" name="searchWord"
							value="${searchInfo.searchWord}" placeholder="검색어를 입력하세요" />
							<span class="bbtn_s"><input type="submit" value="검색" /></span>
					</form>
				</div>
				<!-- 목록 -->
				<div id="bbs_wrap">
					<div class="bbs_list">
						<table class="list_table">
							<thead>
								<tr>
									<th class="num" scope="col">글번호</th>
									<th class="tit" scope="col">글제목</th>
									<th class="writer" scope="col">작성자</th>
									<th class="date" scope="col">작성일</th>
									<th class="hits" scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="VO" items="${result}">
									<tr>
										<td><c:out value="${VO.boardNo}" /></td>
										<td><a href="${pageContext.request.contextPath}/board/edit.do?boardNo=${VO.boardNo}"><c:out value="${VO.boardTitle}" /></a></td>
										<td><c:out value="${VO.boardWriter}" /></td>
										<td><fmt:formatDate value="${VO.boardRegDate}" pattern="yyyy/MM/dd" /><br></td>
										<td><c:out value= "${VO.inqireCo}" /></td>
									</tr>
								</c:forEach>
								<!-- 글이 없을 경우 -->
								<c:if test="${fn:length(result) == 0}">
									<tr class="empty">
										<td colspan="8">검색 데이터가 없습니다.</td>
									</tr>
								</c:if>
								<div class="paging" value="${pageContext.request.contextPath}/board/list.do">
								
								</div>
					
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn-cont ar">
					<a href='${pageContext.request.contextPath}/board/add.do'><input type="button" value="글쓰기" class="btn btn-outline-primary"></a>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>