<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 	request.setCharacterEncoding("utf-8");
    String id = (String)request.getAttribute("id");
    String email = (String)request.getAttribute("email");
    
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="kmj">
  <meta name="description" content="Portfolio, RWD Template">
  <title>회원가입 완료</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="shortcut icon" href="./images/favicon/mj_fav32.png">
  <link rel="apple-touch-icon=precomposed" href="./images/favicon/mj_fav32.png">
  <link rel="stylesheet" href="./css/notosans_kr_CDN.css">
  <!-- 페이지css -->
  <link rel="stylesheet" href="./css/reset.css">
  <link rel="stylesheet" href="./css/display_none_scrollbar.css">
  <link rel="stylesheet" href="./css/signupresult.css">
    <!-- JS -->
  <script src="./js/jquery-1.12.4.min.js"></script>
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/prefixfree.min.js"></script>
 
</head>
<body>
  <div id="wrap">
    <header>
      <h1><a href="login.jsp">NAVER </a><i class="fa fa-check-circle-o" aria-hidden="true"></i></h1>
    </header>
    <main role="main">
      <h2>네이버 ID 회원가입이 완료 되었습니다.</h2>
      <p>아래의 아이디로 로그인하세요</p>
      <section id="joinus_result">
        <table>
          <tr>
            <th>아이디</th>
            <td><%=id %></td>
          </tr>
          <tr>
            <th>이메일</th>
            <td><%=id %>@naver.com</td>
          </tr>
          <%
          if(email !=null){
          %>
          <tr>
            <th>본인확인 이메일</th>
            <td><%=email %></td>
          </tr>
          <%
          }
          %>
        </table>
        <div id="login_box">
          <a href="./login.jsp">네이버 로그인하기</a>
        </div>
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