Portal3

V1.5 2017/7/30�@�}���E�폜�p�v���O�����ǉ��̃u�����`�؂�

�v���O���������p��SQL��
create table portaldb(
id number(3) primary key,
url varchar2(100) not null,
name varchar2(100),
hiduke date,
sitename varchar2(100)
);

create sequence seq_id;

insert into portaldb values(seq_id.nextval,'about:blank','��̃y�[�W','20170101','��');