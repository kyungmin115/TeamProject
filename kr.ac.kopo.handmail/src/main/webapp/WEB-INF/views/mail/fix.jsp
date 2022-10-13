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
<style>
.btns input:hover {
	cursor: pointer;
}
input {
	border-bottom: 1px solid #E0E0E0;
	border-right:1px;
	border-top:1px;
	border-left:1px;
	border-radius: 3px;
	width: 250px;
	height: 35px;
}
input:focus {
	outline: none !important;
	border-color: #c0c0c0;
	box-shadow: 0 0 10px #c0c0c0;
	display: inline-block;
	box-sizing: border-box;
}
input[type=text],
input[type=password],
input[type=email] {
	background-color: #ffffff;
    display: inline-block;
    box-sizing: border-box;
    font-size: 13px;
    font-weight: normal;
}
</style>
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
			<form action='${pageContext.request.contextPath}/member/fix.do' method='post'>
				<table class="tabl" style="padding-top: 110px;">
					<tbody>
						<tr class="flot">
							<td><input type='text' name='memId' placeholder="본인의 아이디를 입력해 주세요"/></td>
						</tr>
						<tr class="flot">
							<td><input type='text' name='memName' placeholder="본인의 이름을 입력해 주세요"/></td>	
						</tr>
			
					</tbody>
				</table>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end btns">	
					<input type="submit" value="입력" class="">
				</div>
			</form>
        </div>
    </section>

</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
