declare 
  v_count number(2):=0;
begin
  loop
    v_count := v_count+1;
    
  /*  --��һ������ѭ����ʽ
    if 
      v_count<3
    then  continue;
    end if;*/
    
    --�ڶ�������ѭ����ʽ
    continue when v_count<3;
    
    --��ѭ������3ʱִ�����´���
    dbms_output.put_line('��һ�׶�:��'||v_count||'��� ���ǵ����ǻ�����');
    
    --�����������Ϊ10,�˳�ѭ��
    exit when v_count=10;
  end loop;
  --ѭ���˳�֮��ִ�и����
  dbms_output.put_line('ѭ���Ѿ��˳���');
end;
