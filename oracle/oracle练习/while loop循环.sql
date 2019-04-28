declare
  v_count pls_integer :=1;
begin 
  while v_count<=5
  loop
    dbms_output.put_line('ÐÐ'||v_count);
    v_count:=v_count+1;
  end loop;
end;

