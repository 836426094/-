--������ʾ�α겢�����α�
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
    --if ���ȼ�������� exit���
    if emp_cursor%notfound
      then 
        dbms_output.put_line('����ѭ��');
        exit; --when emp_cursor%notfound;
    else 
      continue;
    end if; 
    
  end loop;
  close emp_cursor;
  
end;
*/

--������ʽ�α�

begin 
  update emp_copy t1 set t1.ename='xkk' where t1.gonghao=111;
  --ʹ����ʽ�α���µ�����
  dbms_output.put_line('���θ��µ�����Ϊ��'||sql%rowcount);
  if sql%notfound
    then 
      dbms_output.put_line('���θ��µ�����Ϊ0');
  end if;
  commit;
exception
  when others
    then
      dbms_output.put_line(sqlerrm);
end;
    
    
  
