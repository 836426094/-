Oracle 经典练习题



一.创建一个简单的PL/SQL程序块

 1.编写一个程序块,从emp表中显示名为“SMITH”的雇员的薪水和职位。

declare

  v_empemp%rowtype;

  begin

  select * into v_emp from emp where ename='SMITH';

 dbms_output.put_line('员工的工作是：'||v_emp.job||'；  他的薪水是：'||v_emp.sal);

  end;

  2.编写一个程序块，接受用户输入一个部门号，从dept表中显示该部门的名称与所在位置。

方法一：（传统方法）

 declare

 pname dept.dname%type;

 ploc dept.loc%type;

 pdeptnodept.deptno%type;

begin

 pdeptno:=&请输入部门编号;

 selectdname,loc into pname,ploc from dept where deptno=pdeptno;

 dbms_output.put_line('部门名称: '||pname||'所在位置:'||ploc);

 exception–异常处理

   whenno_data_found

     thendbms_output.put_line('你输入的部门编号有误!!');

   whenothers

     thendbms_output.put_line('其他异常');

end;

方法二：（使用%rowtype）

 declare

  erow dept%rowtype;

 begin

   select * into erow from dept wheredeptno=&请输入部门编号;

  dbms_output.put_line(erow.dname||'--'||erow.loc);

 exception

   whenno_data_found

      thendbms_output.put_line('你输入的部门号有误!!!');

   whenothers

      thendbms_output.put_line('其他异常');

 end;

  3.编写一个程序块，利用%type属性，接受一个雇员号，从emp表中显示该雇员的整体薪水(即，薪水加佣金)。

declare

 pempno emp.empno%type;

 totalSal emp.sal%type;

begin

 pempno:=&请输入员工编号;

 select sal+nvl(comm,0) into totalSalfrom emp whereempno=pempno;

 dbms_output.put_line('该员工总共薪水'||totalSal);

 exception

    whenno_data_found

     thendbms_output.put_line('你输入的员工编号有误!!');

   whenothers

     thendbms_output.put_line('其他异常');

end;

  4.编写一个程序块，利用%rowtype属性，接受一个雇员号，从emp表中显示该雇员的整体薪水(即，薪水加佣金)。

declare

 erow emp%rowtype;

begin

 select * into erow from emp whereempno=&请输入员工编号;

   dbms_output.put_line(erow.sal+nvl(erow.comm,0));

exception

 whenno_data_found

   thendbms_output.put_line('你输入的员工编号有误!!');

 whenothers

   thendbms_output.put_line('其他异常');

end;

 

  5.某公司要根据雇员的职位来加薪，公司决定按下列加薪结构处理：

              Designation    Raise

              -----------------------

              Clerk          500

              Salesman       1000

              Analyst        1500

              Otherwise      2000

编写一个程序块,接受一个雇员名，从emp表中实现上述加薪处理。

declare

erow emp%rowtype;

begin

  select * into erow from emp where ename='&name';

  iferow.job='Clerk'then

    update emp set sal=sal+500whereempno=erow.empno;

  elsiferow.job='Salesman'then

    update emp set sal=sal+1000whereempno=erow.empno;

  elsiferow.job='Analyst'then

    update emp set sal=sal-1500whereempno=erow.empno;

  else

    update emp set sal=sal+2000whereempno=erow.empno;

  endif;

  commit;

exception

 whenno_data_found

   thendbms_output.put_line('你输入的员工编号有误!!');

 whenothers

   thendbms_output.put_line('其他异常');

end;

 

6.编写一个程序块，将emp表中雇员名全部显示出来。

declare

  cursorcsisselect ename from emp;

begin

  for erow incsloop

   dbms_output.put_line(erow.ename);

  endloop;

end;

  7.编写一个程序块，将emp表中前5人的名字显示出来。

            方式一:

declare

  cursorcsisselect t.* from (select e.ename,rownum rm from emp e)t where t.rm between1and6;

begin

  for erow incsloop

   dbms_output.put_line(erow.ename);

  endloop;

end;

方式二:

 

--方式二

declare

  cursorcsisselect ename from emp;

  i number :=1;

begin

  for erow incsloop

   dbms_output.put_line(erow.ename);

    i:=i+1;          --迭代

    exitwhen i>5; --退出条件

  endloop;

