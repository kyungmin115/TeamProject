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
<link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div class="cont">
	 <div class="search">
	    <select name="searchType">
	      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
	      <option value="cu"<c:out value="${scri.searchType eq 'cu' ? 'selected' : ''}"/>>CU</option>
	      <option value="gs25"<c:out value="${scri.searchType eq 'gs25' ? 'selected' : ''}"/>>GS25</option>
	      <option value="seven"<c:out value="${scri.searchType eq 'seven' ? 'selected' : ''}"/>>세븐</option>
	      <option value="emart24"<c:out value="${scri.searchType eq 'emart24' ? 'selected' : ''}"/>>이마트</option>
	    </select>
	
	    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="searchh"/>
	
	    <button id="searchBtn" type="button" class="butt">검색</button>
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "search.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });   
	    </script>
	  </div>
	</div>
	<div class="line">
	<section class="sect">
		<div><a href="#"><img src="/resources/images/main/과자류.png" alt="과자류"></a></div>
		<div><a href="#"><img src="/resources/images/main/음료.png" alt="음료"></a></div>
		<div><a href="#"><img src="/resources/images/main/아이스크림.png" alt="아이스크릠"></a></div>
		<div><a href="#"><img src="/resources/images/main/식품.png" alt="식품"></a></div>
	</section>
	</div>
	<section class="secti">
	
	
	
	</section>
	<section class="secti">
	
	
	
	</section>
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>