# Project_boardCRUD_naver.ver2

### [ NaverCafe Clone ]

### 1. 프로젝트 개요

  JSP/Servlet , OracleDB(sql)을 이용. 기본 CRUD(Create Read Update Delete)가 작동하는 홈페이지 구현 
  네이버, 네이버 카페 참조
  >Project_boardCRUD_naver 와 동일한 페이지, db 컨트롤을 servlet를 이용하여 구현.


### 2. 프로젝트 환경
<br> java  1.8 (Jdk. 1.8)
<br> Oracle  11g
<br> apache-tomcat-8.5.78
<br> eclipse  2021-06


### 3 . 프로젝트 사용법
  1. 프로젝트에 ojdbc6.jar , Servers에 해당 프로젝트 db연결 
  2. sql문을 사용하여 db에 테이블 생성
  3. index.jsp 부터 실행하여 회원가입 진행.
  4. 로그인하여 각 게시판 테스트


### 4 . 프로젝트 기능
  1. 회원가입 - 로그인
  2. 회원가입 정보 수정
  3. 로그아웃
  4. 게시판 작성, 확인, 수정, 삭제<br>
             = 수정,삭제는 작성자만 가능
  
  ### = [상세로직 보기](https://mm4322.cafe24.com/portfolio/portfolio_img/naver_ver.2.svg)
  
  
### 5 . [프로젝트 결과물](#프로젝트-결과물-영상)
  1. [회원가입](#1-회원가입)
  2. [로그인 (로그인 실패 / 성공 ) / 로그아웃](#2-로그인-로그아웃)
  3. [회원정보 수정 (비밀번호 확인)](#3-유저정보-수정)
  4. [게시판  게시글 작성, 확인 ( 작성자에게만 수정,삭제버튼 표시 )](#4-게시판-등록-확인)
  5. [게시판  게시글 수정, 삭제 ( 성공 / 실패 )](#5-게시판-수정-삭제)



---
<div align=center>

## 프로젝트 결과물 영상

# 1. 회원가입
![naver_signup_pr](https://user-images.githubusercontent.com/96656259/209602408-d14921ac-1e44-4511-8450-52d9da75eab8.gif)


# 2. 로그인 로그아웃
![naver_loginout](https://user-images.githubusercontent.com/96656259/209602507-9218ef8a-d276-46ac-9f5c-e5322592d599.gif)


# 3. 유저정보 수정
![naver_userUpdate_pr](https://user-images.githubusercontent.com/96656259/209602440-411f4999-37a8-41d2-8cea-ae2d784c2a46.gif)


# 4. 게시판 등록 확인
![naver_boardPost](https://user-images.githubusercontent.com/96656259/209602527-434b60e7-b754-45c9-8025-73f86f8e43c4.gif)


# 5. 게시판 수정 삭제
![naver_boardPostUPdateDelete](https://user-images.githubusercontent.com/96656259/209602519-029528e4-c334-45ae-935b-d34b6b86dde6.gif)
</div>
