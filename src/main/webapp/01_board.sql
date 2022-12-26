/*
프로젝트 명 : Project00_board
작업명 : JSP기초 게시판 연습
*/
--기존 게시판 지우고 시작
drop table board_user;
drop table board_post;

--테이블 유저 생성
create table board_user(
    id varchar2(20) PRIMARY key,
    pwd varchar2(16) not null,
    name varchar2(50) not null,
    nickname varchar2(20) default '이름없음',
    address varchar2(50) not null,
    tel varchar2(20) not null,
    email varchar2(30),
    imgurl varchar2(200) default './images/icon2_03.png'
);
select * from board_user;

--테이블 게시판 생성
create table board_post (
    seq         number(5)    PRIMARY key,
    title       varchar2(200) not null,
    content     varchar2(2000) not null,
    regdate     date            default sysdate,
    cnt         number(5)       default 0,
    id      varchar2(20)
);
select * from board_post;

--Test 데이터 입력(정보 입력)
insert into board_post(seq,title,content,id)values(1,'test','test','kmj');
INSERT into board_user(id,pwd,name,address,tel) VALUES('kmj','1111','김미진','성동구','01012345678');
INSERT into board_user VALUES('mj','1111','김미진','실론티','서울','01012345678','email@naver.com','https://cdn.pixabay.com/photo/2022/01/18/07/36/cat-6946498_960_720.jpg');

commit;
ROLLBACK;


-- 아이디로 행을 찾기 (비번매치용)
select * from board_user where id='mj';

--글 목록 불러오기( 아이디랑 닉네임 매치)
select * from board_post;
select board_post.*,board_user.nickname,board_user.imgurl 
from board_post,board_user 
where board_post.id = board_user.id 
order by seq desc;

--글번호 자동 증가.? 입력
insert into board_post(seq,title,content,id)values(
    (select nvl(max(seq),0)+1 from board_post),'타이틀','콘텐츠','id값'
);

--게시글 업데이트하기 
update board_post set title='수정테스트',content='수정테스트' where seq=1;

--조회수 증가
update board_post set cnt = (select cnt+1 from board_post where seq=1) where seq=1;

--게시글 삭제
delete from board_post where seq=4;
delete from board_user where id='mj';

-- 유저정보 업데이트하기
select * from board_user where id = 'mj';
update board_user set pwd='1112',name='김보경',nickname='달추',address='가양',tel='01098743321',email='name@naver.com' where id ='mj';

--기타 작업 
--게시글 총 갯수 표시
select count(seq) from board_post;
--멤버수 표시
select count(id) from board_user;
-- 내글만 표시?



