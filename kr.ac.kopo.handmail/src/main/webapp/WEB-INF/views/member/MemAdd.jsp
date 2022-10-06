<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/regist.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/include.css" type="text/css" />
<title>회원가입</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap">
		<form action="/member/join.do" id="frm" name="frm" method="post">
		<div class="container">
			<table class="tb">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" id="memId" name="memId" /> <!-- 							<button type="button" id="btn-id-check" class="btn">아이디 중복 검사</button></td> -->
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="memName" name="memName" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="memPass" name="memPass" /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" id="memMail" name="memMail"></td>
					</tr>
				</tbody>
			</table>
			</div>

			<div class="btn">
				<button type="submit" class="btnreg">가입</button>
				<a href="../product/log.do"><button type="button" class="btnesc">취소</button></a>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>