--层次化查询
select * from emp t;
/*
a:level是一个伪列，用来给机构层级分级，level的名称可以任意命名
b：connect by prior 员工号=经理号     分级条件
c:start with mgr is null 从经理号为空的员工开始，当然也可以从二级开始，如start with mgr=5;
d:order by 1  对层级进行排序
*/

select level,gonghao,name ,mgr from emp connect by prior gonghao=mgr start with mgr is null order by 1;

select level,gonghao,name ,mgr from emp connect by prior gonghao=mgr start with mgr=5 --order by 1; 
