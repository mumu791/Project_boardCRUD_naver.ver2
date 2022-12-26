<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="./css/login.css">
    <!-- JS -->
  <script src="./js/jquery-1.12.4.min.js"></script>
  <script src="./js/jquery-3.3.1.min.js"></script>
  <script src="./js/prefixfree.min.js"></script>
 
</head>
<body>
  <div id="wrap">
    <header>
      <h1 class="logo_font"><a href="#">NAVER</a></h1>
    </header>
    <main role="main">
      <section id="login">
        <h2>ID 로그인</h2>
        <form action="LoginCtrl" method="post">
          <ul id="login_form">
            <li>
              <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp;
              <input type="text" name="id" id="id" placeholder="아이디">
            </li>
            <li>
              <i class="fa fa-lock" aria-hidden="true"></i>&nbsp;&nbsp;
              <input type="password" name="pwd" id="pwd" placeholder="비밀번호">
            </li>
          </ul>
          <input type="submit" value="로그인" id="submit">
        </form>
      </section>
      <section id="login_link">
        <a href="#">비밀번호 찾기</a>|<a href="#">아이디 찾기</a>|<a href="./signup.jsp">회원가입</a>
      </section>
      <section id="ad">
        <h3>
          <a href="#"><img src="./images/login_ad.png" alt="광고">
          <div id="ad_text">
            <h3>찐빵 생각나는 요즘</h3>
            <p>NEW 춘식이 가습기로 <br> 건조함 케어해요</p>
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
<script>
$('#login_form #id').on('focus',function(){
  $('#login_form li:last-child').css({"border-color": "#ccc"});
  $('#login_form li:first-child').css({"border-color": "#03c75a"});
  $('#login_form li:last-child').css({"border-top-color": "#03c75a"});
  $('.fa-user-o').css({"color": "#000"});
  $('.fa-lock').css({"color": "#ccc"});
  
})
$('#login_form #pwd').on('focus',function(){
  $('#login_form li:first-child').css({"border-color": "#ccc"});
  $('#login_form li:last-child').css({"border-top-color": "#ccc"});
  $('#login_form li:last-child').css({"border-color": "#03c75a"});
  $('.fa-user-o').css({"color": "#ccc"});
  $('.fa-lock').css({"color": "#000"});
})
$('#login_form input').on('blur',function(){
  $('#login_form li:first-child').css({"border-color": "#ccc"});
  $('#login_form li:last-child').css({"border-top-color": "#ccc"});
  $('#login_form li:last-child').css({"border-color": "#ccc"});
})


</script>
</html>