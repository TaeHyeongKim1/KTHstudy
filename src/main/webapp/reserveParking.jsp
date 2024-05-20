<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Date,  java.text.SimpleDateFormat"
    import= "thirdproject.Reservation"
    import="java.sql.Connection"
    import="java.sql.SQLException"
    import="java.sql.PreparedStatement"
    import="thirdproject.DBConnection"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 결과</title>
    <link rel="stylesheet" href="styles.css">
    <style>
     body{
     background-image:URL('https://park.airport.co.kr/resources/images/common/img-visual-02.png');
     }
    </style>
</head>
<body>

    <div class="container">
        <h1>예약 결과</h1>
        <% 
            // 폼 데이터 받아오기
            String airport = request.getParameter("airport");
            String parkingLot = request.getParameter("parkingLot");
            String entryDate = request.getParameter("entryDate");
            String exitDate = request.getParameter("exitDate");
            String carNumber = request.getParameter("carNumber");
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                conn = DBConnection.getConnection();
                // SQL 쿼리 실행을 위한 PreparedStatement 객체 생성
                String sql = "INSERT INTO parkingHistory (airport, parkingLot, carNumber,entryDate,exitDate) VALUES (?,?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                // PreparedStatement에 값 설정
                pstmt.setString(1, airport);
                pstmt.setString(2, parkingLot);
                pstmt.setString(3, carNumber);
                pstmt.setString(4, entryDate);
                pstmt.setString(5, exitDate);
                // SQL 쿼리 실행
                pstmt.executeUpdate();
                // 성공 메시지 출력
                out.println("<p>차량 번호 " + carNumber + " 이(가) 성공적으로 등록되었습니다.</p>");
            } catch (SQLException e) {
                e.printStackTrace();
                // 오류 메시지 출력
                out.println("<p>차량 번호 등록 중 오류가 발생했습니다.</p>");
            } finally {
                // 자원 해제
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            // 날짜 문자열을 Date 객체로 변환
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date entryDate1 = dateFormat.parse(entryDate);
            Date exitDate1 = dateFormat.parse(exitDate);

            // Reservation 객체 생성 및 주차 요금 계산
            Reservation reservation = new Reservation(entryDate1, exitDate1);
            int parkingFee = (int)reservation.CalculateParkingsale();
        %>
        
        <p><strong>공항:</strong> <%= airport %></p>
        <p><strong>주차장:</strong> <%= parkingLot %></p>
        <p><strong>입차 날짜:</strong> <%= entryDate %></p>
        <p><strong>출차 날짜:</strong> <%= exitDate %></p>
        <p><strong>차량 번호:</strong> <%= carNumber %></p>
        <p><strong>주차 요금:</strong> <%= parkingFee %>원</p>
        
        <a href="mainimage.html"><span align="center">메인으로 돌아가기</span></a>
    </div>
</body>
</html>