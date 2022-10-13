<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="line">
    <header class="hed">
        <ul class="mid">
            <li class="mid"></li>
            <li class="imag"><a href="../product/list.do"><img src="/resources/images/header/logo.png" alt=""></a></li>
            <li class="made"></li>
            <li class="mid"><a href="/views.do">소개</a></li>
            <li class="mid"><a href="../board/list.do">게시판</a></li>
            <li class="mid"><a href="/product/event.do">상품 서비스</a></li>
            <li class="mid"><a href="/recipe/list.do">추천 레시피</a></li>
            <li class="mid"></li>
            <li class="mid"></li>
            <li class="" style="display: flex;flex-direction: column-reverse;">
            	<c:if test="${member != null}">
						${member.memName}님 환영 합니다.
				</c:if>
            	<a href="../member/login.do">
            		<img src="/resources/images/header/로그인버튼.png" alt="로그인" style="width: 40px">
            	</a>
            </li> 
        </ul>
    </header>
    </div>