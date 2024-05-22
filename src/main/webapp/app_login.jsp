<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/backweb/a00_com/a01_common.css" >
<title>Insert title here</title>
</head>
<style>
    .centered {
        text-align: center;
    }
</style>
<body>
<%-- 	<h2>loginId:<%=request.getParameter("username")%></h2>
	<h2>Password:<%=request.getParameter("password")%></h2> --%>

 <%
// 1. 아이디 패스워드 체크
String username = request.getParameter("username"); if(username==null) username = "";
String password = request.getParameter("password"); if(password==null) password = "";
if(username.equals("himan") && password.equals("7777")){
	// 2. 세션 설정
	out.println("<script>alert('login Sucess');</script>"); // out : 화면에 출력시 처리되는 내장 객체..
	// 세션으로 로그인 아이디 설정
	session.setAttribute("member", username);
}else{
	// 3. 유효하지 않을 때, 로그 인페이지 이동
	out.println("<script>alert('login Fail'); "+
		"location.href='app_login.html'</script>"); // out : 화면에 출력시 처리되는 내장 객체..
}
%>
<%-- 4. 로그인 세션 출력, 로그아웃 클릭시, session 종료페이지 이동 처리.. --%>
<h2 align="center" style="color:blue"><%= session.getAttribute("member")%> : login</h2>
<div class="centered">
    <button onclick="location.href='app_login.html'">로그 아웃</button>
</div>
</body>
</html>