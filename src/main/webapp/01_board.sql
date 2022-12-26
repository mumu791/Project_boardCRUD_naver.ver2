/*
������Ʈ �� : Project00_board
�۾��� : JSP���� �Խ��� ����
*/
--���� �Խ��� ����� ����
drop table board_user;
drop table board_post;

--���̺� ���� ����
create table board_user(
    id varchar2(20) PRIMARY key,
    pwd varchar2(16) not null,
    name varchar2(50) not null,
    nickname varchar2(20) default '�̸�����',
    address varchar2(50) not null,
    tel varchar2(20) not null,
    email varchar2(30),
    imgurl varchar2(200) default './images/icon2_03.png'
);
select * from board_user;

--���̺� �Խ��� ����
create table board_post (
    seq         number(5)    PRIMARY key,
    title       varchar2(200) not null,
    content     varchar2(2000) not null,
    regdate     date            default sysdate,
    cnt         number(5)       default 0,
    id      varchar2(20)
);
select * from board_post;

--Test ������ �Է�(���� �Է�)
insert into board_post(seq,title,content,id)values(1,'test','test','kmj');
INSERT into board_user(id,pwd,name,address,tel) VALUES('kmj','1111','�����','������','01012345678');
INSERT into board_user VALUES('mj','1111','�����','�Ƿ�Ƽ','����','01012345678','email@naver.com','https://cdn.pixabay.com/photo/2022/01/18/07/36/cat-6946498_960_720.jpg');

commit;
ROLLBACK;


-- ���̵�� ���� ã�� (�����ġ��)
select * from board_user where id='mj';

--�� ��� �ҷ�����( ���̵�� �г��� ��ġ)
select * from board_post;
select board_post.*,board_user.nickname,board_user.imgurl 
from board_post,board_user 
where board_post.id = board_user.id 
order by seq desc;

--�۹�ȣ �ڵ� ����.? �Է�
insert into board_post(seq,title,content,id)values(
    (select nvl(max(seq),0)+1 from board_post),'Ÿ��Ʋ','������','id��'
);

--�Խñ� ������Ʈ�ϱ� 
update board_post set title='�����׽�Ʈ',content='�����׽�Ʈ' where seq=1;

--��ȸ�� ����
update board_post set cnt = (select cnt+1 from board_post where seq=1) where seq=1;

--�Խñ� ����
delete from board_post where seq=4;
delete from board_user where id='mj';

-- �������� ������Ʈ�ϱ�
select * from board_user where id = 'mj';
update board_user set pwd='1112',name='�躸��',nickname='����',address='����',tel='01098743321',email='name@naver.com' where id ='mj';

--��Ÿ �۾� 
--�Խñ� �� ���� ǥ��
select count(seq) from board_post;
--����� ǥ��
select count(id) from board_user;
-- ���۸� ǥ��?



