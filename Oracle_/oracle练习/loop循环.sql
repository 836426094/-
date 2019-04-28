declare 
  v_count number(2):=0;
begin
  loop
    v_count := v_count+1;
    
  /*  --第一种重新循环方式
    if 
      v_count<3
    then  continue;
    end if;*/
    
    --第二种重新循环方式
    continue when v_count<3;
    
    --当循环大于3时执行如下代码
    dbms_output.put_line('第一阶段:行'||v_count||'你好 还记得你是华神吗？');
    
    --如果技术条件为10,退出循环
    exit when v_count=10;
  end loop;
  --循环退出之后执行该语句
  dbms_output.put_line('循环已经退出！');
end;