end;

 

  8.编写一个程序块，接受一个雇员名，从emp表中显示该雇员的工作岗位与薪水，若输入的雇员名不存在，显示“该雇员不存在”信息。

declare

 pjob emp.job%type;

 totalsal emp.sal%type;

begin

 select job,sal intopjob,totalsal from emp where ename='&请输入员工姓名';

 dbms_output.put_line(pjob ||'----'||totalsal);

 exception

   whenno_data_found then

     dbms_output.put_line('你输入的员工姓名有误!!');

end;

 

 

  9.接受两个数相除并且显示结果，如果第二个数为0，则显示消息“除数不能为0”。

declare

  num1 float;

  num2 float;

  res float;

  my_exception Exception;

  begin

        num1:=&被除数;

        num2:=&除数;

       res:=num1/num2;

        raisemy_exception;

        exception

      whenmy_exception then

        dbms_output.put_line(res);

      whenothersthen

       dbms_output.put_line('除数不能为0');

  end;

 

二.声明和使用游标

------游标:(集合) ，处理返回多行记录的问题

 --  声明游标

    --语法： cursor 游标名 is DQL;

--  遍历游标

    /*

          1.打开游标, open 游标名;

          2.从游标中提取一行的记录：fetch游标名 into 变量名,...;

          3.使用循环， exitwhen 游标名%notfound;

          4.关闭游标， close 游标名;

 

1.      通过使用游标来显示dept表中的部门名称。

      declare

 cursor co isselect dname from dept;

 begin

   for vname in co

   loop

    dbms_output.put_line(vname.dname);

   endloop;

 end;

 

2.      使用For循环，接受一个部门号，从emp表中显示该部门的所有雇员的姓名，工作和薪水。

declare

  cursor c_emp isselect * from emp where deptno=&请输入部门号;

begin

  for erow in c_emp loop

  dbms_output.put_line(erow.ename ||'  ' ||erow.job ||'  '||erow.sal);

  endloop;

exception

  when no_data_found then

    dbms_output.put_line('输入的部门编号有误');

end;

3.      使用带参数的游标，实现第2题。

declare

 cursor c_cs(c_deptno number) isselect * from emp where deptno=c_deptno;

 v_deptno number;

begin

  v_deptno:=&请输入部门编号;

  for erow in c_cs(v_deptno) loop

    dbms_output.put_line(erow.ename||'  ' ||erow.job ||'  '||erow.sal);

  endloop;

exception

  when no_data_found then

    dbms_output.put_line('输入的部门编号有误');

end;

  4.编写一个PL/SQL程序块，从emp表中对名字以“A”或“S”开始的所有雇员按他们基本薪水的10%给他们加薪。

declare

  cursor c_emp isselect ename from emp;

begin

  for erow in c_emp loop

    if erow.ename like'A%'then

      update emp set sal=sal+sal*0.1where ename=erow.ename;

     elsif erow.ename like'S%'then

      update emp set sal=sal+sal*0.1where ename=erow.ename;

    endif;

    commit;

  endloop;

end;

5.      emp表中对所有雇员按他们基本薪水的10%给他们加薪，如果所增加后的薪水大于5000卢布，则取消加薪。

 declare

  cursor c_emp isselect * from emp;

begin

  for erow in c_emp loop

    if erow.sal*1.1<5000then

      update emp set sal=sal+sal*0.1where ename=erow.ename;

    endif;

    commit;

  endloop;

end;

 

三 存储过程

----- 存储过程(dba声明,得授予dba权限): 封装了一组sql语句，提前编译好，效率较高,存储在服务端

  -- 场景：网购：数据库发生什么改变

    -- 库存量-1(update),订单增加(insert)，钱（update）,物流(insert) , 日志(insert)

--- 语法

 /*

 create [or replace] procedure 存储过程名称(参数名 in|out 类型,....)

 as | is

    -- 声明变量

 begin

   -- 过程化语言

 end; 

   

 */

1.创建一个过程，能向dept表中添加一个新记录.（in参数）

createorreplaceprocedure

insert_dept(p_deptno innumber,p_dname invarchar2,p_loc invarchar2)

is

begin

  insertinto dept values(p_deptno,p_dname,p_loc);

end;

--调用该存储过程

 

