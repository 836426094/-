/*declare 
  emp_row emp%rowtype;
  v_name emp.name%type;
  v_gonghao emp.name%type;
  v_ename emp.ename%type;
  v_oname emp.oname%type;
  v_year emp.year%type;
  v_indate emp.indate%type;
  v_code emp.code%type;
  v_sal emp.sal%type;
  
  cursor emp_cursor (p_deptno in number)
  is select * from emp;-- where gonghao=p_deptno;
  
begin
  if not emp_cursor%isopen
    then 
      open emp_cursor(5);
  end if;
  
  if emp_cursor%found is null
    then 
      dbms_output.put_line('%found���Դ�ʱΪnull');
    else
      dbms_output.put_line('%found���Դ�ʱnot null');
    end if;
    
  loop
    if emp_cursor%rowcount<3
      then
       fetch emp_cursor into emp_row;
       dbms_output.put_line('%found���Դ�ʱnot null '||emp_row.name||' '||emp_cursor%rowcount);
    else
      fetch emp_cursor into v_name,
  v_gonghao,
  v_ename,
  v_oname,
  v_year,
  v_indate,
  v_code,
  v_sal;
      
      if emp_cursor%found 
        then 
          dbms_output.put_line('��ʼȫ����ֵ��'||v_name||','||v_gonghao);
      end if;
    end if;
    
    --dbms_output.put_line(emp_row.name||' '||emp_cursor%rowcount);
    
    \*if emp_cursor%found is null
    then 
      dbms_output.put_line('%found���Դ�ʱΪnull');
    else
      dbms_output.put_line('%found���Դ�ʱnot null '||emp_row.name||' '||emp_cursor%rowcount);
    end if;
    *\
    
        
    
    
    
    
    
    exit when not emp_cursor%found;
  end loop;
  
  close emp_cursor;
  
end;*/


--ʹ��Ƕ�ױ���������ȡ�α�����

declare
  type emp_type is table of emp%rowtype;
  emptab emp_type;
  cursor empcur is select * from emp;
begin 
  open empcur;
  fetch empcur bulk collect into emptab;
  
  for i in 1..emptab.count
    loop
      dbms_output.put_line(emptab(i).name);
  
    end loop;
  dbms_output.put_line('������  '||emptab(2).name);
  close empcur;
end;
      






