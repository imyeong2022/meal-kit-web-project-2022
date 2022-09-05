<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <jsp:useBean id="CartList" class="dto.CartList" scope="session" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/gocart.css" rel="stylesheet" >
</head>
<body>
 	<script type="text/javascript">
		function go_cart() {
			opener.location.href="cartlist";
			window.close();
			
		}
		
		
		function go_login() {
			opener.location.href="login";
			window.close();
			
		}	
	</script> 


	<c:choose>
		<c:when test="${empty sessionScope.authInfo}">
			<form action="cartlist" name="gocart" method="GET">
			<div class="search-title" >
				<i class="fas fa-shopping-cart fa-3x"></i>
			</div>
			<div class="search-title2">
				<h3 style="margin-left : 130px;">로그인 해주세요</h3>
			</div>
			<div class="go_cart" style="margin-left : 150px; width: 100px;">
				<input type="button" name="enter" value="로그인하기" style="magin-bottom:30px"  onclick="go_login()"> 
				<input type="button" name="cancle" value="닫기" onClick="self.close()"> 
			</div>
			</form>		
		</c:when>
		<c:when test="${!empty sessionScope.authInfo}">
			<form action="cartlist" name="gocart" method="GET">
			<div class="search-title" >
				<i class="fas fa-shopping-cart fa-3x"></i>
			</div>
			<div class="search-title2">
				<h3>장바구니에 상품이 정상적으로 담겼습니다.</h3>
			</div>
			<div class="go_cart"> <!-- style="margin: auto; width: 100px;" -->
				<input type="button" name="enter" value="장바구니 가기" onclick="go_cart()"> 
				<input type="button" name="cancle" value="계속 쇼핑하기" onClick="self.close()"> 
			</div>
			</form>
		</c:when>	
	</c:choose>
	
	
	
	<script src="https://kit.fontawesome.com/c0af9b6ae6.js"
	crossorigin="anonymous"></script>
</body>
</html>