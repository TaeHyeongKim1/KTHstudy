<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.stream.Stream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/backweb/a00_com/a01_common.css" >
<title>Insert title here</title>
</head>
<body>
   <h1>Membership Information</h1>
    <h2>Username: <%=request.getParameter("username")%></h2>
   <h2>Password: <%=request.getParameter("password")%></h2>
   <h2>Password_chk: <%=request.getParameter("password_chk")%></h2>
   <h2>Name: <%=request.getParameter("name")%></h2>
   <h2>Email: <%=request.getParameter("email")%></h2>
   <h2>Phone: <%=request.getParameter("phone")%></h2>
   <h2>gender: <%=request.getParameter("gender")%></h2>
   <% 
    String agrees[] = request.getParameterValues("agree");
   String password = request.getParameter("password");
   String password_chk = request.getParameter("password_chk");
   if (!Objects.equals(password, password_chk)) {
   %>
         <h2>비밀번호가 일치합니다</h2>
   <%
     }
     else {
   %>
     <h2>비밀번호가 일치하지 않습니다</h2>
   <%
   }
   %>
   <%
    if(agrees != null){
        for(String agree : agrees){
    %>
    <h3>Agree: <%= agree %></h3>
    <% 
        }
    } 
    %>
   


</body>
</html>