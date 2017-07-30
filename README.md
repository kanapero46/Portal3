Portal3

V1.5 2017/7/30　挿入・削除用プログラム追加のブランチ切り

プログラム処理用のSQL文
create table portaldb(
id number(3) primary key,
url varchar2(100) not null,
name varchar2(100),
hiduke date,
sitename varchar2(100)
);

create sequence seq_id;

insert into portaldb values(seq_id.nextval,'about:blank','例のページ','20170101','例');