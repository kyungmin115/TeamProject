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

<c:if test="${member == null }">
	
</c:if>

    

<form name='homeForm' method="post" action="/member/login.do">
	<c:if test="${member == null}">
	<section class="midd">
        <div class="flot">
            <p>아이디</p>
            <label for="memId"></label>
            <input type="text" id="memId" name="memId">
        </div>
        <br/>
        <div class="flot">
            <p>비밀번호</p>
            <label for="memPass"></label>
			<input type="password" id="memPass" name="memPass">
        </div>
        <br/>
        <div class="rel">
            <button type="submit" class="logbox">로그인</button>
            <p class="gaip"><a href="">아이디 비밀번호 변경</a></p>
            <p class="mar"><a href="/member/join.do">회원가입</a></p>
        </div>
    </section>
	</c:if>
	<c:if test="${member != null }">
		<div>
			<p>${member.memName}님 환영 합니다.</p>
			<button id="logoutBtn" type="button">로그아웃</button>
		</div>
	</c:if>
	<c:if test="${msg == false}">
		<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요!.</p>
	</c:if>
</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
