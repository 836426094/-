declare
  type empnametable is table of varchar2(20);
  
  type deptnotable is table of number(2);
  
  deptinfo deptnotable;
  
  empinfo  empnametable := empnametable('周杰伦','林书豪','郭艾伦','李易峰');
  
begin 
  dbms_output.put_line(1||empinfo(1));
  dbms_output.put_line(2||empinfo(2));  
  
  
end;
