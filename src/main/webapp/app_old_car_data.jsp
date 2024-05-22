<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/backweb/a00_com/a01_common.css" >
<title>Insert title here</title>
</head>
<body>
	<%
		String manufacturers = request.getParameter("manufacturer");
		String kiacars = request.getParameter("kiacar");
		String yearStaFroms = request.getParameter("yearStaFrom");
		String yearStaTos = request.getParameter("yearStaTo");
		String mileageFroms = request.getParameter("mileageFrom");
		String mileageTos = request.getParameter("mileageTo");
		String carpriceForms = request.getParameter("carpriceForm");
		String carpriceTos = request.getParameter("carpriceTo");
		String fuels = request.getParameter("fuel");
		String gears = request.getParameter("gear");
		
	    session.setAttribute("manufacturers_out", manufacturers);
	    session.setAttribute("kiacars_out", kiacars);
	    session.setAttribute("yearStaFroms_out", yearStaFroms);
	    session.setAttribute("yearStaTos_out", yearStaTos);
	    session.setAttribute("mileageFroms_out", mileageFroms);
	    session.setAttribute("mileageTos_out", mileageTos);
	    session.setAttribute("carpriceForms_out", carpriceForms);
	    session.setAttribute("carpriceTos_out", carpriceTos);
	    session.setAttribute("fuels_out", fuels);
	    session.setAttribute("gears_out", gears);

		if (manufacturers != null) {
	%>
	<h2>차량검색조건</h2>
	<table>
	<tr>
		<th>제조사</<th>
		<th>차종</<th>
		<th>연식</<th>
		<th>주행거리</<th>
		<th>가격</<th>
		<th>연료</<th>
		<th>기어</<th>
	</tr>
	<tr>
		<td><%=manufacturers%></<td>
		<td><%=kiacars%></<td>
		<td><%=yearStaFroms%> ~ <%=yearStaTos%>년식</<td>
		<td><%=mileageFroms%> ~ <%=mileageTos%>km</<td>
		<td><%=carpriceForms%> ~ <%=carpriceTos%>만원</<td>
		<td><%=fuels%></<td>
		<td><%=gears%></<td>
	</td>
	</table>
	<%
		}
	%>

</body>
</html>