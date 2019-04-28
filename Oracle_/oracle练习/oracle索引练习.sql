select * from all_indexes where table_name='emp_copy'

--查询rowid 
select rowidtochar(rowid) rowid_char,x.* from emp x

--给emp_copy创建索引，以name列创建索引
create index idx_empcopy_name on emp_copy(name);


