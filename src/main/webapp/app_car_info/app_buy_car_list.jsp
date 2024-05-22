<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/backweb/a00_com/a01_common.css" >
<title>Insert title here</title>
</head>
<body>
<%
    // 세션에서 userData 리스트를 가져옴
    List<String[]> buyCarList = (List<String[]>) session.getAttribute("carData");

    if (buyCarList != null && !buyCarList.isEmpty()) {
%>
    <h2>차량구매 장바구니 데이터</h2>
    <ul>
<%
        for (String[] cars : buyCarList) {
%>
	        <li>차종: <%=cars[0]%></li>
	        <li>제조사: <%=cars[1]%></li>
	        <li>연료: <%=cars[2]%></li>
	        <li>엔진형식: <%=cars[3]%></li>
	        <li>배기량: <%=cars[4]%></li>
	        <li>변속기: <%=cars[5]%></li>
	        <li>차량가격: <%=cars[6]%></li>
<%
        }
%>
    </ul>
<%
    } else {
%>
    <h2>저장된 데이터가 없습니다.</h2>
<%
    }
%>
</body>
</html>