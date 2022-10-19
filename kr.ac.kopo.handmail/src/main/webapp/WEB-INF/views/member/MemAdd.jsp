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
<script type="text/javascript">
$(function () {
	var idChecked = false;
	$('#frm').on('submit', function() {
		if (!idChecked) {
			alert('ID중복확인이 필요합니다.');
			return false;
		}
		if ($('#memPass').val() != $('#memPassCheck').val()) {
			alert('비밀번호 입력이 서로 다릅니다.');
			return false;
		}
	});
	$('#dupCheck').on('click', function() {
		$.ajax({
			url: "${pageContext.request.contextPath}/member/check.do",
			method: "post",
			data: {memId:$('#memId').val()},
			dataTypes: 'json'
		}).done(function(resp) {
			console.log(resp)
			idChecked = resp.result;
			if (resp.result) { //사용가능한 아이디
				$('#addLink').prop('disabled', false);
				$('#dupCheck').prop('disabled', true);
				alert('사용 가능한 ID입니다.');
			}else { //이미 존재하는 아이디
				$('#addLink').prop('disabled', true);
				$('#dupCheck').prop('disabled', false);
				alert('중복된 ID입니다.');
			}
		}).fail(function(jqXHR,textStatus) {
			alert('아이디 중복 확인 요청 실패!');
		});
	});
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrap beck">
		<div style="height: 45px;width: 600px;margin: 0 auto;"></div>
			<form action="/member/join.do" id="frm" name="frm" method="post">
				<div class="container midd">
					<div><img src="/resources/images/header/logo.png" alt=""></div>
					<table class="tb">
						<tbody>
							<tr>
								<td><input type="text" id="memId" name="memId" placeholder="ID" style="width: 130px;"/>
								<button type="button" id="dupCheck" class="btndup">아이디 중복 검사</button></td>
							</tr>
							<tr>
								<td><input type="text" id="memName" name="memName" placeholder="이름"/></td>
							</tr>
							<tr>
								<td><input type="password" id="memPass" name="memPass" placeholder="비밀번호"/></td>
							</tr>
							<tr>
								<td><input type="password" id="memPassCheck" name="memPassCheck" placeholder="비밀번호 확인"/></td>
							</tr>
							<tr>
								<td><input type="email" id="memMail" name="memMail" placeholder="E-Mail"></td> 
							</tr>
						</tbody>
					</table>
					</div>
				<div class="btn">
					<button id="addLink" type="submit" class="btnreg">가입</button>
					<a href="/member/login.do"><button type="button" class="btnesc">취소</button></a>
				</div>
			</form>
		</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>