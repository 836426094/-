--select t.dept_name,avg(t.SAL)  from emp_dept t group by t.DEPT_NAME --having avg(SAL)>2000

--create table emp_copy as select * from emp;

/*--第一部分   不使用记录的pl/sql代码块

declare
  --定义数据集类型
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
  --声明记录类型变量
  --emp_info t_emp;
begin
  --从emp表中取数赋给记录类型
  --  select gonghao,name,ename,oname,year,indate,code,sal into emp_info from emp where code = :deptno;

  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2
    from emp
   where emp.gonghao = 3;   --如果where条件使用的是部门编号,由于查出多条数据，则into赋值将不执行，这里的where条件只能筛选出一条数据，多条无效

  dbms_output.put_line(gonghao2 || name2||ename2||oname2||year2|| indate2||code2||sal2);
  --想表中插入数据
  --insert into emp_copy (gonghao,name,ename,oname,year,indate,code,sal) values emp_info;
  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);
  
exception
  when others then
    null;
  
end;
*/

---第二部分  使用集合来操作数据
/*
declare
  --定义数据集类型
  type t_emp is record(
    gonghao2 VARCHAR2(8),
    name2    nvarchar2(20),
    ename2   varchar2(20),
    oname2   varchar2(20),
    year2    number(2, 0),
    indate2  date,
    code2    number(8, 0),
    sal2     number(20, 0));
  --声明记录类型变量
  emp_info t_emp;
begin
  --从emp表中取数赋给记录类型
  --  select gonghao,name,ename,oname,year,indate,code,sal into emp_info from emp where code = :deptno;

  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO emp_info
    from emp
   where emp.gonghao = &sssa; --如果where条件使用的是部门编号,由于查出多条数据，则into赋值将不执行，这里的where条件只能筛选出一条数据，多条无效

  --dbms_output.put_line(gonghao2 || name2||ename2||oname2||year2|| indate2||code2||sal2);
  --想表中插入数据
  insert into emp_copy values emp_info;
  --  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);

exception
  when others then
    null;
end;*/




--第四部分   a.记录类型赋值

/*declare
  --定义数据集类型    type emp_record emp%rowtype 表示声明emp_record记录与emp表中的各个列的数据类型相同

  --type emp_record is record(
      emp_row emp%rowtype;
  --);
  -- 使用 %type定义变量数据类型方式
  --v_gonghao emp.gonghao%type;  --定义工号的变量和emp表中的gonghao列数据类型一致

  --声明记录类型变量
 -- emp_info emp_record;
  --emp_info emp_row;
begin
  --从emp表中取数赋给记录类型
  --  select gonghao,name,ename,oname,year,indate,code,sal into emp_info from emp where code = :deptno;
  
  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO emp_row
    from emp
   where gonghao = '1'; --如果where条件使用的是部门编号,由于查出多条数据，则into赋值将不执行，这里的where条件只能筛选出一条数据，多条无效

  --dbms_output.put_line(gonghao2 || name2||ename2||oname2||year2|| indate2||code2||sal2);
  --想表中插入数据
  insert into emp_copy values emp_row;
  --  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);

exception
  when others then
    null;
end;*/


/*   --%rowtype 定义记录类型的两种方式
declare
  --定义数据集类型    emp_row emp%rowtype 表示声明并定义emp_row记录与emp表中的各个列的数据类型相同
   --定义记录类型方式1    定义记录类型并且声明记录类型变量，一句完成
   emp_row emp%rowtype;

  -- 使用 %type定义变量数据类型方式
  --v_gonghao emp.gonghao%type;  --定义工号的变量和emp表中的gonghao列数据类型一致
     
  --定义记录类型方式2    定义使用 type 记录类型名  is record（）；方式，声明变量时在重做
   type emp_rec is record(
       dept_row dept%rowtype,
       v_empno number(8) := 1,
       v_name varchar2(20):= '林书豪',
       v_job varchar2(20) := 'NBA运动员',
       v_sal number(8) := 8000000
       
   );
   emp_r emp_rec;
   
   
begin
  --从emp 表中取数赋给记录类型

  select GONGHAO, name, ename, oname, year, indate, code, sal
    INTO emp_row
    from emp
   where gonghao = &import; --如果where条件使用的是部门编号,由于查出多条数据，则into赋值将不执行，这里的where条件只能筛选出一条数据，多条无效

  dbms_output.put_line(emp_row.name||emp_r.v_name||' '||emp_r.v_job);
  --向表中插入数据
  insert into emp_copy values emp_row;
  --  insert into emp_test (gonghao,name,ename,oname,year,indate,code,sal) values (gonghao2, name2, ename2, oname2, year2, indate2, code2, sal2);

exception
  when others then
    null;
end;*/





--b.使用记录类型来更新

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

  dbms_output.put_line(emp_row.name||'  工号：'||emp_row.gonghao);
  emp_row.name:='朱小明';
  dbms_output.put_line('更新之后： '||emp_row.name||'  工号：'||emp_row.gonghao);
  
  
  update emp t1 set t1.name = emp_row.name where t1.gonghao=emp_row.gonghao;
  commit;
  
  dbms_output.put_line('程序运行完成！');

end;






