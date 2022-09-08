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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
 <div class="search">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
      <option value="cu"<c:out value="${scri.searchType eq 'cu' ? 'selected' : ''}"/>>CU</option>
      <option value="gs25"<c:out value="${scri.searchType eq 'gs25' ? 'selected' : ''}"/>>GS25</option>
      <option value="seven"<c:out value="${scri.searchType eq 'seven' ? 'selected' : ''}"/>>세븐</option>
      <option value="emart24"<c:out value="${scri.searchType eq 'emart24' ? 'selected' : ''}"/>>이마트</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
			
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
    	<li><a href="list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>


</body>
</html>