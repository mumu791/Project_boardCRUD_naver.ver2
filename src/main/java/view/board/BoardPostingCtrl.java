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


@WebServlet("/BoardPostingCtrl")
public class BoardPostingCtrl extends HttpServlet {

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
		ResultSet rs = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null){response.sendRedirect("login.jsp");}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		try {
			conn=JDBCConnection.getConnection();
			String sql = "insert into board_post(seq,title,content,id)"+
					"values((select nvl(max(seq),0)+1 from board_post),?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, id);
			stmt.executeUpdate();
			response.sendRedirect("BoardListCtrl");
			
			stmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
