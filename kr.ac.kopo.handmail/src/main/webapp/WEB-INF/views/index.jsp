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
		
	<c:if test="${msg == false}">
		alert("로그인 실패! 아이디와 비밀번호 확인해주세요!")
	</c:if>
});
</script>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="beck">
	<div class="gong"></div>
	<div class="gong"></div>
	<div class="gong"></div>
	
		<form name='member' method="post" action="/member/login.do">
			<section class="midd" style="flex: auto;">
				<c:if test="${member == null}">
			        <div class="becc">
			        	<div>
				        	<img alt="" src="/resources/images/main/과자류.png" class="smal">
				        	<img alt="" src="/resources/images/main/음료.png" class="smal">
				        	<img alt="" src="/resources/images/main/아이스크림.png" class="smal">
				        	<img alt="" src="/resources/images/main/식품.png" class="smal">
			        	</div>
			        	<p class="logi">로그인</p>
			            <table class="tabl">
			                <tr class="flot">
			                    <td>
						            <label for="memId"></label>
						            <input type="text" id="memId" name="memId" class="input" placeholder="아이디를 입력해주세요">
			            		</td>
			            	</tr>
			            	<tr class="flot">
			                    <td>
						            <label for="memPass"></label>
									<input type="password" id="memPass" name="memPass" class="input" placeholder="비밀번호를 입력해주세요">
			            		</td>
			            	</tr>
						</table>
					</div>
			        <div class="rel">
			            <button type="submit" class="logbox">로그인</button>
				        <ul class="sel">
				            <li class="sele"><a href="/member/fix.do">회원정보 변경</a></li>
				            <li class="sele"><a href="/member/join.do">회원가입</a></li>
				        </ul>
			        </div>
				</c:if>
				<c:if test="${msg == false}">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요!</p>
				</c:if>
				<c:if test="${member != null}">
					<div style="padding-top: 50px;">
						<div>
				        	<img alt="" src="/resources/images/main/과자류.png" class="smal">
				        	<img alt="" src="/resources/images/main/음료.png" class="smal">
				        	<img alt="" src="/resources/images/main/아이스크림.png" class="smal">
				        	<img alt="" src="/resources/images/main/식품.png" class="smal">
			        	</div>
						<p style="padding-top: 100px;">${member.memName}님으로 로그인중.</p>
						<div class="rel">
							<button id="logoutBtn" class="logbox" type="button">로그아웃</button>
						</div>
					</div>
				</c:if>
		    </section>
		</form>
	</div>
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
