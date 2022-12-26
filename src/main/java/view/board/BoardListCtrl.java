package view.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.board.BoardVO;
import biz.common.JDBCConnection;

/**
 * Servlet implementation class BoardListCtrl
 */
@WebServlet("/BoardListCtrl")
public class BoardListCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myPost = request.getParameter("myPost");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null){response.sendRedirect("login.jsp");}
		String count_user = "";
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			//�쑀���닔 �몴�떆
			conn = JDBCConnection.getConnection();
			String sql = "select count(id) from board_user";
			stmt= conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {count_user=rs.getString(1);}
			stmt.close();
			
			// 紐⑸줉 異쒕젰
			if(myPost ==null) {
				sql="select board_post.*,board_user.nickname,board_user.imgurl "+
						"from board_post,board_user where board_post.id = board_user.id order by seq desc";
				stmt = conn.prepareStatement(sql);
			}else {
				sql="select board_post.*,board_user.nickname,board_user.imgurl "+
						"from board_post,board_user where board_post.id = board_user.id and board_user.id=? order by seq desc";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
			}
			rs= stmt.executeQuery();
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setRegdate(rs.getDate(4));
				board.setCnt(rs.getInt(5));
				board.setId(rs.getString(6));
				board.setNickname(rs.getString(7));
				board.setImgurl(rs.getString(8));
				
				boardList.add(board);
				
			}
			session.setAttribute("count_user", count_user);
			request.setAttribute("boardList", boardList);
			
			RequestDispatcher dis = request.getRequestDispatcher("boardList.jsp");
			dis.forward(request, response);
			
			
		} catch (Exception e) {
		
		}
	}

}
