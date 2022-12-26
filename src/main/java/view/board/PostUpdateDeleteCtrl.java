package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.common.JDBCConnection;


@WebServlet("/PostUpdateDeleteCtrl")
public class PostUpdateDeleteCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null){response.sendRedirect("login.jsp");}
		String update = request.getParameter("update");
		
		int seq = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		try {
			conn = JDBCConnection.getConnection();
			if(update != null) {
				//�뾽�뜲�씠�듃
				String sql = "update board_post set title=?,content=? where seq=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, title);
				stmt.setString(2, content);
				stmt.setInt(3, seq);
				stmt.executeUpdate();
				
				response.sendRedirect("BoardListCtrl");
			}else {
				//�궘�젣
				String sql = "delete from board_post where seq=?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, seq);
				stmt.executeUpdate();
				
				response.sendRedirect("BoardListCtrl");
				

			}
			stmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