declare

 

begin

  insert_dept(50,'DEVELOP','SHENGZ');

end;

 

  2.创建一个过程，从emp表中输入雇员的姓名，返回该雇员的薪水值。（out参数）

然后调用过程。

createorreplaceprocedure

find_emp(p_name invarchar2,p_sal outnumber)

is

e_sal emp.sal%type;

begin

  select sal into e_sal from emp where ename=p_name;

  p_sal:=e_sal;

exception

  when no_data_found then

    p_sal:=0;

end;

--调用存储过程

declare

   msal number(5);

begin

  find_emp('SCOTT',msal);

  dbms_output.put_line(msal);

end;

  

 

  3.编写一个程序块，接受一个雇员号与一个百分数，从emp表中将该雇员的薪水增加输入的百分比。

   （利用过程，in out 参数）

 

createorreplaceprocedure addSal(p_empno innumber,p_num infloat)

is

begin

  update emp set sal=sal+sal*p_num where empno=p_empno;

exception

  when no_data_found then

 

  dbms_output.put_line('输入的员工编号有误');

end;

--访问存储过程

declare

 

begin

  addSal(7788,0.5);

  commit;

end;

存储函数

   --- 存储函数:封装了一组sql语句，提前编译好，效率较高 ,存储在服务端

     --- 存储函数必须有一个返回值，存储函数可以用select语句中

   /**

   create or replace function 函数名(参数名 in|out 类型,....)

   return type

   as | is

  

   begin

      return 值;

   end;

  

   */

 

  4.创建一个函数，它以部门号作为参数且返回那个部门的所有的雇员的整体薪水(其实就是该部门的平均工资)。

    然后调用此函数。

createorreplacefunction

getAllSal(f_deptno innumber)

returnnumber

is

e_sal emp.sal%type;

begin

  selectavg(sal) into e_sal from emp where deptno=f_deptno;

  return e_sal;

exception

  when no_data_found then

    return0;

end;

 

--调用存储函数

selectgetAllSal(20) from dual;

 

 5.创建一个函数，它以部门号作为参数传递并且使用函数显示那个部门名称与位置。

然后调用此函数。

 createorreplacefunction

showDnameAndLoc(f_deptno innumber)

return dept%rowtype

as

e_row dept%rowtype;

begin

  select * into e_row from dept where deptno=f_deptno;

  return e_row;

end;

 

--访问存储函数

declare

 erow dept%rowtype;

begin

  erow:=showDnameAndLoc(20);

  dbms_output.put_line(erow.dname ||'   '|| erow.loc);

end;

四 触发器练习

  -----触发器(监听器):监听表中的数据是否发生了改变

      -- 增删改操作

/*

create or replace trigger 触发器名

after | before 在改变之前还是之后执行触发器

insert | delete | update  监听表的哪个操作

on 表  对哪张表的监听

触发器的级别:表级触发器， 行级触发器

     表级触发器不能使用old，new

     行级触发器：可以使用old，new

declare

 

begin

 

end;

 

*/

 

  1.创建一个行级别触发器，将从emp表中删除的记录输入到ret_emp表中。

createorreplacetrigger del_emp

after

delete

on emp

foreachrow

begin

  insertinto ret_emp values(:old.empno,:old.ename,:old.job,

 :old.mgr,:old.hiredate,:old.sal,:old.comm,:old.deptno);

end;

2.创建一个行级别触发器，停止用户删除雇员名为"SMITH"的记录。

createorreplacetrigger nodel_SMITH

before

delete

on emp

foreachrow

when(old.ename='SMITH')

begin

  raise_application_error(20001,'不能删除该用户信息');

end;

 

3.创建一个语句级别触发器，不允许用户在"Sundays"使用emp表。

     createorreplacetrigger control_emp

      before

      insertorupdateordeleteon emp

  begin

     if to_char(sysdate,'DY','nls_date_language=AMERICAN')--显示系统当前日期以美国格式表示的名字缩写的一天

      in('SUN') then

      raise_application_error(-20001,'不允许在星期天操作emp表');

      endif;

  end;
--------------------- 
作者：飘… 
来源：CSDN 
原文：https://blog.csdn.net/luo609630199/article/details/81046589 
版权声明：本文为博主原创文章，转载请附上博文链接！