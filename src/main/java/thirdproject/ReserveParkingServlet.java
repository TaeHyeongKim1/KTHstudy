package thirdproject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReserveParkingServlet
 */
public class ReserveParkingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveParkingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    String airport = request.getParameter("airport");
		    String parkingLot = request.getParameter("parkingLot");
		    String entryDate = request.getParameter("entryDate");
		    String exitDate = request.getParameter("exitDate");
		    String carNumber = request.getParameter("carNumber");
	        
	       

	       
	        // DB 연결 및 데이터 삽입
		    try (Connection connection = DBConnection.getConnection();
		            PreparedStatement statement = connection.prepareStatement("INSERT INTO parkingHistory (airport, parkingLot, carNumber, entryDate, exitDate) VALUES (?, ?, ?, ?, ?)")) {
		    		statement.setString(1, airport);
		    		statement.setString(2, parkingLot);
		    		statement.setString(3, carNumber);
		            statement.setString(4, entryDate);
		            statement.setString(5, exitDate);
		            statement.executeUpdate();
		       } catch (SQLException e) {
		           e.printStackTrace();
		       }

	        // 예약 확인 페이지로 리다이렉트
	        response.sendRedirect("reserveCheck.jsp");
	    }
	}


