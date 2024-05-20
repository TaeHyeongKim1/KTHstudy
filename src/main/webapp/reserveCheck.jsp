<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.* "
import="thirdproject.DBConnection" 
import="java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="check.css">
    <meta charset="UTF-8">
    <title>차량 목록</title>
    
</head>
<body>
<a href="mainimage.html"><span align="center">뒤로가기</span></a>
<div class="container">
   <h1>주차장 내역</h1>
   
    <table border="1">
        <tr>
            <th>ID</th>
            <th>공항 위치</th>
            <th>주차장 위치</th>
            <th>차량 번호</th>
            <th>입차 날짜</th>
            <th>출차 날짜</th>
        </tr>
        <% 
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM parkingHistory ORDER BY id");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String airport = resultSet.getString("airport");
                String parkingLot = resultSet.getString("parkingLot");
                String carNumber = resultSet.getString("carNumber");
                Timestamp entryDate = resultSet.getTimestamp("entryDate");
                Timestamp exitDate = resultSet.getTimestamp("exitDate");
        %>
        <tr>
        <td><%= id %></td>
        <td><%=airport %></td>
        <td><%=parkingLot %></td>
        <td><%= carNumber %></td>
        <td><%= entryDate != null ? new SimpleDateFormat("yyyy-MM-dd").format(entryDate) : "" %></td>
        <td><%= exitDate != null ? new SimpleDateFormat("yyyy-MM-dd").format(exitDate) : "" %></td>
    </tr>
        <% 
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        %>
    </table>
    
    
    </div>
   
</body>
</html>