# Project_boardCRUD_naver.ver2

### [ NaverCafe Clone ]

1. 프로젝트 개요

  JSP/Servlet , OracleDB(sql)을 이용. 기본 CRUD(Create Read Update Delete)가 작동하는 홈페이지 구현 
  네이버, 네이버 카페 참조
  >Project_boardCRUD_naver 와 동일한 페이지, db 컨트롤을 servlet를 이용하여 구현.


2. 프로젝트 환경
<br> java  1.8 (Jdk. 1.8)
<br> Oracle  11g
<br> apache-tomcat-8.5.78
<br> eclipse  2021-06


3 . 프로젝트 사용법
  1. 프로젝트에 ojdbc6.jar , Servers에 해당 프로젝트 db연결 
  2. sql문을 사용하여 db에 테이블 생성
  3. index.jsp 부터 실행하여 회원가입 진행.
  4. 로그인하여 각 게시판 테스트


4 . 프로젝트 기능
  1. 회원가입 - 로그인
  2. 회원가입 정보 수정
  3. 로그아웃
  4. 게시판 작성, 확인, 수정, 삭제<br>
             = 수정,삭제는 작성자만 가능
  5. [상세로직 이동]()
  
  
5 . 프로젝트 결과물
  1. 회원가입
  2. 로그인 (로그인 실패 / 성공 ) / 로그아웃
  3. 회원정보 수정 (비밀번호 확인)
  4. 게시판  게시글 작성, 확인 ( 작성자에게만 수정,삭제버튼 표시 )
  5. 게시판  게시글 수정, 삭제 ( 성공 / 실패 )
