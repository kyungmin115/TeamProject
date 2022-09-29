<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손안의 편의점 지침서</title>
<link rel="stylesheet" href="/resources/css/include.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/search.css?after" type="text/css"/>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div class="cont"></div>
	<div class="cont">
	<button id="cate1" type="button">음료</button>
	<button id="cate2" type="button">과자</button>
	<button id="cate3" type="button">식품</button>
	<button id="cate4" type="button">아이스크림</button>
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
	        	self.location = "category.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&category=" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });
	      $(function(){
		        $('#cate1').click(function() {
		          self.location = "category.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&category=1" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });
	      $(function(){
		        $('#cate2').click(function() {
		          self.location = "category.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&category=2" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });
	      $(function(){
		        $('#cate3').click(function() {
		          self.location = "category.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&category=3" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });
	      $(function(){
		        $('#cate4').click(function() {
		          self.location = "category.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&category=4" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });
	    </script>
	  </div>
	</div>
<div class="contt">	
 <table>
 	<thead>
 		<tr>
	 		<th>상품이름</th>
	 		<th>가격</th>
	 		<th>편의점</th>
	 		<th>할인종류</th>
 		</tr>
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
</div>
<div class="cont">
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="category.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="category.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="category.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
<div class="cont"></div>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>