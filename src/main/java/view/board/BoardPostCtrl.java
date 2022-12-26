package view.board;

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


@WebServlet("/BoardPostCtrl")
public class BoardPostCtrl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글하나 출력
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id==null){response.sendRedirect("login.jsp");}
		int seq = Integer.parseInt(request.getParameter("num"));
		BoardVO board = new BoardVO();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCConnection.getConnection();
			//조회수 증가
		    String sql="update board_post set cnt = (select cnt+1 from board_post where seq=?) where seq=?";
			stmt =conn.prepareStatement(sql);
			stmt.setInt(1, seq);
			stmt.setInt(2, seq);
			stmt.executeUpdate();
			
			//�궡�슜 異쒕젰
			sql = "select board_post.*,board_user.nickname,board_user.imgurl "+
					"from board_post,board_user where board_post.id = board_user.id and seq=?";
			stmt =conn.prepareStatement(sql);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				board.setSeq(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setRegdate(rs.getDate(4));
				board.setCnt(rs.getInt(5));
				board.setId(rs.getString(6));
				board.setNickname(rs.getString(7));
				board.setImgurl(rs.getString(8));
			}
			request.setAttribute("board", board);
			String update = request.getParameter("update");
			if(update==null) {
				RequestDispatcher dis = request.getRequestDispatcher("boardPost.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis = request.getRequestDispatcher("boardPostUpdate.jsp");
				dis.forward(request, response);
			}
		    rs.close();
			stmt.close();
			conn.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
