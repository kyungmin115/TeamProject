<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/member/join.do" method="post">
	아이디<input type="text" name="memId"/><br/>
	비밀번호<input type="password" name="memPass"/><br/>
	이메일<input type="text" name="memMail"/><br/>
	이름<input type="text" name="memName"/><br/>
	<input type="submit"/>
	
	</form>


</body>
</html>