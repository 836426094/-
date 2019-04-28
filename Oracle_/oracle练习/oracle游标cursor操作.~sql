--创建显示游标并操作游标
/*declare
  emp_row emp%rowtype;
  cursor  emp_cursor is select * from emp where gonghao is not null;
  n number:=0;
begin 
  open emp_cursor;
  loop
    fetch emp_cursor into emp_row;
    n:=n+1;
    dbms_output.put_line(n||'  '||emp_row.name);
    
    --exit when emp_cursor%notfound;
    --if 语句等价于上面的 exit语句
    if emp_cursor%notfound
      then 
        dbms_output.put_line('跳出循环');
        exit; --when emp_cursor%notfound;
    else 
      continue;
    end if; 
    
  end loop;
  close emp_cursor;
  
end;
*/

--操作隐式游标

begin 
  update emp_copy t1 set t1.ename='xkk' where t1.gonghao=111;
  --使用隐式游标更新的行数
  dbms_output.put_line('本次更新的行数为：'||sql%rowcount);
  if sql%notfound
    then 
      dbms_output.put_line('本次更新的行数为0');
  end if;
  commit;
exception
  when others
    then
      dbms_output.put_line(sqlerrm);
end;
    
    
  
