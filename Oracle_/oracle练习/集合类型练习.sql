--����������ϰ

--��һ����  ��������ϰ
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

--�������͵�������

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


--�ڶ����� Ƕ�ױ�




