<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("utf-8");
%>
<title>Insert title here</title>
</head>
<body>

<form method="post" action="loginyn">
<table border="1" align="center">
<tr height="30">
<td width="100" align="center">사용자 ID</td>
<td width="100"><input type="text" name="u_id">
</tr>
<tr height="30">
<td width="100" align="center">비밀번호</td>
<td width="100"><input type="password" name="u_pwd">
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="로그인">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- controller 에 register 찾아감 -->
	<a href="register">회원가입</a>

</td>
</tr>
</table>
</form>
</body>
</html>