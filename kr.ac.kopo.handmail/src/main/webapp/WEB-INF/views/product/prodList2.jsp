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
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
</head>
<body>
<form name="frm" method="get" action="/product/list.do">
				<fieldset>
					<legend>검색조건입력폼</legend>
					<label for="ftext" class="hdn">검색분류선택</label>
					<select name="searchCondition" id="ftext">
						<option value="all">전체</option>
						<option value="cu">CU</option>
						<option value="gs25">GS25</option>
						<option value="seven">SEVEN</option>
						<option value="emart24">EMART</option>
					</select>
					<label for="inp_text" class="hdn">검색어입력</label>
					<input name="searchKeyword" type="text" class="inp_s" id="inp_text" />
					<span class="bbtn_s"><input type="submit" value="검색" title="검색(수업용 게시판 게시물 내)" />
					</span>
				</fieldset>
</form>
			
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
<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="list.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="list.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>


</body>
</html>