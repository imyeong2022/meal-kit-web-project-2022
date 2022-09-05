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
<script src="https://kit.fontawesome.com/c0af9b6ae6.js"
	crossorigin="anonymous"></script>

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
			<div class="qnaframebox">
				<form>
					
						<div class="qna-choose">
							<div>
								<div class="qna-choose-a">
									<label for="qna-choose-1">유 형</label>
									<div class="star"><i class="fa-solid fa-star"></i></div>
								</div>
							</div>
							<table class="qnadt-cate">
								<tr>
								
									<td>${qnadetail.get(0).category}</td>
								</tr>
								
							</table>
							<div>
								<div class="qnadt-date">
									<label for="qna-choose-1">작성일</label>
								</div>
							</div>
							<table class="qnadt-cate">
								<tr>
									<td>${qnadetail.get(0).indate}</td>
								</tr>
								
							</table>
							
						</div>
						<div class="qna-choose">
							<div>
								<div class="qna-choose-a">
									<label for="txt1">제 목</label>
									<div class="star"><i class="fa-solid fa-star"></i></div>
								</div>
								
							</div>
							<table class="qnadt-sbj">
								<tr>
									<td>${qnadetail.get(0).subject}</td>
								</tr>
							</table>
						</div>
						<div class="qna-textarea">
							<div>
								<div class="qna-choose-a">
									<label for="textarea">내 용</label>
									<div class="star"><i class="fa-solid fa-star"></i></div>
								</div>
							</div>
							<table class="qnadt-cont">
								<tr>
									<td>${qnadetail.get(0).content}</td>
								</tr>
							</table>
						</div>
	
						<c:if test="${!empty qnadetail.get(0).reply}">
							<div class="qna-textarea">
								<div>
									<div class="qna-choose-a">
										<label for="textarea">답 변</label>
										<div class="star"><i class="fa-solid fa-star"></i></div>
									</div>
								</div>
								<table class="qnadt-cont">
									<tr>
										<td>${qnadetail.get(0).reply}</td>
									</tr>
								</table>
							</div>
						</c:if>
						<c:forEach var="qna" items="${qnadetail }">
							<div class="qnadt-image">
								<c:if test="${qna.image != '' }">
									<img src="images/qna/${qna.image}" />
								</c:if>
							</div>
						</c:forEach>
						
					
						<div class="qnasubmit">
							<a href="qnalist"><input type="button" value="목록으로"></a>
							<a href="qnaupdate"><input type="submit" value="수정하기"></a>
							<a href="qnalist"><input type="submit" value="삭제하기"></a>
						
						</div>
					
						
					
				</form>
			</div>
			
	</section>
	</div>
</body>
</html>