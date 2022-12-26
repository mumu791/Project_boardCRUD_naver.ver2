package view.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.JDBCConnection;


@WebServlet("/LoginCtrl")
public class LoginCtrl extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nickname = "";
		String db_pwd = null;
		String imgurl = "";
		int count=0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn =JDBCConnection.getConnection();
			String sql = "select * from board_user where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs= stmt.executeQuery();
			if(rs.next()){
				db_pwd=rs.getString("pwd");
				nickname = rs.getString("nickname");
				imgurl =rs.getString("imgurl");
			}
			stmt.close();
			rs.close();
			
			sql="select count(seq) from board_post where id=?";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}

			PrintWriter out = response.getWriter();
			
			//비번이 맞다면 session에 아이디와 닉네임 입력 아니라면 로그인창으로
			HttpSession session = request.getSession();
			if(db_pwd ==null) {
				out.println("<script>alert('아이디/비밀번호 미입력.다시 시도바랍니다.'); location.href='login.jsp';</script>");
			}else if(db_pwd.equals(pwd)){				
				session.setAttribute("id", id);
				session.setAttribute("nickname", nickname);
				session.setAttribute("imgurl", imgurl);
				response.sendRedirect("login_result.jsp");
			}else {
				out.println("<script>alert('아이디/비밀번호 오류.다시 시도바랍니다.'); location.href='login.jsp';</script>");
				
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
	
	}

}
