--select t.dept_name,avg(t.SAL)  from emp_dept t group by t.DEPT_NAME --having avg(SAL)>2000

--create table emp_copy as select * from emp;

/*--��һ����   ��ʹ�ü�¼��pl/sql�����

declare
  --�������ݼ�����
  --type t_emp is record(
  gonghao2 VARCHAR2(8);
  name2    nvarchar2(20);
  ename2   varchar2(20);
  oname2   varchar2(20);
  year2    number(2, 0);
  indate2  date;
  code2    number(8, 0);
  sal2     number(20, 0);
  -- );
  --������¼���ͱ���
  --emp_info t_emp;
begin
  --��emp����ȡ��������¼����
  --  select gonghao,name,ename,oname,year,indate,code,sal into emp_info from emp where code = :deptno;

  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2
    from emp
   where emp.gonghao = 3;   --���where����ʹ�õ��ǲ��ű��,���ڲ���������ݣ���into��ֵ����ִ�У������where����ֻ��ɸѡ��һ�����ݣ�������Ч

  dbms_output.put_line(gonghao2 || name2||ename2||oname2||year2|| indate2||code2||sal2);
  --����в�������
  --insert into emp_copy (gonghao,name,ename,oname,year,indate,code,sal) values emp_info;
  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);
  
exception
  when others then
    null;
  
end;
*/

---�ڶ�����  ʹ�ü�������������
/*
declare
  --�������ݼ�����
  type t_emp is record(
    gonghao2 VARCHAR2(8),
    name2    nvarchar2(20),
    ename2   varchar2(20),
    oname2   varchar2(20),
    year2    number(2, 0),
    indate2  date,
    code2    number(8, 0),
    sal2     number(20, 0));
  --������¼���ͱ���
  emp_info t_emp;
begin
  --��emp����ȡ��������¼����
  --  select gonghao,name,ename,oname,year,indate,code,sal into emp_info from emp where code = :deptno;

  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO emp_info
    from emp
   where emp.gonghao = &sssa; --���where����ʹ�õ��ǲ��ű��,���ڲ���������ݣ���into��ֵ����ִ�У������where����ֻ��ɸѡ��һ�����ݣ�������Ч

  --dbms_output.put_line(gonghao2 || name2||ename2||oname2||year2|| indate2||code2||sal2);
  --����в�������
  insert into emp_copy values emp_info;
  --  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);

exception
  when others then
    null;
end;*/




--���Ĳ���   a.��¼���͸�ֵ

/*declare
  --�������ݼ�����    type emp_record emp%rowtype ��ʾ����emp_record��¼��emp���еĸ����е�����������ͬ

  --type emp_record is record(
      emp_row emp%rowtype;
  --);
  -- ʹ�� %type��������������ͷ�ʽ
  --v_gonghao emp.gonghao%type;  --���幤�ŵı�����emp���е�gonghao����������һ��

  --������¼���ͱ���
 -- emp_info emp_record;
  --emp_info emp_row;
begin
  --��emp����ȡ��������¼����
  --  select gonghao,name,ename,oname,year,indate,code,sal into emp_info from emp where code = :deptno;
  
  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO emp_row
    from emp
   where gonghao = '1'; --���where����ʹ�õ��ǲ��ű��,���ڲ���������ݣ���into��ֵ����ִ�У������where����ֻ��ɸѡ��һ�����ݣ�������Ч

  --dbms_output.put_line(gonghao2 || name2||ename2||oname2||year2|| indate2||code2||sal2);
  --����в�������
  insert into emp_copy values emp_row;
  --  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);

exception
  when others then
    null;
end;*/


/*   --%rowtype �����¼���͵����ַ�ʽ
declare
  --�������ݼ�����    emp_row emp%rowtype ��ʾ����������emp_row��¼��emp���еĸ����е�����������ͬ
   --�����¼���ͷ�ʽ1    �����¼���Ͳ���������¼���ͱ�����һ�����
   emp_row emp%rowtype;

  -- ʹ�� %type��������������ͷ�ʽ
  --v_gonghao emp.gonghao%type;  --���幤�ŵı�����emp���е�gonghao����������һ��
     
  --�����¼���ͷ�ʽ2    ����ʹ�� type ��¼������  is record��������ʽ����������ʱ������
   type emp_rec is record(
       dept_row dept%rowtype,
       v_empno number(8) := 1,
       v_name varchar2(20):= '�����',
       v_job varchar2(20) := 'NBA�˶�Ա',
       v_sal number(8) := 8000000
       
   );
   emp_r emp_rec;
   
   
begin
  --��emp ����ȡ��������¼����

  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO emp_row
    from emp
   where gonghao = &import; --���where����ʹ�õ��ǲ��ű��,���ڲ���������ݣ���into��ֵ����ִ�У������where����ֻ��ɸѡ��һ�����ݣ�������Ч

  dbms_output.put_line(emp_row.name||emp_r.v_name||' '||emp_r.v_job);
  --����в�������
  insert into emp_copy values emp_row;
  --  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);

exception
  when others then
    null;
end;*/





--b.ʹ�ü�¼����������

declare
  /*type emp_row is record(
  v_gonghao emp.gonghao%type,
  v_year emp.year%type,
  v_oname     emp.oname%type
  );*/
  --type emp_record emp%rowtype;
  emp_row emp%rowtype;
  --emprowdata emp_row;

begin

  select * into emp_row from emp t1 where t1.gonghao = 1;

  dbms_output.put_line(emp_row.name||'  ���ţ�'||emp_row.gonghao);
  emp_row.name:='��С��';
  dbms_output.put_line('����֮�� '||emp_row.name||'  ���ţ�'||emp_row.gonghao);
  
  
  update emp t1 set t1.name = emp_row.name where t1.gonghao=emp_row.gonghao;
  commit;
  
  dbms_output.put_line('����������ɣ�');

end;






