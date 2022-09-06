<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/product/insert.do" method="post">
	
	<input type="submit" value="상품추가"/>
	
	</form>
	
	<form action="${pageContext.request.contextPath}/product/delete.do" method="post">
	<input type="submit" value="상품모두삭제"/>
	
	</form>


</body>
</html>