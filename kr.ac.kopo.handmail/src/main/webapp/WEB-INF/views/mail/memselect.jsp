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
<div class="beck">
<div class="gong"></div>
<div class="gong"></div>
<div class="gong"></div>

<section class="midd">
        <div class="becc">
<form action='${pageContext.request.contextPath}/member/update.do' method='post'>
	<table class="tabl">
		<tbody>
			<tr class="flot">
				<td>아이디</td>
				<td><input type='text' name='memId' value="${memberVO.memId}" class="form-control" readonly="readonly"/></td>			
			</tr>
			<tr class="flot">
				<td>이름</td>
				<td><input type='text' name='memName' value="${memberVO.memName}"></td>			
			</tr>
			<tr class="flot">
				<td>이메일</td>
				<td><input type='text' name='memMail' value="${memberVO.memMail}"></td>	
			</tr>
			<tr class="flot">
				<td>비밀번호</td>
				<td><input type="password" name='memPass' placeholder="비밀번호 입력"></td>
			</tr>
		</tbody>
	</table>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<a href='${pageContext.request.contextPath}/member/list.do'><input type="button" value="목록" class="btn btn-outline-primary"></a>	
		<input type="submit" value="수정" class="">		
		<a href='${pageContext.request.contextPath}/member/delete.do?memberId=${memberVO.memId}'><input type="button" value="삭제" class="btn btn-outline-danger"></a>
	</div>
</form>

        </div>
    </section>

</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
