
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String nickname = (String)session.getAttribute("nickname");
	String id = (String)session.getAttribute("id");
	String imgurl = (String)session.getAttribute("imgurl");
	if(id==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="kmj">
  <meta name="description" content="Portfolio, RWD Template">
  <title>네이버 로그인</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="shortcut icon" href="./images/favicon/mj_fav32.png">
  <link rel="apple-touch-icon=precomposed" href="./images/favicon/mj_fav32.png">
  <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
  <!-- 페이지css -->
  <link rel="stylesheet" href="./css/reset.css">
  <link rel="stylesheet" href="./css/display_none_scrollbar.css">
  <link rel="stylesheet" href="./css/loginresult.css">
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
      <h1 class="logo_font"><a href="#">NAVER</a></h1>
    </header>
    <main role="main">
      <h2><%=nickname %> 님 환영합니다.</h2>
      <section id="info">
        <article id="profile" >
          <h3><img src="<%=imgurl %>" alt="프로필 사진"></h3>
          <ul>
            <li><strong><%=nickname %></strong>님 |  <span>네이버ID <i class="fa fa-lock" aria-hidden="true"></i></span></li>
            <li><%=id %>@naver.com</li>
            <li>
              <ul id="notcion">
                <li><a href="#">메일 0</a></li>
                <li><a href="#">쪽지 0</a></li>
                <li><a href="UserUpdate">개인정보 수정</a></li>
              </ul>
            </li>
          </ul>
          <div id="logout_btn"><a onclick="logout();">로그아웃</a></div>
        </article>
        <article id="notice_list">
          <ul>
            <li>
              <a href="BoardListCtrl">
                <h3>전체글 목록</h3>
              </a>
            </li>
            <li>
              <a href="BoardListCtrl?myPost=<%=id%>">
                <h3>내글목록</h3>
              </a>
            </li>
            <li>
              <a href="boardPosting.jsp">
                <h3>글쓰기</h3>
              </a>
            </li>
          </ul>
        </article>
      </section>
      <section id="ad">
        <h3>
          <a href="#"><img src="./images/login_ad2.png" alt="광고">
          <div id="ad_text">
            <h3>안냥 고양이로 변신</h3>
            <p>젤리 장착한 <br> 라이언 냥냥인형</p>
          </div>
        </a>
        </h3>
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
</html>