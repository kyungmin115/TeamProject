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

<form action='${pageContext.request.contextPath}/member/fix.do' method='post'>
	<table class="table">
		<tbody>
			<tr>
				<td>본인의 아이디를 입력해 주세요</td>
				<td><input type='text' name='memId' placeholder="아이디"/></td>
				<br/>
				<td>본인의 이름을 입력해 주세요</td>
				<td><input type='text' name='memName' placeholder="이름"/></td>	
			</tr>

		</tbody>
	</table>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">	
		<input type="submit" value="입력" class="">
	</div>
</form>




<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
