<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/mypage.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<nav id="sub_menu">
	<!-- 	<ul>
			<li><a href="cartlist">장바구니</a></li>
			<li><a href="orderlist">나의 주문목록</a></li>
		</ul> -->
	</nav>

	<div class="wrap">
		<div class="greenContainer">
			<div>
				<div class="grade">${authInfo.level}등급</div>
				<div class="name">${authInfo.name}님</div>
			</div>
		</div>
		<div class="summaryContainer">
			<div class="item">
				<div class="number"></div>
				<div>상품포인트</div>
			</div>
			<div class="item">
				<div class="number">${authInfo.point}</div>
				<div>포인트(POINT)</div>
			</div>
		</div>
		<div class="shippingStatusContainer">
			<div class="title">주문/배송조회</div>
			<div class="status">

				<div class="item">
					<div>
						<div class="green number">6</div>
						<div class="text">장바구니</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="number">0</div>
						<div class="text">결제완료</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">1</div>
						<div class="text">배송중</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">3</div>
						<div class="text">구매확정</div>
					</div>
				</div>

			</div>

		</div>
		<div class="listContainer">
			<a href="MyOrderList" class="item">
				<div class="icon">ii</div>
				<div class="text">
					주문목록<span class="circle"></span>
				</div>
				<div class="right">></div>
			</a> <a href="Myreview" class="item">
				<div class="icon">ii</div>
				<div class="text">상품후기</div>
				<div class="right">></div>
			</a> <a href="Myitemqna" class="item">
				<div class="icon">ii</div>
				<div class="text">상품문의</div>
				<div class="right">></div>
			</a> <a href="wishlist" class="item">
				<div class="icon">ii</div>
				<div class="text">찜한상품</div>
				<div class="right">></div>
			</a>
		</div>
		<div class="listContainer">
			<a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">
					<span>내지갑</span> <span class="smallLight"> <span>|</span> <span>보유
							적립금</span>
					</span>
				</div>
				<div class="right">
					<span class="blct">175 BLCT</span> >
				</div>
			</a>
</body>
</html>
