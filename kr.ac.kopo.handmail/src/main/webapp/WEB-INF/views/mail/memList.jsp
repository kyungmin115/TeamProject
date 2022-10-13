<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>손.편.지</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	<link rel="stylesheet" href="/resources/css/login.css" type="text/css"/>
	<link rel="stylesheet" href="/resources/css/include.css" type="text/css"/>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/member/logout.do";
		})		
	})
</script>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="gong"></div>
<div class="gong"></div>
<div class="gong"></div>

<c:forEach var="vo" items="${result}">
	<tr>
		<td><a href="${pageContext.request.contextPath}/member/update.do?memId=${vo.memId}"><c:out value="${vo.memId}" /></a></td>
		<td><c:out value="${vo.memMail}" /></td>
		<td><c:out value="${vo.memName}" /></td>
		<td><a href="${pageContext.request.contextPath}/member/delete.do?memId=${vo.memId}">삭제</a></td>
		<br/>
	</tr>
</c:forEach>

    


	
	



</body>
</html>
