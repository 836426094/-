declare
  type empnametable is table of varchar2(20);
  
  type deptnotable is table of number(2);
  
  deptinfo deptnotable;
  
  empinfo  empnametable := empnametable('�ܽ���','�����','������','���׷�');
  
begin 
  dbms_output.put_line(1||empinfo(1));
  dbms_output.put_line(2||empinfo(2));  
  
  
end;
