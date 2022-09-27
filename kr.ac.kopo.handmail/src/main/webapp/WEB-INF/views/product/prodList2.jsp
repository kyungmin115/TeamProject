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
<link rel="stylesheet" href="/resources/css/slide.css" type="text/css"/>
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
		<div class="imgbox"><a href="http://localhost:8004/product/category.do?page=1&perPageNum=10&searchType=n&category=2&keyword="><img src="/resources/images/main/과자류.png" alt="과자류"></a></div>
		<div class="imgbox"><a href="http://localhost:8004/product/category.do?page=1&perPageNum=10&searchType=n&category=1&keyword="><img src="/resources/images/main/음료.png" alt="음료"></a></div>
		<div class="imgbox"><a href="http://localhost:8004/product/category.do?page=1&perPageNum=10&searchType=n&category=4&keyword="><img src="/resources/images/main/아이스크림.png" alt="아이스크릠"></a></div>
		<div class="imgbox"><a href="http://localhost:8004/product/category.do?page=1&perPageNum=10&searchType=n&category=3&keyword="><img src="/resources/images/main/식품.png" alt="식품"></a></div>
	</section>
	</div>
<div class="line">
	<div class="bbox">
			<div class="chu">추천상품</div>
		<div class="bot-box1"><button class="botl"><img src="/resources/images/main/오른쪽버튼.png" alt="오른쪽버튼" class="bot-right"></button></div>
		    <div class="outer">
		        <div class="iner">
		
		            <section class="slide">
		                <div class="box"><div class="mini">CU</div>
		                <div><img src="/resources/images/main/과자류.png" alt=""></div>
		                <p>롯)칠성사이다</p>
		                <p>2,000원</p>
		                </div>
		                <div class="box"><div class="mini">GS25</div></div>
		                <div class="box"><div class="mini">세븐일레븐</div></div>
		                <div class="box"><div class="mini">이마트24</div></div>
		            </section>
		
		            <section class="slide">
		                <div class="box"><div class="mini">CU</div>
		                <div><img src="/resources/images/main/음료.png" alt=""></div>
		                <p>롯)팔성사이다</p>
		                <p>8,000원</p>
		                </div>
		                <div class="box"><div class="mini">GS25</div></div>
		                <div class="box"><div class="mini">세븐일레븐</div></div>
		                <div class="box"><div class="mini">이마트254</div></div>
		            </section>
		
		            <section class="slide">
		                <div class="box"><div class="mini">CU</div>
		                <div><img src="/resources/images/main/식품.png" alt=""></div>
		                <p>롯)구성사이다</p>
		                <p>9,000원</p>
		                </div>
		                <div class="box"><div class="mini">GS25</div></div>
		                <div class="box"><div class="mini">세븐일레븐</div></div>
		                <div class="box"><div class="mini">이마트294</div></div>
		            </section>
		        </div>
		    </div>
		    <div class="bot-box2"><button class="botr"><img src="/resources/images/main/왼쪽버튼.png" alt="왼쪽버튼" class="bot-left"></button></div>
		</div>
</div>

	<section class="secti">
	
	
	
	</section>
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
<script src="/resources/js/slide.js" type="text/javascript"></script>
</html>