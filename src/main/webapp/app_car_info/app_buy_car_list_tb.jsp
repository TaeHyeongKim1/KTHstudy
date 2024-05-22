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
    <table>
	<tr>
		<th>차종</th>
		<th>제조사</th>  
		<th>연료</th>
		<th>엔진형식</th>
		<th>배기량</th>
		<th>변속기</th>
		<th>차량가격</th>
	</tr>
<%
        for (String[] cars : buyCarList) {
%>

        <tr>
			<td><%=cars[0]%></td> 
			<td><%=cars[1]%></td> 
			<td><%=cars[2]%></td> 
			<td><%=cars[3]%></td> 
			<td><%=cars[4]%></td> 
			<td><%=cars[5]%></td> 
			<td><%=cars[6]%></td> 
        </tr>
<%
        }
%>
    </table>
<%
    } else {
%>
    <h2>저장된 데이터가 없습니다.</h2>
<%
    }
%>
</body>
</html>