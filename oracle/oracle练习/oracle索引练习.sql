select * from all_indexes where table_name='emp_copy'

--��ѯrowid 
select rowidtochar(rowid) rowid_char,x.* from emp x

--��emp_copy������������name�д�������
create index idx_empcopy_name on emp_copy(name);


