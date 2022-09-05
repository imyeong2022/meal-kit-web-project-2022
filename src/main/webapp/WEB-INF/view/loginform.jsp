<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>

<script type="text/javascript">

 function callfindem(){
	   window.open('findem', 'pop', "width=400,height=300");
	   
   }
 
 function callfindpw(){
	   window.open('findpw', 'pop', "width=400,height=300");
	   
 }
 </script>

   <link href="css/styles.css" rel="stylesheet" >
    <title>로그인</title>
</head>
<%@ include file="header.jsp"%>
<body>

    <header class="welcome-header">
    <div class="welcome-header__logo">
        <h1 class="welcome-header__title">로그인</h1>

        </div>
    </header>

    <form action="login" method="POST" id="login-form">
        <input name="email" type="text"  placeholder="  이메일을 입력해주세요"  />
        <input name="pwd" type="password"  placeholder="  비밀번호를 입력해주세요"/>
        <input type="submit" value="로그인"/>
    </form>
     <form action="joinForm" id="signup-form" name="call">
    	<input type="submit" value="회원가입"/>
    	<table>
    	<tr><td><a href="#" onclick="callfindem(); return false;">아이디 찾기</a> | <a href="#" onclick="callfindpw(); return false;"> 비밀번호 찾기</a></td></tr>
    	</table>
    	</form>
    	
</body>
</html>