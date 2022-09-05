<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>

<style>
	div {
	 text-align: center;
	 }
	 
	 table {
    margin-left:auto; 
    margin-right:auto;
}

</style>

  	<link href="css/styles.css" rel="stylesheet" >
    <title>회원가입</title>
    
    <script type="text/javascript">
   function emailchk(){
	   var email = joinform.email.value.trim();
	   
	   // 이메일 체크
	   var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   
       if(!e_RegExp.test(email)){
	 			if (email == null || email == ""){
		   			alert("이메일을 입력해주세요");
	   			}else{
	   				 alert("올바른 이메일 형식이 아닙니다.");
	   			}
       }else{
	 		window.open('emailcheck?email='+email,'pop',"width=500, height=150");
 	   }
	   
	  
   }
   
   
   function goemail(){
	   
	    document.getElementById("emailcheckbox").value = 0;
	   
   }
   
   
   function zipcheck(){
	   window.open('zipcode?zipcode=', 'pop', "width=800,height=400");
	   
   }
   
   
   function gocheck(){
	   
		var buf = false;
		var num = 0;
		
		buf = emailck();	
		if(!buf) num += 1;
		buf = pwck();	
		if(!buf) num += 1;
		buf = nameck();	
		if(!buf) num += 1;
		buf = phoneck();	
		if(!buf) num += 1;
		buf = addrck();	
		if(!buf) num += 1;
		
		// 0이면 문제 없다.
		if(num == 0) return buf = true;
		else return buf = false;
	   
   }
   
   
   function emailck(){
	   
	   var emailckbox = document.getElementById("emailcheckbox");
	   var email = document.getElementById("email");
	   var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   
	   if(emailckbox.value == 0){
		   alert("이메일 중복확인 버튼을 눌러주세요");
		   return false
	   }
	   else{
		    if(!e_RegExp.test(email.value)){
			   if (email == null || email == ""){
				   alert("이메일을 입력해주세요");
			   }
			   else{
				   alert("올바른 이메일 형식이 아닙니다.");
				   return false				   
			   }
		    }else{
		    	return true
		    }
	   }
	 
   }
   
   
    function pwck(){
	
    	 var pw1 = document.getElementById("pwd");
    	 var pw2 = document.getElementById("pwd2");
    
    	 var RegExp = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{4,16}$/
    	
    	 // 암호가 둘이 같아야한다.
    	 if(pw1.value == pw2.value){
    		 if (pw1.value == null || pw1.value == "" && pw2.value == null || pw2.value == ""){
				   alert("비밀번호를 입력해주세요.");
				   return false	
			 }
    		 else{
    			 if(!RegExp.test(pw1.value)){
    				 alert("비밀번호 4~16자의 영문 대소문자와 숫자,특수문자 입력하여 주세요.");
    				 return false	
    			 }
    			 else return true
    		 }
    		 
    	 }
    	 else{
    		 alert("비밀번호와 비밀번호확인이 서로 다릅니다."); 
    		 return false	
    	 }
    	 
    } 
   
   
    
    function nameck(){
    	
    	var name = document.getElementById("name");
    	var n_RegExp = /^[가-힣]{2,15}$/;
    	
    
    	if(name.value == "" || name.value == null){
    		alert("이름을 입력해주세요."); 
   		    return false
    	}
    	else{
    		if(!n_RegExp.test(name.value)){
        		alert("특수문자, 영어, 숫자는 사용할 수 없습니다."); 
       		    return false   			
    		}
    		else return true
    	}
    	
    }
   
    
    function phoneck(){
    	
    	var phone = document.getElementById("phone");
    	var ph_RegExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
    	
    	if(phone.value == "" || phone.value == null){
    		alert("전화번호를 입력해주세요"); 
   		    return false
    	}
    	else{
    		if(!ph_RegExp.test(phone.value)){
        		alert("\"-\" 포함하여 작성해주세요"); 
       		    return false   			
    		}
    		else return true   		
    	}
    	
    	
    }
   
    
    
    function addrck(){
    	
    	var zipnum = document.getElementById("zipnum");
    	var address = document.getElementById("address");
    	var zipchecked = document.getElementById("zipchecked");
    	
    	if(zipnum.value == "" || zipnum.value == null && address.value == "" || address.value == null){
      		alert("우편번호와 주소를 입력해주세요."); 
   		    return false	
    	}
    	else{
    	//	if(zipchecked.value == 0){
         // 		alert("우편번호 검색을 눌러주세요."); 
       	//	    return false   			
    	//	}
    	//	else{
    			return true
    		//}
    	}
    	
    }
   
    
    function goemail(){
    	
    	document.getElementById("emailcheckbox").value = 0;
    	
    }
   
	</script>
<%@ include file="header.jsp"%>
</head>
<body>
	

    <header class="join-header">
    <div class="join-header__logo">
                    <div class="join-header__logo-photo">
                    </div>
        <h1 class="join-header__title">회원가입</h1>

        </div>
    </header>

    <form action="join" method="post" name="joinform" id="join-form" onsubmit="return gocheck()">
    <table>
   	 	<tr><td><span>이메일 * </span></td>
        <td><input name="email" id="email" value='${ param.email }' class="form-control" type="text" placeholder="  6자 이상 영문 혹은 영문과 숫자를 조합" oninput="goemail()"/></td>
        <td><input type="button" value="중복 확인" id="btmCheck"   onclick="emailchk()" />
        <input type="hidden" id="emailcheckbox" value="0"/>
        </td>
        </tr>
        <span id = "result"></span>
        <input type="hidden" name="emailDuplication" value="emailUncheck">
        
        <tr><td><span>비밀번호*  </span></td>
        <td><input name="pwd" id="pwd" value='${ param.pwd }' class="form-control" type="password" placeholder="  비밀번호를 입력해주세요"/></td></tr>
        
        <tr><td><span>비밀번호 확인*  </span></td>
        <td><input name="pwd2" id="pwd2"  type="password" value='${ param.pwd }' placeholder="  비밀번호를 한번 더 입력해주세요"/></td></tr>
        
        <tr><td><span>이름* </span></td>
        <td><input name="name" id="name" type="text" value='${ param.mname }' placeholder="  이름을 입력해주세요"/></td></tr>
        
        <tr><td><span>휴대폰번호* (-포함)  </span></td>
        <td><input name="phone" id="phone" type="text" placeholder="  휴대폰번호를 입력해주세요"/></td></tr>
        
       	<tr><td><span>주소*  </span></td>
        <td><input name="zip_num" type="text" id="zipnum"  placeholder="  우편번호를 검색해주세요"></td>
        <td><input type=button value="우편번호 검색"  onclick="zipcheck()" />
         <input  type="hidden" id="zipchecked"  value="0" />
        </td>
        </tr>
         <tr><td><input name="useyn" type="hidden"  value="y"></td>
       <td><input name="address" type="text" id="address" ></td></tr>
        <input name="point" type="hidden"  value="0">
        <input name="level" type="hidden"  value="일반">
         
        
        
        <tr><td>&nbsp</td>
        <td><input type="submit" value="회원가입 제출"/></td></tr>
        </table>
    </form>
    
</body>
</html>