--集合类型练习

--第一部分  索引表练习
/*declare
  type emp_gonghao is table of emp.gonghao%type index by pls_integer;
  vemp emp_gonghao;
begin
  null;
  vemp(1):='11';
  vemp(2):='22';
  dbms_output.put_line(vemp(1));
  
  
  for i in 1..5  --emp_gonghao
     loop
      dbms_output.put_line(i);
     end loop;
end;
*/

--复合类型的索引表

/*declare
  type emp_gonghao is table of emp%rowtype index by emp.gonghao%type;
  
  vemp emp_gonghao;
  
  cursor empcur is select * from emp;
begin
  for emprow in empcur
    loop
     vemp(emprow.gonghao):=emprow;
     --dbms_output.put_line(emprow.gonghao);
     dbms_output.put_line(vemp(emprow.gonghao).gonghao||','||vemp(emprow.gonghao).name);
    
    end loop;
    
end;*/


--第二部分 嵌套表




