create table company_emp
(
empno number(4) primary key not null, --Ա������
ename varchar2(10 byte),     --Ա������
job varchar2(9 byte),   --Ա��ְλ
mgr number(4),  --��������
hiredate  date,  --��Ӷ����
sal  number(7,2),  --Ա������
comm  number(7,2), --Ա������
deptno number(2)    --���ű���

)
