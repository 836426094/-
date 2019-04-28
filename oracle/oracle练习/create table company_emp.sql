create table company_emp
(
empno number(4) primary key not null, --员工工号
ename varchar2(10 byte),     --员工名称
job varchar2(9 byte),   --员工职位
mgr number(4),  --所属经理
hiredate  date,  --雇佣日期
sal  number(7,2),  --员工工资
comm  number(7,2), --员工描述
deptno number(2)    --部门编码

)
