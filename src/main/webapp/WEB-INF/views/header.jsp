<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<%
request.setCharacterEncoding("utf-8");
%>
<style>
@import
'../css/css_common.css'
</style>
<style>
@import
'../css/css_mainPage.css'
</style>
</head>
<body>
	<header>
		<div class="top">
			<div>

				<c:choose>
					<c:when test="${sessionScope.u_id eq null }">
						<a class="nav-link " onclick="return false;"></a>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.access_Token eq null }">
								<a class="nav-link " onclick="return false;">
									${sessionScope.u_nick}님 환영합니다</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link " onclick="return false;">
									${sessionScope.u_nick}님 환영합니다</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${sessionScope.u_id eq null }">
						<a href="kakaoSignIn">로그인</a>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.access_Token eq null }">
								<a class="nav-link " href="/logout">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link " href="/kakaologout">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>




				<a href="">회원가입</a> <a href="">마이페이지</a> <a href=""> <i
					class="fa fa-shopping-cart" aria-hidden="true"></i> 장바구니
				</a>
			</div>
		</div>
		<div class="logo">
			<div>
				<a href="/"> <img src="./images/main.png" alt="헤더로고" width="220"
					height="75">EADEAN
				</a>
				<form action="#">
					<input type="text" name="search">
					<button>
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
			</div>
		</div>
		<div class="menu">
			<div>
				<ul>
					<li><a href="#">히트상품</a></li>
					<li><a href="#">추천상품</a></li>
					<li><a href="#">최신상품</a></li>
					<li><a href="#">인기상품</a></li>
					<li><a href="#">할인상품</a></li>
				</ul>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">자주묻는질문</a></li>
					<li><a href="#">문의하기</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
	</header>
</body>

</html>
