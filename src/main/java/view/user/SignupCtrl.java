package view.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardVO;
import biz.common.JDBCConnection;


@WebServlet("/SignupCtrl")
public class SignupCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql="INSERT into board_user VALUES(?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, request.getParameter("id"));
			stmt.setString(2, request.getParameter("pwd"));
			stmt.setString(3, request.getParameter("name"));
			stmt.setString(4, request.getParameter("nickname"));
			stmt.setString(5, request.getParameter("address"));
			stmt.setString(6, request.getParameter("tel"));
			stmt.setString(7, request.getParameter("email"));
			stmt.setString(8, request.getParameter("imgurl"));
			stmt.executeUpdate();
			
			request.setAttribute("id", request.getParameter("id"));
			request.setAttribute("email", request.getParameter("email"));
			
			RequestDispatcher dis = request.getRequestDispatcher("signupresult.jsp");
			dis.forward(request, response);
			
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
