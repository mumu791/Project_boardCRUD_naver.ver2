package view.user;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.apache.catalina.connector.Response;

import biz.common.JDBCConnection;

@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check = null 이면 정보출력, 아닐경우 정보 업데이트
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String check = request.getParameter("check");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pwd =request.getParameter("pwd");
		String db_pwd="";
		Board_UserVO ubean = new Board_UserVO();
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCConnection.getConnection();
			if(check == null) {
				//정보출력
				String sql ="select * from board_user where id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					ubean.setId(rs.getString(1));
					ubean.setName(rs.getString(3));
					ubean.setNickname(rs.getString(4));
					ubean.setAddress(rs.getString(5));
					ubean.setTel(rs.getString(6));
					ubean.setEmail(rs.getString(7));
					ubean.setImgurl(rs.getString(8));
				}
				
				request.setAttribute("user", ubean);
				RequestDispatcher dis = request.getRequestDispatcher("memberUpdate.jsp");
				dis.forward(request, response);
				
				rs.close();
				stmt.close();
				conn.close();
				
			}else{
				// 비번확인
				String sql ="select pwd from board_user where id=?";
				stmt= conn.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				if(rs.next()) {
					db_pwd=rs.getString(1);
				}
				
				if(db_pwd.equals(pwd)) {
					// 업데이트
					sql = "update board_user set name=?,nickname=?,address=?,tel=?,email=?,imgurl=? where id =?";
					stmt =conn.prepareStatement(sql);
					stmt.setString(1, request.getParameter("name"));
					stmt.setString(2, request.getParameter("nickname"));
					stmt.setString(3, request.getParameter("address"));
					stmt.setString(4, request.getParameter("tel"));
					stmt.setString(5, request.getParameter("email"));
					stmt.setString(6, request.getParameter("profile_url"));
					stmt.setString(7, id);
					stmt.executeUpdate();
					
					response.sendRedirect("login_result.jsp");
					session.setAttribute("nickname", request.getParameter("nickname"));
					session.setAttribute("imgurl", request.getParameter("profile_url"));
					rs.close();
					stmt.close();
					conn.close();
					
				}else {
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호 오류.다시 시도바랍니다.'); history.back(-1);</script>");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
