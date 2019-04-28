--如：这种方式来查询的时候将查不出数据
select e2.*,rownum from (select e.* from emp e where rownum between 2 and 10) e2 where rownum <=5;
 
select * from emp where rownum<=10;

select * from emp where rownum between 0 and 10;

--比较符查询：查询roenum前10条数据
select e.*,rownum rn from(select * from emp)e where rownum<=10;
--区间查询case1:查询rownum在[5,10]的数据
--select e.*,rownum rn from(select * from emp)e where rn between 5 and 6;  --这个语句执行不出来，改成下面的语句
select e.* from(select z.*,rownum rn from emp z)e where e.rn between 5 and 10;
--区间查询case2:查询rownum在[2,6]的数据
/*select * from 
 (select e.*,rownum rn from(select * from emp)e where rownum<=10) 
 where rn>=5;   --这个语句执行不出来 改成下面这个语句*/

select * from 
 (select e.* from(select emp.*,rownum rn from emp)e where e.rn<=10) 
 where rn>=5; 
/* 
说明：注意区间查询的两种格式，由于rownum在一个sql语句中只能使用一次，
所以不能使用where rownum<=10 and rownum>=5。所以case1中我们使用between and 来表示；
而在case2中，相当于两次分页，首先我们查询了rownum<=10的数据，是第一次分页，
然后再把这些数据作为第二次分页的子查询，第二次分页我们将rn>=5就最终得到[5,10]之间的分页数据。
ps：区间查询中case1格式简单明了，但查询速度却不及case2的两次分页查询速度。
注意1：我们上面的查询例子是查询所有字段信息即select *查询。例如case2只需要查询部分字段，
如只需要查询员工名称ename和员工薪资sal，我们只需要修改最里层的查询即可：
*/

--查询rownum为[5,10]的员工姓名和工资
--分页方式1 
select e.* from (   select z.name,z.sal,rownum rn from emp z ) e where e.rn between 5 and 10;  --耗时0.136秒
--分页方式2
select *
  from (select *
          from (select z.name, z.sal, rownum rn from emp z) e1
         where e1.rn <= 10) e2
 where e2.rn >= 5; --耗时0.059秒
