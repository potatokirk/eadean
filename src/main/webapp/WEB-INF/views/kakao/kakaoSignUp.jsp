<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <meta name="viewport" content="width=device-width,initial-scale=1"> -->
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>카카오 추가 회원가입</title>
<style>
@import'../css/kakao/css_kakaosignUp.css'
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
					if(checkNickname == "u_nick"){
						alert("중복된 닉네임이 존재합니다.");
					return false;
			}
			}) //submit
	}); //end of ready
</script> 
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<%@ include file="../header.jsp" %>
<body>

<div class="form-structor" id="screen2">

  <div class="signup">
    <h2 class="form-title" id="signup">KAKAO Sign Up</h2>
  </div>
  <form method="post" action="kakaoSignUpOk" name="regform" id="kakaoRegisterForm">
    <div class="form-holder">

        <div class="txt">
            <input class="inputtxt1" type="text" size="20" name="u_email" required placeholder="이메일">
        </div>

      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_nick" id="u_nickname" placeholder="닉네임">
      </div>

<!--  
      <div class="chk">
        <span class="nick_ok">사용 가능한 닉네임입니다.</span>
        <span class="nick_already">중복된 닉네임입니다.</span>
      </div>
-->

      <div class="txt">
        <input class="inputtxt1" type="text" size="12" name="u_phone" required placeholder="폰번호  (000-0000-00000)">
      </div>   

      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_address" required placeholder="주소입력">
      </div>

      <input type ='hidden' name='u_id' value="${u_id}">
    </div>
    
    
        <input type="submit" class="submit-btn" value="회원가입">
        <input type="submit" value="취소" class="cencle">
        
</form>
    </div>
</body>
<%@ include file="../footer.jsp" %>
</html>