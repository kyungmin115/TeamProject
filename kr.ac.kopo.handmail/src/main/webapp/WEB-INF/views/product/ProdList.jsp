<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table>
 	<thead>
 		<th>상품이름</th>
 		<th>가격</th>
 		<th>편의점</th>
 		<th>할인종류</th>
 	</thead>
 	<tbody>
 		<c:forEach var="item" items="${result}">
 		<tr>
 			<td>${item.prodName}</td>
 			<td>${item.prodPrice}</td>
 			<td>${item.store}</td>
 			<td>
 			<c:choose>
 				<c:when test="${item.sale eq '1'}"><c:out value="1+1"/></c:when>
 				<c:when test="${item.sale eq '2'}"><c:out value="2+1"/></c:when>
 			</c:choose>
 			</td>
 		</tr>
 		</c:forEach>
 	</tbody>
 	
 </table>



</body>
</html>