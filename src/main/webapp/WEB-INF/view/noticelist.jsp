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

	<section class="infosection" >

		<h3> 공 지 사 항</h3>
			<c:if test="${!empty noticelist}">
			<table id="noticeList">
				<tr>
					<th>번호</th><th>제 목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
				<c:forEach var="notice" items="${noticelist}">
					<tr>
						<td><a href='noticedetail?noticd=${notice.noticd}'>${notice.noticd}</a></td>
						<td>${notice.subject}</td>
						<td>${notice.name}</td>
						<td><fmt:formatDate value="${notice.indate}" pattern="yyyy-MM-dd" /></td>
						<td>${notice.views}</td>
					</tr>
					
					
					<%-- <tr>
						<td><a href='noticedetail?noticd=${notice.noticd}'>${notice.noticd}</a></td>
						<td><a href='noticedetail?subject=${notice.subject}'>${notice.subject}</a></td>
						<td><a href='noticedetail?name=${notice.name}'>${notice.name}</a></td>
						<td><a href='noticedetail?indate=<fmt:formatDate value="${notice.indate}" pattern="yyyy-MM-dd" />'>${notice.indate}</a></td>
						<td><a href='noticedetail?views=${notice.views}'>${notice.views}</a></td>
					</tr>  --%>
					
					
							
							
				</c:forEach>
				
			</table>
			</c:if>
			<c:if test="${empty noticelist}">
			<text>"아직 공지사항이 없습니다. 감사합니다"</text>
			</c:if>
	</section>
	</div>
	
</body>
</html>