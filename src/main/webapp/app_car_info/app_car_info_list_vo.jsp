<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="backweb.vo.CarInfo"
    import="java.util.ArrayList"
    %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/backweb/a00_com/a01_common.css" >
<title>차량구매정보</title>
<style>
body, button {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Basic button styles */
.basic-button {
    background-color: gray; /* Primary blue color */
    color: #FFFFFF; /* White text */
    border: none; /* No border */
    border-radius: 4px; /* Rounded corners */
    padding: 10px 20px; /* Padding for size */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s ease; /* Smooth transition for background color */
}

/* Hover state */
.basic-button:hover {
    background-color: blue;
}

/* Active state */
.basic-button:active {
    background-color: red;
}

/* Focus state */
.basic-button:focus {
    outline: none; /* Remove default focus outline */
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5); /* Custom focus outline */
}
</style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
	// 구매하기 버튼 누른 차종 종류
	String carname = request.getParameter("carname");
	String carcorp = request.getParameter("carcorp");
	String carfuel = request.getParameter("carfuel");
	String carengin = request.getParameter("carengin");
	String carcc = request.getParameter("carcc");
	String cargear = request.getParameter("cargear");
	String carprice = request.getParameter("carprice");
	ArrayList<CarInfo> clist = new ArrayList<CarInfo>();
	ArrayList<CarInfo> sessClist = (ArrayList<CarInfo>)session.getAttribute("clist");
	if(sessClist!=null){
		clist = sessClist;
	}
	if(carname!=null){
		CarInfo c01 = new CarInfo(carname, carcorp, carfuel, carengin, carcc, cargear, carprice);
		clist.add(c01);
		session.setAttribute("clist",clist);
	}
	%> 

	<h3>세션에 등록된 차량 정보 list</h3>
	<table>
		<tr>
			<th>차종</th><th>제조사</th><th>연료</th><th>엔진형식</th><th>배기량</th><th>변속기</th><th>차량가격</th>
		</tr>
		<%
		for(CarInfo c : clist){ 
		
		%>
		<tr><td><%=c.getCarName()%></td><td><%=c.getCarCorp()%></td><td><%=c.getCarFuel()%></td>
		<td><%=c.getCarEngin()%></td><td><%=c.getCarCc()%></td><td><%=c.getCarGear()%></td>
		<td><%=c.getCarPrice()%></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>