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
<link href="css/qna.css" rel="stylesheet">
<script>
	function selectAll(selectAll) {
		const checkboxes = document.getElementsByName('qnacd');
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	}
</script>



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

		<h3> 1:1 문의</h3>
			<c:if test="${!empty qnalist}">
			<table id="noticeList">
				<tr>
				
					<th><input type="checkbox" name="pseq" value="${qna.qnacd}" onclick='selectAll(this)'/>전체선택</th>
					<th>유 형</th><th>제 목</th><th>작성일</th><th>답변상태</th>
				</tr>
				<c:forEach var="qna" items="${qnalist}">
					<tr>
						<td><input type="checkbox" name="qnacd" value="${qna.qnacd}"/></td>
						<td>${qna.category}</td>
						<td><a href='qnadetail?qnacd=${qna.qnacd}'>${qna.subject}</a></td>
						<td><fmt:formatDate value="${qna.indate}" pattern="yyyy-MM-dd" /></td>
						<td>
						<c:if test="${(qna.rep) == 1}">처리 진행 중</c:if>
 	  					<c:if test="${(qna.rep)  == 2}">처리 완료</c:if></td>
					</tr>
				</c:forEach>
				
			</table>
			<table class="fonction-i">
					<form class="fonction-icons" method="get" action="delete">
					<th><a href="delete" type="submit" >삭제하기</a></th>
					</form>
					
					<form class="fonction-icons" method="post" action="qnaupdate">
						<input type="submit" id="update" value="수정하기">
					</form>
			</table>
			</c:if>
			
			<div class="qna-b-function">
				<c:if test="${empty qnalist}">
				<div class="qna">
					<div class="qna_not"> 작성하신 1:1 문의가 없습니다."</div>
				</div>
				</c:if>
				<div class="qnareq">
					<input type="button" id="qnaadd" value="문의하기" onclick="location.href='qnaaddform'">
				</div>
			</div>
	</section>
	</div>
</body>
</html>