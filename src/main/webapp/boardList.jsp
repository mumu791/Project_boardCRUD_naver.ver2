<%@page import="biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	if(id==null){response.sendRedirect("login.jsp");}
	String nickname = (String)session.getAttribute("nickname");
	String count_user = (String)session.getAttribute("count_user");
	ArrayList<BoardVO> beanList = (ArrayList<BoardVO>)request.getAttribute("boardList");
	
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="kmj">
  <meta name="description" content="Portfolio, RWD Template">
  <title>네이버 게시판</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="shortcut icon" href="./images/favicon/mj_fav32.png">
  <link rel="apple-touch-icon=precomposed" href="./images/favicon/mj_fav32.png">
  <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
  <!-- 페이지css -->
  <link rel="stylesheet" href="./css/reset.css">
  <link rel="stylesheet" href="./css/display_none_scrollbar.css">
  <link rel="stylesheet" href="./css/boardList.css?ver=1.1">
    <!-- JS -->
  <script src="./js/jquery-1.12.4.min.js"></script>
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/prefixfree.min.js"></script>
   <script>
 	function logout() {
	  var answer = confirm('로그아웃 하시겠습니까?');
	  if(answer){
		  location.href="LogoutCtrl";
	  }
	}
 </script>

</head>
<body>
  <div id="wrap">
    <header>
      <h1 class="logo_font"><a href="login_result.jsp">NAVER</a> Cafe</h1>
      <div>
        <img src="./images/login_ad.png" alt="카페이미지" width="100px" height="100px">
        <div>
          <h2><a href="#">[노원이젠엠씨쌤]풀스택</a></h2>
          <p><br>멤버수 [<%=count_user %>] </p>
        </div>
      </div>
    </header>
    <main role="main">
    <aside><%=nickname %> (<%=id %>) &nbsp;&nbsp;&nbsp;<a onclick="logout();" id="logout_btn">로그아웃</a></aside>
      <section id="content">
        <article>
          <ul>
            <li><a href="BoardListCtrl">전체글</a></li>
            <li><a href="BoardListCtrl?myPost=s">내글보기</a></li>
            <li><a href="boardPosting.jsp">글등록</a></li>
            <li><input type="text">&nbsp;&nbsp;<i class="fa fa-search" aria-hidden="true"></i></li>
          </ul>
        </article>
        <ul>
<%
	for(BoardVO bean:beanList){
		
%> 
          <li>
          	<div><%=bean.getSeq() %></div>
            <a href="BoardPostCtrl?num=<%=bean.getSeq()%>">
              <h3><%=bean.getTitle() %></h3>
              <%=bean.getNickname() %> <%=bean.getRegdate() %>
            </a>
            <p>조회수<br><%=bean.getCnt() %></p>
          </li>
<%
	}
%>
        </ul>
      </section>
    </main>
    <footer>
      <h3>
        <a href="#">이용약관</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
        <a href="#">개인정보처리방침</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
        <a href="#">책임의 한계와 법적고지</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
        <a href="#">회원정보 고객센터</a>
      </h3>
      <p><span class="lobo_c">NAVER</span> Copyright <span class="font_c">&copy; NAVER Corp.</span> All Rights Reserved.</p>
    </footer>
  </div>

</body>
<script>
</script>
</html>