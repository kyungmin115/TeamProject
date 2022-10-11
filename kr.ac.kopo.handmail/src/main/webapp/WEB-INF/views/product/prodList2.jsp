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
<link rel="stylesheet" href="/resources/css/gongj.css" type="text/css"/>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div class="cont">
	 <div class="search">
	    <select name="searchType" class="selBox">
	      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
	      <option value="cu"<c:out value="${scri.searchType eq 'cu' ? 'selected' : ''}"/>>CU</option>
	      <option value="gs25"<c:out value="${scri.searchType eq 'gs25' ? 'selected' : ''}"/>>GS25</option>
	      <option value="seven"<c:out value="${scri.searchType eq 'seven' ? 'selected' : ''}"/>>세븐</option>
	      <option value="emart24"<c:out value="${scri.searchType eq 'emart24' ? 'selected' : ''}"/>>이마트</option>
	    </select>
	
	    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="srch"/>
	
	    <button id="searchBtn" type="button" class="srchBtn">검색</button>
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "category.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
			<div class="chu">상품</div>
		<div class="bot-box1"><button class="botl"><img src="/resources/images/main/오른쪽버튼.png" alt="오른쪽버튼" class="bot-right"></button></div>
		    <div class="outer">
		        <div class="iner">
		            <section class="slide">
		        	<c:forEach var="item" items="${result}">
		                <div class="box"><div class="mini">${item.store}</div>
		                <div><img src="/pyony/${item.imgName}" alt="" class="img"></div>
		                <p>${item.prodName}</p>
		                <p>${item.prodPrice}</p>
		                </div>
		            </c:forEach>
		            </section>
		            <section class="slide">
		            <c:forEach var="item" items="${result1}">
						<div class="box"><div class="mini">${item.store}</div>
		                <div><img src="/pyony/${item.imgName}" alt="" class="img"></div>
		                <p>${item.prodName}</p>
		                <p>${item.prodPrice}</p>
		                </div>
		            </c:forEach>
		            </section>
		            <section class="slide">
		            <c:forEach var="item" items="${result2}">
						<div class="box"><div class="mini">${item.store}</div>
		                <div><img src="/pyony/${item.imgName}" alt="" class="img"></div>
		                <p>${item.prodName}</p>
		                <p>${item.prodPrice}</p>
		                </div>
		            </c:forEach>
		            </section>
		        </div>
		    </div>
		    <div class="bot-box2"><button class="botr"><img src="/resources/images/main/왼쪽버튼.png" alt="왼쪽버튼" class="bot-left"></button></div>
		</div>
</div>
<div class="gong"></div>
<div class="gong"></div>
<div class="line">
	<section class="gongj">
        <div class="sahang">공지사항</div>
        <div class="the"><a href="/board/list.do">+더보기</a></div>
        <c:forEach var="vo" items="${board}" begin="0" end="5">		
        <div class="neyong">
            <div class="fl">
                <div class="nob"><c:out value="${vo.boardNo}" /></div>
                <div class="dat"><fmt:formatDate value="${vo.boardRegDate}" pattern="yyyy/MM/dd" /></div>
            </div>
            <div>
                <div class="ta"><c:out value="${vo.boardWriter}" /></div>
                <div class="ta"><a href="${pageContext.request.contextPath}/board/edit.do?boardNo=${vo.boardNo}"><c:out value="${vo.boardTitle}" /></a></div>
            </div>
        </div>
        </c:forEach>
    </section>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
<script src="/resources/js/slide.js" type="text/javascript"></script>
</html>