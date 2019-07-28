/*create or replace trigger updatesal_jt
--定义after 触发器，检测emp表的sal列的更新
after update of sal on emp
      --定义的是行级别触发器
      for each row

declare
      v_recount number(10);
begin
  --
  select count(*) into v_recount from emp t where t.gonghao =:old.gonghao;
  IF v_recount=0 then insert into raisesalarylog values(::old.gonghao,sysdate,:old.sal,:new.sal);
  else
    update reasesalarylog set raiseddate =sysdate,originalsal=:old.sal,rausedsal=:old.gonghao;
  end if;

exception
  when others
    then dbms_output.put_line(SALERRM);
end;*/
