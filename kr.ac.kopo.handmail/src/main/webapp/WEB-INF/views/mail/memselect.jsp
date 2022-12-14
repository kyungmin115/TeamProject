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
.btns input {
	width: 70px;
}
.btns input:hover {
	cursor: pointer;
}
.buto {
	width: 100px;
	border-radius: 30px;
	background-color: #222222;
	color: white;
}
.buto:hover {
	background-color: #37D243;
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
			$("#btnUpt").click(function() {
				if ($('#memPass').val() != $('#memPassCheck').val()) {
					alert('비밀번호 입력이 서로 다릅니다.');
					return false;
					}
				if (!confirm("회원정보수정 하시겠습니까?")) {
					return false;
				}
				});
		$("#btnDel").click(function() {
			if (!confirm("회원탈퇴 하시겠습니까?")) {
				return false;
			}
		});
	});
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
				<td><input type='text' name='memId' value="${memberVO.memId}" class="form-control" readonly="readonly"/></td>			
			</tr>
			<tr class="flot">
				<td><input type='text' name='memName' value="${memberVO.memName}"></td>			
			</tr>
			<tr class="flot">
				<td><input type='text' name='memMail' value="${memberVO.memMail}"></td>	
			</tr>
			<tr class="flot">
				<td><input type="password" name='memPass' id="memPass" placeholder="비밀번호 입력"></td>
			</tr>
			<tr class="flot">
				<td><input type="password" name='memPassCheck' id="memPassCheck" placeholder="비밀번호 확인"></td>
			</tr>
		</tbody>
	</table>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end btns">
		<input type="submit" value="수정" id="btnUpt" class="buto">		
		<a href='${pageContext.request.contextPath}/member/delete.do?memId=${memberVO.memId}'><input type="button" value="삭제" id="btnDel"  class="buto"></a>
		<a href='${pageContext.request.contextPath}/member/login.do'><input type="button" value="목록" class="buto"></a>	
	</div>
</form>

        </div>
    </section>

</div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>
