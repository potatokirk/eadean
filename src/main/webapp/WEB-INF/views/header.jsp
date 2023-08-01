<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("utf-8");
%>
<style>@import '../css/css_header.css'</style>

</head>
 


<body>
           
    <div class="wrapper">
        <img src="/images/main.png" width="200" height="50" style="background-color: white;"><br>
        <ul>
            <li>
                <a class="home" onclick="location.href = 'main_board?u_id=${users.u_id}'">HOME</a>
            </li>
            <li>
                <a href="#" class="home">CONTENT</a>
            </li>
            <li>
                <a href="#" class="home">FAQ</a>
            </li>
            <li>
                <a href="#" class="home">CUSTOMER</a>
            </li> 
        </ul>
      
        <a href="admin/login" class="href_login">Login</a>
      
    </div>
   
</body>


</html>
