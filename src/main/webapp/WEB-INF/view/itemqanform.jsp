<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">

	#header{
		 /* background-color:lightgrey; 
 */		height:100px;
	}
	#nav{
	/* 	 background-color:#339999;  */
		color:white;
		width:0px;
		height:0px;
		float:left;
	}
	#section{
	/*    background-color: blue;  */  
		width:550px;
		text-align:left;
		float:left; 
		margin: auto;
		/* padding:10px; */
	}
	#footer{
	 	/* background-color:#FFCC00;  */
		height:5px;
		clear:both;
	}
	#header, #nav, #footer {text-align:center;}
	#header, #footer{line-height:100px;}
	#nav{line-height:240px;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function check(){

		var buf = false;
		var num = 0;
		
		buf = name();
		if(!buf) num += 1;
		buf = title();
		if(!buf) num += 1;
		buf = checkdox();
		if(!buf) num += 1;			
		buf = content();
		if(!buf) num += 1;		
		
		// 0이면 문제 없다.
		if(num == 0){
			
			var prodcode = ${prodcd};
			var username = document.getElementById('user').value;
		 	var qnatitle = document.getElementById('title').value;
			var qnacheck = document.getElementById('rock').checked;
			var qnapwd = document.getElementById('pwd').value;
			var qnacontent = document.getElementById('t_content').value;  
			
			
 			$.ajax({
				type:"post",
				data:{"username":username,"qnatitle":qnatitle,"qnacheck":qnacheck,"qnapwd":qnapwd,"qnacontent":qnacontent,"prodcode":prodcode},
				url:"itemqnainsert",
				datatype :"json",
			    success:function(result){
			    	//alert("결과");
			   	//	alert(result);
			    	if(result == 0){
			    		//alert("성공");
			    		//qnaList();
				    //	opener.location.href="item?prod_cd=${prodcd}&image=${imagecd}&page=${page}";
					//	window.close();		
			    		var  scrollTop =  opener.parent.window.document.body.scrollTop;
			    		opener.parent.location.reload();
			    		opener.parent.window.document.body.scrollTop = scrollTop;
			    		window.close();
					
			    	}else alert("실패");

				}
			});   			
			
		}
			
	}
	
	
    function refreshAndClose() {
        window.opener.location.reload(true);
        window.close();
    }
	
	
	function qnaList(){
		
		var test = {
				"prodcd" : "d",
				"image" : "dd",
				"page" : "vv"
		}
		
		alert("map은 성공");
		
		$.ajax({
			type:"post",
			data: JSON.stringify(test),
			contentType:"application/json",
			url:"http://localhost:8080/team/item",
			datatype :"json",
		    success:function(result){
		   		alert("성공");
			}
		});   	
		
	}
	
	
	
	function name(){	
		 var name = document.getElementById('user');
		 if( name.value == "" ){
                alert("작성자를 입력해 주세요!!!");                
                name.focus();	// 엔터이벤트.
                return false;
         }
		 return true; 	
	}
	
	function title(){
		var title = document.getElementById('title');
		 if( title.value == "" ){
             alert("제목을 입력해 주세요!!!");                
             title.focus();	// 엔터이벤트.
             return false;
     	 }
		 return true; 	
	}
	
	
	function checkdox(){
		
		 var ckdox = document.getElementById('rock').checked;
		 
		 if(ckdox){
			 var pw = document.getElementById('pwd');
			 if(pw.value == ""){
				 alert("비밀번호를 입력해 주세요!!!"); 
				 pw.focus();	// 엔터이벤트.
				 return false;
			 }
    	 }else{
			 var pw = document.getElementById('pwd');
			 if(pw.value != ""){
				 alert("체크박스를 체크해 주세요!!!"); 
				 pw.focus();	// 엔터이벤트.
				 return false;
			 }    		 
    	 }
		 
		 return true; 	
	}	
	
	
	function content(){
		var content = document.getElementById('t_content');
		 if( content.value == "" ){
             alert("내용을 입력해 주세요!!!");                
             content.focus();	// 엔터이벤트.
             return false;
     	 }
		 return true; 	
	}
	

</script>

</head>
<body>

<!-- //<div id="header"> -->
	
<!-- 	<div id="header">
		
	</div>
		<div id="nav">
		
	</div> -->
	
	
		<p style="padding:5px;"></p>
	<div id="section">
	
		<div style="margin-left:200px">
		<h2>상품 Q&A 등록</h2>
	</div>
	
	
	<p style="padding:5px;"></p>
	
	<form action="itemqnainsert" method="post" name="qna">
	
		<table >
			<tr>
				<td>작성자</td><td><input type="text" id="user" name="user" value="${name}"/></td>
			</tr>
			<tr>
				<td>비밀번호</td><td><input type="text" id="pwd" name="pwd" /></td>
			</tr>		
			<tr>
				<td>제목</td><td><input type="text" id="title" name="title" /></td>
			</tr>
			<tr>
				<td></td><td><input type="checkbox" id="rock" name="rock" />비밀글</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<textarea style=" resize: none;" id="t_content" name="t_content" rows="10" cols="60" ></textarea>
				</td>
			</tr>								
		</table>
		
		<input type="hidden" name="prod_cd" value="${prodcd}" />
		<input type="hidden" name="image" value="${imagecd}" />
		
		<p style="padding:10px;"></p>
		
		<div style="margin-left:220px">
	 	<input type="button" class="submit" value="등록"  onclick="check()"/>
 	 	<input type="button" class="cancel" value="취소" onclick="self.close()" />
		</div>
	</form>
	
</div>
	<div id="footer">
	
</div>


</body>
</html>