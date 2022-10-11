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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/resources/css/sale.css">
<link rel="stylesheet" href="/resources/css/img.css" type="text/css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<section id="secc">
        <h1 id="heed">이벤트 상품</h1>
        <ul class="sel">
            <li class="sele"><a href="/product/category.do">카테고리별 상품</a></li>
            <li class="sele"><a href="/product/event.do">행사상품</a></li>
        </ul>
	 <div class="search">
	 	<div class="mid">
	    <select name="searchType" class="selBox">
	      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
	      <option value="cu"<c:out value="${scri.searchType eq 'cu' ? 'selected' : ''}"/>>CU</option>
	      <option value="gs25"<c:out value="${scri.searchType eq 'gs25' ? 'selected' : ''}"/>>GS25</option>
	      <option value="seven"<c:out value="${scri.searchType eq 'seven' ? 'selected' : ''}"/>>세븐</option>
	      <option value="emart24"<c:out value="${scri.searchType eq 'emart24' ? 'selected' : ''}"/>>이마트</option>
	    </select>
	
	    <input type="text" name="keyword" id="keywordInput" class="srch" value="${scri.keyword}"/>
	
	    <button id="searchBtn" class="srchBtn" type="button">검색</button>
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "event.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&sale=${scri.sale}&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });
	      $(function(){
		        $('#saleBtn1').click(function() {
		          self.location = "event.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&sale=1" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });
	      $(function(){
		        $('#saleBtn2').click(function() {
		          self.location = "event.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&sale=2" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });
	      $(function(){
		        $('#none').click(function() {
		          self.location = "event.do" + '${pageMaker.makeQuery(1)}'  + "&searchType=" + $("select option:selected").val()+ "&sale=" + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		        });
		      });
	    </script>
	  </div>
	 </div>
	 	
        <div>
            <ul class="select">
                <li><a href="#" id="none">전체 <span class="material-symbols-outlined">chevron_right</span></a></li>
                <li><a href="#" id="saleBtn1">1+1 <span class="material-symbols-outlined">chevron_right</span></a></li>
                <li><a href="#" id="saleBtn2">2+1 <span class="material-symbols-outlined">chevron_right</span></a></li>
            </ul>
        </div>
        <div class="big">
        	<c:forEach var="item" items="${result}">
            <div class="box">
                <a href="">
                    <p class="nomal">${item.store}&nbsp&nbsp
                    <c:choose>
		 				<c:when test="${item.sale eq '1'}"><c:out value="1+1"/></c:when>
		 				<c:when test="${item.sale eq '2'}"><c:out value="2+1"/></c:when>
		 			</c:choose>
 					</p>
                    <img src="/pyony/${item.imgName}" alt="" class="img">
                   	<p class="mini">${item.prodName}</p>
                    <p class="nomal">${item.prodPrice}</p>
                </a>
            </div>            
        	</c:forEach>
        </div>
        <div class="cont">
		  <ul>
		    <c:if test="${pageMaker.prev}">
		    	<li><a href="event.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li><a href="event.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li><a href="event.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
		  </ul>
		</div>
		<div class="cont"></div>
    </section>
	



<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>