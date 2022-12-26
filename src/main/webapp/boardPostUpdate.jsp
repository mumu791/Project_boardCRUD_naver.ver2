<%@page import="biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String nickname =(String)session.getAttribute("nickname");
	if(id==null){response.sendRedirect("login.jsp");}
	String count_user = (String)session.getAttribute("count_user");
	BoardVO board = (BoardVO)request.getAttribute("board");
	%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="kmj">
  <meta name="description" content="Portfolio, RWD Template">
  <title>네이버 게시글 수정</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="shortcut icon" href="./images/favicon/mj_fav32.png">
  <link rel="apple-touch-icon=precomposed" href="./images/favicon/mj_fav32.png">
  <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
  <!-- 페이지css -->
  <link rel="stylesheet" href="./css/reset.css">
  <link rel="stylesheet" href="./css/display_none_scrollbar.css">
  <link rel="stylesheet" href="./css/boardPostUpdate.css?ver=1.1">
    <!-- JS -->
  <script src="./js/jquery-1.12.4.min.js"></script>
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/prefixfree.min.js"></script>
   <script>
  function deletemove(){
	  var answer = confirm('작성글을 삭제하시겠습니까?');
	  if(answer){
		  location.href="PostUpdateDeleteCtrl?num=<%=board.getSeq()%>";
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
      <aside>
        <div>
        	<a href="BoardListCtrl">게시글 목록</a>
        	<a onclick ="deletemove();">글 삭제</a>
        </div>
        <p><%=nickname %> (<%=id %>) &nbsp;&nbsp;&nbsp;<a onclick="logout();" id="logout_btn">로그아웃</a></p>
      </aside>
      <section id="content">
        <form method="post" action="PostUpdateDeleteCtrl">
          <article id="title">
            <h3><input type="text" name="title" value="<%=board.getTitle() %>"></h3>
            <div>
            <img src="<%=board.getImgurl() %>" alt="프로필" width="50px" height="50px">
            <p><%=nickname %><br><%=board.getRegdate() %><br>조회수 <%=board.getCnt() %></p>
            </div>
          </article>
          <article id="content_text">
            <textarea name="content" cols="30" rows="10"><%=board.getContent() %></textarea>
          </article>
          <input type="hidden" name="update" value="true">
          <input type="hidden" name="num" value="<%=board.getSeq() %>">
          <input type="submit" value="수정완료">
        </form>
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