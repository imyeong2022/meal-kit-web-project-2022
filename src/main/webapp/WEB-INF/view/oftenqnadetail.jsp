<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/noticelist.css" rel="stylesheet">


</head>
<body>
	<jsp:include page="header.jsp"/>

	<hr>
	<div id="header">
		<h2>고 객 센 터</h2>
	</div>
	</div>
	<div id="section">
		<div class="info">
			<a href="noticelist">공지사항</a>
		</div>
		<div class="info">Q & A</div>
		<li><a href="oftenqnalist" class="qna">자주하는 질문</a></li>
		<p>
		<li><a href="qnalist" class="qna">1:1 문의</a></li>
	</div>

	<section class="infosection">

		<h3> 자주하는 질문</h3>

			<table id="noticeList">
				<tr>
					<th>번호</th><th>카테고리</th><th>제 목</th>
				</tr>
					<tr>
						<td>${oftenqnadetail.oftqnacd}</a></td>
						<td>${oftenqnadetail.category}</td>
						<td>${oftenqnadetail.subject}</td>
					</tr>
					

			</table>
			
			<table>
					<tr class="tr-1">
						<td>${oftenqnadetail.subject}</td>
					</tr>
					<tr class="tr-2">
						<td>${oftenqnadetail.content}</td>
					</tr>		
				</table>


			<div><a href="oftenqnalist">목록</a></div>
		
			
	</section>
	
</body>
</html>