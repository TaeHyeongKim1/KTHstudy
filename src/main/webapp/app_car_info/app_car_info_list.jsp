<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    if (carname != null && !carname.trim().isEmpty() && carcorp != null && !carcorp.trim().isEmpty()) {
        try {
            /* int age = Integer.parseInt(carprice); */

            // 세션에서 carData 리스트를 가져오거나 없으면 새로 생성
            List<String[]> carData = (List<String[]>) session.getAttribute("carData");
            if (carData == null) {
                carData = new ArrayList<>();
            }

            // 새 데이터 추가
            /* carData.add(new String[]{username, String.valueOf(age), gender}); */
            // 차량리스트로 변경
            carData.add(new String[]{carname, carcorp, carfuel, carengin, carcc, cargear, carprice });

            // 세션에 carData 리스트 저장
            session.setAttribute("carData", carData);

            out.println("<h2>차량구매정보가 저장되었습니다.</h2>");
        } catch (NumberFormatException e) {
            out.println("<h2>차량가격은 숫자이어야 합니다.</h2>");
        }
    } else {
        out.println("<h2>필수 항목이 입력되지 않았습니다</h2>");
    }
%>
     <li>차종: <%=carname%></li>
     <li>제조사: <%=carcorp%></li>
     <li>연료: <%=carfuel%></li>
     <li>엔진형식: <%=carengin%></li>
     <li>배기량: <%=carcc%></li>
     <li>변속기: <%=cargear%></li>
     <li>차량가격: <%=carprice%></li>

<a href="app_buy_car_list_tb.jsp"><button class="basic-button">장바구니보기 </button></a>

</body>
</html>