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


</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<hr>
	<div id="header">
		<h2>고 객 센 터</h2>
	</div>
	</div>
	<div class="sectiondiv">
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

		<h3>공 지 사 항</h3>


     		<c:if test="${!empty noticedetail}">
     			
     		
		
			<table id="noticeList">
				<tr>
					<th>번호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>공지일</th>
					<th>조회수</th>
				</tr>

       
				<tr>
				<td>${noticedetail.get(0).noticd}</td>
				<td>${noticedetail.get(0).subject}</td>
				<td>${noticedetail.get(0).name}</td>
				<td><fmt:formatDate value="${noticedetail.get(0).indate}"
						pattern="yyyy-MM-dd" /></td>
				<td>${noticedetail.get(0).views}</td>
			</tr>
			
		</table>

		<table>
			<c:forEach var="notice" items="${noticedetail}">
				<img src="images/notice/${notice.image}" />
			</c:forEach>					
			
			
				<tr class="tr-1">
					<td>${noticedetail.get(0).subject}</td>
				</tr>
				<tr class="tr-2">
					<td>${noticedetail.get(0).content}</td>
				</tr>
			
		</table>

		</c:if>
		<c:if test="${empty noticedetail}">
		
			<text>"아직 공지사항이 없습니다. 감사합니다"</text>

		</c:if>
	

		<div class="list_a" style="font-size: 20px;
	font-color: red;
	font-weight: bold;
	padding: 0 0 100px 0;">
			<a href="noticelist">목록</a>
		</div>
		
		
	</section>
  </div>
</body>
</html>