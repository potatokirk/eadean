<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style>
table{
margin-left:auto;
margin-right:auto;
}
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 	
  <script type="text/javascript">
$(document).ready(function(){
	  $(".cencle").on("click", function(){
		//			location.href = "../shop/list";
		location.href = "../users/userSignIn";
		})

	var checkNickname="";
		    $('.nick_already').css("display", "none");
	       	$('.nick_ok').css("display", "none");
	       	
	       	
	       	 $("#u_nick").keyup(function() {
			   checkNickname="";
// 			닉네임 중복확인
	       	var nickname = $('#u_nick').val();
			$.ajax({
				url : "nickChk",
				type : "post",
				dataType : "json",
				data : {"u_nick" : nickname},
				
				success : function(data){
					if(data == 0){
	                    $('.nick_ok').css("display","inline-block"); 
	                    $('.nick_already').css("display", "none");
	                    checkNickname="Y";
					}else{
	                    $('.nick_already').css("display","inline-block");
	                    $('.nick_ok').css("display", "none");
					}
				}, //end of success
				
				error : function(request, error){
					alert("fail");
					alert("code: " +request.status + "\n" + "message: "+ request.responseText + "\n" +"error:" +error);
				} //end of error
			}); //end of ajax
		});//end of keyup
			
			$("#kakaoRegisterForm").submit(function(){
					if(checkNickname == ""){
						alert("중복된 닉네임이 존재합니다.");
					return false;
			}
			}) //submit
	}); //end of ready
</script> 
</head>
<body>
<header>
		<%@include file="../header.jsp"%>
		</header>
	
		
<table board="1" align="center">
		<form method="post" action="registerOk">
			<tr height="50">
				<td colspan="2">
					<h1>회원가입 신청</h1>
				</td>
			
			 <tr height="30">
                <td width="80">User ID</td>
                <td><input type="text" size="20" name="u_id"></td>
            </tr>

			<tr height="30">
				<td width="80">암호 </td>
				<td><input type="password" size="20" name="u_pwd"></td>
			</tr>

			<tr height="30">
				<td width="80">별명</td>
				<td><input type="text" size="20" name="u_name"></td>
			</tr>

			<tr height="30">
				<td width="80">이메일</td>
				<td><input type="text" size="20" name="u_email"></td>
			</tr>
			
				
				<td colspan="2">
				<input type="submit" value="등록">
				</td>
			
			</tr>


		</form>
	</table>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>